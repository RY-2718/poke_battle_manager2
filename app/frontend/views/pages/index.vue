<script>
  import CSRF from 'components/shared/csrf.vue';
  export default {
    // templateで使うcomponentを登録（/app/frontend/components/以下に置いておく共通部品を登録するイメージ）
    components: {
      csrf: CSRF
    },
    // propsはこのcomponentを呼び出すときに渡される変数を解釈するための記述
    props: {
      errors: Array,
      sign_in: String,
      sign_up: String,
      sign_out: String,
      edit: String,
      logged_in: Boolean,
    },
  }
</script>

<template>
  <!-- this div is the top level container where -->
  <div class="">
    <el-container class="bg-light" style="height: 100vh;">
      <el-main>
        <el-row type="flex">
          <el-col :xs="24" :sm="6" :offset="2">
            <el-card class="box-card" style="width: 100%;">
              <div slot="header" class="clearfix">
                <h3>PokeBattleManager ver.2</h3>
              </div>

              <template v-if="logged_in">
                <el-form method="get" :action="edit">
                  <el-form-item>
                    <el-button native-type="submit" type="primary" class="m-t-10">
                      アカウントの編集
                    </el-button>
                  </el-form-item>
                </el-form>

                <el-form method="post" :action="sign_out">
                  <input type="hidden" name="_method" value="delete">
                  <csrf></csrf>
                  <el-button native-type="submit" type="warning" class="m-t-10">
                    ログアウト
                  </el-button>
                </el-form>
              </template>

              <template v-else>
                <el-form method="get" :action="sign_in">
                  <el-form-item>
                    <el-button native-type="submit" type="primary" class="m-t-10">
                      ログイン
                    </el-button>
                  </el-form-item>
                </el-form>

                もしくは
                <a :href="sign_up">
                  <el-button type="text" style="margin-left: 10px">
                    新規登録
                  </el-button>
                </a>
              </template>

            </el-card>
          </el-col>
        </el-row>
      </el-main>
    </el-container>
  </div>
</template>

<style scoped>
/*このコンポーネントにだけ適応されるCSS*/
.box-card {
  margin-top: 150px;
  background-color: rgba(255,255,255,0.5);
}
@media screen and (max-width: 767px ) {
  .box-card {
    background-color: rgba(255,255,255,0.85);
  }
}
</style>

<style>
body {
  background-image: url("../../images/background/top.jpg");
}
</style>
