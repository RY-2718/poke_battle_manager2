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
        newPoke: {
          poke_name: '',
          nickname: '',
          nature: '',
          ability: '',
          moves: [{txt: ""}, {txt: ""}, {txt: ""}, {txt: ""}],
          iv: {
            h: 31,
            a: 31,
            b: 31,
            c: 31,
            d: 31,
            s: 31,
          },
          ev: {
            h: 0,
            a: 0,
            b: 0,
            c: 0,
            d: 0,
            s: 0,
          },
          memo: ''
        },
        form_visible: false
      };
    },
    methods: {
      handleClick(tab, event) {
      },
      onSubmit(poke) {
        console.log('submit!' + poke);
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
              <div class="buttons">
                <el-button @click="form_visible = true" class="button">新しいポケモンを登録する</el-button>
              </div>
            </el-tab-pane>
            <el-tab-pane label="パーティ" name="party">
              party
            </el-tab-pane>
          </el-tabs>
        </el-main>
      </el-container>

      <!--編集用のモーダルダイアログ-->
      <el-dialog :visible.sync="form_visible" title="編集" top="3vh">
        <el-form :model="newPoke" size="mini">
          <el-form-item label="ポケモン">
            <el-input v-model="newPoke.poke_name"></el-input>
          </el-form-item>
          <el-form-item label="ニックネーム">
            <el-input v-model="newPoke.nickname"></el-input>
          </el-form-item>
          <el-form-item label="せいかく">
            <el-input v-model="newPoke.nature"></el-input>
          </el-form-item>
          <el-form-item label="とくせい">
            <el-input v-model="newPoke.ability"></el-input>
          </el-form-item>
          <el-form-item
              v-for="(move, index) in newPoke.moves"
              :label="'わざ' + (index+1)"
              :key="index"
          >
            <el-input v-model="move.txt"></el-input>
          </el-form-item>
          <el-form-item label="個体値">
            <el-col :xs="24" :lg="3">
              <el-input-number v-model="newPoke.iv.h" controls-position="right" class="form-input-number"></el-input-number>
            </el-col>
            <el-col :xs="24" :lg="3">
              <el-input-number v-model="newPoke.iv.a" controls-position="right" class="form-input-number"></el-input-number>
            </el-col>
            <el-col :xs="24" :lg="3">
              <el-input-number v-model="newPoke.iv.b" controls-position="right" class="form-input-number"></el-input-number>
            </el-col>
            <el-col :xs="24" :lg="3">
              <el-input-number v-model="newPoke.iv.c" controls-position="right" class="form-input-number"></el-input-number>
            </el-col>
            <el-col :xs="24" :lg="3">
              <el-input-number v-model="newPoke.iv.d" controls-position="right" class="form-input-number"></el-input-number>
            </el-col>
            <el-col :xs="24" :lg="3">
              <el-input-number v-model="newPoke.iv.s" controls-position="right" class="form-input-number"></el-input-number>
            </el-col>
          </el-form-item>
          <el-form-item label="努力値">
            <el-col :xs="24" :lg="3">
              <el-input-number v-model="newPoke.ev.h" controls-position="right" class="form-input-number"></el-input-number>
            </el-col>
            <el-col :xs="24" :lg="3">
              <el-input-number v-model="newPoke.ev.a" controls-position="right" class="form-input-number"></el-input-number>
            </el-col>
            <el-col :xs="24" :lg="3">
              <el-input-number v-model="newPoke.ev.b" controls-position="right" class="form-input-number"></el-input-number>
            </el-col>
            <el-col :xs="24" :lg="3">
              <el-input-number v-model="newPoke.ev.c" controls-position="right" class="form-input-number"></el-input-number>
            </el-col>
            <el-col :xs="24" :lg="3">
              <el-input-number v-model="newPoke.ev.d" controls-position="right" class="form-input-number"></el-input-number>
            </el-col>
            <el-col :xs="24" :lg="3">
              <el-input-number v-model="newPoke.ev.s" controls-position="right" class="form-input-number"></el-input-number>
            </el-col>
          </el-form-item>
          <el-form-item label="メモ">
            <el-input type="textarea" v-form="newPoke.memo"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="onSubmit(poke)">登録</el-button>
            <el-button @click="form_visible = false">キャンセル</el-button>
          </el-form-item>
        </el-form>
      </el-dialog>
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

