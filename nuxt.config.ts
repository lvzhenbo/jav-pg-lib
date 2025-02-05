import { createRequire } from 'module';
import path from 'path';

import tailwindcss from '@tailwindcss/vite';

const { resolve } = createRequire(import.meta.url);

const prismaClient = `prisma${path.sep}client`;

const prismaClientIndexBrowser = resolve('@prisma/client/index-browser').replace(
  `@${prismaClient}`,
  `.${prismaClient}`
);

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
    resolve: {
      alias: { '.prisma/client/index-browser': path.relative(__dirname, prismaClientIndexBrowser) },
    },
  },
  modules: ['@bg-dev/nuxt-naiveui', '@prisma/nuxt', '@nuxt/eslint', '@vueuse/nuxt'],
  prisma: {
    installStudio: false,
  },
  naiveui: {
    colorModePreference: 'system',
  },
});
