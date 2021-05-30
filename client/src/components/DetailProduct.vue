<template>
  <div class="row bg-white q-mt-sm">
    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
      <div class="q-pt-md q-pb-md q-pr-md">
        <q-carousel swipeable animated v-model="slide" thumbnails infinite>
          <q-carousel-slide :name="1" :img-src="product.img1" />
          <q-carousel-slide :name="2" :img-src="product.img2" />
          <q-carousel-slide :name="3" :img-src="product.img3" />
          <q-carousel-slide :name="4" :img-src="product.img4" />
        </q-carousel>
      </div>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 q-pl-xl">
      <!--<q-scroll-area :style="{'height':(win_height-200)+'px'}">-->
      <div class="row">
        <div
          class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
          :class="$q.platform.is.desktop ? '' : 'q-px-md'"
        >
          <div class="text-h6 text-grey-10 q-mt-sm q-pt-xs">
            {{ product.name }}
          </div>
          <div class="text-h6 text-grey-10">
            <q-chip
              size="10px"
              class="text-weight-bold text-h6 q-px-xs"
              square
              color="green-7"
              text-color="white"
              icon-right="star"
            >
              4.4
            </q-chip>
            <span class="text-subtitle2 text-weight-bold text-grey-6"
              >6 Đánh giá & 2 Bình luận</span
            >
          </div>
          <div>
            <div class="text-subtitle2 text-green-8 text-weight-bolder q-mt-sm">
              Giá đặc biệt
            </div>
            <span class="text-h6 text-orange-10">₫{{
              (product.origin_price - (product.origin_price * product.sale) / 100).toLocaleString("de-DE")
            }}</span
            ><span
              class="q-ml-sm text-grey-6"
              style="text-decoration: line-through"
              >₫{{ product.origin_price.toLocaleString("de-DE") }}</span
            >
            <span v-if="product.sale"
              class="q-ml-md text-subtitle2 text-red text-weight-bolder q-mt-md"
              >Giảm giá {{ product.sale }}%</span
            >
          </div>
          <div class="q-mt-sm text-weight-bold">
            Đặc biệt:
            <ul class="q-pl-sm text-subtitle2" style="list-style-type: none">
              <li class="q-mt-xs">
                <span class="text-weight-bold">Giảm</span> 5% khi
                thanh toán bằng 
                <a class="text-primary text-weight-bolder">AirPay</a>
              </li>
              <li class="q-mt-xs">
                <span class="text-weight-bold">Giảm</span> 5,5% khi thanh toán bằng 
                <a class="text-primary text-weight-bolder">Paypal</a>
              </li>
            </ul>
          </div>
          <div class="q-mt-sm">
            <div class="text-subtitle1 text-green-8 text-weight-bold">
              Trong kho : 99
            </div>
            <div class="text-subtitle2 q-mt-sm text-grey-8 text-weight-bold">
              Giao hàng sau: <span class="text-black">3 ngày</span>
            </div>
            <div
              class="text-subtitle2 text-subtitle2 text-grey-8 text-weight-bold"
            >
              Thời gian nhận hàng chậm nhất:
              <span class="text-black">5 ngày sau khi đặt hàng</span>
            </div>
          </div>
          <span>Số lượng: </span>
          <q-btn
            outline
            class="q-mt-xs q-mx-md bg-grey-4"
            style="width: 50px"
            color="primary"
            @click="quantity > 1 && --quantity"
          >
            <q-icon name="remove"
          /></q-btn>
          <b href="">{{ quantity }}</b>

          <q-btn
            outline
            class="q-mt-xs q-ml-md bg-grey-4"
            style="width: 50px"
            color="primary"
            @click="++quantity"
          >
            <q-icon name="add" />
          </q-btn>

          <div>
            <q-btn
              class="q-mt-md"
              color="orange-9"
              icon="shopping_cart"
              @click="addToCart"
              label="Thêm vào giỏ hàng"
            />
            <q-btn
              class="q-mt-md q-ml-md"
              color="orange-8"
              icon="shopping_cart"
              label="Mua ngay"
            />
          </div>
        </div>
      </div>

      <!--</q-scroll-area>-->
    </div>
    <q-dialog v-model="alert">
      <q-card>
        <q-card-section class="text-center">
          <q-icon
            name="check_circle"
            class="bg-green text-white rounded-borders"
            style="border-radius: 50%"
            size="5rem"
          />
        </q-card-section>

        <q-card-section class="q-pt-none text-h5">
          Sản phẩm đã được thêm vào giỏ hàng !!!
        </q-card-section>

        <q-card-actions align="right">
          <q-btn flat label="OK" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
  </div>
</template>

<script>
import { mapGetters, mapMutations, mapActions } from "vuex";
import EventBus from "../boot";
export default {
  props: ["product"],
  data() {
    return {
      quantity: 1,
      slide: 1,
      tab: "Specifications",
      rating_point: 4.3,
      rat_5: 5,
      rat_4: 4,
      rat_3: 3,
      rat_2: 2,
      rat_1: 1,
      current: 1,
      alert: false,
    };
  },
  computed: {
    ...mapGetters(["isAuthenticated"]),
  },
  methods: {
    ...mapMutations(["ADD_TO_CART"]),
    ...mapActions(["addItemInCart", "acCheckCartExisted", "acUpdateCart"]),
    async addToCart() {
      console.log(await this.isAuthenticated);

      if (this.isAuthenticated) {
        const data = await this.acCheckCartExisted({ id: this.product.id });
        if (!data) {
          const payload = {
            product_id: this.product.id,
            quantity: this.quantity,
          };
          console.log(payload);
          const data1 = await this.addItemInCart(payload);
          if (data1.success) {
            EventBus.$emit("EBModifyCart");
            this.alert = true;
          } else {
            this.$q.notify({
              message: "Có lỗi xảy ra",
              color: "red",
            });
          }
        } else {
          const data2 = await this.acUpdateCart({
            id: data.id,
            quantity: data.quantity + this.quantity,
          });
          if (data2.success) {
            EventBus.$emit("EBModifyCart");
            this.alert = true;
          } else {
            this.$q.notify({
              message: "Có lỗi xảy ra",
              color: "red",
            });
          }
          console.log("tồn tại cart", data.quantity);
        }
      } else {
        this.$router.push("/auth");
      }
    },
  },
};
</script>

<style>
</style>