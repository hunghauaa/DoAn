<template>
  <div class="q-my-xl">
    <q-table
      ref="myTable"
      :class="tableClass"
      :dense="$q.screen.lt.xs"
      color="blue-8"
      tabindex="0"
      title="Giỏ hàng"
      :data="data"
      :columns="columns"
      @selection="selectionRow"
      @update:selected="selectedTableUpdate"
      row-key="id"
      :pagination.sync="pagination"
      hide-pagination
      selection="multiple"
      :selected.sync="selected"
      :filter="filter"
      @focusin.native="activateNavigation"
      @focusout.native="deactivateNavigation"
      @keydown.native="onKey"
    >
      <template v-slot:top-right>
        <q-input
          borderless
          dense
          debounce="300"
          v-model="filter"
          placeholder="Search"
        >
          <template v-slot:append>
            <q-icon name="search" />
          </template>
        </q-input>
      </template>
      <template v-slot:body-cell-name="props">
        <q-td :props="props" width="350px">
          <div class="row items-center">
            <div class="my-table-details ol-md-7">
              <!-- <p>{{props.row}}</p> -->
              <img
                width="100px"
                height="100px"
                :src="props.row.Product.img1"
                alt="haha"
              />
            </div>
            <div class="col-md-5">
              <q-badge
                class="word q-ml-xs text-subtitle1"
                style="
                  word-break: break-word !important;
                  word-spacing: revert;
                  white-space: normal;
                  width: 250px;
                  background-color: white !important;
                  color: black;
                  line-height: 1rem;
                "
                color="purple"
                :label="props.row.Product.name"
              />
            </div>
          </div>
        </q-td>
      </template>
      <template v-slot:body-cell-fat="props">
        <q-td :props="props">
          <q-btn
            outline
            class="q-mt-xs q-mx-md bg-grey-4"
            style="width: 50px"
            color="primary"
            @click="subQuantity(props.row)"
          >
            <q-icon name="remove"
          /></q-btn>
          <b>{{ props.row.quantity }}</b>

          <q-btn
            outline
            class="q-mt-xs q-ml-md bg-grey-4"
            style="width: 50px"
            color="primary"
            @click="addQuantity(props.row)"
          >
            <q-icon name="add" />
          </q-btn>
        </q-td>
      </template>
      <template v-slot:body-cell-iron="props">
        <q-td :props="props">
          <q-btn
            color="red"
            label="Xóa"
            @click="deleteCart(props.row.id)"
            size="md"
            no-caps
          ></q-btn>
        </q-td>
      </template>
      <template v-slot:body-cell-calories="props">
        <q-td :props="props">
          <span class="text-strike q-mr-sm" style="opacity: 0.5"
            >₫{{ props.row.Product.origin_price.toLocaleString("de-DE") }}</span
          >
          <span class="text-h6"
            >₫{{
              (
                props.row.Product.origin_price -
                (props.row.Product.origin_price * props.row.Product.sale) / 100
              ).toLocaleString("de-DE")
            }}</span
          >
        </q-td>
      </template>
      <template v-slot:body-cell-carbs="props">
        <q-td :props="props">
          <span class="text-orange-10 text-h6"
            >₫{{
              (
                (props.row.Product.origin_price -
                  (props.row.Product.origin_price * props.row.Product.sale) /
                    100) *
                props.row.quantity
              ).toLocaleString("de-DE")
            }}</span
          >
        </q-td>
      </template>
      <!-- <template v-slot:body-cell-calories="props">
        <q-td :props="props">
                  <q-td auto-width>
                    <q-btn
                      color="blue"
                      label="Kết thúc"
                      size="md"
                      no-caps
                      style="margin-right: 16px; width: 64px"
                    ></q-btn>

                    <q-btn
                      color="red"
                      label="Xóa"
                      size="md"
                      no-caps
                    ></q-btn>
        </q-td>
      </template> -->
      <!-- <template v-slot:body="props">
                
                <q-tr :props="props">
                  <q-td key="name" :props="name">
                    {{ props.row.number }}
                  </q-td>
                  <q-td key="calories" :props="calories">
                    {{ props.row.calories }}
                  </q-td>

                  <q-td auto-width>
                    <q-btn
                      color="blue"
                      label="Kết thúc"
                      size="md"
                      no-caps
                      style="margin-right: 16px; width: 64px"
                    ></q-btn>

                    <q-btn
                      color="red"
                      label="Xóa"
                      size="md"
                      no-caps
                    ></q-btn>
                  </q-td>
                </q-tr>
              </template> -->
    </q-table>
    <div class="row justify-center q-my-md">
      <q-pagination
        v-model="pagination.page"
        color="grey-8"
        :max="pagesNumber"
        size="sm"
      />
    </div>
    <q-dialog v-model="confirm" persistent>
      <q-card>
        <q-card-section class="row items-center">
          <span class="q-ml-md text-orange text-h6 q-mb-xl"
            >Bạn chắc chắc muốn bỏ sản phẩm này ?</span
          >
          <p class="q-ml-md q-mb -xl">{{ delName }}</p>
        </q-card-section>
        <q-card-actions align="center" class="q-mt-xl">
          <q-btn
            outline
            label="Có"
            @click="deleteCart(delId)"
            class="bg-primary text-white"
            color="primary"
            style="width: 45%"
            v-close-popup
          />
          <q-btn
            outline
            label="Không"
            color="grey"
            style="width: 45%"
            v-close-popup
          />
        </q-card-actions>
      </q-card>
    </q-dialog>
    <div
      class="row justify-center items-center content-center checkout q-my-md"
    >
      <div class="col-md-4 col-sm-4 col-xs-4 q-ml-xl text-subtitle1">
        <b> Chọn tất cả ({{ itemSelected }} sản phẩm) </b>
        <q-btn
          class="q-ml-xl"
          @click="deleteAllCart"
          flat
          label="Xóa"
          color="primary"
        />

        <!-- <a><b class="q-ml-xl" @click="deleteAllCart">Xóa</b> </a> -->
      </div>
      <div class="col-md-4 col-sm-4 col-xs-4 text-subtitle1">
        <b>
          Tổng thanh toán ({{ itemSelected }} sản phẩm):
          <span class="text-orange-10">
            ₫{{ money.toLocaleString("de-DE") }}
          </span></b
        >
        <p class="q-pt-md">Tiết kiệm: ₫{{ saving.toLocaleString("de-DE") }}</p>
      </div>
      <div class="col-md-4 col-sm-4 col-xs-4 btn">
        <div class="q-pa-md q-gutter-sm q-ml-xl" style="position: relative">
          <q-btn
            @click="checkout"
            class="btn__ q-ml-xl"
            color="deep-orange"
            glossy
            label="Mua hàng"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import EventBus from "../boot";
