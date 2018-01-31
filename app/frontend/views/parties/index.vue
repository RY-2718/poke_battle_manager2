<script>
  import CSRF from 'components/shared/csrf.vue';
  import axios from "axios";
  import PokeCard from "../../components/parties/pokeCard"
  export default {
    // templateで使うcomponentを登録（/app/frontend/components/以下に置いておく共通部品を登録するイメージ）
    components: {
      csrf: CSRF,
      "poke-card": PokeCard
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
        <el-menu class="el-menu">
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
            <div class="flex-parent">
              <div class="flex-children" v-for="poke in pokes" :key="poke.id">
                <poke-card :poke="poke" class="poke-card"></poke-card>
              </div>
            </div>
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
  .poke-card {
    margin-right: 20px;
  }
  .flex-parent {
    justify-content: center;
    flex-wrap: wrap;
  }
  .flex-children {
    min-width: 400px;
    max-width: 490px;
  }
  @media screen and (max-width: 700px) {
    .flex-parent {
      flex-direction: column;
    }
  }
</style>

