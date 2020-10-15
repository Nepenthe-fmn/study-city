<template>
    <div class="cart_item">
      <div class="cart_column column_1">
        <el-checkbox class="my_el_checkbox" v-model="course.select"></el-checkbox>
      </div>
      <div class="cart_column column_2">
        <img :src="$settings.Host+course.course_img" alt="">
        <span>
          <span><router-link to="/course/detail/1">{{course.course_name}}</router-link></span>
          <span style="color: orange">{{course.discount_name}}</span>
        </span>
      </div>
      <div class="cart_column column_3">
        <el-select v-model="course.expire" size="mini" placeholder="请选择购买有效期" class="my_el_select">
          <el-option :label="item.name" :value="item.time" v-for="item in course.expire_list" :key="item.time"></el-option>
        </el-select>
      </div>
      <div class="cart_column column_4" v-for="item in course.expire_list" v-if="item.time==course.expire">
        ¥{{item.discount_price}}
      </div>
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
        },
        "course.expire"(){
            this.change_expire();
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
            // 商品状态切换
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
            // 移除购物车
            this.$axios.delete(`/cart/course/`, {
                headers: {
                    Authorization: "jwt " + this.$settings.checkoutUserLogin(this),
                },
                params: {
                    course_id: this.course.course_id,
                }
            }).then(response=>{
                // 移除成功
                this.$emit("del_cart");  // 主操作在子集，子集向父级提交移除事件
            }).catch(error=>{
                console.log(error.response);
            })
        },
        change_expire(){
            // 修改有效期选项
            this.$axios.patch(`/cart/course/`,{
                expire: this.course.expire,
                course_id: this.course.course_id
            },{
                headers: {
                    Authorization: "jwt " + this.$settings.checkoutUserLogin(this)
                }
            }).then(response=>{
                // 当切换有效期以后,更新课程的价格.
                for(let item of this.course.expire_list){
                    if(this.course.expire != item.time){
                      continue;
                    }
                    this.course.price = item.price;
                }
            }).catch(error=>{
                console.log(error.response.data);
            })
        },
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
