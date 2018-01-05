<template>
  <div class="">
    <input name="utf8" type="hidden" value="✓">
    <input type="hidden" name="authenticity_token" :value="csrf">
  </div>
</template>

<script>
  // 読み込み元のHTML（railsが生成）からCSRFトークンを取得
  export default {
    data: function() {
      return ({
        csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      })
    }
  }
</script>
