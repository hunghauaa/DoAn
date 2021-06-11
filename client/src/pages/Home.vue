<template>
  <div>
    <Header @onClick="onClick" />
    <Slider />
    <!-- <div class="row justify-center items-center content-center">
      <div class="col-10">
        <div class="row">
          <div class="col-md-4">
            <div class="cms-block1">
              <h4>Free Shipping &amp; Return</h4>
              <p>All Order Over $ 338</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="cms-block3">
              <h4>Online Support 24/7</h4>
              <p>All Question All Time</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="cms-block2">
              <h4>Money Back Guarantee</h4>
              <p>100% Money back Guarantee</p>
            </div>
          </div>
        </div>
      </div>
    </div> -->
    <div class="row justify-center items-center content-center">
      <div class="col-md-10 col-sm-10 col-xs-10">
        <h4 style="text-align: center">Sản phẩm bán chạy</h4>

        <div class="row justify-center items-center content-center">
          <div
            v-for="product in dataChunk[0]"
            :key="product.id"
            class="col-md-2 col-lg-2 col-sm-3 col-xs-12">
            <Product :product="product" />
          </div>
        </div>
      </div>

      <p
        class="bg-grey-5 text-center text-white q-mt-sm"
        style="text-align: center,display: inline-block;width: 300px"
        @click="$router.push('/all-products')"
      >
        Xem tất cả
      </p>
    </div>
    <div class="row justify-center items-center content-center">
      <div class="col-md-10 col-sm-10 col-xs-10">
        <h4 style="text-align: center">Sản phẩm mới</h4>

        <div class="row justify-center items-center content-center">
          <div
            v-for="product in dataChunk[1]"
            :key="product.id"
            class="col-md-2 col-lg-2 col-sm-3 col-xs-12">
            <Product :product="product" />
          </div>
        </div>
      </div>
      <p
        class="bg-grey-5 text-center text-white q-mt-sm"
        style="text-align: center,display: inline-block;width: 300px"
        @click="$router.push('/all-products')"
      >
        Xem tất cả
      </p>
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
import array from "lodash/array";

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
      dataChunk: null,
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
    this.dataChunk = array.chunk(this.products, 12);
    console.log(this.dataChunk);
  },
};
</script>

<style></style>
