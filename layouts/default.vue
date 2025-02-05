<template>
  <NLayout content-class="min-h-screen">
    <NLayoutHeader>标题</NLayoutHeader>
    <NLayoutContent
      ref="contentRef"
      position="absolute"
      :native-scrollbar="false"
      class="!top-4.5 !bottom-4.5"
      content-class="min-h-full"
    >
      <slot />
    </NLayoutContent>
    <NLayoutFooter position="absolute">页尾</NLayoutFooter>
  </NLayout>
</template>

<script setup lang="ts">
  import type { LayoutContentInst } from 'naive-ui';

  const route = useRoute();
  const contentRef = ref<LayoutContentInst | null>(null);
  watch(route, () => {
    contentRef.value?.scrollTo({ top: 0 });
  });
</script>

<style scoped></style>
