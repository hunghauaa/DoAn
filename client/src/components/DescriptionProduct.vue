<template>
  <div>
    <div class="row" q-ma-xl>
      <div class="col-md-12 col-sm-12 col-xs-12">
        <h5>Thông tin sản phẩm</h5>
        <p v-html="description"></p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["description"],
};
</script>

<style>
</style>