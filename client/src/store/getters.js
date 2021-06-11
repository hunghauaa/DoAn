export function products(state){  
     return state.products
}
export function getUserInfo(state){
     return state.userInfo
}
export function isAuthenticated(state){
     return !!state.userInfo
}
export function itemOfCart(state){
     return state.cart
}
export function deliveryMethod(state){
     return state.deliveryMethod
}
export function getOrder(state){
     return state.order
}
export function getCategory(state){
     return state.category
}
export function getCompany(state){
     return state.company
}