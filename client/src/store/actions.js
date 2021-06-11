import http from "../lib/defaul";
export async function getProducts({ commit }) {
  const { data } = await http.get("/product");
  console.log(data.data);
  commit("SET_PRODUCTS", data.data);
}
export async function getProductDetails(commit, payload) {
  const { data } = await http.get(`/product/${payload.id}`);
  return data.data;
}
export async function login({ commit }, payload) {
  const { data } = await http.post("/auth/login", payload);
  console.log(JSON.stringify(data.data));
  commit("LOGIN", JSON.stringify(data.data));
  return data;
}
export async function acUpdateUser(commit, payload) {
  const { data } = await http.put(`/user/${payload.id}`, payload);
  return data;
}
export async function registerUser(commit, payload) {
  const { data } = await http.post("/auth/register", payload);
  return data;
}
export async function addItemInCart(commit, payload) {
  const { data } = await http.post("/cart", payload);
  return data;
}
export async function getCart({ commit }) {
  const { data } = await http.get(`/cart`);
  commit("setCart", data.data);
  return data.data;
}
export async function acCheckCartExisted(commit, payload) {
  const { data } = await http.get(`/cart/checkCartExisted/${payload.id}`);
  // commit('addOrder',data.data)
  return data.data;
}
export async function acDeleteCart(commit, payload) {
  console.log(payload);
  const { data } = await http.delete(`/cart`, { data: payload });
  // commit('setCart',data.data)
  return data;
}
export async function acUpdateCart(commit, payload) {
  const { data } = await http.put(`/cart/${payload.id}`, payload);
  // commit('setCart',data.data)
  return data;
}
export async function acUpdateCheckoutCart(commit, payload) {
  const { data } = await http.put(`/cart/checkout`, payload);
  // commit('setCart',data.data)
  return data;
}
export async function acClearCheckoutCart() {
  const { data } = await http.put(`/cart/clear-checkout`);
  // commit('setCart',data.data)
  return data;
}
export async function acGetDeliveryMethod({ commit }) {
  const { data } = await http.get(`/delivery-method`);
  commit("setDeliveryMethod", data.data);
  return data;
}
export async function acCreateOrder(commit, payload) {
  const { data } = await http.post(`/order`, payload);
  // commit('addOrder',data.data)
  return data.data;
}
export async function acGetAllOrder({ commit }) {
  const { data } = await http.get(`/order`);
  commit("setOrder", data.data);
  return data.data;
}
export async function acCreateOrderDetail(commit, payload) {
  const { data } = await http.post(`/order-detail`, payload);
  // commit('addOrder',data.data)
  return data.data;
}
export async function acCancelOrder(commit, payload) {
  const { data } = await http.put(`/order`, payload);
  // commit('addOrder',data.data)
  return data.data;
}
export async function acGetCategory({ commit }) {
  const { data } = await http.get(`/category`);
  commit("setCategory", data.data);
  return data.data;
}
export async function acGetCompany({ commit }) {
  const { data } = await http.get(`/company`);
  commit("setCompany", data.data);
  return data.data;
}
export async function acUploadImgUser(commit,payload){
  const { data } = await http.post(`/user`,payload)
  // commit('addOrder',data.data)
  return data.data;
}