export default {
  props: ["data"],
  data() {
    return {
      delName: null,
      money: 0,
      saving: 0,
      confirm: false,
      descending: false,
      rowsPerPage: 3,
      navigationActive: false,
      itemSelected: 0,
      filter: "",
      selected: [],
      pagination: {},
      columns: [
        {
          headerStyle: "font-weight: bold;font-size:1rem",
          name: "name",
          required: true,
          label: "Sản phẩm",
          align: "left",
          field: (row) => row.name,
          format: (val) => `${val}`,
          sortable: true,
        },
        {
          headerStyle: "font-weight: bold;font-size:1rem",

          name: "calories",
          align: "center",
          label: "Đơn giá",
          field: (row) => row.Product.origin_price,
          sortable: true,
        },
        {
          headerStyle: "font-weight: bold;font-size:1rem",

          name: "fat",
          label: "Số lượng",
          align: "center",
          field: "quantity",
          sortable: true,
        },
        {
          headerStyle: "font-weight: bold;font-size:1rem",
          name: "carbs",
          label: "Số tiền",
          align: "center",
          field: "quantity",
        },

        {
          headerStyle: "font-weight: bold;font-size:1rem",

          name: "iron",
          label: "Thao tác",
          field: "iron",
          sortable: true,
          sort: (a, b) => parseInt(a, 10) - parseInt(b, 10),
        },
      ],
    };
  },
  watch: {},
  computed: {
    ...mapGetters(["getUserInfo"]),
    tableClass() {
      return this.navigationActive === true ? "shadow-8 no-outline" : void 0;
    },
    pagesNumber() {
      return (
        parseInt(this.data.length / 5) +
        parseInt(this.data.length % 5 == 0 ? 0 : 1)
      );
    },
  },
  methods: {
    ...mapActions([
      "acDeleteCart",
      "acUpdateCart",
      "acUpdateCheckoutCart",
      "acClearCheckoutCart",
    ]),
    async checkout() {
      console.log("thi", this.getUserInfo);
      if (
        !this.getUserInfo.user.address ||
        !this.getUserInfo.user.name ||
        !this.getUserInfo.user.phone_number
      ) {
        this.$router.push("/profile");
        this.$q.notify({
          message: "Vui lòng điền đầy đủ thông tin trước khi đặt hàng!",
          color: "orange",
        });
        return;
      }
      if (this.selected.length > 0) {
        let id = [];
        this.selected.forEach((e) => id.push(e.id));
        console.log("selec", this.selected, id);
        await this.acClearCheckoutCart();
        await this.acUpdateCheckoutCart({ id, status: "checkout" });
        // console.log("dâta", data);
        this.$router.push("/checkout");
      }
    },
    async deleteAllCart() {
      if (this.selected.length) {
        let payload = [];
        this.selected.forEach((e) => payload.push(parseInt(e.id)));
        console.log(payload);
        const data = await this.acDeleteCart({ id: payload });
        if (data.success == true) {
          console.log("data", data);
          EventBus.$emit("EBModifyCart");
          this.data = this.data.filter((e) => payload.includes(e.id));
          this.selected.forEach((e) => {
            console.log("e", e, this.money);
            this.money -=
              e.quantity *
              (e.Product.origin_price -
                (e.Product.origin_price * e.Product.sale) / 100);
            this.saving -=
              e.quantity * e.Product.origin_price -
              e.quantity *
                (e.Product.origin_price -
                  (e.Product.origin_price * e.Product.sale) / 100);
          });
          this.itemSelected = this.itemSelected - this.selected.length;
        } else {
          this.$q.notify({
            message: "Có lỗi xảy ra",
            color: "red",
          });
        }
      }
    },
    selectionRow(details) {
      console.log("d", details);
      !details.added &&
        details.rows.forEach((e) => {
          console.log("e", e, this.money);
          this.money -=
            e.quantity *
            (e.Product.origin_price -
              (e.Product.origin_price * e.Product.sale) / 100);
          this.saving -=
            e.quantity * e.Product.origin_price -
            e.quantity *
              (e.Product.origin_price -
                (e.Product.origin_price * e.Product.sale) / 100);
          if (this.money < 0) this.money = 0;
          if (this.saving < 0) this.saving = 0;
        });
      if (details.added) {
        details.rows.forEach((e) => {
          console.log("e", e, this.money);
          this.money +=
            e.quantity *
            (e.Product.origin_price -
              (e.Product.origin_price * e.Product.sale) / 100);
          this.saving +=
            e.quantity * e.Product.origin_price -
            e.quantity *
              (e.Product.origin_price -
                (e.Product.origin_price * e.Product.sale) / 100);
        });
        this.itemSelected = this.itemSelected + details.rows.length;
      } else {
        this.itemSelected = this.itemSelected - details.rows.length;
        if (this.itemSelected < 0) this.itemSelected = 0;
      }
    },
    selectedTableUpdate(newSelected) {
      // console.log("se", this.selected);
      // if (this.selected.length < newSelected.length) {
      //   let oldVal = newSelected;
      //   let newVal = this.selected;
      //   let removed = oldVal.filter((p, idx) => {
      //     // check if current index exist in new value
      //     if (newVal[idx] === undefined) return true;
      //     // continue compare old value to new value
      //     let j = Object.keys(p).some((prop) => {
      //       return p[prop] !== newVal[idx][prop];
      //     });
      //     return j;
      //   });
      //   console.log("removed", removed);
      //   removed.forEach((e) => {
      //     console.log("e", e, this.money);
      //     this.money +=
      //       e.quantity *
      //       (e.Product.origin_price -
      //         (e.Product.origin_price * e.Product.sale) / 100);
      //     this.saving +=
      //       e.quantity * e.Product.origin_price -
      //       e.quantity *
      //         (e.Product.origin_price -
      //           (e.Product.origin_price * e.Product.sale) / 100);
      //   });
      // }
      console.log("new", newSelected);
    },
    async deleteCart(id) {
      const data = await this.acDeleteCart({ id });
      if (data.success) {
        console.log("data", data);
        EventBus.$emit("EBModifyCart", id);
        this.data = this.data.filter((e) => e.id != id);
        this.selected.forEach((e) => {
          console.log("e", e, this.money);
          this.money -=
            e.quantity *
            (e.Product.origin_price -
              (e.Product.origin_price * e.Product.sale) / 100);
          this.saving -=
            e.quantity * e.Product.origin_price -
            e.quantity *
              (e.Product.origin_price -
                (e.Product.origin_price * e.Product.sale) / 100);
        });
        this.itemSelected = this.itemSelected - this.selected.length;
      } else {
        this.$q.notify({
          message: "Có lỗi xảy ra",
          color: "red",
        });
      }
    },
    async subQuantity(product) {
      if (product.quantity > 1) {
        const payload = {
          id: product.id,
          quantity: product.quantity - 1,
        };
        const data = await this.acUpdateCart(payload);
        console.log("data", data);
        if (data.success) {
          --product.quantity;
          this.money -=
            product.Product.origin_price -
            (product.Product.origin_price * product.Product.sale) / 100;
          this.saving -=
            product.Product.origin_price -
            (product.Product.origin_price -
              (product.Product.origin_price * product.Product.sale) / 100);
        } else {
          this.$q.notify({
            message: "Có lỗi xảy ra",
            color: "red",
          });
        }
      } else {
        this.delName = product.Product.name;
        this.delId = product.id;
        this.confirm = true;
      }
    },

    async addQuantity(product) {
      const payload = {
        id: product.id,
        quantity: product.quantity + 1,
      };
      const data = await this.acUpdateCart(payload);
      console.log("data", data);
      if (data.success) {
        ++product.quantity;
        this.money +=
          product.Product.origin_price -
          (product.Product.origin_price * product.Product.sale) / 100;
        this.saving +=
          product.Product.origin_price -
          (product.Product.origin_price -
            (product.Product.origin_price * product.Product.sale) / 100);
      } else {
        this.$q.notify({
          message: "Có lỗi xảy ra",
          color: "red",
        });
      }
    },
    activateNavigation() {
      this.navigationActive = true;
    },
    deactivateNavigation() {
      this.navigationActive = false;
    },
    onKey(evt) {
      if (
        this.navigationActive !== true ||
        [33, 34, 35, 36, 38, 40].indexOf(evt.keyCode) === -1 ||
        this.$refs.myTable === void 0
      ) {
        return;
      }
      evt.preventDefault();
      const { computedRowsNumber, computedRows } = this.$refs.myTable;
      if (computedRows.length === 0) {
        return;
      }
      const currentIndex =
        this.selected.length > 0 ? computedRows.indexOf(this.selected[0]) : -1;
      const currentPage = this.pagination.page;
      const rowsPerPage =
        this.pagination.rowsPerPage === 0
          ? computedRowsNumber
          : this.pagination.rowsPerPage;
      const lastIndex = computedRows.length - 1;
      const lastPage = Math.ceil(computedRowsNumber / rowsPerPage);
      let index = currentIndex;
      let page = currentPage;
      switch (evt.keyCode) {
        case 36: // Home
          page = 1;
          index = 0;
          break;
        case 35: // End
          page = lastPage;
          index = rowsPerPage - 1;
          break;
        case 33: // PageUp
          page = currentPage <= 1 ? lastPage : currentPage - 1;
          if (index < 0) {
            index = 0;
          }
          break;
        case 34: // PageDown
          page = currentPage >= lastPage ? 1 : currentPage + 1;
          if (index < 0) {
            index = rowsPerPage - 1;
          }
          break;
        case 38: // ArrowUp
          if (currentIndex <= 0) {
            page = currentPage <= 1 ? lastPage : currentPage - 1;
            index = rowsPerPage - 1;
          } else {
            index = currentIndex - 1;
          }
          break;
        case 40: // ArrowDown
          if (currentIndex >= lastIndex) {
            page = currentPage >= lastPage ? 1 : currentPage + 1;
            index = 0;
          } else {
            index = currentIndex + 1;
          }
          break;
      }
      if (page !== this.pagination.page) {
        this.pagination = {
          ...this.pagination,
          page,
        };
        this.$nextTick(() => {
          const { computedRows } = this.$refs.myTable;
          this.selected = [
            computedRows[Math.min(index, computedRows.length - 1)],
          ];
        });
      } else {
        this.selected = [computedRows[index]];
      }
    },
  },
};
</script>

