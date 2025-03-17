import 'package:flutter/material.dart';
import 'package:myfitnessapp/Models/product_model.dart';
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

  List<Product> allProduct = Product.getSampleProducts();

  Widget buildProductsGridView(BuildContext context, List<Product> products) {
    bool IsLoading = false;

    return Expanded(
      child: GridView.builder(
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
              // context.push("${RouteGenerate.productDetailsScreen}",
              //     extra: products![index].id);
            },
            child: ProductGridView(context, products[index]),
          );
        },
      ),
    );
  }
}
