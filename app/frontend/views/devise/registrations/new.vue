<script>
  import CSRF from 'components/shared/csrf.vue';
  import changeBackgroundImage from 'components/shared/changeBackgroundImage.vue';
  export default {
    // templateで使うcomponentを登録（/app/frontend/components/以下に置いておく共通部品を登録するイメージ）
    mixins: [changeBackgroundImage],
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
          password: ''
        },
        // バリデーションルール el-formで使えるのかな？
        rules: {
          email: [
            {type: 'email', trigger: 'blur,change'}
          ]
        }
      });
    }
  }
</script>

<template>
  <!-- this div is the top level container where -->
  <div class="">
    <div class="background">
      <!-- railsから渡ってくるerrorをここで処理する -->
      <el-alert v-for="error in errors"
                :key="error"
                type="error"
                :title="error"
                :closable="false">
      </el-alert>
      <el-container class="bg-light" style="height: 100vh;">
        <el-main>
          <el-row type="flex" justify="center">
            <el-col :xs="24" :sm="12">
              <el-card class="box-card" style="width: 100%">
                <div slot="header" class="clearfix">
                  <h3>新規登録</h3>
                </div>
                <el-form :model="user" :rules="rules" label-position="top" method="post" :action="action">
                  <!-- CSRF tokenを挿入 -->
                  <csrf></csrf>

                  <el-form-item label="名前" prop="username" required>
                    <el-input name="user[username]" v-model="user.username" >
                    </el-input>
                  </el-form-item>

                  <el-form-item label="Email" prop="email" required>
                    <el-input name="user[email]" v-model="user.email" type="email">
                    </el-input>
                  </el-form-item>

                  <el-form-item label="Password" prop="password" required>
                    <el-input v-model="user.password" name="user[password]" type="password" autoComplete="off">
                    </el-input>
                  </el-form-item>

                  <el-form-item>
                    <el-button native-type="submit" type="primary" class="m-t-10">
                      Create
                    </el-button>
                  </el-form-item>
                </el-form>

                <a href="/users/sign_in">
                  <el-button type="text" style="margin-left: 10px">
                    Sign In
                  </el-button>
                </a>

              </el-card>
            </el-col>
          </el-row>
        </el-main>
      </el-container>
    </div>
  </div>
</template>

<style scoped>
  /*このコンポーネントにだけ適応されるCSS*/
  .background {
    height: 100%;
    background-color: rgba(255,255,255,0.7);
  }
</style>

<style src="../../../stylesheets/devise/common.scss"></style>
