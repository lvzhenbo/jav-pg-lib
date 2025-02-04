import prisma from '~/lib/prisma';

export default defineEventHandler(async (event) => {
  const query = getQuery(event);
  const page = parseInt(query.page as string) || 1;
  const pageSize = parseInt(query.pageSize as string) || 30;

  const total = await prisma.derived_video.count({
    where: {
      release_date: {
        not: null,
      },
      site_id: 2,
    },
  });

  const videos = await prisma.derived_video.findMany({
    where: {
      release_date: {
        not: null,
      },
      site_id: 2,
    },
    orderBy: [{ release_date: 'desc' }, { dvd_id: 'asc' }],
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
