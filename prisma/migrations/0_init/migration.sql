-- CreateTable
CREATE TABLE "derived_actor" (
    "id" INTEGER NOT NULL,
    "name_kanji" VARCHAR,
    "name_kana" VARCHAR,

    CONSTRAINT "derived_actor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "derived_actress" (
    "id" INTEGER NOT NULL,
    "name_romaji" VARCHAR,
    "image_url" VARCHAR,
    "name_kanji" VARCHAR,
    "name_kana" VARCHAR,

    CONSTRAINT "derived_actress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "derived_author" (
    "id" INTEGER NOT NULL,
    "name_kanji" VARCHAR,
    "name_kana" VARCHAR,

    CONSTRAINT "derived_author_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "derived_category" (
    "id" INTEGER NOT NULL,
    "name_en" VARCHAR,
    "name_ja" VARCHAR,

    CONSTRAINT "derived_category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "derived_director" (
    "id" INTEGER NOT NULL,
    "name_kanji" VARCHAR,
    "name_kana" VARCHAR,
    "name_romaji" VARCHAR,

    CONSTRAINT "derived_director_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "derived_label" (
    "id" INTEGER NOT NULL,
    "name_en" VARCHAR,
    "name_ja" VARCHAR,

    CONSTRAINT "derived_label_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "derived_maker" (
    "id" INTEGER NOT NULL,
    "name_en" VARCHAR,
    "name_ja" VARCHAR,

    CONSTRAINT "derived_maker_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "derived_series" (
    "id" INTEGER NOT NULL,
    "name_en" VARCHAR,
    "name_ja" VARCHAR,

    CONSTRAINT "derived_series_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "derived_site" (
    "id" INTEGER NOT NULL,
    "name" VARCHAR NOT NULL,

    CONSTRAINT "derived_video_site_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "derived_video" (
    "content_id" VARCHAR NOT NULL,
    "dvd_id" VARCHAR,
    "title_en" VARCHAR,
    "title_ja" VARCHAR,
    "comment_en" VARCHAR,
    "comment_ja" VARCHAR,
    "runtime_mins" INTEGER,
    "release_date" DATE,
    "sample_url" VARCHAR,
    "maker_id" INTEGER,
    "label_id" INTEGER,
    "series_id" INTEGER,
    "jacket_full_url" VARCHAR,
    "jacket_thumb_url" VARCHAR,
    "gallery_full_first" VARCHAR,
    "gallery_full_last" VARCHAR,
    "gallery_thumb_first" VARCHAR,
    "gallery_thumb_last" VARCHAR,
    "site_id" INTEGER NOT NULL,
    "service_code" VARCHAR NOT NULL,

    CONSTRAINT "derived_video_pkey" PRIMARY KEY ("content_id","service_code")
);

-- CreateTable
CREATE TABLE "derived_video_actor" (
    "content_id" VARCHAR NOT NULL,
    "actor_id" INTEGER NOT NULL,
    "ordinality" INTEGER,
    "release_date" DATE,

    CONSTRAINT "derived_video_actor_pkey" PRIMARY KEY ("content_id","actor_id")
);

-- CreateTable
CREATE TABLE "derived_video_actress" (
    "content_id" VARCHAR NOT NULL,
    "actress_id" INTEGER NOT NULL,
    "ordinality" INTEGER,
    "release_date" DATE,

    CONSTRAINT "derived_video_actress_pkey" PRIMARY KEY ("content_id","actress_id")
);

-- CreateTable
CREATE TABLE "derived_video_author" (
    "content_id" VARCHAR NOT NULL,
    "author_id" INTEGER NOT NULL,

    CONSTRAINT "derived_video_author_pkey" PRIMARY KEY ("content_id","author_id")
);

-- CreateTable
CREATE TABLE "derived_video_category" (
    "content_id" VARCHAR NOT NULL,
    "category_id" INTEGER NOT NULL,
    "release_date" DATE,

    CONSTRAINT "derived_video_category_pkey" PRIMARY KEY ("content_id","category_id")
);

-- CreateTable
CREATE TABLE "derived_video_director" (
    "content_id" VARCHAR NOT NULL,
    "director_id" INTEGER NOT NULL,

    CONSTRAINT "derived_video_director_pkey" PRIMARY KEY ("content_id","director_id")
);

-- CreateTable
CREATE TABLE "machine_translation" (
    "id" SERIAL NOT NULL,
    "source_ja" VARCHAR NOT NULL,
    "target_en" VARCHAR NOT NULL,
    "timestamp" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "machine_translation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "source_dmm_histrion" (
    "id" INTEGER NOT NULL,
    "name_kanji" VARCHAR,
    "created" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "source_dmm_histrion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "source_dmm_trailer" (
    "content_id" VARCHAR NOT NULL,
    "url" VARCHAR,
    "timestamp" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "source_dmm_trailer_pkey" PRIMARY KEY ("content_id")
);

-- CreateTable
CREATE TABLE "source_dmm_video_histrion" (
    "histrion_id" INTEGER NOT NULL,
    "timestamp" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "content_id" VARCHAR NOT NULL,

    CONSTRAINT "source_dmm_video_histrion_pkey" PRIMARY KEY ("content_id","histrion_id")
);

-- CreateIndex
CREATE INDEX "derived_video_gallery_thumb_first_idx" ON "derived_video"("gallery_thumb_first");

-- CreateIndex
CREATE INDEX "derived_video_label_id_idx" ON "derived_video"("label_id");

-- CreateIndex
CREATE INDEX derived_video_lower_idx ON public.derived_video USING btree (lower(replace((dvd_id)::text, '-'::text, ''::text)));

-- CreateIndex
CREATE INDEX derived_video_lower_idx1 ON public.derived_video USING btree (lower((content_id)::text));

-- CreateIndex
CREATE INDEX derived_video_lower_idx3 ON public.derived_video USING btree (lower(replace(replace((content_id)::text, '0'::text, ''::text), '-'::text, ''::text)));

-- CreateIndex
CREATE INDEX "derived_video_maker_id_idx" ON "derived_video"("maker_id");

-- CreateIndex
CREATE INDEX "derived_video_sample_url_idx" ON "derived_video"("sample_url");

-- CreateIndex
CREATE INDEX "derived_video_series_id_idx" ON "derived_video"("series_id");

-- CreateIndex
CREATE INDEX "derived_video_actor_actor_id_idx" ON "derived_video_actor"("actor_id");

-- CreateIndex
CREATE INDEX "derived_video_actress_actress_id_idx" ON "derived_video_actress"("actress_id");

-- CreateIndex
CREATE INDEX "derived_video_author_author_id_idx" ON "derived_video_author"("author_id");

-- CreateIndex
CREATE INDEX "derived_video_category_category_id_idx" ON "derived_video_category"("category_id");

-- CreateIndex
CREATE INDEX "derived_video_director_director_id_idx" ON "derived_video_director"("director_id");

