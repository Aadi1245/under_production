import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../globels.dart' as globals;
import 'package:flutter_svg/flutter_svg.dart';

import '../app_assets.dart';
import '../dashboard_font_size.dart';

class ImageView extends StatelessWidget {
  BoxFit? fit;
  double height, width;
  bool isProfileImage;
  ImageView(this.imageUrl,
      {this.fit = null,
      this.width = 0,
      this.height = 0,
      this.isProfileImage = false});
  String imageUrl;
  @override
  Widget build(BuildContext context) {
    // if (width != 0 || height != 0) {
    //   imageUrl = imageUrl + "&width=${width.toInt()}&height=${height.toInt()}";
    // }
    // BoxFit imageFit = BoxFit.cover;
    // if (fit == null &&
    //     globals.Settings.containsKey(SettingsEnum.App_Image_Fit_Type.name) &&
    //     globals.Settings[SettingsEnum.App_Image_Fit_Type.name]
    //             .defaultBoxFitvalue !=
    //         null &&
    //     globals.Settings[SettingsEnum.App_Image_Fit_Type.name]
    //             .defaultBoxFitvalue !=
    //         "") {
    //   switch (globals.Settings[SettingsEnum.App_Image_Fit_Type.name]
    //       .defaultBoxFitvalue.boxfitValue) {
    //     case 'cover':
    //       fit = BoxFit.cover;
    //     case 'contain':
    //       fit = BoxFit.contain;
    //     case 'fitWidth':
    //       fit = BoxFit.fitWidth;
    //     case 'fitHeight':
    //       fit = BoxFit.fitHeight;
    //     case 'none':
    //       fit = BoxFit.none;
    //     case 'scaleDown':
    //       fit = BoxFit.scaleDown;
    //     case 'fill':
    //       fit = BoxFit.fill;
    //     default:
    //       fit = BoxFit.contain; // default value
    //   }
    // }
    if (fit == null) {
      fit = BoxFit.cover;
    }
    // print("Checkimage url is issue here ...${imageUrl}");
    return ClipRRect(
      borderRadius: BorderRadius.circular(DashboardFontSize.customBorderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
        child: Container(
            child: imageUrl.isEmpty
                ? Image.asset(
                    AppAssets.placeholder,
                    width: double.infinity,
                    fit: fit,
                  )
                // : imageUrl.contains(".svg")
                //     ? SvgPicture.network(
                //         imageUrl,
                //         fit: fit ?? BoxFit.cover,
                //         width: double.infinity,
                //         placeholderBuilder: (context) => isProfileImage
                //             ? Image.asset(AppAssets.placeholder, fit: fit)
                //             : globals.placeholderImagePath != null
                //                 ? Image.file(
                //                     File(globals.placeholderImagePath!),
                //                     fit: BoxFit.cover,
                //                   )
                //                 : Image.asset(
                //                     AppAssets.placeholder,
                //                     fit: BoxFit.cover,
                //                   ),
                //       )
                : Image.asset(imageUrl, fit: BoxFit.cover)
            // CachedNetworkImage(
            //     fit: fit,
            //     width: double.infinity,
            //     imageUrl: imageUrl,
            //     placeholder: (context, url) => isProfileImage
            //         ? Image.asset(AppAssets.placeholder, fit: fit)
            //         : globals.placeholderImagePath != null
            //             ? Image.file(
            //                 File(globals.placeholderImagePath!),
            //                 fit: BoxFit.cover)
            //             : Image.asset(
            //                 AppAssets.placeholder,
            //                 fit: BoxFit.cover,
            //               ),
            //     errorWidget: (context, url, error) => Image.asset(
            //           AppAssets.placeholder,
            //           fit: fit,
            //         ))
            ),
      ),
    );
  }
}
