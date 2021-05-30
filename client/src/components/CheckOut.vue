<template>
  <div class="temp">
    <div class="row justify-center items-center content-center q-pa-md price">
      <div class="col-md-12 col-sm-12 col-xs-12 q-py-sm">
        <q-icon color="red" name="room" size="1.5rem" /> Địa chỉ nhận hàng
      </div>
      <div class="col-md-3 col-sm-3 col-xs-3 q-mt-md">
        <p>
          <b>{{ getUserInfo.user.name }}</b>
        </p>
        <p>
          <b>{{ getUserInfo.user.phone_number }} </b>
        </p>
      </div>
      <div class="col-md-6 col-sm-6 col-xs-6">
        <p>
          {{ getUserInfo.user.address }}
        </p>
      </div>
      <div class="col-md-3 col-sm-3 col-xs-3 q-pl-xl">
        <q-btn flat label="Thay đổi" color="primary" />
      </div>
    </div>
    <div class="price q-pa-md q-mt-md">
      <div class="row justify-center items-center content-center">
        <div class="col-md-4 col-sm-4 col-xs-4">
          <p>Sản phẩm</p>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>Mô tả</p>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>Đơn giá</p>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>Số lượng</p>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>Thành tiền</p>
        </div>
      </div>
      <div
        v-for="product in productCheckOut"
        v-bind:key="product.id"
        class="row justify-center items-center content-center q-py-md"
      >
        <div class="col-md-4 col-sm-4 col-xs-4">
          <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-3">
              <img width="50" height="50" :src="product.Product.img1" alt="" />
            </div>
            <div class="col-md-9 q-pr-md">
              {{ product.Product.name }}
            </div>
          </div>
        </div>

        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>Loại: Kích Thước 60-100cm</p>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>
            ₫{{
              (product.Product.origin_price -
              (product.Product.origin_price * product.Product.sale) / 100).toLocaleString("de-DE")
            }}
          </p>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>{{ product.quantity }}</p>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>
            ₫{{
              ((product.Product.origin_price -
                (product.Product.origin_price * product.Product.sale) / 100) *
              product.quantity).toLocaleString("de-DE")
            }}
          </p>
        </div>
      </div>
      <div class="row justify-around items-center content-center q-py-md">
        <div class="col-md-9 col-sm-6 col-xs-6">
          <p>Voucher của Shop</p>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-6">
          <q-icon name="receipt" />
          <b class="q-pl-md">-10%</b>
          <q-btn flat label="Chọn Voucher" color="primary" />
        </div>
      </div>
    </div>
    <div class="price q-pa-md q-mb-md">
      <div class="row justify-center items-center content-center">
        <div class="col-md-4 col-sm-4 col-xs-4">
          <span>Lời nhắn:</span>
          <q-input
            ma
            stack-label
            class="q-ml-md"
            style="width: 250px; height: 1rem; display: inline-block"
            v-model="message"
            label="Lưu ý cho người bán"
          />
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>Đơn vị vận chuyển:</p>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2 q-pr-md">
          <p style="font-weight: bold">Vận chuyển nhanh</p>
          <p>{{ shipAddress[0].name }}</p>
          <p>Nhận hàng vào 15 Th05 - 16 Th05</p>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
          <q-btn
            flat
            label="Thay đổi"
            color="primary"
            @click="confirmShip = true"
          />
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>₫{{ shipAddress[0].money.toLocaleString("de-DE") }}</p>
        </div>
      </div>
    </div>
    <q-dialog v-model="confirmShip" persistent>
      <q-card style="width: 40rem">
        <q-card-section class="row items-center">
          <b class="q-ml-sm text-h6">Chọn đơn vị vận chuyển</b>
          <div v-for="method in deliveryMethod" v-bind:key="method.id">
            <q-radio
              dense
              v-model="deliveryMethodChecked"
              @input="checked"
              :val="method.id"
            >
              <q-item>
                <q-item-section>
                  <q-item-label class="text-subtitle1">{{
                    method.name
                  }}</q-item-label>
                  <q-item-label>Cho phép thanh toán khi nhận hàng</q-item-label>
                  <q-item-label caption
                    >Thời gian nhận hàng dự kiến từ 3-5 ngày kể từ ngày
                    đặt</q-item-label
                  >
                </q-item-section>
              </q-item></q-radio
            >
          </div>
        </q-card-section>

        <q-card-actions align="right">
          <q-btn
            class="bg-grey"
            label="Quay lại"
            color="primary"
            v-close-popup
          />
          <q-btn
            class="bg-deep-orange"
            label="Hoàn thành"
            color="primary"
            v-close-popup
          />
        </q-card-actions>
      </q-card>
    </q-dialog>
    <div class="price q-pa-md q-mt-md">
      <div class="row justify-center items-center content-center">
        <div class="col-md-8 col-sm-8 col-xs-8">
          <p>Phương thức thanh toán</p>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>Thanh toán khi nhận hàng</p>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>Thay đỏi</p>
        </div>
      </div>
      <div class="row justify-center items-center content-center q-py-md">
        <div class="col-md-8 col-sm-8 col-xs-8"></div>

        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>Tổng tiền hàng</p>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>₫{{ tongTienHang.toLocaleString("de-DE") }}</p>
        </div>
      </div>
      <div class="row justify-center items-center content-center q-py-md">
        <div class="col-md-8 col-sm-8 col-xs-8"></div>

        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>Phí vận chuyển</p>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>₫{{ phiVanChuyen.toLocaleString("de-DE") }}</p>
        </div>
      </div>
      <div class="row justify-center items-center content-center q-py-md">
        <div class="col-md-8 col-sm-8 col-xs-8"></div>

        <div class="col-md-2 col-sm-2 col-xs-2">
          <p>Tổng thanh toán</p>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
          <p class="text-orange-10 text-h4">
            ₫{{ tongThanhToan.toLocaleString("de-DE") }}
          </p>
        </div>
      </div>
      <div class="row justify-center items-center content-center q-py-md">
        <div class="col-md-8 col-sm-8 col-xs-8"></div>
        <div class="col-md-4 col-sm-4 col-xs-4">
          <div class="q-pa-md q-gutter-sm q-ml-xl">
            <q-btn
              class="btn__"
              color="deep-orange"
              @click="confirmCheckout"
              glossy
              label="Đặt hàng"
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  props: ["productCheckOut"],
  data() {
    return {
      phiVanChuyen: 35000,
      confirmShip: false,
      deliveryMethodChecked: 1,
      message: null,
      shipAddress: null,
    };
  },
  computed: {
    ...mapGetters(["getUserInfo", "deliveryMethod"]),
    tongTienHang() {
      let data = 0;
      this.productCheckOut.forEach(
        (e) =>
          (data +=
            e.quantity *
            (e.Product.origin_price -
              (e.Product.origin_price * e.Product.sale) / 100))
      );
      return data;
    },
    tongThanhToan() {
      return this.tongTienHang + this.shipAddress[0].money;
    },
  },
  methods: {
    ...mapActions([
      "acCreateOrder",
      "acDeleteCart",
      "getCart",
      "acCreateOrderDetail",
      "acGetAllOrder",
    ]),
    checked(value) {
      console.log(this.deliveryMethodChecked, value);
      this.shipAddress = this.deliveryMethod.filter((e) => e.id == value);
      console.log(this.shipAddress);
    },
    async confirmCheckout() {
      const payload = {
        order_progress_id: 1,
        payment_method_id: 1,
        delivery_method_id: this.deliveryMethodChecked,
        intoMoney: this.tongThanhToan,
        transportFee: this.shipAddress[0].money,
        description: this.message,
      };

      const data = await this.acCreateOrder(payload);
      console.log("data", data);

      if (data) {
        let payload1 = [];
        let payloadDel = [];
        this.productCheckOut.forEach((e) => {
          payload1.push({
            createdBy: this.getUserInfo.user.id,
            OrderId: data.id,
            ProductId: e.ProductId,
            quantity: e.quantity,
            totalMoney:
              (e.Product.origin_price -
                (e.Product.origin_price * e.Product.sale) / 100) *
              e.quantity,
          });
          payloadDel.push(e.id);
        });
        const data1 = await this.acCreateOrderDetail(payload1);
        if (data1) {
          await Promise.all([
            this.acGetAllOrder(),
            this.acDeleteCart({ id: payloadDel }),
            this.getCart(),
          ]);
          this.$router.push("/profile?slug=2");
        }
      }

      // console.log("data", payload1);
    },
  },
  created() {
    this.shipAddress = this.deliveryMethod.filter((e) => e.id == 1);
  },
};
</script>

<style scoped>
.price {
  box-shadow: 0 1px 5px rgb(0 0 0 / 20%), 0 2px 2px rgb(0 0 0 / 14%),
    0 3px 1px -2px rgb(0 0 0 / 12%);
}
</style>
