<script>
  export default {
    props: {
      dex: String,
      width: String
    }
  }
</script>

<template>
  <div>
    <img :src="require('../../images/icon/' + dex + '.png')" :style="'width: ' + width + ';'">
  </div>
</template>
