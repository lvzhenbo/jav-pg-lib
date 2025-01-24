<template>
  <div />
</template>

<script setup lang="ts">
  const { data } = await useFetch('/api/video/page');
  onMounted(() => {
    console.log(useRoute().params);
    console.log(data.value);
  });

  watch(data, () => {
    console.log(data);
  });
</script>

<style scoped></style>
