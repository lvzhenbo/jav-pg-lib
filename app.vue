<template>
  <NaiveConfig v-if="isSecureContext" inline-theme-disabled :locale="zhCN">
    <NLoadingBarProvider>
      <NaiveLoadingBar navigation />
    </NLoadingBarProvider>
    <NMessageProvider>
      <NuxtLayout>
        <NuxtPage :keepalive="{ max: 10 }" />
      </NuxtLayout>
    </NMessageProvider>
  </NaiveConfig>
  <NConfigProvider v-else inline-theme-disabled :locale="zhCN" :theme>
    <NLoadingBarProvider>
      <NaiveLoadingBar navigation />
    </NLoadingBarProvider>
    <NMessageProvider>
      <NuxtLayout>
        <NuxtPage :keepalive="{ max: 10 }" />
      </NuxtLayout>
    </NMessageProvider>
  </NConfigProvider>
</template>

<script setup lang="ts">
  import { zhCN, lightTheme, darkTheme } from 'naive-ui';

  const { colorModePreference } = useNaiveColorMode();
  const isDark = usePreferredDark();
  const isSecureContext = window?.isSecureContext;
  const theme = ref(lightTheme);

  onMounted(() => {
    theme.value = isDark.value ? darkTheme : lightTheme;
  });

  watch(isDark, () => {
    if (colorModePreference.get() === 'system') {
      colorModePreference.sync();
    }
    theme.value = isDark.value ? darkTheme : lightTheme;
  });
</script>
