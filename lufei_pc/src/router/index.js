import Vue from 'vue'
import Router from 'vue-router'
import Home from "../components/Home"
import Login from "../components/users/Login";
import Register from "../components/users/Register";
Vue.use(Router);

export default new Router({
  mode: "history",
  routes: [
    {
      path: '/',
      name: "Home",
      component: Home,
    },{
      path: '/home',
      name: "Home",
      component: Home,
    },{
      path: '/login',
      name: "Login",
      component: Login,
    },{
      path: '/register',
      name: "Register",
      component: Register,
    }
  ]
})
