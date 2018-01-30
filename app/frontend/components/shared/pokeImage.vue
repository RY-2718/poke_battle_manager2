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
    <img :src="require('../../images/img/' + dex + '.png')" :style="'width: ' + width + ';'">
  </div>
</template>
