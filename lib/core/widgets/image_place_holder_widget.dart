import 'package:flutter/material.dart';

class ImagePlaceHolderWidget extends StatelessWidget {
  final String imagePath;
  final String? msg;
  final Color? textColor;
  const ImagePlaceHolderWidget(
      {super.key, required this.imagePath, this.msg, this.textColor});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Durations.medium2,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: child,
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 15,
          children: [
            SizedBox.square(
                dimension: 250,
                child: Image.asset(
                  imagePath,
                )),

            msg != null
                ? Text(
                    msg ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: textColor),
                    textAlign: TextAlign.center,
                  )
                : SizedBox(),
           
          ],
        ),
      ),
    );
  }
}
