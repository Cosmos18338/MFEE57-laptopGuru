import express from 'express'
const router = express.Router()

import db from '##/configs/mysql.js'

import multer from 'multer'
const upload = multer()

/* GET home page. */
router.post('/', upload.none(), async (req, res, next) => {
  const { user_id } = req.body
  // const [data] = await db.query(
  //   'SELECT cart.id, cart.user_id, cart.product_id, cart.quantity, product.model, product.list_price, product_img.product_img_path FROM cart JOIN product AND product_img ON cart.product_id = product.id WHERE cart.user_id = ?',
  //   [user_id]
  // )
  const [data] = await db.query(
    'SELECT cart.id, cart.user_id, cart.product_id, cart.quantity, product.model, product.list_price, product_img.product_img_path FROM cart JOIN product ON cart.product_id = product.product_id JOIN product_img ON cart.product_id = product_img.img_product_id  WHERE cart.user_id = ?',
    [user_id]
  )
  if (data.length == 0) {
    return res.json({ status: 'error', message: '購物車目前沒有商品' })
  }
  res.json({ status: 'success', data })
})

router.post('/add', upload.none(), async (req, res, next) => {
  const { user_id, product_id, quantity } = req.body
  const cartCheck = await db.query(
    'SELECT * FROM cart WHERE user_id = ? AND product_id = ?',
    [user_id, product_id]
  )
  if (cartCheck[0].length !== 0) {
    const cartquantity = cartCheck[0][0].quantity
    let newquantity = parseInt(quantity) + parseInt(cartquantity)
    const [data] = await db.query(
      'UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?',
      [newquantity, user_id, product_id]
    )
    return res.json({
      status: 'success',
      message: '已成功加入購物車',
      data,
    })
  }
  try {
    const [data] = await db.query(
      'INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)',
      [user_id, product_id, quantity]
    )
    res.json({ status: 'success', message: '加入購物車成功', data })
  } catch (error) {
    res.json({ status: 'error', message: '加入購物車失敗' })
  }
})

router.post('/delete', upload.none(), async (req, res, next) => {
  const { user_id, product_id } = req.body
  try {
    const [data] = await db.query(
      'DELETE FROM cart WHERE user_id = ? AND product_id = ?',
      [user_id, product_id]
    )
    res.json({
      status: 'success',
      message: '已成功刪除購物車商品',
      data,
    })
  } catch (error) {
    res.json({ status: 'error', message: '刪除購物車商品失敗' })
  }
})

router.post('/update', upload.none(), async (req, res, next) => {
  const { user_id, product_id, quantity } = req.body
  const productCheck = await db.query(
    'SELECT * FROM cart WHERE user_id = ? AND product_id = ?',
    [user_id, product_id]
  )
  if (productCheck[0].length === 0) {
    return res.json({ status: 'error', message: '購物車沒有此商品' })
  }
  try {
    const [data] = await db.query(
      'UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?',
      [quantity, user_id, product_id]
    )
    res.json({
      status: 'success',
      message: '已成功更新購物車商品數量',
      data,
    })
  } catch (error) {
    res.json({ status: 'error', message: '更新購物車商品數量失敗' })
  }
})

export default router
