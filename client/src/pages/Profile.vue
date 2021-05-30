<template>
  <div>
    <Header />
    <div class="row justify-center items-center content-center">
      <div class="col-md-10 col-sm-10 col-xs-10">
        <Sidebar style="min-width: 500px" />
      </div>
    </div>
    <Footer class="q-mt-xl"/>
  </div>
</template>

<script>
import Header from "../components/Header";
import Footer from "../components/Footer";
import Sidebar from "../components/Sidebar";
export default {
  components: {
    Header,
    Footer,
    Sidebar,
  },
};
</script>

<style>
</style>