<template>
  <div class="q-pa-md">
    <div class="q-gutter-y-md">
      <q-card>
        <q-tabs
          v-model="tab"
          dense
          class="bg-grey-3 text-black"
          active-color="primary"
          indicator-color="purple"
          align="justify"
        >
          <q-tab name="all" label="Tất cả" />
          <q-tab name="active" label="Chờ xác nhận" />
          <q-tab name="take" label="Chờ lấy hàng" />
          <q-tab name="ship" label="Đang giao" />
          <q-tab name="shiped" label="Đã giao" />
          <q-tab name="cancel" label="Đã hủy" />
        </q-tabs>

        <q-tab-panels v-model="tab" animated class="text-white">
          <q-tab-panel name="all">
            <div class="q-pa-md">
              <q-list class="list" v-for="order in getOrder" v-bind:key="order.id">
                <q-item
                  v-for="product in order.Order_details"
                  v-bind:key="product.id"
                >
                  <q-item-section top avatar>
                    <img
                      width="100px"
                      height="100px"
                      :src="product.Product.img1"
                      alt=""
                    />
                  </q-item-section>

                  <q-item-section>
                    <q-item-label caption lines="2"
                      ><p class="text-h6" style="color: black">
                        {{ product.Product.name }}
                      </p></q-item-label
                    >
                    <q-item-label caption
                      ><p style="color: black">
                        x {{ product.quantity }}
                      </p></q-item-label
                    >
                  </q-item-section>

                  <q-item-section side bot>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: black">
                        ₫{{ product.totalMoney }}
                      </p></q-item-label
                    >
                  </q-item-section>
                </q-item>
                <q-item>
                  <q-item-section top avatar>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: #fb5531">
                        Tổng thanh toán :
                      </p></q-item-label
                    >
                  </q-item-section>

                  <q-item-section>
                    <q-item-label caption lines="2"></q-item-label>
                    <q-item-label caption></q-item-label>
                  </q-item-section>

                  <q-item-section side bot>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: #fb5531">
                        ₫{{ order.intoMoney + order.transportFee }}
                      </p></q-item-label
                    >
                  </q-item-section>
                </q-item>

                <q-separator spaced inset />
              </q-list>
            </div>
          </q-tab-panel>
          <q-tab-panel name="active">
            <div class="q-pa-md">
              <q-list class="list"
                v-for="order in getOrder.filter(
                  (e) => e.order_progress_id == 1
                )"
                v-bind:key="order.id"
              >
                <q-item
                  v-for="product in order.Order_details"
                  v-bind:key="product.id"
                >
                  <q-item-section top avatar>
                    <img
                      width="100px"
                      height="100px"
                      :src="product.Product.img1"
                      alt=""
                    />
                  </q-item-section>

                  <q-item-section>
                    <q-item-label caption lines="2"
                      ><p class="text-h6" style="color: black">
                        {{ product.Product.name }}
                      </p></q-item-label
                    >
                    <q-item-label caption
                      ><p style="color: black">
                        x {{ product.quantity }}
                      </p></q-item-label
                    >
                  </q-item-section>

                  <q-item-section side bot>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: black">
                        ₫{{ product.totalMoney }}
                      </p></q-item-label
                    >
                  </q-item-section>
                </q-item>
                <q-item>
                  <q-item-section top avatar>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: #fb5531">
                        Tổng thanh toán :
                      </p></q-item-label
                    >
                  </q-item-section>

                  <q-item-section>
                    <q-item-label caption lines="2"></q-item-label>
                    <q-item-label caption></q-item-label>
                  </q-item-section>

                  <q-item-section side bot>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: #fb5531">
                        ₫{{ order.intoMoney + order.transportFee }}
                      </p></q-item-label
                    >
                  </q-item-section>
                </q-item>

                <q-separator spaced inset />
              </q-list>
            </div>
          </q-tab-panel>
          <q-tab-panel name="take">
            <div class="q-pa-md">
              <q-list class="list"
                v-for="order in getOrder.filter(
                  (e) => e.order_progress_id == 2
                )"
                v-bind:key="order.id"
              >
                <q-item
                  v-for="product in order.Order_details"
                  v-bind:key="product.id"
                >
                  <q-item-section top avatar>
                    <img
                      width="100px"
                      height="100px"
                      :src="product.Product.img1"
                      alt=""
                    />
                  </q-item-section>

                  <q-item-section>
                    <q-item-label caption lines="2"
                      ><p class="text-h6" style="color: black">
                        {{ product.Product.name }}
                      </p></q-item-label
                    >
                    <q-item-label caption
                      ><p style="color: black">
                        x {{ product.quantity }}
                      </p></q-item-label
                    >
                  </q-item-section>

                  <q-item-section side bot>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: black">
                        ₫{{ product.totalMoney }}
                      </p></q-item-label
                    >
                  </q-item-section>
                </q-item>
                <q-item>
                  <q-item-section top avatar>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: #fb5531">
                        Tổng thanh toán :
                      </p></q-item-label
                    >
                  </q-item-section>

                  <q-item-section>
                    <q-item-label caption lines="2"></q-item-label>
                    <q-item-label caption></q-item-label>
                  </q-item-section>

                  <q-item-section side bot>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: #fb5531">
                        ₫{{ order.intoMoney + order.transportFee }}
                      </p></q-item-label
                    >
                  </q-item-section>
                </q-item>

                <q-separator spaced inset />
              </q-list>
            </div>
          </q-tab-panel>
          <q-tab-panel name="ship">
            <div class="q-pa-md">
              <q-list class="list"
                v-for="order in getOrder.filter(
                  (e) => e.order_progress_id == 3
                )"
                v-bind:key="order.id"
              >
                <q-item
                  v-for="product in order.Order_details"
                  v-bind:key="product.id"
                >
                  <q-item-section top avatar>
                    <img
                      width="100px"
                      height="100px"
                      :src="product.Product.img1"
                      alt=""
                    />
                  </q-item-section>

                  <q-item-section>
                    <q-item-label caption lines="2"
                      ><p class="text-h6" style="color: black">
                        {{ product.Product.name }}
                      </p></q-item-label
                    >
                    <q-item-label caption
                      ><p style="color: black">
                        x {{ product.quantity }}
                      </p></q-item-label
                    >
                  </q-item-section>

                  <q-item-section side bot>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: black">
                        ₫{{ product.totalMoney }}
                      </p></q-item-label
                    >
                  </q-item-section>
                </q-item>
                <q-item>
                  <q-item-section top avatar>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: #fb5531">
                        Tổng thanh toán :
                      </p></q-item-label
                    >
                  </q-item-section>

                  <q-item-section>
                    <q-item-label caption lines="2"></q-item-label>
                    <q-item-label caption></q-item-label>
                  </q-item-section>

                  <q-item-section side bot>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: #fb5531">
                        ₫{{ order.intoMoney + order.transportFee }}
                      </p></q-item-label
                    >
                  </q-item-section>
                </q-item>

                <q-separator spaced inset />
              </q-list>
            </div>
          </q-tab-panel>
          <q-tab-panel name="shiped">
            <div class="q-pa-md">
              <q-list class="list"
                v-for="order in getOrder.filter(
                  (e) => e.order_progress_id == 4
                )"
                v-bind:key="order.id"
              >
                <q-item
                  v-for="product in order.Order_details"
                  v-bind:key="product.id"
                >
                  <q-item-section top avatar>
                    <img
                      width="100px"
                      height="100px"
                      :src="product.Product.img1"
                      alt=""
                    />
                  </q-item-section>

                  <q-item-section>
                    <q-item-label caption lines="2"
                      ><p class="text-h6" style="color: black">
                        {{ product.Product.name }}
                      </p></q-item-label
                    >
                    <q-item-label caption
                      ><p style="color: black">
                        x {{ product.quantity }}
                      </p></q-item-label
                    >
                  </q-item-section>

                  <q-item-section side bot>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: black">
                        ₫{{ product.totalMoney }}
                      </p></q-item-label
                    >
                  </q-item-section>
                </q-item>
                <q-item>
                  <q-item-section top avatar>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: #fb5531">
                        Tổng thanh toán :
                      </p></q-item-label
                    >
                  </q-item-section>

                  <q-item-section>
                    <q-item-label caption lines="2"></q-item-label>
                    <q-item-label caption></q-item-label>
                  </q-item-section>

                  <q-item-section side bot>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: #fb5531">
                        ₫{{ order.intoMoney + order.transportFee }}
                      </p></q-item-label
                    >
                  </q-item-section>
                </q-item>

                <q-separator spaced inset />
              </q-list>
            </div>
          </q-tab-panel>
          <q-tab-panel name="cancel">
            <div class="q-pa-md">
              <q-list class="list"
                v-for="order in getOrder.filter(
                  (e) => e.order_progress_id == 6
                )"
                v-bind:key="order.id"
              >
                <q-item
                  v-for="product in order.Order_details"
                  v-bind:key="product.id"
                >
                  <q-item-section top avatar>
                    <img
                      width="100px"
                      height="100px"
                      :src="product.Product.img1"
                      alt=""
                    />
                  </q-item-section>

                  <q-item-section>
                    <q-item-label caption lines="2"
                      ><p class="text-h6" style="color: black">
                        {{ product.Product.name }}
                      </p></q-item-label
                    >
                    <q-item-label caption
                      ><p style="color: black">
                        x {{ product.quantity }}
                      </p></q-item-label
                    >
                  </q-item-section>

                  <q-item-section side bot>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: black">
                        ₫{{ product.totalMoney }}
                      </p></q-item-label
                    >
                  </q-item-section>
                </q-item>
                <q-item>
                  <q-item-section top avatar>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: #fb5531">
                        Tổng thanh toán :
                      </p></q-item-label
                    >
                  </q-item-section>

                  <q-item-section>
                    <q-item-label caption lines="2"></q-item-label>
                    <q-item-label caption></q-item-label>
                  </q-item-section>

                  <q-item-section side bot>
                    <q-item-label caption class="text-bold"
                      ><p class="text-subtitle1" style="color: #fb5531">
                        ₫{{ order.intoMoney + order.transportFee }}
                      </p></q-item-label
                    >
                  </q-item-section>
                </q-item>

                <q-separator spaced inset />
              </q-list>
            </div>
          </q-tab-panel>
        </q-tab-panels>
      </q-card>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  data() {
    return {
      tab: "all",
    };
  },
  computed: { ...mapGetters(["getOrder"]) },
  methods: {
    // ...mapActions(["acGetAllOrder"]),
  },
  async created() {
    //   const data = await this.getOrder();
    console.log(this.getOrder);
  },
};
</script>
<style scoped>
.list:hover{
  background-color:rgb(209, 204, 204)  !important;
}
</style>