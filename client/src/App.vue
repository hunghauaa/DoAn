<template>
  <div>
    <!-- <Cart />
    <Home />
    <ProductDetail /> -->
    <Header />
    <keep-alive include="keepCart">
    <router-view/>
    </keep-alive>
  </div>
</template>

<script>
import Header from "./components/Header";
// import Home from "./pages/Home";
// import ProductDetail from "./pages/DetailProduct";
// import Cart from "./pages/Cart";
export default {
Header
};
</script>

<style></style>
