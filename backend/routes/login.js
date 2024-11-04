import express from 'express'
import authenticate from '#middlewares/authenticate.js'
import db from '##/configs/mysql.js'
import multer from 'multer'
import jsonwebtoken from 'jsonwebtoken'
import { compareHash } from '#db-helpers/password-hash.js'

const upload = multer()
const accessTokenSecret = process.env.ACCESS_TOKEN_SECRET
const router = express.Router()

/* GET home page. */
router.post('/', upload.none(), async (req, res, next) => {
  try {
    console.log(req.body)
    const { email, password } = req.body

   const [row] = await db.query(
     'SELECT * FROM users WHERE email = ?',
     [email]
   )
// 這邊實際上是帳號錯誤
   if (row.length == 0) {
     return res.json({ status: 'error', message: '帳號或密碼錯誤' })
   }

   const user = row[0]
   // compareHash比對輸入與資料庫中的密碼~
  //  const passwordMatch = await compareHash(password, user.password)
  //  這邊實際上是密碼錯誤
  //  if (!passwordMatch) {
  //    return res.json({
  //      status: 'error',
  //      message: '帳號或密碼錯誤'
  //    })
  //  }
   // 之後想改這邊邏輯，因為帳號密碼應該只能有比對出一組，如果email一樣不予註冊才對。
   const token = jsonwebtoken.sign(
     {
       user_id: user.user_id,
       email: user.email,
       country: user.country,
       city: user.city,
       road_name: user.road_name,
       detailed_address: user.detailed_address,
       level: user.level,
       phone: user.phone,
     },
     accessTokenSecret,
     { expiresIn: '10m' }
   )

    // if (!passwordMatch) {
    //   return res.json({
    //     status: 'error',
    //     message: '帳號或密碼錯誤',
    //   })
    // }

    // 之後想改這邊邏輯，因為帳號密碼應該只能有比對出一組，如果email一樣不予註冊才對。
    const token = jsonwebtoken.sign(
      {
        user_id: user.user_id,
        email: user.email,
        country: user.country,
        city: user.city,
        road_name: user.road_name,
        detailed_address: user.detailed_address,
        level: user.level,
        phone: user.phone,
      },
      accessTokenSecret,
      { expiresIn: '5d' }
    )

    res.cookie('accessToken', token)

    res.json({
      status: 'success',
      data: {
        token,
      },
    })
  } catch (error) {
    console.error('登入錯誤:', error)
    res.status(500).json({
      status: 'error',
      message: '系統錯誤',
    })
  }
})

router.post('/logout', authenticate, (req, res) => {
  // 清除cookie
  res.clearCookie('accessToken', { httpOnly: true })
  res.json({ status: 'success', data: null })
})
export default router

// 用 POST 來處理 logout 行為是因為 RESTful API 的設計原則建議將「變更狀態」或「造成副作用」的操作用 POST、PUT、DELETE 等方法，而 GET 是用來取得資源、不應該改變伺服器的狀態。

<<<<<<< HEAD
// 在 logout 的情況下，清除 cookies 是一個修改伺服器狀態的操作，符合 POST 的使用原則。雖然從使用者角度來看只是按了一個按鈕，但背後的動作其實涉及狀態變更。
export default router
=======
// 在 logout 的情況下，清除 cookies 是一個修改伺服器狀態的操作，符合 POST 的使用原則。雖然從使用者角度來看只是按了一個按鈕，但背後的動作其實涉及狀態變更。
>>>>>>> dev
