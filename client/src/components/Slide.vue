<template>
  <div class="">
    <q-carousel
      animated
      v-model="slide"
      navigation
      infinite
      :autoplay="autoplay"
      arrows
      transition-prev="slide-right"
      height="550px"
      transition-next="slide-left"
      @mouseenter="autoplay = false"
      @mouseleave="autoplay = true"
    >
      <q-carousel-slide :name="1" img-src="http://html.lionode.com/nature/n-speed/image/banners/Main-Banner3.jpg" />
      <q-carousel-slide :name="2" img-src="http://html.lionode.com/nature/n-speed/image/banners/Main-Banner1.jpg" />
      <q-carousel-slide :name="3" img-src="http://html.lionode.com/nature/n-speed/image/banners/Main-Banner3.jpg" />
      <q-carousel-slide :name="4" img-src="http://html.lionode.com/nature/n-speed/image/banners/Main-Banner2.jpg" />
    </q-carousel>
  </div>
</template>

<script>
export default {
  data () {
    return {
      slide: 1,
      autoplay: true
    }
  }
}
</script>