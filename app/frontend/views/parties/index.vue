<script>
  import CSRF from 'components/shared/csrf.vue';
  import axios from "axios";
  import PokeCard from "../../components/parties/pokeCard"
  import changeBackgroundImage from 'components/shared/changeBackgroundImage.vue';

  export default {
    // templateで使うcomponentを登録（/app/frontend/components/以下に置いておく共通部品を登録するイメージ）
    components: {
      csrf: CSRF,
      pokeCard: PokeCard,
      background: changeBackgroundImage,
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
    <background>
      <el-container class="bg-light" style="height: 100vh;">
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
    </background>
  </div>
</template>

<style scoped>
  /*このコンポーネントにだけ適応されるCSS*/
  .el-menu {
    min-height: 100%;
  }

  .flex-parent {
    justify-content: center;
    flex-wrap: wrap;
  }

  .flex-children {
    width: 550px;
  }

  .poke-card {
    margin-right: 20px;
  }

  @media screen and (max-width: 700px) {
    .flex-parent {
      flex-direction: column;
    }
  }
</style>

