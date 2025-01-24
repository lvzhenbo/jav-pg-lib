import prisma from '~/lib/prisma';

export default defineEventHandler(async (event) => {
  const query = getQuery(event);
  const page = parseInt(query.page as string) || 1;
  const pageSize = parseInt(query.pageSize as string) || 10;

  const total = await prisma.derived_video.count({
    where: {
      release_date: {
        not: null,
      },
    },
  });

  const videos = await prisma.derived_video.findMany({
    where: {
      release_date: {
        not: null,
      },
    },
    orderBy: {
      release_date: 'desc',
    },
    skip: (page - 1) * pageSize,
    take: pageSize,
  });

  return {
    page,
    pageSize,
    total,
    data: videos,
  };
});
