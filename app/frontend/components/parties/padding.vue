<script>
  export default {
    props: {
      v: null,
      head: null,
    }
  }
</script>

<template>
  <div>
    <b>{{ head }}</b>: <span>{{ v.h }}</span> - <span>{{ v.a }}</span> - <span>{{ v.b }}</span> -<span>{{ v.c }}</span> - <span>{{ v.d }}</span> - <span>{{ v.s }}</span>
  </div>
</template>

<style scoped>
  span {
    display: inline-block;
    width: 2em;
    text-align: right;
  }
</style>