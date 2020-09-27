<template>
    <div class="cart_item">
      <div class="cart_column column_1">
        <el-checkbox class="my_el_checkbox" v-model="course.select"></el-checkbox>
      </div>
      <div class="cart_column column_2">
        <img :src="$settings.Host+course.course_img" alt="">
        <span><router-link to="/course/detail/1">{{course.course_name}}</router-link></span>
      </div>
      <div class="cart_column column_3">
        <el-select v-model="expire" size="mini" placeholder="请选择购买有效期" class="my_el_select">
          <el-option label="1个月有效" value="30" key="30"></el-option>
          <el-option label="2个月有效" value="60" key="60"></el-option>
          <el-option label="3个月有效" value="90" key="90"></el-option>
          <el-option label="永久有效" value="10000" key="10000"></el-option>
        </el-select>
      </div>
      <div class="cart_column column_4">¥{{course.price}}</div>
      <div class="cart_column column_4" @click="delete_course()">删除</div>
    </div>
</template>

<script>
export default {
    name: "CartItem",
    props: ["course", ],
    watch: {
        "course.select"(){
            this.change_status();
        }
    },
    data(){
      return {
        // select:false,
        expire: "1个月有效",
      }
    },
    methods: {
        change_status(){
            console.log("1:",this.course.select,"2:",this.course.course_id);
            this.$axios.put(`/cart/course/`, {
                select: this.course.select,
                course_id: this.course.course_id
            },{
                headers: {
                    Authorization: "jwt " + this.$settings.checkoutUserLogin(this)
                }
            }).then(response=>{
                console.log(response.data);
            }).catch(error=>{
                console.log(error.response.data);
            })
        },
        delete_course(){
            this.$axios.delete(`/cart/course/`, {
                headers: {
                    Authorization: "jwt " + this.$settings.checkoutUserLogin(this),
                },
                params: {
                    course_id: this.course.course_id,
                }
            })
        }
    }
}
</script>


<style scoped>
.cart_item::after{
  content: "";
  display: block;
  clear: both;
}
.cart_column{
  float: left;
  height: 250px;
}
.cart_item .column_1{
  width: 88px;
  position: relative;
}
.my_el_checkbox{
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  top: 0;
  margin: auto;
  width: 16px;
  height: 16px;
}
.cart_item .column_2 {
  padding: 67px 10px;
  width: 520px;
  height: 116px;
}
.cart_item .column_2 img{
  width: 175px;
  height: 115px;
  margin-right: 35px;
  vertical-align: middle;
}
.cart_item .column_3{
  width: 197px;
  position: relative;
  padding-left: 10px;
}
.my_el_select{
  width: 117px;
  height: 28px;
  position: absolute;
  top: 0;
  bottom: 0;
  margin: auto;
}
.cart_item .column_4{
  padding: 67px 10px;
  height: 116px;
  width: 142px;
  line-height: 116px;
}

</style>