<style scoped>
.my-table-details {
  font-size: 0.85em;
  font-style: italic;
  max-width: 200px;
  white-space: normal;
  color: #555;
  margin-top: 4px;
}
.table-class {
  display: block;
  height: 500px;
}
.word {
  word-wrap: break-word !important;
  white-space: break-space !important;
  word-break: break-all !important;
}
.checkout {
  position: sticky;
  bottom: 0;

  --animate-duration: 0.3s;
  --animate-delay: 0.3s;
  --animate-repeat: 1;
  --q-color-primary: #027be3;
  --q-color-secondary: #26a69a;
  --q-color-accent: #9c27b0;
  --q-color-positive: #21ba45;
  --q-color-negative: #c10015;
  --q-color-info: #31ccec;
  --q-color-warning: #f2c037;
  --q-color-dark: #1d1d1d;
  --q-size-xs: 0;
  --q-size-sm: 600px;
  --q-size-md: 1024px;
  --q-size-lg: 1440px;
  --q-size-xl: 1920px;
  direction: ltr;
  font-family: "Roboto", "-apple-system", "Helvetica Neue", Helvetica, Arial,
    sans-serif;
  -webkit-text-size-adjust: 100%;
  -webkit-font-smoothing: antialiased;
  line-height: 1.5;
  font-size: 14px;
  box-sizing: inherit;
  -webkit-tap-highlight-color: transparent;
  color: #000;
  background-color: #fff;
  border-radius: 4px;
  box-shadow: 0 1px 5px rgb(0 0 0 / 20%), 0 2px 2px rgb(0 0 0 / 14%),
    0 3px 1px -2px rgb(0 0 0 / 12%);
  display: flex;
  flex-wrap: nowrap;
  min-height: 7rem;
}
.btn {
  position: relative;
}
.btn__ {
  position: absolute;
  left: unset;
  top: 0;
}
</style>
