<template>
  <footer>
    <div class="footer-top-cms">
      <div class="container">
        <div class="row justify-center">
          <div class="col-sm-6">
            <div class="newslatter">
              <h4>Đăng ký nhận thông báo của chúng tôi</h4>
              <p class="title-subline">
                Hãy chắc chắn theo dõi blog của chúng tôi và đăng ký tất cả các
                cập nhật gửi thư của chúng tôi!
              </p>
              <div class="input-group">
                <input
                  type="text"
                  class="form-control"
                  placeholder="Your-email@website.com"
                />
                <button
                  type="submit"
                  value="Sign up"
                  class="btn btn-large btn-primary"
                >
                  <font style="vertical-align: inherit"
                    ><font style="vertical-align: inherit">Đăng ký</font></font
                  >
                </button>
              </div>
            </div>
          </div>
          <div class="col-sm-4">
            <h5>Theo dõi tôi tại :</h5>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
export default {};
</script>

<style scoped>
.footer-top-cms {
  -webkit-text-size-adjust: 100%;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  font-family: "Roboto", sans-serif;
  font-weight: normal;
  font-size: 14px;
  letter-spacing: 0.5px;
  line-height: 22px;
  box-sizing: border-box;
  background: url("https://tpms.vn/wp-content/uploads/2017/04/anh-dep-sieu-xe-1.jpg")
    50% no-repeat;
  color: #fff;
  background-color: #253993;
  padding: 100px 0;
  background-size: cover;
}
.form-control {
  -webkit-text-size-adjust: 100%;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  border-collapse: separate;
  box-sizing: border-box;
  font: inherit;
  margin: 0;
  font-family: inherit;
  line-height: inherit;
  display: block;
  color: #555;
  background-color: #fff;
  background-image: none;
  max-width: 100%;
  height: 48px;
  width: 390px !important;
  border: 0 none !important;
  padding: 0 24px;
  float: left;
  margin-bottom: 0;
  -webkit-appearance: none;
  font-size: 14px;
  border-bottom-right-radius: 0;
  border-top-right-radius: 0;
}
.btn {
  -webkit-text-size-adjust: 100%;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  border-collapse: separate;
  box-sizing: border-box;
  font: inherit;
  margin: 0;
  overflow: visible;
  text-transform: none;
  -webkit-appearance: button;
  font-family: inherit;
  line-height: inherit;
  display: inline-block;
  border: none;
  transition: color 0.3s ease 0s, border 0.3s ease 0s, background 0.3s ease 0s;
  text-decoration: none;
  cursor: pointer;
  float: left;
  background: #100381;
  padding: 13px 28px;
  font-size: 16px;
  margin-left: 0px;
  letter-spacing: 1px;
  font-weight: 700;
  color: #eceef8;
  background-color: #170a8f;
  height: 3rem;
}
/* .footer-social ul {
  display: flex;
  justify-content: space-around;
  align-items: center;
} */
/* .footer-social ul li {
  list-style: none;
  opacity: 0.5;
} */
* {
  font-family: "Playfair Display", serif;
}
.title-subline {
  margin-top: -27px;
  padding-bottom: 20px;
}
.facebook:hover {
  color: blue;
}
</style>
