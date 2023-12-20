import 'package:assignment/network/end_points.dart';
import 'package:assignment/presentation/screens/person_details_cubit/person_details_cubit.dart';
import 'package:assignment/utils/app_debug_prints.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageScreen extends StatelessWidget {
  final String? imagePath;
  final int? width;
  final int? height;

  const ImageScreen({super.key, this.imagePath, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    printDone(' width $width');
    printDone(' height $height');
    var cubit = PersonDetailsCubit.get(context);
    return BlocProvider<PersonDetailsCubit>(
      create: (BuildContext context) => PersonDetailsCubit(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  cubit.saveNetworkImage(
                      '${Endpoints.REQUEST_GALLARY_IMAGE}' + imagePath!,
                      context);
                },
                icon: Icon(
                  Icons.save,
                  color: Colors.black,
                  size: 25.sp,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.h),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r)),
              child: Card(
                color: Colors.white,
                elevation: 6.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  child: CachedNetworkImage(
                    width: double.parse(width.toString()),
                    height: double.parse(height.toString()),
                    fit: BoxFit.fill,
                    imageUrl: '${Endpoints.REQUEST_GALLARY_IMAGE}' + imagePath!,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
