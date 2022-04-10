<template>
  <div class="container mx-auto my-6">
    <CardDetails :card="card" :set="set" class="mb-6"></CardDetails>
    <CardImages :card="card" :cardBaseUrl="cardBaseUrl"></CardImages>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import CardDetails from "~/components/CardDetails.vue";
import CardImages from "~/components/CardImages.vue";

async function getCardData(cardId: string, $axios: any) {
  const cardBaseUrl = `http://localhost:3000/cards/${cardId}/`
  const cardData = await $axios.$get(`${cardBaseUrl}/index.json`)
  const setBaseUrl = `http://localhost:3000/sets/${cardData.game}/${cardData.set}/`
  const setData = await $axios.$get(`${setBaseUrl}/set.json`)
  cardData.id = cardId
  return { card: cardData, cardBaseUrl, set: setData, setBaseUrl }
}

export default Vue.extend({
  name: 'WildcardPage',
  components: {CardImages, CardDetails},
  validate({ route }) {
    return route.path.startsWith('/c') || route.path.startsWith('/p')
  },
  asyncData({ route, $axios }): Promise<object | void> | object | void {
    return new Promise((resolve, reject) => {
      const folderName = route.params.id.slice(1)
      let data = {}
      if (route.params.id.startsWith('c')) {
        data = getCardData(folderName, $axios)
      }
      if (data === {}) {
        reject(new Error('Invalid type'))
        return
      }
      resolve(data)
    })
  }
})
</script>

<style media="all">
body {
  background-color: #333;
}
</style>
