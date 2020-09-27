import Vue from 'vue'
import Router from 'vue-router'
import Home from "../components/Home"
import Login from "../components/users/Login";
import Register from "../components/users/Register";
import Course from "../components/courses/Course";
import Detail from "../components/courses/Detail";
import Cart from "../components/cart/Cart";
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
    },{
      path: '/course',
      name: "Course",
      component: Course,
    },{
      path: '/course/:id',  // 路径子路由（使用路由嵌套的前提是部分内容重叠）
      name: "Detail",
      component: Detail,
    },{
      path: '/cart',
      name: "Cart",
      component: Cart,
    }
  ]
})
