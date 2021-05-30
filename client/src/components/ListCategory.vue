<template>
  <div>
    <VueSlickCarousel v-bind="settings" class="row justify-center items-center content-center">
      <div>
        <img
          width="200px"
          height="150px"
          src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxE0LysJJC1g_wPnPcsumY_HcwLEtGtIBJ8Q&usqp=CAU"
          alt=""
        />
      </div>
      <div>
        <img
          width="200px"
          height="150px"
          src="https://file.sedanviet.vn/fontend/automaker/honda.png"
          alt=""
        />
      </div>
      <div>
        <img
          width="250px"
          height="150px"
          src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHgHl0cMyGeBGvRzUogzJgDpqj-0K3vsL-Yg&usqp=CAU"
          alt=""
        />
      </div>
      <div>
        <img
          width="200px"
          height="150px"
          src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKxnd7xakBADOAwMNytnNuCPkzm7X1IJogdw&usqp=CAU"
          alt=""
        />
      </div>
      <div>
        <img
          width="200px"
          height="150px"
          src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoy2dL2Cfn3PzbglkoGrk2Na_FhmRPjR-UCw&usqp=CAU"
          alt=""
        />
      </div>
      <div>
        <img
          width="200px"
          height="150px"
          src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTjNpyYCsd6_TJuW9JQqLlx-Iftl9xPeVAUg&usqp=CAU"
          alt=""
        />
      </div>

      <div>
        <img
          width="200px"
          height="150px"
          src="https://travelcar.vn/images/logo/VAZ.png"
          alt=""
        />
      </div>

      <div>
        <img
          width="200px"
          height="150px"
          src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-WRLRABnI4rWr3CvLPxn3pD88H1MB66jGyw&usqp=CAU"
          alt=""
        />
      </div>

      <div>
        <img
          width="200px"
          height="150px"
          src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3r1FQpbxob9XW4SIheJuAhFYjIQY7COa21Q&usqp=CAU"
          alt=""
        />
      </div>
    </VueSlickCarousel>
  </div>
</template>

<script>
import VueSlickCarousel from "vue-slick-carousel";
import "vue-slick-carousel/dist/vue-slick-carousel.css";
// optional style for arrows & dots
import "vue-slick-carousel/dist/vue-slick-carousel-theme.css";
export default {
  components: { VueSlickCarousel },
  data() {
    return {
      settings: {
        arrows: false,
        infinite: true,
        slidesToShow: 5,
        slidesToScroll: 1,
        autoplay: true,
        speed: 5000,
        autoplaySpeed: 100,
        cssEase: "linear",
      },
    };
  },
};
</script>
