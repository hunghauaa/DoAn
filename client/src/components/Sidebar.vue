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
              <img :src="getUserInfo.user.avatar" />
            </q-avatar>
            <div class="text-weight-bold">{{ getUserInfo.user.name }}</div>
            <div>@{{ getUserInfo.user.username }}</div>
          </div>
        </q-img>
      </q-drawer>

      <q-page-container>
        <q-page padding v-if="activeProfile" class="bg-grey-3">
          <div class="row justify-center">
            <div class="col-md-2 col-sm-2 col-xs-2 text-right q-mr-xl">
              <p class="q-mb-xl text-weight-bold">Email:</p>
              <p class="q-mb-xl text-weight-bold">Họ và tên:</p>
              <p class="q-mb-xl text-weight-bold">Số điện thoại:</p>

              <p class="q-mb-xl text-weight-bold">Giới tính:</p>

              <p class="q-mb-xl text-weight-bold">Ngày sinh:</p>

              <p class="q-mb-xl text-weight-bold">Địa chỉ:</p>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-5">
              <p class="q-mb-xl">
                {{ getUserInfo.user.email }}
              </p>
              <!-- <div class="" style="max-width: 300px">
                <q-input
                  class="q-mb-xl"
                  v-model="getUserInfo.user.name"
                  label="Họ và tên"
                  :dense="false"
                />
              </div> -->

              <p class="q-mb-xl">
                {{ getUserInfo.user.name }}
              </p>

              <p class="q-mb-xl">{{ getUserInfo.user.phone_number }}</p>

              <p class="q-mb-xl">{{ getUserInfo.user.gender }}</p>
              <p class="q-mb-xl">{{ getUserInfo.user.date_of_birth }}</p>
              <p class="q-mb-xl">{{ getUserInfo.user.address }}</p>
            </div>

            <div class="col-md-2 offset-1 col-sm-2 col-xs-2 text-center">
              <q-avatar size="6rem">
                <img :src="getUserInfo.user.avatar" />
              </q-avatar>
              <div class="q-pa-md q-gutter-sm">
                <q-file
                  clearable
                  class="text-center"
                  filled
                  color="purple-12"
                  v-model="image"
                  label="CHỌN ẢNH"
                />

                <!-- equivalent -->
              </div>
              <div class="q-pa-md q-mt-md q-gutter-sm">
                <q-btn
                  v-if="image"
                  class="bg-green"
                  style="color: white"
                  label="Lưu"
                  @click="handleSubmit"
                />
              </div>
              <div class="q-pa-md q-mt-xl q-gutter-sm">
                <q-btn
                  class="bg-deep-orange"
                  style="color: white"
                  label="Sửa Profile"
                  @click="editor = true"
                />
              </div>
            </div>
          </div>
        </q-page>
        <TabPanel v-if="activeOrder" />
      </q-page-container>
    </q-layout>
    <q-dialog v-model="editor">
      <q-card
        class="my-card"
        flat
        bordered
        style="max-width: 600px; width: 600px"
      >
        <q-card-section>
          <div class="row justify-center text-center align-center item-center">
            <div class="col-md-12 text-h6 q-pb-xl">
              Chỉnh sửa thông tin tài khoản
            </div>

            <div class="col-md-12 col-sm-12 q-px-md q-gutter-y-md">
              <q-input
                v-model="userUpdate.name"
                label="Họ và tên"
                stack-label
                :dense="dense"
              />
            </div>
            <div class="col-md-12 col-sm-12 q-px-md q-gutter-y-md">
              <q-input
                v-model="userUpdate.phone_number"
                label="Số điện thoại"
                type="number"
                stack-label
                :dense="dense"
              />
            </div>
            <div class="col-md-12 col-sm-12 q-pa-md q-gutter-y-md">
              <div class="text-left">
                <span class="text-grey">Giới tính :</span>

                <q-radio
                  v-model="userUpdate.gender"
                  class="q-ml-xl"
                  val="Nam"
                  label="Nam"
                />
                <q-radio
                  v-model="userUpdate.gender"
                  class="q-ml-xl"
                  val="Nữ"
                  label="Nữ"
                />
                <q-radio
                  v-model="userUpdate.gender"
                  class="q-ml-xl"
                  val="Khác"
                  label="Khác"
                />
              </div>
            </div>
            <div class="col-md-12 col-sm-12 q-px-md">
              <q-input
                v-model="userUpdate.date_of_birth"
                mask="date"
                :rules="['date']"
                stack-label
                label="Ngày sinh"
                :dense="dense"
              >
                <template v-slot:append>
                  <q-icon name="event" class="cursor-pointer">
                    <q-popup-proxy
                      ref="qDateProxy"
                      transition-show="scale"
                      transition-hide="scale"
                    >
                      <q-date v-model="userUpdate.date_of_birth">
                        <div class="row items-center justify-end">
                          <q-btn v-close-popup label="Close" color="primary" />
                        </div>
                      </q-date>
                    </q-popup-proxy>
                  </q-icon>
                </template>
              </q-input>
            </div>
            <div class="col-md-12 col-sm-12 q-px-md q-gutter-y-md">
              <q-input
                v-model="userUpdate.address"
                label="Địa chỉ"
                stack-label
                :dense="dense"
              />
            </div>
          </div>
          <div class="text-right q-gutter-sm q-mt-md">
            <q-btn
              dense
              color="grey"
              label="Hủy"
              v-close-popup
              style="width: 72px"
            />
            <q-btn
              dense
              color="green"
              label="Lưu"
              style="width: 72px"
              v-close-popup
              @click="editProfile"
            />
          </div>
        </q-card-section>

        <q-separator />
      </q-card>
    </q-dialog>
  </div>
</template>

<script>
import { mapGetters, mapActions, mapMutations } from "vuex";
import TabPanel from "./TabPanel";
export default {
  components: { TabPanel },
  data() {
    return {
      drawer: false,
      editor: false,
      dense: false,
      header: "Tài khoản của tôi",
      activeProfile: true,
      activeOrder: false,
      userUpdate: null,
      image: null,
    };
  },
  computed: {
    ...mapGetters(["getUserInfo"]),
  },
  methods: {
    ...mapActions(["acUpdateUser", "acUploadImgUser"]),
    ...mapMutations(["SETUSERINFO"]),
    async handleSubmit() {
      const formData = new FormData();
      formData.append("files", this.image);
      const data = await this.acUploadImgUser(formData);
      if (data.avatar) {
        const data1 = await this.acUpdateUser({
          avatar: data.avatar,
          id: this.userUpdate.id,
        });
        if (data1) {
          this.userUpdate.avatar = data.avatar;
          this.image = null;
          this.SETUSERINFO(this.userUpdate);
        }
      }
      console.log(data);
      // formData.append("file", this.files[0]);
    },
    async editProfile() {
      console.log("this.", this.userUpdate);
      const data = await this.acUpdateUser(this.userUpdate);
      console.log("data", data);
      this.SETUSERINFO(this.userUpdate);
      console.log("d", this.getUserInfo);
    },
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
    let userUpdate = { ...this.getUserInfo.user };
    userUpdate.phone_number = parseInt(userUpdate.phone_number);
    delete userUpdate.password;
    delete userUpdate.create_by;
    this.userUpdate = userUpdate;
    console.log(this.userUpdate);
    if (this.$route.query.slug == 2) this.clickOrder();
    if (this.$route.query.slug == 1) this.clickProfile();
  },
};
</script>