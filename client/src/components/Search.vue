<template>
  <div class="">
    <div class="">
      <p>

      <slot name="append"></slot>
      </p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      text: "haha",
    };
  },
  props: {
    model: String,
  },
  methods: {
    async click() {
      console.log("aa");
    },
  },
};
</script>

<style></style>e
