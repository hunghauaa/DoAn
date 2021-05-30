<template>
  <div>
    <Header />
    <div class="row justify-center items-center content-center bol">
      <div class="col-md-10">
        <Cart :data="itemOfCart" />
      </div>
    </div>
    <Footer />
  </div>
</template>

<script>
import Header from "../components/Header";
import Footer from "../components/Footer";
import Cart from "../components/Cart";
import {mapGetters} from 'vuex'
export default {
  name:"keepCart",
  components: {
    Header,
    Footer,
    Cart,
  },
  computed:{
    ...mapGetters(["itemOfCart"])
  }
  ,
  mounted(){
    console.log(this.itemOfCart)
  }
};
</script>

<style scoped>
.bol{
  background-color: rgb(230, 224, 224) !important;
}
</style>
