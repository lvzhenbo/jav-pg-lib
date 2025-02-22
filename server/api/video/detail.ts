import prisma from '~/lib/prisma';

export default defineEventHandler(async (event) => {
  try {
    const query = getQuery(event);
    const contentId = query.contentId as string;
    const serviceCode = query.serviceCode as string;
    if (!contentId) {
      throw createError({
        statusCode: 400,
        statusMessage: 'contentId is required',
      });
    }
    if (!serviceCode) {
      throw createError({
        statusCode: 400,
        statusMessage: 'serviceCode is required',
      });
    }
    const videoDetail = await prisma.derived_video.findUnique({
      where: {
        content_id_service_code: {
          content_id: contentId,
          service_code: serviceCode,
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
