<template>
  <div>
      <div class="row" q-ma-xl>
          <h5>Thông tin sản phẩm</h5>
          <p v-html="description">
          </p>
      </div>
  </div>
</template>

<script>

export default {
  props:["description"]

}
</script>

<style>

</style>