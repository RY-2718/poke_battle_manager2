<script>
  import ElCard from "element-ui/packages/card/src/main";
  import PokeIcon from "../shared/pokeIcon"
  import PokeImage from "../shared/pokeImage"
  import Padding from "./padding"
  export default {
    components: {
      ElCard,
      PokeIcon,
      PokeImage,
      Padding
    },
    props: {
      poke: null
    },
  }
</script>

<template>
  <div>
    <el-card class="el-card">
      <h3>{{ poke.nickname }} - {{ poke.poke_name }}</h3>
      <div class="flex-parent">
        <div class="flex-children" id="stats-table">
          <table>
            <tr>
              <th>HP</th>
              <td>{{ poke.stat.h }}</td>
            </tr>
            <tr>
              <th>こうげき</th>
              <td>{{ poke.stat.a }}</td>
            </tr>
            <tr>
              <th>ぼうぎょ</th>
              <td>{{ poke.stat.b }}</td>
            </tr>
            <tr>
              <th>とくこう</th>
              <td>{{ poke.stat.c }}</td>
            </tr>
            <tr>
              <th>とくぼう</th>
              <td>{{ poke.stat.d }}</td>
            </tr>
            <tr>
              <th>すばやさ</th>
              <td>{{ poke.stat.s }}</td>
            </tr>
            <tr>
              <th>せいかく</th>
              <td>{{ poke.nature }}</td>
            </tr>
            <tr>
              <th>とくせい</th>
              <td>{{ poke.ability }}</td>
            </tr>
          </table>
        </div>
        <div class="flex-children" id="icon_and_moves">
          <poke-image :dex="poke.dex" :width="'60%'" class="poke-image flex-children"></poke-image>
          <div>
            <h4>わざ</h4>
            <ul>
              <li v-for="move in poke.moves" :key="poke.moves.txt">{{ move.txt }}</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="flex-parent">
        <div class="note">
          <padding head="個体値" :v="poke.iv"></padding>
          <padding head="努力値" :v="poke.ev" class="margin-bottom"></padding>
          <p><b>　備考</b>: {{ poke.memo }}</p>
        </div>
        <div class="buttons">
          <el-button type="primary" icon="el-icon-edit" class="button"></el-button>
          <el-button type="warning" icon="el-icon-delete" class="button"></el-button>
        </div>
      </div>
    </el-card>
  </div>
</template>

<style scoped lang="scss">
  $bg_color: #FFFFFF;
  $gradient_color: #DAF2C9;
  $theme_color: #409EFF;

  tr {
    line-height: 1.3;
  }
  th, td {
    text-align: right;
    white-space: nowrap;
  }
  td {
    padding-left: 1em;
  }
  ul, ol {
    list-style-type: none!important;/*ポチ消す*/
    padding-left: 0.5em;
  }
  ul li, ol li {
    border-left: solid 4px $theme_color;/*左側の線*/
    line-height: 1.2;
    margin-top: 0.2em;
    margin-bottom: 0.2em;
    padding-top: 0.1em;
    padding-bottom: 0.1em;
    white-space: nowrap;
  }
  ul li:last-of-type{
    margin-bottom: 0px;
  }
  .button {
    margin-left: 2px;
    margin-right: 2px;
    padding-left: 12px;
    padding-right: 18px;
    width: 3em;
  }
  .el-card {
    background: linear-gradient(-20deg, $bg_color 30%, $gradient_color);
    background: -webkit-linear-gradient(-20deg, $bg_color 30%, $gradient_color);
    margin-bottom: 20px;
    width: 500px;
  }
  .margin-bottom {
    margin-bottom: 0.5em;
  }
  .note {
    background: #fff0cd;
    box-shadow: 0px 0px 0px 5px #fff0cd;
    border: dashed 2px white;
    color: #454545;
    display: inline-block;
    margin-top: 10px;
    margin-right: auto;
    padding-top: 0.5em;
    padding-bottom: 0.2em;
    padding-left: 0.5em;
    padding-right: 0.6em;
    position: relative;
  }
  .note :after{
    border-width: 0 15px 15px 0;
    border-style: solid;
    border-color: #ffdb88 #fff #ffdb88;
    box-shadow: -1px 1px 1px rgba(255, 255, 255, 0.15);
    content: '';
    position: absolute;
    right: -7px;
    top: -7px;
  }
  .poke-image {
    text-align: right;
  }
  #icon_and_moves {
    flex: 1;
  }
  #stats-table {
    flex: 1.3;
  }
</style>