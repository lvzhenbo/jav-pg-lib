import prisma from '~~/lib/prisma';

export default defineEventHandler(async (event) => {
  try {
    const query = getQuery(event);
    const contentId = query.contentId as string;
    if (!contentId) {
      throw createError({
        statusCode: 400,
        statusMessage: 'contentId is required',
      });
    }
    const videoDetail = await prisma.derived_video.findUnique({
      where: {
        content_id: contentId,
      },
      include: {
        maker: true,
        label: true,
        series: true,
        actors: true,
        actresses: {
          include: {
            actress: true,
          },
        },
      },
    });

    if (!videoDetail) {
      throw createError({
        statusCode: 404,
        statusMessage: 'video not found',
      });
    }
    return videoDetail;
  } catch (error) {
    throw createError({
      statusCode: 500,
      statusMessage: JSON.stringify(error),
    });
  }
});
