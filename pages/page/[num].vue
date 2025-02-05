<template>
  <div class="p-4">
    <NGrid v-if="status === 'success'" x-gap="12" :y-gap="8" :cols="4">
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
    <div v-if="status === 'success'" class="flex justify-center mt-4">
      <NPagination
        v-model:page="page"
        :item-count="data?.total"
        :page-size="30"
        show-quick-jumper
        @update:page="handlePageChange"
      />
    </div>
    <NGrid v-else x-gap="12" :y-gap="8" :cols="4">
      <NGi v-for="item in 30" :key="item">
        <NCard size="small">
          <template #cover>
            <NSkeleton height="350px" />
          </template>
          <template #header>
            <NSkeleton text />
          </template>
          <div class="flex justify-between">
            <NSkeleton text class="!w-16" />
            <NSkeleton text class="!w-20" />
          </div>
        </NCard>
      </NGi>
    </NGrid>
  </div>
</template>

<script setup lang="ts">
  import { format } from 'date-fns';

  const route = useRoute();
  const router = useRouter();
  const page = ref(Number(route.params.num));
  const { data, status, error } = await useFetch('/api/video/page', {
    query: { page: page.value },
    lazy: true,
  });
  const message = useMessage();

  watch(status, (val) => {
    console.log(val);
  });

  watch(data, (val) => {
    console.log(val);
  });

  watch(error, (val) => {
    console.error(val);
    message.error(JSON.stringify(val));
  });

  const handlePageChange = (page: number) => {
    router.push(`/page/${page}`);
  };
</script>

<style scoped></style>
