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
      <div class="note">
        <padding head="個体値" :v="poke.iv"></padding>
        <padding head="努力値" :v="poke.ev" class="margin-bottom"></padding>
        <p><b>　備考</b>: {{ poke.memo }}</p>
      </div>
    </el-card>
  </div>
</template>

<style scoped lang="scss">
  $gradient_color: #DAF2C9;
  $bg_color: #FFFFFF;
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
    padding-left: 0.5em;
    list-style-type: none!important;/*ポチ消す*/
  }
  ul li, ol li {
    white-space: nowrap;
    line-height: 1.2;
    border-left: solid 4px $theme_color;/*左側の線*/
    padding-top: 0.1em;
    padding-bottom: 0.1em;
    margin-top: 0.2em;
    margin-bottom: 0.2em;
  }
  ul li:last-of-type{
    margin-bottom: 0px;
  }
  .el-card {
    margin-bottom: 20px;
    width: 480px;
    background: -webkit-linear-gradient(-20deg, $bg_color 30%, $gradient_color);
    background: linear-gradient(-20deg, $bg_color 30%, $gradient_color);
  }
  .margin-bottom {
    margin-bottom: 0.5em;
  }
  .note {
    position: relative;
    background: #fff0cd;
    box-shadow: 0px 0px 0px 5px #fff0cd;
    border: dashed 2px white;
    padding-top: 0.5em;
    padding-bottom: 0.2em;
    padding-left: 0.5em;
    padding-right: 0.6em;
    color: #454545;
    display: inline-block;
    margin-top: 10px;
  }
  .note :after{
    position: absolute;
    content: '';
    right: -7px;
    top: -7px;
    border-width: 0 15px 15px 0;
    border-style: solid;
    border-color: #ffdb88 #fff #ffdb88;
    box-shadow: -1px 1px 1px rgba(255, 255, 255, 0.15);
  }
  .poke-image {
    text-align: right;
  }
  #stats-table {
    flex: 1.7;
  }
  #icon_and_moves {
    flex: 1;
  }
</style>