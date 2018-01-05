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
      action: String
    },
    // dataはVueが双方向バインディングする変数
    data: function() {
      return ({
        user: {
          username: '',
          email: '',
          password: '',
          password_confirmation: '',
          current_password: ''
        },
        // バリデーションルール el-formで使えるのかな？
        rules: {
          email: [
            {type: 'email', trigger: 'blur,change'}
          ]
        },
        dialogVisible: false
      });
    },
    methods: {
      handleClose(done) {
        this.$confirm('Are you sure to close this dialog?')
          .then(_ => {
            done();
          })
          .catch(_ => {});
      }
    }
  }
</script>

<template>
  <!-- this div is the top level container where -->
  <div class="">
    <!-- railsから渡ってくるerrorをここで処理する -->
    <el-alert v-for="error in errors"
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
              <h3>ユーザ情報の編集</h3>
            </div>
            <el-form :model="user" :rules="rules" label-position="top" method="post" :action="action">
              <!-- CSRF tokenを挿入 -->
              <input type="hidden" name="_method" value="put">
              <csrf></csrf>

              <el-form-item label="Email（必須）" prop="email">
                <el-input name="user[email]" v-model="user.email" type="email">
                </el-input>
              </el-form-item>

              <el-form-item label="現在のパスワード（必須）" prop="current_password">
                <el-input v-model="user.current_password" name="user[current_password]" type="password" autocomplete="off">
                </el-input>
              </el-form-item>

              <el-form-item label="名前" prop="username">
                <el-input name="user[username]" v-model="user.username" >
                </el-input>
              </el-form-item>

              <el-form-item label="新しいパスワード" prop="password">
                <el-input v-model="user.password" name="user[password]" type="password" autocomplete="off">
                </el-input>
              </el-form-item>

              <el-form-item label="新しいパスワード（確認）" prop="password_confirmation">
                <el-input v-model="user.password_confirmation" name="user[password_confirmation]" type="password" autocomplete="off">
                </el-input>
              </el-form-item>

              <el-form-item>
                <el-button native-type="submit" type="primary" class="m-t-10">
                  更新
                </el-button>
              </el-form-item>
            </el-form>

            <el-form method="post" :action="action">
              <input type="hidden" name="_method" value="delete">
              <csrf></csrf>
              <el-button @click="dialogVisible = true" type="danger">
                アカウントを消す！
              </el-button>
              <el-dialog title="確認" :visible.sync="dialogVisible" width="30%" :before-close="handleClose">
                <span>本当に消しますか？</span>
                <span slot="footer" class="dialog-footer">
                  <el-button @click="dialogVisible = false">消さない</el-button>
                  <el-button native-type="submit" type="primary">消す</el-button>
                </span>
              </el-dialog>
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

