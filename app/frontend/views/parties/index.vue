<script>
  import CSRF from 'components/shared/csrf.vue';
  import ElCard from "element-ui/packages/card/src/main";
  import axios from "axios";
  export default {
    // templateで使うcomponentを登録（/app/frontend/components/以下に置いておく共通部品を登録するイメージ）
    components: {
      ElCard,
      csrf: CSRF
    },
    // propsはこのcomponentを呼び出すときに渡される変数を解釈するための記述
    props: {
      errors: Array,
    },
    data() {
      return {
        activeTab: "pokes",
        pokes: [],

      };
    },
    methods: {
      handleClick(tab, event) {
        return;
      }
    },
    mounted() {
      axios.get("http://localhost:3000/pokes")
        .then(
          response => {
            this.pokes = response.data
          }
        )
    }
  }
</script>

<template>
  <!-- this div is the top level container where -->
  <div class="">
    <el-container class="bg-light" style="height: 100vh;">
      <el-aside>
        <el-menu>
          <el-menu-item index="1">
            <a href="/parties">Party</a>
          </el-menu-item>
          <el-menu-item index="2">
            <a href="/battles">Battle</a>
          </el-menu-item>
          <el-menu-item index="3">
            <a href="/stats">Stats</a>
          </el-menu-item>
          <el-menu-item index="4">
            <a href="/users">User</a>
          </el-menu-item>
        </el-menu>
      </el-aside>
      <el-main>
        <el-tabs v-model="activeTab" @tab-click="handleClick">
          <el-tab-pane label="追加・編集" name="pokes">
            <el-row :gutter="20" style="width: 80%;">
              <el-col :xs="24" :sm="8" v-for="poke in pokes" :keys="id">
                <el-card style="width: 100%;">
                  <div slot="header">
                    <h5>{{poke.nickname}} - {{poke.poke_name}}</h5>
                  </div>
                  がぞう
                </el-card>
              </el-col>
            </el-row>
          </el-tab-pane>
          <el-tab-pane label="パーティ" name="party">
            party
          </el-tab-pane>
        </el-tabs>
      </el-main>
    </el-container>
  </div>
</template>

<style scoped>
  /*このコンポーネントにだけ適応されるCSS*/
  .el-menu {
    min-height: 100%;
  }
</style>

