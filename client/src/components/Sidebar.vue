<template>
  <div>
    <q-layout
      view="lHh Lpr lff"
      container
      style="height: 550px"
      class="shadow-2 rounded-borders"
    >
      <q-header elevated class="bg-blue-7">
        <q-toolbar>
          <q-toolbar-title>{{ header }}</q-toolbar-title>
        </q-toolbar>
      </q-header>

      <q-drawer
        @input="toggle"
        v-model="drawer"
        show-if-above
        :width="200"
        :breakpoint="400"
      >
        <q-scroll-area
          style="
            height: calc(100% - 150px);
            margin-top: 150px;
            border-right: 1px solid #ddd;
          "
        >
          <q-list padding>
            <q-item
              :active="activeProfile"
              @click="clickProfile"
              clickable
              v-ripple
            >
              <q-item-section avatar>
                <q-icon name="account_circle" />
              </q-item-section>

              <q-item-section> Tài khoản của tôi </q-item-section>
            </q-item>

            <q-item
              :active="activeOrder"
              clickable
              v-ripple
              @click="clickOrder"
            >
              <q-item-section avatar>
                <q-icon name="list_alt" />
              </q-item-section>

              <q-item-section> Đơn mua </q-item-section>
            </q-item>

            <q-item clickable v-ripple>
              <q-item-section avatar>
                <q-icon name="notifications" />
              </q-item-section>

              <q-item-section> Thông báo </q-item-section>
            </q-item>
          </q-list>
        </q-scroll-area>

        <q-img
          class="absolute-top"
          src="https://cdn.quasar.dev/img/material.png"
          style="height: 150px"
        >
          <div class="absolute-bottom bg-transparent">
            <q-avatar size="56px" class="q-mb-sm">
              <img src="https://cdn.quasar.dev/img/boy-avatar.png" />
            </q-avatar>
            <div class="text-weight-bold">{{ getUserInfo.user.name }}</div>
            <div>@{{ getUserInfo.user.username }}</div>
          </div>
        </q-img>
      </q-drawer>

      <q-page-container>
        <q-page padding v-if="activeProfile">
          <div class="row justify-center">
            <div class="col-md-2 col-sm-2 col-xs-2 text-right q-mr-xl">
              <p class="q-mb-xl">Email:</p>
              <p class="q-mb-xl">Họ và tên:</p>
              <p class="q-mb-xl">Số điện thoại:</p>

              <p class="q-mb-xl">Giới tính:</p>

              <p class="q-mb-xl">Ngày sinh:</p>

              <p class="q-mb-xl">Địa chỉ:</p>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-5">
              <p class="">{{ getUserInfo.user.email }}</p>
              <div class="" style="max-width: 300px">
                <q-input
                  class="q-mb-xl"
                  v-model="getUserInfo.user.name"
                  label="Họ và tên"
                  :dense="false"
                />
              </div>

              <p class="q-mb-xl">{{ getUserInfo.user.phone_number }}</p>

              <p class="q-mb-xl">{{ getUserInfo.user.gender }}</p>
              <p class="q-mb-xl">{{ getUserInfo.user.date_of_birth }}</p>
              <p class="q-mb-xl">{{ getUserInfo.user.address }}</p>
            </div>
            <div class="col-md-2 offset-1 col-sm-2 col-xs-2 text-center">
              <q-avatar size="6rem">
                <img src="https://cdn.quasar.dev/img/avatar.png" />
              </q-avatar>
              <div class="q-pa-md q-gutter-sm">
                <q-btn outline style="color: black" label="Chọn ảnh" />
              </div>
            </div>
          </div>
        </q-page>
        <TabPanel v-if="activeOrder" />
      </q-page-container>
    </q-layout>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import TabPanel from "./TabPanel";
export default {
  components: { TabPanel },
  data() {
    return {
      drawer: false,
      header: "Tài khoản của tôi",
      activeProfile: true,
      activeOrder: false,
    };
  },
  computed: {
    ...mapGetters(["getUserInfo"]),
  },
  methods: {
    async clickProfile() {
      this.header = "Tài khoản của tôi";
      this.activeProfile = true;
      this.activeOrder = false;
    },
    async clickOrder() {
      this.header = "Đơn Mua";
      this.activeProfile = false;
      this.activeOrder = true;
    },
    toggle(value) {
      console.log(value);
    },
  },
  created() {
    if (this.$route.query.slug ==2) this.clickOrder();
        if (this.$route.query.slug ==1) this.clickProfile();

  },
};
</script>