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
      action: String,
      token: String
    },
    // dataはVueが双方向バインディングする変数
    data: function() {
      return ({
        user: {
          password: '',
          password_confirmation: '',
        },
        // バリデーションルール el-formで使えるのかな？
        rules: {
        },
      });
    },
  }
</script>

<template>
  <!-- this div is the top level container where -->
  <div class="">
    <!-- railsから渡ってくるerrorをここで処理する -->
    <el-alert v-for="error in errors"
      :key="error"
      type="error"
      :title="error"
      :closable="false"
    >
  </el-alert>
  <el-container class="bg-light" style="height: 100vh;">
    <el-main>
      <el-row type="flex" justify="center">
        <el-col :xs="24" :sm="12">
          <el-card class="box-card" style="width: 100%">
            <div slot="header" class="clearfix">
              <h3>パスワードリセットの時間です</h3>
            </div>
            <el-form :model="user" :rules="rules" label-position="top" method="post" :action="action">
              <!-- CSRF tokenを挿入 -->
              <input type="hidden" name="_method" value="put">
              <input type="hidden" name="user[reset_password_token]" :value="token">
              <csrf></csrf>

              <el-form-item label="新しいパスワード" prop="password">
                <el-input v-model="user.password" name="user[password]" type="password" autoComplete="off">
                </el-input>
              </el-form-item>

              <el-form-item label="新しいパスワード（確認）" prop="password_confirmation">
                <el-input v-model="user.password_confirmation" name="user[password_confirmation]" type="password" autoComplete="off">
                </el-input>
              </el-form-item>

              <el-form-item>
                <el-button native-type="submit" type="primary" class="m-t-10">
                  リセット
                </el-button>
              </el-form-item>
            </el-form>
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
    margin-top: 30px;
  }
</style>


