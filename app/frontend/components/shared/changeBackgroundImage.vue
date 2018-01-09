<script>
  export default {
    created () {
      const num = (('000') + (Math.floor(Math.random() * 151) + 1)).slice(-3);
      document.body.style.backgroundImage = "url(" + require("images/background/" + num + ".jpg") + ")";
    }
  }
</script>

<template>
  <div>
    <slot></slot>
  </div>
</template>

<style scoped type="text/scss">
  div {
    height: 100%;
    background-color: rgba(255,255,255,0.5);
  }
</style>
