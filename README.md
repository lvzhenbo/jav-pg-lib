# JAV-PG-LIB

顾名思义，一个基于 PostgreSQL 的 JAV 元数据库。目前的开发目标是可用。

## 获取数据

数据来源于[R18.dev](https://r18.dev/)，目前该网站保留近 90 天版本数据，每周二更新一次，获取最新的数据[https://r18.dev/dumps/latest](https://r18.dev/dumps/latest)，历史版本[https://r18.dev/dumps](https://r18.dev/dumps)

```bash
# 导入数据
psql -d dbname -U username -f file.sql
```

## Setup

Make sure to install dependencies:

```bash
pnpm install
```

## Development Server

Start the development server on `http://localhost:3000`:

```bash
pnpm dev
```

## Production

Build the application for production:

```bash
pnpm build
```

Locally preview production build:

```bash
pnpm preview
```

Check out the [deployment documentation](https://nuxt.com/docs/getting-started/deployment) for more information.
