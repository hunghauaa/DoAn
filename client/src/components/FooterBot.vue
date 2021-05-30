<template>
  <footer>
    <div class="container">
      <div class="row justify-center q-ml-md">
        <div class="col-md-3 footer-block">
          <h5 class="footer-title">GIỚI THIỆU CHUNG</h5>
          <ul class="list-unstyled ul-wrapper q-pl-xs">
            <li><a href="contact.html">Giới thiệu Vietparts</a></li>
            <li><a href="#">Tuyển dụng</a></li>
            <li><a href="#">Liên hệ</a></li>
            <li><a href="#">Đối tác - Đại lý</a></li>
            <li><a href="#">Điều khoản sử dụng</a></li>
          </ul>
        </div>
        <div class="col-md-3 footer-block q-pl-xl">
          <h5 class="footer-title">HỖ TRỢ KHÁCH HÀNG</h5>
          <ul class="list-unstyled ul-wrapper q-pl-xs">
            <li><a href="contact.html">Mua hàng trên di động</a></li>
            <li><a href="#">Chính sách bảo hành</a></li>
            <li><a href="#">Giao hàng - Lắp đặt</a></li>
            <li><a href="#">Chính sách đổi trả</a></li>
            <li><a href="#">Chính sách bảo mật</a></li>
            <li><a href="#">Phương thức thanh toán</a></li>
          </ul>
        </div>
        <div class="col-md-3 footer-block q-pl-xl">
          <h5 class="footer-title">TIN TỨC - TƯ VẤN</h5>
          <ul class="list-unstyled ul-wrapper q-pl-xs">
            <li><a href="#">Tin khuyến mại</a></li>
            <li><a href="#">Câu hỏi thường gặp</a></li>
            <li><a href="#">Chia sẻ kinh nghiệm</a></li>
            <li><a href="#">Tài liệu hướng dẫn</a></li>
            <li><a href="#">Tư vấn sản phẩm</a></li>
            <li><a href="#">TIn công nghệ</a></li>
          </ul>
        </div>
        <div class="col-md-3 footer-block q-pl-xl q-mt-xl">
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m23!1m12!1m3!1d2688.9605795132607!2d105.82577313883553!3d21.141290686162186!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m8!3e2!4m0!4m5!1s0x3135005154c08ffb%3A0x4bd8b966f95db080!2zVHJ1bmcgT2FpLCBUacOqbiBExrDGoW5nLCDEkMO0bmcgQW5oLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!3m2!1d21.143089999999997!2d105.8230813!5e0!3m2!1svi!2s!4v1622383786244!5m2!1svi!2s"
            width="300"
            height="250"
            style="border: 0"
            allowfullscreen=""
            loading="lazy"
          ></iframe>
        </div>
      </div>
      <hr width="50%" />
      <div class="footer-bottom">
        <div id="bottom-footer">
          <ul class="footer-link">
            <li><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Work</a></li>
            <li><a href="#">Team</a></li>
            <li><a href="#">Pricing</a></li>
            <li><a href="#">Blog</a></li>
            <li><a href="#">Contact</a></li>
          </ul>
          <div class="copyright">
            Copyright -
            <a class="yourstore" href="http://www.lionode.com/">
              Created by Nguyen Doan Hung ©2021
            </a>
          </div>
          <div class="footer-bottom-cms">
            <div class="footer-payment">
              <ul>
                <li class="mastero">
                  <a href="#"
                    ><img
                      alt=""
                      src="http://html.lionode.com/nature/n-speed/image/payment/mastero.jpg"
                  /></a>
                </li>
                <li class="visa">
                  <a href="#"
                    ><img
                      alt=""
                      src="http://html.lionode.com/nature/n-speed/image/payment/visa.jpg"
                  /></a>
                </li>
                <li class="currus">
                  <a href="#"
                    ><img
                      alt=""
                      src="http://html.lionode.com/nature/n-speed/image/payment/currus.jpg"
                  /></a>
                </li>
                <li class="discover">
                  <a href="#"
                    ><img
                      alt=""
                      src="http://html.lionode.com/nature/n-speed/image/payment/discover.jpg"
                  /></a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <a id="scrollup" style="display: block">Scroll</a>
  </footer>
</template>

<script>
export default {};
</script>

<style scoped>
a {
  color: #808080;
  text-decoration: none;
}
li {
  list-style: none !important;
}
.footer-link {
  display: flex;
  justify-content: center;
  align-items: center;
  letter-spacing: 1px;
}
.footer-link li:not(:last-child):after {
  content: " | ";
  color: #808080;
  font-weight: bold;
  margin-right: 10px;
  padding-right: 10px;
}
.copyright {
  text-align: center;
}
.footer-payment ul {
  display: flex;
  justify-content: center;
  align-items: center;
}
.footer-payment ul li {
  margin-right: 5px;
}
</style>
