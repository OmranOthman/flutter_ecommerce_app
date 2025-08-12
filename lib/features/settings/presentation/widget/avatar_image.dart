import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/constants/app_assets.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/util/copress_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shimmer/shimmer.dart';

class AvatarImage extends StatefulWidget {
  final void Function(File)? pickNewImage;
  final File? fileImage;
  final String? networkImage;
  final bool editButton;
  final double size;

  const AvatarImage({
    this.networkImage,
    this.fileImage,
    super.key,
    this.pickNewImage,
    this.editButton = true,
    this.size = 50,
  });

  @override
  State<AvatarImage> createState() => _AvatarImageState();
}

class _AvatarImageState extends State<AvatarImage> {
  String? networkImage;
  String? fileImagePath;
  @override
  void initState() {
    super.initState();
    if (widget.networkImage != null) {
      networkImage = widget.networkImage;
    }
    if (widget.fileImage != null) {
      fileImagePath = widget.fileImage!.path;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        _imageTypeWidget(),
        if (widget.editButton)
          GestureDetector(
              onTap: () async {
                showImageDialog(context);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 3.h, right: 5.w),
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.w),
                        bottomRight: Radius.circular(2.w),
                        topRight: Radius.circular(2.w))),
                child: Icon(
                  Icons.edit,
                ),
              ))
      ],
    );
  }

  Future showImageDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "choose_the_image".tr,
                textAlign: TextAlign.center,
              ),
              content: SizedBox(
                height: 60.h,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              onPressed: () async {
                                File? fileImage =
                                    await _pickimage(ImageSource.gallery);

                                widget.pickNewImage!(fileImage!);
                                setState(() {
                                  networkImage = null;
                                  fileImagePath = fileImage.path;
                                });

                                if (context.mounted) {
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.photo,
                                    size: 25.w,
                                    color: AppColors.primary,
                                  ),
                                  Text(
                                    "gallery".tr,
                                    style: TextStyle(
                                        color: AppColors.primary, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () async {
                                File? fileImage =
                                    await _pickimage(ImageSource.camera);
                                if (fileImage != null) {
                                  widget.pickNewImage!(fileImage);
                                  setState(() {
                                    networkImage = null;
                                    fileImagePath = fileImage.path;
                                  });
                                }
                                if (context.mounted) {
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera,
                                    size: 25.w,
                                    color: AppColors.primary,
                                  ),
                                  Text(
                                    "camera".tr,
                                    style: TextStyle(
                                        color: AppColors.primary, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Future<File?> _pickimage(ImageSource source) async {
    ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(source: source);
    return await compressImageToMaxSize(File(file!.path));
  }

  Widget _imageTypeWidget() {
    if (networkImage != null) {
      return CachedNetworkImage(
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: AppColors.greyColor.withValues(alpha: 0.5),
          highlightColor: AppColors.greyLightColor,
          child: CircleAvatar(
            radius: widget.size.r,
          ),
        ),
        imageBuilder: (context, imageProvider) => CircleAvatar(
          backgroundImage: imageProvider,
          radius: widget.size.r,
        ),
        fadeInDuration: const Duration(milliseconds: 4),
        fadeOutDuration: const Duration(milliseconds: 4),
        imageUrl: networkImage!,
        errorWidget: (context, url, error) => CircleAvatar(
          backgroundImage: AssetImage(AppAssets.images.user),
          radius: widget.size.r,
        ),
        fit: BoxFit.cover,
      );
    }
    if (fileImagePath != null) {
      return CircleAvatar(
        backgroundImage: FileImage(File(fileImagePath!)),
        radius: widget.size.r,
      );
    } else {
      return CircleAvatar(
        backgroundImage: AssetImage(AppAssets.images.user),
        radius: widget.size.r,
      );
    }
  }
}
