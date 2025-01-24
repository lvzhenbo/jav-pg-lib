// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: "2024-11-01",
  devtools: { enabled: true },
  modules: [
    "@bg-dev/nuxt-naiveui",
    "@prisma/nuxt",
    "@nuxt/eslint",
    "@nuxtjs/tailwindcss",
    "@vueuse/nuxt",
  ],
  prisma: {
    installStudio: false,
  },
});
