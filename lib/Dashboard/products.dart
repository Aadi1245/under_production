import 'package:flutter/material.dart';
import 'package:myfitnessapp/Models/product_model.dart';
import 'package:myfitnessapp/Utils/app_const.dart';
import 'package:myfitnessapp/Utils/theme_size.dart';
import 'package:myfitnessapp/Widgets/webview_pages_screenbody.dart';
import 'package:myfitnessapp/app_assets.dart';
import 'package:myfitnessapp/product_gridview.dart';

class Products {
  @override
  Widget productsWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: buildProductsGridView(context, allProduct),
      ),
    );
  }

  List<Product> allProduct = [
    Product(
        title: "Muscle Blaze",
        image: AppAssets.muscleBlaze,
        price: 1000,
        url: AppConst.mB),
    Product(
        title: "NackPro",
        image: AppAssets.nackPro,
        price: 1000,
        url: AppConst.nackPro),
    Product(title: "ON", image: AppAssets.oN, price: 1000, url: AppConst.oN),
    Product(
        title: "The Whole Truth",
        image: AppAssets.truth,
        price: 1000,
        url: AppConst.truth),
    Product(
        title: "Atom", image: AppAssets.Atom, price: 1000, url: AppConst.atom),
    Product(
        title: "Creatine",
        image: AppAssets.creatine,
        price: 1000,
        url: AppConst.creatine),
    Product(
        title: "Gloves",
        image: AppAssets.gloves,
        price: 1000,
        url: AppConst.gloves),
    Product(
        title: "Abs Roller",
        image: AppAssets.roller,
        price: 1000,
        url: AppConst.roller),
    Product(title: "Bag", image: AppAssets.bag, price: 1000, url: AppConst.bag),
    Product(
        title: "Dumbbells",
        image: AppAssets.dumbbell,
        price: 1000,
        url: AppConst.dumbbell),
  ];

  Widget buildProductsGridView(BuildContext context, List<Product> products) {
    bool IsLoading = false;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: (1 / 1.45), //1.45),
        crossAxisSpacing: 10,
      ),
      padding: EdgeInsets.all(10.0),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            print("onclick on product");
            // context.push("${RouteGenerate.productDetailsScreen}",
            //     extra: products![index].id);
            // WebViewPagesScreen(
            //     titleMain: "",
            //     urlToLoad:
            //         "https://www.amazon.in/MuscleBlaze-Performance-Chocolate-Creatine-Monohydrate/dp/B0CJYCFXSK/?th=1",
            //     bodyTags: "");

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WebViewPagesScreen(
                    titleMain: "",
                    urlToLoad:
                        "https://www.amazon.in/MuscleBlaze-Performance-Chocolate-Creatine-Monohydrate/dp/B0CJYCFXSK/?th=1",
                    bodyTags: "")));

            // ThemeSize.urlLauncher(
            //     "https://www.amazon.in/MuscleBlaze-Performance-Chocolate-Creatine-Monohydrate/dp/B0CJYCFXSK"); //products[index].url!);

            // context.push("${RouteGenerate.productDetailsScreen}",
            //     extra: products![index].id);
          },
          child: ProductGridView(context, products[index]),
        );
      },
    );
  }
}
