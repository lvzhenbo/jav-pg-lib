<template>
  <div class="p-4">
    <div class="flex justify-center mb-4">
      <NPagination
        v-model:page="page"
        :item-count="data?.total"
        :page-size="30"
        size="small"
        :show-quick-jumper="width >= 640"
        @update:page="handlePageChange"
      />
    </div>
    <div
      class="grid 3xl:grid-cols-5 2xl:grid-cols-4 xl:grid-cols-3 lg:grid-cols-2 md:grid-cols-2 sm:grid-cols-1 grid-cols-1 gap-x-3 gap-y-2"
    >
      <div v-for="item in data?.data" :key="item.content_id">
        <NuxtLink :to="{ name: 'video-id', params: { id: item.content_id } }">
          <NCard :title="item.title_ja ?? item.title_en ?? '无标题'" hoverable size="small">
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
        </NuxtLink>
      </div>
    </div>
    <div class="flex justify-center mt-4">
      <NPagination
        v-model:page="page"
        :item-count="data?.total"
        :page-size="30"
        size="small"
        :show-quick-jumper="width >= 640"
        @update:page="handlePageChange"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
  import { format } from 'date-fns';

  const route = useRoute();
  const router = useRouter();
  const page = ref(Number(route.params.num));
  const { data } = await useFetch('/api/video/page', {
    query: { page: page.value },
  });
  const { width } = useWindowSize();
  const scrollToTop = inject(scrollToTopKey);

  onMounted(() => {
    console.log(data.value);
  });

  watch(route, (val) => {
    if (val.name !== 'page-num') return;
    page.value = Number(val.params.num);
  });

  const handlePageChange = (page: number) => {
    router.push(`/page/${page}`);
    if (scrollToTop) scrollToTop();
  };
</script>

<style scoped></style>
