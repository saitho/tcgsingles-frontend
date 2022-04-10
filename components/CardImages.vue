<template>
  <div>
    <CoolLightBox
      :items="cardImages.map(i => i.url)" :index="index" @close="index = null"
    >
    </CoolLightBox>

    <div class="lg:grid lg:grid-cols-4 lg:gap-x-6">
      <figure class="aspect-w-3 aspect-h-4 rounded-lg overflow-hidden relative cursor-pointer lg:col-span-2">
        <figcaption class="absolute text-lg px-4 bg-white">Front</figcaption>
        <img :src="cardImages[0].url"
             @click="index = 0"
             class="w-full h-full object-center object-cover">
      </figure>
      <div class="lg:grid lg:grid-cols-1 lg:gap-y-6">
        <figure class="aspect-w-3 aspect-h-2 rounded-lg overflow-hidden relative cursor-pointer">
          <figcaption class="absolute text-lg px-4 bg-white">Top left</figcaption>
          <img :src="cardImages[1].url"
               @click="index = 1"
               class="w-full h-full object-center object-cover">
        </figure>
        <figure class="aspect-w-3 aspect-h-2 rounded-lg overflow-hidden relative cursor-pointer">
          <figcaption class="absolute text-lg px-4 bg-white">Bottom left</figcaption>
          <img :src="cardImages[2].url"
               @click="index = 2"
               class="w-full h-full object-center object-cover">
        </figure>
      </div>
      <div class="lg:grid lg:grid-cols-1 lg:gap-y-6">
        <figure class="aspect-w-3 aspect-h-2 rounded-lg overflow-hidden relative cursor-pointer">
          <figcaption class="absolute text-lg px-4 bg-white">Top right</figcaption>
          <img :src="cardImages[3].url"
               @click="index = 3"
               class="w-full h-full object-center object-cover">
        </figure>
        <figure class="aspect-w-3 aspect-h-2 rounded-lg overflow-hidden relative cursor-pointer">
          <figcaption class="absolute text-lg px-4 bg-white">Bottom right</figcaption>
          <img :src="cardImages[4].url"
               @click="index = 4"
               class="w-full h-full object-center object-cover">
        </figure>
      </div>
    </div>
  </div>
</template>

<script>
// @ts-ignore
import CoolLightBox from "vue-cool-lightbox"
import 'vue-cool-lightbox/dist/vue-cool-lightbox.min.css'

export default {
  name: 'CardImages',
  components: {CoolLightBox},
  props: ['card', 'cardBaseUrl'],
  computed: {
    cardImages() {
      return [
        {
          // Front
          url: `${this.cardBaseUrl}${this.card.images.front}`,
        },
        {
          // Top left
          url: `${this.cardBaseUrl}${this.card.images.frontTopLeft}`,
        },
        {
          // Bottom left
          url: `${this.cardBaseUrl}${this.card.images.frontBottomLeft}`,
        },
        {
          // Top right
          url: `${this.cardBaseUrl}${this.card.images.frontTopRight}`,
        },
        {
          // Bottom right
          url: `${this.cardBaseUrl}${this.card.images.frontBottomRight}`,
        }
      ]
    }
  },
  data: () => {
    return {
      index: null,
    }
  },
}
</script>
