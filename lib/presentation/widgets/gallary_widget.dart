import 'package:assignment/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GallaryWidget extends StatelessWidget {
  final String image;
  final void Function()? onPress;

  GallaryWidget(this.image, this.onPress, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.r), bottomRight: Radius.circular(8.r)),
      child: Card(
        color: Colors.white,
        elevation: 6.0,
        child: InkWell(
          onTap: onPress,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: '${Endpoints.REQUEST_GALLARY_IMAGE}' + image,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
