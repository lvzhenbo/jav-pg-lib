<template>
  <div class="p-4">
    <div class="flex justify-center mb-4">
      <NPagination
        v-model:page="page"
        :item-count="data?.total"
        :page-size="30"
        show-quick-jumper
        @update:page="handlePageChange"
      />
    </div>
    <NGrid x-gap="12" :y-gap="8" :cols="4">
      <NGi v-for="item in data?.data" :key="item.content_id">
        <NuxtLink
          :to="{ name: 'video-type-id', params: { id: item.content_id, type: item.service_code } }"
        >
          <NCard :title="item.title_ja || '无标题'" hoverable size="small">
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
  const page = ref(Number(route.params.num));
  const { data } = await useFetch('/api/video/page', {
    query: { page: page.value },
  });

  onMounted(() => {
    console.log(data.value);
  });

  watch(route, (val) => {
    if (val.name !== 'page-num') return;
    page.value = Number(val.params.num);
  });

  const handlePageChange = (page: number) => {
    router.push(`/page/${page}`);
  };
</script>

<style scoped></style>
