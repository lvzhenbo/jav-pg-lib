<template>
  <div class="flex m-4 justify-center">
    <div class="w-full xl:w-312 lg:w-248">
      <NCard v-if="data" hoverable>
        <NGrid :cols="4" :x-gap="10" :y-gap="10">
          <NGi :span="3">
            <NImage
              lazy
              :src="`https://pics.dmm.co.jp/${data.jacket_full_url}.jpg`"
              class="w-full"
              width="100%"
            />
          </NGi>
          <NGi>
            <NDescriptions label-placement="left" :column="1">
              <NDescriptionsItem label="内容 ID"> {{ data.content_id }} </NDescriptionsItem>
              <NDescriptionsItem label="DVD ID">
                {{ data.dvd_id ?? '无，参考内容ID' }}
              </NDescriptionsItem>
              <NDescriptionsItem label="时长"> {{ data.runtime_mins }} 分钟 </NDescriptionsItem>
              <NDescriptionsItem label="发行日期">
                {{ format(new Date(data.release_date!), 'yyyy-MM-dd') }}
              </NDescriptionsItem>
              <NDescriptionsItem label="制作商">
                {{ data.maker?.name_ja ?? '无' }}
              </NDescriptionsItem>
              <NDescriptionsItem label="发行商">
                {{ data.label?.name_ja ?? '无' }}
              </NDescriptionsItem>
              <NDescriptionsItem label="系列">
                {{ data.series?.name_ja ?? '无' }}
              </NDescriptionsItem>
            </NDescriptions>
          </NGi>
        </NGrid>
      </NCard>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { format } from 'date-fns';

  const { data } = await useFetch('/api/video/detail', {
    query: { contentId: useRoute().params.id },
  });

  onMounted(() => {
    console.log(data.value);
  });
</script>

<style scoped></style>
