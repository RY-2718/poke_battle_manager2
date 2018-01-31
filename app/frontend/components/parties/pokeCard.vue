<script>
  import ElCard from "element-ui/packages/card/src/main";
  import PokeIcon from "../shared/pokeIcon"
  import PokeImage from "../shared/pokeImage"
  export default {
    components: {
      ElCard,
      PokeIcon,
      PokeImage
    },
    props: {
      poke: null
    }
  }
</script>

<template>
  <div>
    <el-card class="el-card">
      <div slot="header">
        <h5>{{ poke.nickname }} - {{ poke.poke_name }}</h5>
      </div>
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
          <div class="flex-parent">
            <poke-icon :dex="poke.dex" :width="'40%'" class="poke-image flex-children"></poke-icon>
          </div>
          <div>
            <h4>わざ</h4>
            <ul>
              <li v-for="move in poke.moves" :key="poke.moves.txt">{{ move.txt }}</li>
            </ul>
          </div>
        </div>
      </div>
    </el-card>
  </div>
</template>

<style scoped>
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
    border-left: solid 4px #409EFF;/*左側の線*/
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
    width: 100%;
  }
  .poke-image {
    text-align: right;
    margin-right: 10%;
  }
  #stats-table {
    flex: 1;
  }
  #stats-table {
    flex: 1;
  }
</style>