<template>
  <div class="">
    <Header />
    <div class="row justify-center items-center content-center">
      <CheckOut :productCheckOut="cartCheckOut" class="col-md-10 checkout1" />
    </div>
    <Footer class="q-mt-xl" />
  </div>
</template>

<script>
import Header from "../components/Header";
import CheckOut from "../components/CheckOut";
import Footer from "../components/Footer";
import { mapActions } from "vuex";
export default {
  components: {
    Header,
    CheckOut,
    Footer,
  },
  data() {
    return {
      cartCheckOut: null,
    };
  },
  computed: {
    // ...mapActions(["getCart"]),
    // cartCheckOut() {
    //   const data = this.itemOfCart.filter(
    //     (e) => e.status && e.status.trim() == "checkout"
    //   );
    //   return data;
    // },
  },
  methods: {
    ...mapActions(["getCart"]),
  },
  async mounted() {
    const data = await this.getCart();
    this.cartCheckOut = data.filter(
      (e) => e.status && e.status.trim() == "checkout"
    );
    console.log("data", data, this.cartCheckOut);
  },
};
</script>

<style scoped>
.checkout1 {
}
</style>
