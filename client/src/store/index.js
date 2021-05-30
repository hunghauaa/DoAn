import state from "./state";
import * as actions from "./actions";
import * as mutations from "./mutations";
import * as getters from "./getters";
import createPersistedState from "vuex-persistedstate";

import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);
const store = new Vuex.Store({
  state,
  actions,
  mutations,
  getters,
  plugins: [createPersistedState()],
});
export default store;
