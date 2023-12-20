import 'package:assignment/models/popular_people_model.dart';
import 'package:assignment/network/end_points.dart';
import 'package:assignment/utils/app_styles_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final void Function()? onPress;

  PopularCardWidget(this.image, this.title, this.description, this.onPress,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.r), bottomRight: Radius.circular(8.r)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: Card(
          color: Colors.white,
          elevation: 6.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                child: CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: '${Endpoints.REQUEST_NETWORK_IMAGE}' + image,
                  placeholder: (context, url) =>
                      const Center(child:  CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              12.verticalSpace,
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        textScaler: const TextScaler.linear(0.97),
                        style: AppStylesUtil.textSemiBoldStyle(
                            16.sp, Colors.black, FontWeight.w600),
                      ),
                      Text(
                        description.toString(),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textScaler: const TextScaler.linear(0.97),
                        style: AppStylesUtil.textRegularStyle(
                            13.sp, Colors.black, FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
