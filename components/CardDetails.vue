<template>
  <div class="bg-white shadow overflow-hidden sm:rounded-lg">
    <div class="px-4 py-5 sm:px-6 flex justify-between">
      <h3 class="text-lg leading-6 font-medium text-gray-900">Card Information</h3>
      <h3 class="leading-6 font-medium text-gray-300">ID: {{card.id}}</h3>
    </div>
    <div class="border-t border-gray-200">
      <dl>
        <div class="column">
          <dt>Card name</dt>
          <dd>{{card.name}}</dd>
        </div>
        <div class="column">
          <dt>Set</dt>
          <dd>{{set.name}}</dd>
        </div>
        <div class="column">
          <dt>Card number</dt>
          <dd>{{card.cardNumber}}</dd>
        </div>
        <div class="column">
          <dt>Condition</dt>
          <dd>{{card.condition}}</dd>
        </div>
      </dl>
    </div>
  </div>
</template>

<style scoped>
.column {
  @apply px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6;

  dt {
    @apply text-sm font-medium text-gray-500;
  }

  dd {
    @apply mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2;
  }
}

.column:nth-child(odd) {
  @apply bg-gray-50;
}

.column:nth-child(even) {
  @apply bg-white;
}
</style>

<script>
export default {
  name: 'CardDetails',
  props: ['card', 'set']
}
</script>
