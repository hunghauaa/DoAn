<template>
  <header>
    <div
      class="row justify-center items-center content-center bg-blue-6 header__top"
    >
      <div class="col-md-5 offset-1">
        <span class="q-mr-xl">Chỉ đường</span>
        <span class="q-mr-xl">Liên hệ</span>
        <span class="q-mr-xl">Số điện thoại</span>
      </div>
      <div class="col-md-4 offset-2">
        <span class="q-mr-xl">Thông báo</span>
        <span class="q-mr-xl">Hỗ trợ</span>
        <div
          v-if="getUserInfo"
          id="a"
          style="display: inline-block; position: relative"
        >
          <q-avatar size="2em">
            <img src="https://cdn.quasar.dev/img/avatar.png" />
          </q-avatar>
          <b class="q-ml-sm q-mr-xl userName">{{
            getUserInfo.user.username
          }}</b>
          <ul id="b" class="tooltip">
            <li><router-link to="/profile?slug=1" style="color: black;text-decoration: none" class="q-ml-sm">Tài khoản của tôi</router-link></li>

            <li><router-link to="/profile?slug=2" style="color: black;text-decoration: none" class="q-ml-sm">Đơn đã mua</router-link></li>
            <li><a class="q-ml-sm" @click="logout">Đăng xuất</a></li>
          </ul>
        </div>

        <router-link v-else to="/auth">
          <span class="q-mr-xl">Đăng nhập</span></router-link
        >
      </div>
    </div>

    <div class="row justify-around items-center content-center">
      <div class="col-md-3 offset-1">
        <router-link to="/">
          <!-- <img width="200" height="150" src="../assets/logo2.png" alt="" /> -->
          <img
            width="200"
            height="150"
            src="http://html.lionode.com/nature/n-speed/image/logo.png"
            alt=""
          />
        </router-link>
      </div>
      <div class="col-md-4">
        <div class="">
          <div class="">
            <q-input rounded outlined type="search" class="search">
              <template v-slot:append>
                <q-icon name="search" />
              </template>
            </q-input>
          </div>
        </div>
      </div>
      <div class="col-md-4 q-pl-xl">
        <router-link to="/cart">
          <q-icon
            class="q-ml-xl q-pl-xl shop"
            name="shopping_cart"
            style="font-size: 3em; color: grey"
          >
            <div class="shopping_cart bg-grey">
              {{ itemOfCart ? itemOfCart.length : 0 }}
            </div>
          </q-icon>
        </router-link>
      </div>
    </div>
  </header>
</template>

<script>
// import Search from "./Search";
import { mapGetters, mapMutations, mapActions } from "vuex";
import EventBus from "../boot";
export default {
  // components: { Search },
  components: {},
  computed: {
    ...mapGetters(["itemOfCart", "getUserInfo"]),
  },
  data() {
    return {
      count: 2,
    };
  },
  methods: {
    ...mapMutations(["LOGOUT"]),
    ...mapActions(["getCart"]),
    async onClick(e) {
      console.log(e);
    },
    async logout() {
      this.LOGOUT();
      this.$router.push("/");
    },
    async handler(id) {
      console.log(id);
      await this.getCart();
    },
  },
  async mounted() {
    console.log(this.getUserInfo);
    EventBus.$on("EBModifyCart", this.handler);
  },
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box !important;
}
.shop {
  position: relative;
  transition: transform 0.2s; /* Animation */
}
.shop:hover {
  transform: scale(
    1.2
  ); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
}
.shopping_cart {
  font-family: "Times New Roman", Times, serif !important;
  width: 20px;
  height: 20px;
  font-size: 1rem;
  position: absolute;
  right: -45px;
  top: -10px;
  background-color: black;
  border: 1px solid grey;
  border-radius: 50%;
  color: white;
}
.shopping_cart span {
  color: Black;
}
.header__meta {
  background-color: rgb(130, 130, 207);
  color: white;
}
.header__content > div {
  height: 150px;
}
.header__content {
  height: 150px;
  background-color: rgb(130, 130, 207);
}
.logo > img {
  border-radius: 50%;
  width: 200;
  height: 150px;
}
.search {
  width: inherit;
  align-items: center;
  padding: auto;
  margin: 50px auto;
  min-width: max-content !important;
}
.content {
  padding-top: 62px;
}
.header__top {
  color: white;
  font: 1em sans-serif;
  font-weight: bold;
  min-height: 32px;
  /* height: 32px; */
}
img {
  -webkit-text-size-adjust: 100%;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  font-family: "Roboto", sans-serif;
  font-weight: normal;
  font-size: 14px;
  letter-spacing: 0.5px;
  line-height: 22px;
  color: #000;
  box-sizing: border-box;
  border: 0;
  vertical-align: middle;
  max-width: 100%;
  height: auto;
  display: block;
  width: 200px;
}
span {
  display: inline-block;
  height: 100%;
}
.tooltip {
  z-index: 1000;
  font-weight: 100;
  display: none;
  color:black;
  border-radius:5px;

  position: absolute;
  background-color: #2196f3 !important;
  width: 150px;
  transition: all 2s;
}
.tooltip::after {
  content: "";
  position: absolute;
  bottom: 100%;
  left: 30%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: transparent transparent #555 transparent;
}

#a:hover > #b {
  display: block;
}
#b:hover {
  display: block;
}
li {
  background-color: rgb(243, 234, 234);
  display: inline-block;
  height: 32px;
  width: 100%;

  padding-top: 8px;
}
li:hover{
  background-color:rgb(224, 221, 221);
}
span:hover {
  color: rgb(26, 6, 207);
}
</style>
