// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue';
import App from './App';
import router from './router';
import settings from './settings';
import ElementUI from 'element-ui';
import '../static/js/TCaptcha';

import 'element-ui/lib/theme-chalk/index.css';
import "../static/css/reset.css";
import axios from 'axios';
import 'video.js/dist/video-js.css';
import 'vue-video-player/src/custom-theme.css';
import VideoPlayer from 'vue-video-player';
Vue.use(VideoPlayer);

Vue.config.productionTip = false;
Vue.prototype.$settings = settings;

/* 允许ajax发送请求时附带cookie，设置为不允许 */
axios.defaults.withCredentials = false;
axios.defaults.baseURL = settings.Host;
Vue.prototype.$axios = axios;  // 把对象挂载vue中

Vue.use(ElementUI);

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
});
