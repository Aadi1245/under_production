// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:shopify_code/modelClass/product_filter_data.dart';
// import 'package:shopify_code/modelClass/product_lock_list_model.dart';
// import 'package:shopify_code/modelClass/product_tag_list_model.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:shopify_code/modelClass/partner_info_model.dart';

import 'package:myfitnessapp/Utils/app_const.dart';
import 'package:myfitnessapp/app_assets.dart';

import 'Models/product_model.dart';

String FilterHandle = "";
// Database? database;
// ProductFilterData productFilterOptionValue = ProductFilterData("", [], [], "");

Map<String, dynamic> productStarRating = {};

Map<String, dynamic> Settings = {};
Map<String, dynamic> plugins = {};
// PartnerInfoModel partnerInfoModel = PartnerInfoModel();
// ProductTagListModel productTagList = ProductTagListModel();
// ProductLockListModel productLockList = ProductLockListModel();

bool routeFound = false;
String routeName = "";
String currentCountryCode = "";
bool isLogin = false;
String? placeholderImagePath;
String? gender = "male";
// bool firebaseEnabled = false;
// FirebaseAnalytics? analyticsMain;

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

String publishedTheme = "first";

// FirebaseAnalytics? analytics(String event) {
//   if (partnerInfoModel.isFirebaseSetup == true) {
//     if (analyticsMain == null) {
//       analyticsMain = FirebaseAnalytics.instance;
//       FirebaseAnalyticsObserver observer =
//           FirebaseAnalyticsObserver(analytics: analyticsMain!);
//     }
//     analyticsMain!.logEvent(name: event);
//     return analyticsMain;
//   }
//   return null;
// }
