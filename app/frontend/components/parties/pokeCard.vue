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
    <el-card style="width: 100%;">
      <div slot="header">
        <h5>{{poke.nickname}} - {{poke.poke_name}}</h5>
      </div>
      <el-row>
        <el-col :xs="12">
          <table>
          </table>
        </el-col>
      </el-row>
    </el-card>
  </div>
</template>