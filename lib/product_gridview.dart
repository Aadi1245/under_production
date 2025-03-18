import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myfitnessapp/app_assets.dart';

import 'Models/product_model.dart';
import 'app_theme.dart';

// class ProductGridview extends StatefulWidget {
//   const ProductGridview({super.key});

//   @override
//   State<ProductGridview> createState() => _ProductGridviewState();
// }

// class _ProductGridviewState extends State<ProductGridview> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class ProductGridView extends StatefulWidget {
  Product product;
  BuildContext context;

  // Function(String) OnClick;

  ProductGridView(
    this.context,
    this.product, // this.OnClick
  );

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        // decoration: BoxDecoration(
        //     // borderRadius: BorderRadius.circular(8.0),
        //     border: Border.all(width: 0.5, color: AppTheme.lightBorder)
        //     ),
        margin: EdgeInsets.all(2),
        // padding: EdgeInsets.all(0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 0.1, color: AppTheme.borderColor!)),
            // margin: EdgeInsets.all(2),
            height: MediaQuery.of(context).size.width * 0.45,
            width: MediaQuery.of(context).size.width * 0.45,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                    widget.product.image != null
                        ? widget.product.image!
                        : AppAssets.placeholder,
                    fit: BoxFit.cover)
                // CachedNetworkImage(
                //     imageUrl:
                //         (widget.product != null && widget.product.image != null)
                //             ? ("${widget.product.image}&width=300&height=300")
                //             : AppAssets.placeholder,
                //     placeholder: (context, url) =>
                //         Image.asset(AppAssets.placeholder, fit: BoxFit.cover),
                //     errorWidget: (context, url, error) =>
                //         Image.asset(AppAssets.placeholder, fit: BoxFit.cover),
                //     fit: BoxFit.cover),
                ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
            alignment: Alignment.centerLeft,
            child: Text(widget.product.title.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppTheme.black,
                    )),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            alignment: Alignment.centerLeft,
            child: Text("₹ ${widget.product.price}",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         // Container(
          //         //   padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          //         //   alignment: Alignment.centerLeft,
          //         //   child: Text(AppLocalizations.of(context)!.from,
          //         //       style: Theme.of(context).textTheme.bodySmall!.copyWith(
          //         //           color: AppTheme.black.withAlpha(120),
          //         //           fontSize: 10,
          //         //           )),
          //         // ),
          //         // Container(
          //         //   padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          //         //   alignment: Alignment.centerLeft,
          //         //   child: Text("${widget.product.formattedPrice}",
          //         //       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //         //           color: AppTheme.priceTagColor,
          //         //           fontWeight: FontWeight.bold,
          //         //           )),
          //         // ),
          //       ],
          //     ),
          //   ],
          // )
        ]),
      ),
      // Positioned(
      //     top: 6,
      //     right: 6,
      //     child: FavoriteView(widget.product.id!, 20, (productId) {
      //       widget.OnClick(widget.product.id!);
      //     })),
    ]);
  }
}
