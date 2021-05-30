import axios from "axios";
const userInfo = JSON.parse(localStorage.getItem("userInfo"));
if(userInfo)
  var token = userInfo.token
else{
   token =''
}
console.log(userInfo)
const htpt = axios.create({
  baseURL: "http://localhost:3000",
  headers: {'Authorization':'Bear '+token}
});
export default htpt;
