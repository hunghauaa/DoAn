<template>
  <div id="q-app">
    <q-layout view="lHh Lpr fff">
      <q-page
        class="window-height window-width row justify-center items-center"
        style="background: linear-gradient(#2196f3, #5a4a9f)"
      >
        <div class="column q-pa-lg">
          <div class="row">
            <q-card
              square
              class="shadow-24"
              style="width: 400px; height: 600px; border-radius: 50%"
            >
              <q-card-section class="bg-blue-5">
                <h4 class="text-h5 text-white q-my-md">{{ title }}</h4>
              </q-card-section>
              <q-card-section>
                <q-fab
                  color="primary"
                  @click="switchTypeForm"
                  icon="add"
                  class="absolute"
                  style="top: 0; right: 12px; transform: translateY(-50%)"
                >
                  <q-tooltip> Đăng ký </q-tooltip>
                </q-fab>
                <q-form class="q-px-sm q-pt-xl">
                  <q-input
                    ref="email"
                    square
                    clearable
                    v-model="email"
                    type="email"
                    lazy-rules
                    :rules="[this.required, this.isEmail, this.short]"
                    label="Email"
                  >
                    <template v-slot:prepend>
                      <q-icon name="email" />
                    </template>
                  </q-input>
                  <q-input
                    ref="username"
                    v-if="register"
                    square
                    clearable
                    v-model="username"
                    lazy-rules
                    :rules="[this.required, this.short]"
                    type="username"
                    label="Tên đăng nhập"
                  >
                    <template v-slot:prepend>
                      <q-icon name="person" />
                    </template>
                  </q-input>
                  <q-input
                    ref="password"
                    square
                    clearable
                    v-model="password"
                    :type="passwordFieldType"
                    lazy-rules
                    :rules="[this.required, this.short]"
                    label="Mật khẩu"
                  >
                    <template v-slot:prepend>
                      <q-icon name="lock" />
                    </template>
                    <template v-slot:append>
                      <q-icon
                        :name="visibilityIcon"
                        @click="switchVisibility"
                        class="cursor-pointer"
                      />
                    </template>
                  </q-input>
                  <q-input
                    ref="repassword"
                    v-if="register"
                    square
                    clearable
                    v-model="repassword"
                    :type="passwordFieldType"
                    lazy-rules
                    :rules="[this.required, this.short, this.diffPassword]"
                    label="Nhập lại mật khẩu"
                  >
                    <template v-slot:prepend>
                      <q-icon name="lock" />
                    </template>
                    <template v-slot:append>
                      <q-icon
                        :name="visibilityIcon"
                        @click="switchVisibility"
                        class="cursor-pointer"
                      />
                    </template>
                  </q-input>
                </q-form>
              </q-card-section>

              <q-card-actions class="q-px-lg">
                <q-btn
                  unelevated
                  size="lg"
                  color="secondary"
                  @click="submit"
                  class="full-width text-white"
                  :label="btnLabel"
                />
              </q-card-actions>
              <q-card-section v-if="!register" class="text-center q-pa-sm">
                <p class="text-grey-6">Quên mật khẩu</p>
              </q-card-section>
            </q-card>
          </div>
        </div>
      </q-page>
    </q-layout>
  </div>
</template>

<script>
import {
  // mapMutations,
  mapActions,
  // ,mapGetters
} from "vuex";
export default {
  data() {
    return {
      title: "Đăng nhập",
      email: "",
      username: "",
      password: "",
      repassword: "",
      register: false,
      passwordFieldType: "password",
      btnLabel: "Đăng nhập",
      visibility: false,
      visibilityIcon: "visibility",
    };
  },

  methods: {
    ...mapActions(["login", "registerUser","getCart","acGetDeliveryMethod","acGetAllOrder"]),
    required(val) {
      return (val && val.length > 0) || "Không được bỏ trống";
    },
    diffPassword(val) {
      const val2 = this.$refs.password.value;
      return (val && val === val2) || "Mật khẩu không khowps!";
    },
    short(val) {
      return (val && val.length > 3) || "Mật khẩu quá ngắn";
    },
    isEmail(val) {
      const emailPattern = /^(?=[a-zA-Z0-9@._%+-]{6,254}$)[a-zA-Z0-9._%+-]{1,64}@(?:[a-zA-Z0-9-]{1,63}\.){1,8}[a-zA-Z]{2,63}$/;
      return emailPattern.test(val) || "Hãy điền email";
    },
    async submit() {
      if (this.register) {
        console.log("register", this.email, this.password);
        this.$refs.email.validate();
        this.$refs.username.validate();
        this.$refs.password.validate();
        this.$refs.repassword.validate();
        const payload = {
          email: this.email,
          username: this.username,
          password: this.password,
        };
        const data = await this.registerUser(payload);
        if (data.success) {
          this.$q.notify({
            icon: "done",
            message: "Đăng ký thành công",
            color: "green",
          });
          this.switchTypeForm();
        } else {
          this.$q.notify({
            message: data.message,
            color: "red",
          });
        }
        console.log("data", data);
      } else {
        this.$refs.email.validate();
        this.$refs.password.validate();
        const payload = {
          email: this.email,
          password: this.password,
        };
        const data = await this.login(payload);
        if (data.success) {
          this.$q.notify({
            icon: "done",
            message: "Đăng nhập thành công",
            color: "green",
          });
          const [cart,deliveryMethod,order] = await Promise.all([this.getCart(),this.acGetDeliveryMethod(),this.acGetAllOrder()])
          console.log('cart',cart,deliveryMethod,order)
          const router = this.$router;
          setTimeout(function () {
            router.go(-1);
          }, 0);
        } else {
          this.$q.notify({
            message: data.message,
            color: "red",
          });
        }
      }

      // if (!this.register)
      //   if (!this.$refs.email.hasError && !this.$refs.password.hasError) {
      //     this.$q.notify({
      //       icon: "done",
      //       color: "positive",
      //       message: "Đăng nhập",
      //     });
      //   }
    },
    switchTypeForm() {
      this.register = !this.register;
      console.log(this.register);
      this.title = this.register ? "Đăng ký" : "Đăng nhập";
      this.btnLabel = this.register ? "Đăng ký" : "Đăng nhập";
    },
    switchVisibility() {
      this.visibility = !this.visibility;
      this.passwordFieldType = this.visibility ? "text" : "password";
      this.visibilityIcon = this.visibility ? "visibility_off" : "visibility";
    },
  },
  created() {
    console.log(this.register);
  },
};
</script>

<style>
</style>