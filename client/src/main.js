import Vue from "vue";
import App from "./App.vue";
import "./quasar";
import { library } from "@fortawesome/fontawesome-svg-core";
import { faGolfBall } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import router from "./routers/index";
import store from "./store";
// import VueSocketIO from "vue-socket.io";

import VueLodash from "vue-lodash";
import lodash from "lodash";
library.add(faGolfBall);
// const options = { path: '/' }; //Options object to pass into SocketIO
Vue.component("font-awesome-icon", FontAwesomeIcon);
// Vue.use(
//   new VueSocketIO({
//     debug: true,
//     connection: "http://localhost:3000/socket.io/?transport=udp",

//     vuex: {
//       store,
//       actionPrefix: "SOCKET_",
//       mutationPrefix: "SOCKET_",
//     },
//     options: { path: "/", transports: ["websocket", "polling"] }, //Optional options
//   })
// );

Vue.config.errorHandler = function(err, vm, info) {
  // $q.notify({
  //   message:"Có lỗi xảy ra",
  //   color:"red"
  // })
  console.log(err);
  console.log(vm);

  console.log(info);

  // handle error
  // `info` is a Vue-specific error info, e.g. which lifecycle hook
  // the error was found in. Only available in 2.2.0+
};
Vue.use(VueLodash, { name: "custom", lodash: lodash });
Vue.config.productionTip = false;
new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
