<template>
  <div> </div>
</template>

<script setup lang="ts">
  onMounted(() => {
    console.log(useRoute().params.id);
  });
</script>

<style scoped></style>
