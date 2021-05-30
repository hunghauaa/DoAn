import Vue from "vue";
//Dòng này để import vue-router
import Router from "vue-router";
import Home from "../pages/Home";
import DetailProduct from "../pages/DetailProduct";
import Cart from "../pages/Cart";
import Checkout from "../pages/CheckOut";
import Auth from "../components/Auth";
import store from "../store";
import Profile from "../pages/Profile";
Vue.use(Router);

const router = new Router({
  routes: [
    // bao gồm danh sách route
    {
      path: "/", ///path của route
      name: "Hello", // tên route
      component: Home, // component route sử dụng
    },
    {
      path: "/detail-product/:id",
      name: "About",
      component: DetailProduct,
    },
    {
      path: "/checkout",
      name: "Checkout",
      component: Checkout,
      meta: { requiresAuth: true },
    },
    {
      path: "/cart",
      name: "Cart",
      component: Cart,
      meta: { requiresAuth: true },
    },
    {
      path: "/profile",
      name: "profile",
      component: Profile,
      meta: { requiresAuth: true },
    },
    {
      path: "/auth",
      component: Auth,
    },
  ],
});
router.beforeEach((to, from, next) => {
  if (to.matched.some((record) => record.meta.requiresAuth)) {
    // this route requires auth, check if logged in
    // if not, redirect to login page.
    console.log(!localStorage.getItem("userInfo"));
    if (!localStorage.getItem("userInfo") || !store.getters.isAuthenticated) {
      next({
        path: "/auth",
        // query: { redirect: to.fullPath },
      });
    } else {
      next();
    }
  } else {
    next(); // make sure to always call next()!
  }
});
export default router;
