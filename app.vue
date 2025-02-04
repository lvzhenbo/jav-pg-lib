<template>
  <NaiveConfig inline-theme-disabled :locale="zhCN">
    <NuxtLayout>
      <NuxtPage />
    </NuxtLayout>
  </NaiveConfig>
</template>

<script setup lang="ts">
  import { zhCN } from 'naive-ui';

  const { colorModePreference } = useNaiveColorMode();
  const isDark = usePreferredDark();

  watch(isDark, () => {
    if (colorModePreference.get() === 'system') {
      colorModePreference.sync();
    }
  });
</script>
