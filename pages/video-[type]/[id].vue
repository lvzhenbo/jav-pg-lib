<template>
  <div>{{ data?.title_ja }}</div>
</template>

<script setup lang="ts">
  const { data } = await useFetch('/api/video/detail', {
    query: { contentId: useRoute().params.id, serviceCode: useRoute().params.type },
  });

  onMounted(() => {
    console.log(data.value);
  });
</script>

<style scoped></style>
