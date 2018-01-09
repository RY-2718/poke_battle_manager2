<script>
  export default {
    created () {
      const num = (('000') + (Math.floor(Math.random() * 151) + 1)).slice(-3);
      document.body.style.backgroundImage = "url(" + require("images/background/" + num + ".jpg") + ")";
    }
  }
</script>
