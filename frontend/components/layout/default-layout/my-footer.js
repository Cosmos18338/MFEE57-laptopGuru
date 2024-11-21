import Link from 'next/link'

export default function MyFooter() {
  return (
    <footer>
      <div className="container footer-side">
        <div className="row m-3 border-bottom border-secondary">

          <div className="col-2">
            <Link
              className="text-secondary mb-3 d-block text-decoration-none"
              href=""
            >
              關於我們
            </Link>
            <Link
              className="text-secondary mb-3 d-block text-decoration-none"
              href=""
            >
              加入我們
            </Link>
            <Link
              className="text-secondary mb-3 d-block text-decoration-none"
              href=""
            >
              最新優惠
            </Link>
          </div>
          <div className="col-2">
            <Link
              className="text-secondary mb-3 d-block text-decoration-none"
              href=""
            >
              產品列表
            </Link>
            <Link
              className="text-secondary mb-3 d-block text-decoration-none"
              href=""
            >
              租賃規則
            </Link>
            <Link
              className="text-secondary mb-3 d-block text-decoration-none"
              href=""
            >
              比看看
            </Link>
          </div>
          <div className="col">
            <Link
              className="text-secondary mb-3 d-block text-decoration-none"
              href=""
            >
              最新文章
            </Link>
            <Link
              className="text-secondary mb-3 d-block text-decoration-none"
              href=""
            >
              來揪團
            </Link>
          </div>
          <div className="col-3 d-flex justify-content-end">
            <div className="footer-logo">
              <img src="/logo2.svg" alt="網站 Logo" />
            </div>
          </div>
          <div className="mb-4" />
        </div>
        <div className="row p-3">
          <div className="col">
            <Link className="text-secondary mb-2 text-decoration-none" href="">
              <img src="/Icon-fb.svg" alt="Facebook 圖標" className="me-3" />
            </Link>
            <Link className="text-secondary mb-2 text-decoration-none" href="">
              <img src="/Icon-ig.svg" alt="Instagram 圖標" />
            </Link>
          </div>
          <div className="col text-secondary text-end">© 2024 Hello, Inc.</div>
        </div>
      </div>
    </footer>
  )
}