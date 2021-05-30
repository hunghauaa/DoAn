<template>
  <div>
    <FooterTop />
    <div class="row justify-center items-center content-center">
      <div class="col-md-10 q-mt-xl">
        <FooterBot />
      </div>
    </div>
  </div>
</template>

<script>
import FooterBot from "./FooterBot";
import FooterTop from "./FooterTop";
export default {
  components: {
    FooterBot,
    FooterTop,
  },
};
</script>

<style scoped></style>
