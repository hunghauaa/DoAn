<template>
  <div>
    <Header />
    <div class="row justify-center items-center content-center">
      <h4
        class="bg-orange-9 text-center text-white"
        style="text-align: center,display: inline-block;width: 300px;border-radius: 15px"
      >
        Tất cả
      </h4>
    </div>
    <div class="row justify-center">
      <div class="col-md-2 col-sm-12 col-xs-12 q-mt-lg">
        <p class="text-subtitle1 text-weight-bold text-grey">
          <q-icon name="filter_alt" size="2rem" color="grey"> </q-icon> BỘ LỌC
          TÌM KIẾM
        </p>
        <p class="q-ml-sm text-subtitle1 text-grey">Theo danh mục</p>

        <div class="q-pa-md">
          <q-option-group
            :options="categorys"
            type="checkbox"
            v-model="category"
            @input="filter"
          />
        </div>
        <p class="q-ml-sm text-subtitle1 text-grey">Theo thương hiệu</p>
        <div class="q-pa-md">
          <q-option-group
            :options="companys"
            type="checkbox"
            v-model="company"
            @input="filter"
          />
        </div>
        <p class="q-ml-sm text-subtitle1 text-grey">Theo khoảng giá</p>
        <div class="q-pa-md q-ml-sm">
          <input
            type="number"
            maxlength="13"
            class="shopee-price-range-filter__input"
            placeholder="₫ TỪ"
            v-model="fromPrice"
          />
          <span class="text-grey"> - </span>
          <input
            type="number"
            maxlength="13"
            class="shopee-price-range-filter__input"
            placeholder="₫ ĐẾN"
            v-model="toPrice"
          />
          <div class="q-py-md q-gutter-sm">
            <q-btn
              color="deep-orange"
              glossy
              label="ÁP DỤNG"
              style="width: 170px"
              @click="filter"
            />
          </div>
          <!-- <q-option-group :options="options" type="checkbox" v-model="group" /> -->
        </div>
      </div>
      <div class="col-md-8 col-sm-8 col-xs-8">
        <div class="row justify-center items-center content-center">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="row justify-start" style="min-height: 550px">
              <div
                v-for="product in productAll"
                :key="product.id"
                class="col-md-3 col-lg-3 col-sm-4 col-xs-12"
              >
                <Product :product="product" />
              </div>
            </div>
          </div>
          <div class="q-pa-lg flex flex-center">
            <!-- <q-pagination
        v-model="current"
        :max="products.length / 24"
        @click="onClick"
      /> -->
            <q-pagination
              direction-links
              v-model="current"
              :max="maxPage"
              @click="onClick"
            />
          </div>
        </div>
      </div>
    </div>

    <Footer />
  </div>
</template>

<script>
import Header from "../components/Header";
import Footer from "../components/Footer";
import Product from "../components/Product";
import array from "lodash/array";
import EventBus from "../boot";

import { mapGetters, mapActions } from "vuex";
export default {
  components: {
    Header,
    Footer,
    Product,
  },
  data() {
    return {
      productAll: null,
      dataChunk: null,
      current: 1,
      maxPage: 5,
      fromPrice: null,
      toPrice: null,
      group: [],
      category: [],
      company: [],
      categorys: [
        { label: "Battery too low", value: "bat" },
        { label: "Friend request", value: "friend", color: "green" },
        { label: "Picture uploaded", value: "upload", color: "red" },
      ],
      companys: [
        { label: "Battery too low", value: "bat" },
        { label: "Friend request", value: "friend", color: "green" },
        { label: "Picture uploaded", value: "upload", color: "red" },
      ],
    };
  },
  computed: {
    ...mapGetters(["products"]),
  },
  methods: {
    ...mapActions(["acGetCategory", "acGetCompany"]),
    async filter() {
      console.log(this.category, this.company);
      let data = this.products.filter(
        (e) =>
          (this.category.length > 0
            ? this.category.includes(parseInt(e.category))
            : true) &&
          (this.company.length > 0
            ? this.company.includes(parseInt(e.company_id))
            : true) &&
          (this.fromPrice ? e.origin_price >= this.fromPrice : true) &&
          (this.toPrice ? e.origin_price <= this.toPrice : true)
        // e.category.includes(this.category)
      );
      this.dataChunk = await array.chunk(data, 12);
      this.productAll = this.dataChunk[0];
      this.maxPage = this.dataChunk.length;
      console.log(data);
    },
    async handler(data) {
      console.log("evb", data);
      this.dataChunk = await array.chunk(data, 12);
      this.productAll = this.dataChunk[0];
      this.maxPage = this.dataChunk.length;
    },
    onClick() {
      this.productAll = this.dataChunk[this.current - 1];
    },
  },
  async created() {
    this.dataChunk = await array.chunk(this.products, 12);
    this.productAll = this.dataChunk[0];
    this.maxPage = this.dataChunk.length;
    console.log(this.productAll);
    let categorys = await this.acGetCategory();
    categorys.map((e) => {
      e.label = e.name;
      e.value = e.id;
    });
    this.categorys = categorys;
    let companys = await this.acGetCompany();
    companys.map((e) => {
      e.label = e.name;
      e.value = e.id;
    });
    this.companys = companys;
    console.log(categorys);
  },
  async mounted() {
    console.log(this.getUserInfo);
    EventBus.$on("search", this.handler);
  },
};
</script>

<style>
.shopee-price-range-filter__input {
  -webkit-text-size-adjust: 100%;
  color: inherit;
  font: inherit;
  margin: 0;
  line-height: normal;
  height: 1.875rem;
  background-color: #fff;
  outline: none;
  border: 1px solid rgba(0, 0, 0, 0.26);
  box-sizing: border-box;
  padding-left: 0.3125rem;
  text-transform: uppercase;
  border-radius: 0.125rem;
  box-shadow: inset 0 1px 0 0 rgba(0, 0, 0, 0.05);
  width: 5rem;
  font-size: 0.75rem;
}
</style>