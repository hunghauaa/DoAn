<template>
  <div>
    <Header />
    <div class="row justify-center items-center content-center">
      <div class="col-md-10">
        <DetailProduct :product="product" />
      </div>
    </div>
    <div class="row justify-center items-center content-center">
      <DescriptionProduct
        :description="product.description"
        class="col-md-10 col-xs-10 col-sm -10"
      />
    </div>
    <div class="row justify-center items-center content-center">
      <Comment class="col-md-10 col-sm-10 col-xs-10"/>
    </div>
    <div class="row justify-center items-center content-center">
      <div class="col-md-10 col-sm-10 col-xs-10">
        <h5>Sản phẩm tương tự</h5>
        <div class="row justify-center items-center content-center">
          <div
            v-for="product in productFil "
            :key="product.id"
            class="col-md-2 col-lg-2"
          >
            <Product :product="product" />
          </div>
        </div>
      </div>
    </div>
    <div class=" fit row wrap justify-center items-center content-center">
      <!-- <q-pagination
        class="q-mt-md"
        v-model="current"
        :max="5"
        direction-links
        flat
        color="grey-6"
        active-color="primary"
      /> -->
    </div>

    <Footer class="q-mt-md" />
  </div>
</template>

<script>
import Header from "../components/Header";
import Footer from "../components/Footer";
import DescriptionProduct from "../components/DescriptionProduct";
import Comment from "../components/Comment";
import Product from "../components/Product";
import DetailProduct from "../components/DetailProduct";
import { mapGetters, mapActions, mapMutations } from "vuex";
import array from "lodash/array";

export default {
  components: {
    Header,
    Footer,
    DescriptionProduct,
    DetailProduct,
    Comment,
    Product,
  },
  data() {
    return {
      slide: 1,
      tab: "Specifications",
      rating_point: 4.3,
      rat_5: 5,
      rat_4: 4,
      rat_3: 3,
      rat_2: 2,
      rat_1: 1,
      current: 1,
      product: null,
    };
  },
  computed: {
    ...mapGetters(["products"]),
    productFil(){
     const data =  array.chunk(this.products, 12)
     return data[1]
    }
  },
  methods: {
    ...mapActions(["getProductDetails"]),
    ...mapMutations(["ADD_TO_CART"]),
  },
  async mounted() {
    const { id } = this.$route.params;
    const data = await this.getProductDetails({ id });
    this.product = data;
    console.log(data);
  },

  //   computed: {
  //     win_width() {
  //       return this.$q.screen.width - 59;
  //     },
  //     win_height() {
  //       return this.$q.screen.height - 0;
  //     },
  //   },
};
</script>

<style scoped></style>
