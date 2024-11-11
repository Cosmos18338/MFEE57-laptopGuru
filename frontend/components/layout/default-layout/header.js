import Link from 'next/link'
import React, { useState, useEffect } from 'react'
import { useAuth } from '@/hooks/use-auth'

export default function Header(props) {
  const { auth, logout } = useAuth() // 獲取 auth 對象
  const { isAuth } = auth // 獲取 isAuth

  return (
    <>
      <header>
        <div className="container d-flex p-3 align-items-center">
          <Link className="logo me-auto" href="/">
            <img src="/logo.svg" />
          </Link>
          <div className="me-7 nav-list">
            <Link className="text-light me-3" href="/">
              首頁
            </Link>
            <Link className="text-light me-3" href="/product">
              商品
            </Link>
            <a className="text-light me-3">比較</a>
            <Link className="text-light me-3" href="/event">
              活動
            </Link>
            <Link className="text-light me-3" href="/blog">
              部落格
            </Link>
          </div>
          {isAuth == true ? (
            <>
              <Link href="/dashboard">
                <div className="user-avater me-3">
                  <img src="/Vector.svg" />
                </div>
              </Link>
              <Link href="/cart">
                <div className="cart me-3">
                  <img src="/cart.svg" />
                </div>
              </Link>
              <Link href="/">
                <button
                  className="btn btn-primary header-logout"
                  onClick={logout}
                >
                  登出
                </button>
              </Link>
            </>
          ) : (
            <>
              <Link href="/member/login">
                <button className="btn btn-primary text-white me-3">
                  登入
                </button>
              </Link>
              <Link href="/member/signup">
                <button className="btn btn-primary text-white">註冊</button>
              </Link>
            </>
          )}
        </div>
      </header>
    </>
  )
}
