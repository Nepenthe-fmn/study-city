<template>
    <div class="footer">
      <ul>
        <li :key="key" v-for="nav,key in nav_list">
          <a :href="nav.link" target="_blank" v-if="nav.is_http">{{nav.name}}</a>
          <router-link :to="nav.link" v-else>{{nav.name}}</router-link>
        </li>
      </ul>
      <p>Copyright © luffycity.com版权所有 | 京ICP备17072161号-1</p>
    </div>
</template>

<script>
    export default {
        name: "Footer",
        data(){
          return{
            nav_list:[],
          }
        },
        created(){
            this.get_nav();
        },
        methods:{
            get_nav(){
                this.$axios.get(`/nav/footer/`).then(response=>{
                    this.nav_list = response.data;
                })
            }
        }
    }
</script>

<style scoped>
.footer {
  width: 100%;
  height: 128px;
  background: #25292e;
  color: #fff;
}
.footer ul{
  margin: 0 auto 16px;
  padding-top: 38px;
  width: 810px;
}
.footer ul li{
  float: left;
  width: 112px;
  margin: 0 10px;
  text-align: center;
  font-size: 14px;
}
.footer ul::after{
  content:"";
  display:block;
  clear:both;
}
.footer p{
  text-align: center;
  font-size: 12px;
}
.footer a{
  color: #fff;
}
</style>
