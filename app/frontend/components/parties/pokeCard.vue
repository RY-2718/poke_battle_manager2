<script>
  import ElCard from "element-ui/packages/card/src/main";
  export default {
    components: {
      ElCard
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
        <h5>{{poke.nickname}} - {{poke.poke_name}}</h5>
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
              <td>{{ poke.stat.h }}</td>
            </tr>
            <tr>
              <th>ぼうぎょ</th>
              <td>{{ poke.stat.h }}</td>
            </tr>
            <tr>
              <th>とくこう</th>
              <td>{{ poke.stat.h }}</td>
            </tr>
            <tr>
              <th>とくぼう</th>
              <td>{{ poke.stat.h }}</td>
            </tr>
            <tr>
              <th>すばやさ</th>
              <td>{{ poke.stat.h }}</td>
            </tr>
          </table>
        </el-col>
        <el-col :span="12">
          hogehoge
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
</style>