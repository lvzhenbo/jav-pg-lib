<template>
  <div class="p-4">
    <NGrid x-gap="12" :y-gap="8" :cols="4">
      <NGi v-for="item in data?.data" :key="item.content_id">
        <NCard :title="item.title_ja || '无标题'" tag="a" hoverable size="small">
          <template #cover>
            <NImage
              lazy
              :src="`https://pics.dmm.co.jp/${item.jacket_full_url}.jpg`"
              preview-disabled
              class="w-full"
            />
          </template>
          <div class="flex justify-between">
            <div>{{ item.dvd_id ?? item.content_id }}</div>
            <div>{{ format(new Date(item.release_date!), 'yyyy-MM-dd') }}</div>
          </div>
        </NCard>
      </NGi>
    </NGrid>
    <div class="flex justify-center mt-4">
      <NPagination
        v-model:page="page"
        :item-count="data?.total"
        :page-size="30"
        show-quick-jumper
        @update:page="handlePageChange"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
  import { format } from 'date-fns';

  const route = useRoute();
  const router = useRouter();
  const { data } = await useFetch('/api/video/page', { query: { page: route.params.num } });
  const page = ref(1);

  onMounted(() => {
    page.value = Number(route.params.num);
    console.log(data.value);
  });

  const handlePageChange = (page: number) => {
    router.push(`/page/${page}`);
  };
</script>

<style scoped></style>
