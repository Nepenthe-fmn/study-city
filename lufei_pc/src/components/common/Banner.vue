<template>
  <el-carousel height="405px" :interval="3000" arrow="always"><!--    <el-carousel-item>-->
    <el-carousel-item :key="index" v-for="(banner, index) in banner_list">
      <a :href="banner.link"><img :src="banner.image" alt=""></a>
    </el-carousel-item>
  </el-carousel>
</template>

<script>
    export default {
        name: "Banner",
        created() {
            this.get_banner();
        },
        data(){
            return {
                banner_list:[],
            }
        },
        methods:{
            get_banner(){
                this.$axios.get(`/banner/`).then((response)=>{
                    console.log('1:', response.data);
                    this.banner_list = response.data;
                }).catch(error=>{
                    this.$message.error("网络异常，轮播图无法显示！")
                })
            }
        }
    }
</script>

<style scoped>
  .el-carousel__item h3 {
    color: #475669;
    font-size: 18px;
    opacity: 0.75;
    line-height: 300px;
    margin: 0;
  }

  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }
</style>
