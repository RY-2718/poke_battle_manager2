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
      <el-row>
        <el-col :span="12">
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
          </table>
        </el-col>
        <el-col :span="12">
          <poke-image :dex="poke.dex" :width="'50%'" class="poke-image"></poke-image>
        </el-col>
      </el-row>
    </el-card>
  </div>
</template>

<style scoped>
  .el-card {
    margin-bottom: 20px;
    width: 100%;
  }
  th {
    text-align: right;
  }
  .poke-image {
    text-align: right;
    margin-right: 10%;
  }
</style>