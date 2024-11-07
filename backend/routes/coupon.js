import express from 'express'
const router = express.Router()
import db from '##/configs/mysql.js'
import multer from 'multer'

const upload = multer()

// 獲取優惠券資訊
router.get('/:coupon_id', async (req, res) => {
  try {
    const coupon_id = req.params.coupon_id

    // 修正這行：將 couponId 改為 coupon_id
    if (isNaN(coupon_id)) {
      return res.status(400).json({
        status: 'error',
        message: '無效的優惠券編號'
      })
    }

    // 修正 SQL 查詢
    const [coupons] = await db.query(`
      SELECT 
        coupon_id,
        coupon_code,
        coupon_content,
        discount_method,
        coupon_discount,
        coupon_start_time,
        coupon_end_time,
        valid=1
      FROM coupon
      WHERE coupon_id = ?
    `, [coupon_id])

    if (coupons.length === 0) {
      return res.status(404).json({
        status: 'error',
        message: '查無此優惠券'
      })
    }

    // 格式化日期時間
    const processedCoupons = coupons.map(coupon => ({
      ...coupon,
      discount_type: coupon.discount_method === 1 ? '金額折抵' : '折扣百分比',
      coupon_start_time: new Date(coupon.coupon_start_time).toISOString(),
      coupon_end_time: new Date(coupon.coupon_end_time).toISOString()
    }))

    return res.json({
      status: 'success',
      data: processedCoupons
    })
    
  } catch (error) {
    console.error('Error:', error)
    return res.status(500).json({
      status: 'error',
      message: '伺服器錯誤'
    })
  }
})

export default router