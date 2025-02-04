import tailwindcss from '@tailwindcss/vite';

// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',
  devtools: { enabled: true },
  typescript: {
    typeCheck: true,
  },
  css: ['~/assets/css/tailwind.css'],
  vite: {
    plugins: [tailwindcss()],
  },
  modules: ['@bg-dev/nuxt-naiveui', '@prisma/nuxt', '@nuxt/eslint', '@vueuse/nuxt'],
  prisma: {
    installStudio: false,
  },
  naiveui: {
    colorModePreference: 'system',
  },
});
