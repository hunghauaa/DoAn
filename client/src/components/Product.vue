<template>
  <div>
    <div
      class="row justify-center items-center content-center bg-white q-mt-sm"
    >
      <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
        <div class="row q-mt-sm q-mb-sm items-start q-gutter-md">
          <q-card
            @click="$router.push(`/detail-product/${product.id}`)"
            class="cursor-pointer"
            :class="class_val"
            @mouseover="class_val = 'my-card shadow-20'"
            @mouseleave="class_val = 'my-card shadow-'"
          >
            <q-img height="150px" :src="product.img1"></q-img>

            <q-card-section class="q-pb-xs q-pt-xs">
              <!--<q-btn-->
              <!--fab-->
              <!--color="primary"-->
              <!--icon="shopping_cart"-->
              <!--class="absolute"-->
              <!--style="top: 0; right: 12px; transform: translateY(-50%);"-->
              <!--&gt;</q-btn>-->

              <div class="row no-wrap items-center">
                <div class="col text-subtitle2 ellipsis-2-lines text-grey-10">
                  {{ product.name }}
                  <q-tooltip
                    content-class="bg-grey text-weight-light"
                    :offset="[10, 10]"
                  >
                    {{ product.name }}
                  </q-tooltip>
                </div>
                <div
                  class="col-auto text-grey text-caption q-pt-xs row no-wrap items-center"
                >
                  <!--<q-icon name="place"></q-icon>-->
                  <!--250 ft-->
                </div>
              </div>
            </q-card-section>

            <q-card-section class="q-py-xs">
              <span style="font-size: 12px; color: grey">Đánh giá:</span>
              <q-rating
                v-model="ratingModel"
                size="1em"
                color="orange"
                readonly
              />
              <span
                v-show="product.sale"
                class="text-caption text-red-8 text-weight-bolder"
                >Giảm giá:</span
              >
              <p v-if="!product.sale"> </p>
              <span
                v-show="product.sale"
                class="q-ml-xs text-caption text-red-8 text-weight-bolder"
                >{{ product.sale }}%</span
              >
              <div>
                <span class="text-orange-10 text-subtitle2"
                  >₫{{
                    (
                      product.origin_price -
                      (product.origin_price * product.sale) / 100
                    ).toLocaleString("de-DE")
                  }}</span
                ><span
                  class="q-ml-xs text-grey-6"
                  style="text-decoration: line-through"
                  >₫{{ product.origin_price.toLocaleString("de-DE") }}</span
                >
              </div>
              <!--<div class="text-subtitle1">-->
              <!--$・Italian, Cafe-->
              <!--</div>-->
              <!--<div class="text-caption text-grey">-->
              <!--Small plates, salads & sandwiches in an intimate setting.-->
              <!--</div>-->
            </q-card-section>

            <q-separator></q-separator>

            <q-card-actions>
              <q-btn
                flat
                class="text-weight-bold text-capitalize"
                dense
                color="primary"
              >
                Xem chi tiết
              </q-btn>
            </q-card-actions>
          </q-card>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["product"],
  data() {
    return {
      stars: 4,
      ratingModel: 3,
      class_val: "shadow-1 my-card",
      filters_list: [
        {
          label: "Discount",
          items: [
            {
              Product: false,
              count: 51,
              label: "50% or more",
              model: "Product",
            },
            {
              Product: false,
              count: 3,
              label: "40% or more",
              model: "Product",
            },
            {
              Product: false,
              count: 41,
              label: "30% or more",
              model: "Product",
            },
            {
              Product: false,
              count: 16,
              label: "20% or more",
              model: "Product",
            },
            {
              Product: false,
              count: 16,
              label: "10% or more",
              model: "Product",
            },
          ],
        },
        {
          label: "Sleeve",
          items: [
            {
              Period: false,
              count: 51,
              label: "3/4 Sleeve",
              model: "Period",
            },
            {
              Period: false,
              count: 3,
              label: "Full Sleeve",
              model: "Period",
            },
            {
              Period: false,
              count: 23,
              label: "Half Sleeve",
              model: "Period",
            },
            {
              Period: false,
              count: 65,
              label: "Short Sleeve",
              model: "Period",
            },
          ],
        },
        {
          label: "Size",
          items: [
            {
              AssetType: false,
              count: 51,
              label: "XXS",
              model: "AssetType",
            },
            {
              AssetType: false,
              count: 3,
              label: "XS",
              model: "AssetType",
            },
            {
              AssetType: false,
              count: 23,
              label: "S",
              model: "AssetType",
            },
            {
              AssetType: false,
              count: 65,
              label: "M",
              model: "AssetType",
            },
            {
              AssetType: false,
              count: 35,
              label: "L",
              model: "AssetType",
            },
            {
              AssetType: false,
              count: 23,
              label: "XL",
              model: "AssetType",
            },
            {
              AssetType: false,
              count: 12,
              label: "XXL",
              model: "AssetType",
            },
          ],
        },
      ],
    };
  },
  computed: {
    win_width() {
      return this.$q.screen.width - 59;
    },
    win_height() {
      return this.$q.screen.height - 0;
    },
  },
};
</script>

<style scoped>
.my-card {
  width: 100%;
  max-width: 350px;
}
</style>