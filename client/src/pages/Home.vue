<template>
  <div>
    <Header @onClick="onClick" />
    <Slider />
    <div class="row justify-center items-center content-center">
      <div class="col-md-10">
        <h4 style="text-align: center">Sản phẩm bán chạy </h4>

        <div class="row justify-center items-center content-center">
          <div
            v-for="product in products"
            :key="product.id"
            class="col-md-2 col-lg-2"
          >
            <Product :product="product" />
          </div>
        </div>
      </div>
    </div>
        <div class="row justify-center items-center content-center">
      <div class="col-md-10">
        <h4 style="text-align: center">Sản phẩm mới </h4>

        <div class="row justify-center items-center content-center">
          <div
            v-for="product in products"
            :key="product.id"
            class="col-md-2 col-lg-2"
          >
            <Product :product="product" />
          </div>
        </div>
      </div>
    </div>
    <div class="row justify-center items-center content-center">
      <div class="col-md-10 col-xs-10 q-pa-md">
        <h4 style="text-align: center">Thương hiệu yêu thích</h4>
        <ListCategory />
      </div>
    </div>
    <Footer />
  </div>
</template>

<script>
// import HelloWorld from './components/HelloWorld.vue'
import Header from "../components/Header";
import Slider from "../components/Slide";
import Product from "../components/Product";
import ListCategory from "../components/ListCategory";
import Footer from "../components/Footer";
import { mapActions, mapGetters } from "vuex";

export default {
  components: {
    Header,
    Slider,
    Product,
    ListCategory,
    Footer,
  },
  computed: {
    ...mapGetters(["products"]),
  },

  data() {
    return {
      listProduct: null,
    };
  },
  methods: {
    ...mapActions(["getProducts"]),
    async onClick(e) {
      console.log(e);
    },
  },
  async mounted() {
    await this.getProducts();
    console.log(this.products);

  },
};
</script>

<style></style>
