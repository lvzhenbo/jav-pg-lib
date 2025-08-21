<template>
  <div class="flex p-4 justify-center">
    <div class="w-full xl:w-312 lg:w-248 md:w-184">
      <NH2>
        {{ data?.dvd_id ?? data?.content_id }}
        {{ data?.title_ja ?? data?.title_en ?? '无标题' }}
      </NH2>
      <NCard v-if="data" hoverable>
        <div class="grid grid-cols-4 gap-2">
          <div class="lg:col-span-3 col-span-4">
            <NImage
              lazy
              :src="`https://pics.dmm.co.jp/${data.jacket_full_url}.jpg`"
              class="w-full"
              width="100%"
            />
          </div>
          <div class="lg:col-span-1 col-span-4">
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
          </div>
        </div>
      </NCard>
      <NH3 prefix="bar"> 预览图 </NH3>
      <NImageGroup>
        <NSpace>
          <NImage
            v-for="(image, index) in previewImages"
            :key="index"
            :src="image"
            width="128"
            :preview-src="fullImages[index]"
          />
        </NSpace>
      </NImageGroup>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { format } from 'date-fns';

  const { data } = await useFetch('/api/video/detail', {
    query: { contentId: useRoute().params.id },
  });
  const previewImages = computed<string[]>(() => {
    if (data.value?.gallery_thumb_first) {
      const urlPart = data.value.gallery_thumb_first.split('-')[0];
      const total = Number(data.value.gallery_thumb_last?.split('-')[1]);
      return Array.from(
        { length: total },
        (_, index) => `https://pics.dmm.co.jp/${urlPart}-${index + 1}.jpg`,
      );
    } else {
      return [];
    }
  });
  const fullImages = computed<string[]>(() => {
    if (data.value?.gallery_full_first) {
      const urlPart = data.value.gallery_full_first.split('-')[0];
      const total = Number(data.value.gallery_full_last?.split('-')[1]);
      const isJp = data.value.gallery_full_first === data.value.gallery_thumb_first;
      return Array.from(
        { length: total },
        (_, index) => `https://pics.dmm.co.jp/${urlPart}${isJp ? 'jp' : ''}-${index + 1}.jpg`,
      );
    } else {
      return [];
    }
  });

  onMounted(() => {
    console.log(data.value);
  });
</script>

<style scoped></style>
