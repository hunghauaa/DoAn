<template>
  <header>
    <div
      class="
        row
        justify-center
        items-center
        content-center
        bg-blue-6
        header__top
      "
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
            <img :src="getUserInfo.user.avatar" />
          </q-avatar>
          <b class="q-ml-sm q-mr-xl userName">{{
            getUserInfo.user.name
          }}</b>
          <ul id="b" class="tooltip">
            <li>
              <router-link
                to="/profile?slug=1"
                style="color: black; text-decoration: none"
                class="q-ml-sm"
                >Tài khoản của tôi</router-link
              >
            </li>

            <li>
              <router-link
                to="/profile?slug=2"
                style="color: black; text-decoration: none"
                class="q-ml-sm"
                >Đơn đã mua</router-link
              >
            </li>
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
            <q-input
              rounded
              outlined
              type="search"
              v-model="txtSearch"
              class="search"
            >
              <template v-slot:append>
                <q-icon name="search" @click="searchPro" />
              </template>
            </q-input>
          </div>
        </div>
      </div>
      <div class="col-md-4">
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
import * as JsSearch from "js-search";
import EventBus from "../boot";
export default {
  // components: { Search },
  components: {},
  computed: {
    ...mapGetters(["itemOfCart", "getUserInfo", "products"]),
  },
  data() {
    return {
      count: 2,
      txtSearch: null,
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
    removeVietnameseTones(str) {
      str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
      str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
      str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
      str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
      str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
      str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
      str = str.replace(/đ/g, "d");
      str = str.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g, "A");
      str = str.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g, "E");
      str = str.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, "I");
      str = str.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g, "O");
      str = str.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, "U");
      str = str.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, "Y");
      str = str.replace(/Đ/g, "D");
      // Some system encode vietnamese combining accent as individual utf-8 characters
      // Một vài bộ encode coi các dấu mũ, dấu chữ như một kí tự riêng biệt nên thêm hai dòng này
      str = str.replace(/\u0300|\u0301|\u0303|\u0309|\u0323/g, ""); // ̀ ́ ̃ ̉ ̣  huyền, sắc, ngã, hỏi, nặng
      str = str.replace(/\u02C6|\u0306|\u031B/g, ""); // ˆ ̆ ̛  Â, Ê, Ă, Ơ, Ư
      // Remove extra spaces
      // Bỏ các khoảng trắng liền nhau
      str = str.replace(/ + /g, " ");
      str = str.trim();
      // Remove punctuations
      // Bỏ dấu câu, kí tự đặc biệt
      str = str.replace(
        /!|@|%|\^|\*|\(|\)|\\=|\\<|\\>|\?|\/|,|\.|\\:|\\;|\\'|\\"|\\&|\\#|\[|\]|~|\$|_|`|-|{|}|\||\\/g,
        " "
      );
      return str;
    },
    async searchPro() {
      if (this.txtSearch) {
        let search = new JsSearch.Search("id");
        // search.addIndex("name");
        search.addIndex("slug");
        search.addDocuments(this.products);
        let data = search.search(this.removeVietnameseTones(this.txtSearch));
        // console.log(data)
        // // return
        console.log(this.$route.path);
        EventBus.$emit("search", data);

        this.$router.push("/all-products");
      }
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
  color: black;
  border-radius: 5px;

  position: absolute;
  background-color: #2196f3 !important;
  width: 150px;
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
#b {
  transition-delay: 5s;
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
li:hover {
  background-color: rgb(224, 221, 221);
}
span:hover {
  color: rgb(26, 6, 207);
}
</style>
