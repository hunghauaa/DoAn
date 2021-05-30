<template>
  <div>
    <div class="row" q-ma-md>
      <h5>Đánh giá sản phẩm</h5>
    </div>
    <!-- <div class="row">
      <div class="q-py-md">
        <q-rating
          v-model="model"
          max="5"
          size="2.5em"
          color="yellow"
          icon="star_border"
          icon-selected="star"
          icon-half="star_half"
          no-dimming
        />
      </div>
    </div> -->
    <div class="row">
      <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 q-pl-lg">
        <div class="text-subtitle2">Customer rating</div>
        <div class="text-h3">4.2</div>
        <div>
          <q-rating
            v-model="rating_point"
            max="5"
            size="2em"
            color="orange"
            icon="star_border"
            icon-selected="star"
            icon-half="star_half"
            no-dimming
          />
        </div>
        <div class="text-subtitle2 text-grey-8">(357 reviews)</div>
        <div class="text-subtitle2 text-grey-10 q-mt-sm">
          93% would recommend to a friend
        </div>

        <q-list dense bordered padding class="no-border q-mt-lg q-pr-xl">
          <q-item style="padding-left: 0 !important;" v-ripple>
            <span class="text-subtitle2 q-mr-xs">5</span>
            <q-icon name="star" size="1.5em" color="orange"></q-icon>
            <q-linear-progress
              class="q-ml-sm  q-mr-sm"
              style="margin-top: 5px;"
              size="13px"
              :value="0.9"
            />
            <span
              style="margin-top: 2px"
              class="text-caption text-weight-bold text-grey-8"
              >273</span
            >
          </q-item>
          <q-item style="padding-left: 0 !important;" v-ripple>
            <span class="text-subtitle2 q-mr-xs">4</span>
            <q-icon name="star" size="1.5em" color="orange"></q-icon>
            <q-linear-progress
              class="q-ml-sm  q-mr-sm"
              style="margin-top: 5px;"
              size="13px"
              :value="0.6"
            />
            <span
              style="margin-top: 2px"
              class="text-caption text-weight-bold text-grey-8"
              >&nbsp;&nbsp;69</span
            >
          </q-item>
          <q-item style="padding-left: 0 !important;" v-ripple>
            <span class="text-subtitle2 q-mr-xs">3</span>
            <q-icon name="star" size="1.5em" color="orange"></q-icon>
            <q-linear-progress
              class="q-ml-sm  q-mr-sm"
              style="margin-top: 5px;"
              size="13px"
              :value="0.1"
            />
            <span
              style="margin-top: 2px"
              class="text-caption text-weight-bold text-grey-8"
              >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6</span
            >
          </q-item>
          <q-item style="padding-left: 0 !important;" v-ripple>
            <span class="text-subtitle2 q-mr-xs">2</span>
            <q-icon name="star" size="1.5em" color="orange"></q-icon>
            <q-linear-progress
              class="q-ml-sm  q-mr-sm"
              style="margin-top: 5px;"
              size="13px"
              :value="0.1"
            />
            <span
              style="margin-top: 2px"
              class="text-caption text-weight-bold text-grey-8"
              >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3</span
            >
          </q-item>
          <q-item style="padding-left: 0 !important;" v-ripple>
            <span class="text-subtitle2 q-mr-xs">1</span>
            <q-icon name="star" size="1.5em" color="orange"></q-icon>
            <q-linear-progress
              class="q-ml-sm  q-mr-sm"
              style="margin-top: 5px;"
              size="13px"
              :value="0.1"
            />
            <span
              style="margin-top: 2px"
              class="text-caption text-weight-bold text-grey-8"
              >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6</span
            >
          </q-item>
        </q-list>
      </div>
      <div
        class="col-lg-7 col-md-7 col-sm-12 col-xs-12 q-pl-lg relative-position"
      >
        <p>sa</p>
        <p>á</p>
        <p>sa</p>
        <p>á</p>
        <p>sa</p>
        <p>á</p>
        <p>sa</p>
        <p>á</p>

        <!-- <div class="column">
            đá
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 absolute-bottom"> -->
        <div class="fix q-mb-xl q-pa-xl"></div>
        <div class="q-pa-md q-mb-sm absolute-bottom">
          <div class="q-gutter-y-md column">
            <q-input square outlined v-model="text">
              <template v-slot:append>
                <q-btn round dense flat icon="send" />
              </template>
            </q-input>
            <!-- </div>
            </div> -->
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      rating_point: 4.2,
      text:null
    };
  },
};
</script>

<style></style>
