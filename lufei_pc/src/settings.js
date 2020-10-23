export default {
  Host: "http://api.bzboy.info:80",
  TC_captcha:{
    app_id: "2050295557",
  },
  checkoutUserLogin(vm){
    // 判断用户是否登录
    vm.token = sessionStorage.token || localStorage.token;
    if(vm.token){
      // 验证token的有效性
      vm.$axios.post(`/users/verify/`, {
        token: vm.token,
      }).catch(error=>{
        if(error.response.status === 400){
          vm.token='';
          sessionStorage.removeItem("token");
          localStorage.removeItem("token");
        }
      });
    }else{
      vm.token="";
    }
    return vm.token;
  }
}
