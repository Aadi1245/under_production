// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:shopify_code/modelClass/product_filter_data.dart';
// import 'package:shopify_code/modelClass/product_lock_list_model.dart';
// import 'package:shopify_code/modelClass/product_tag_list_model.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:shopify_code/modelClass/partner_info_model.dart';

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

// bool firebaseEnabled = false;
// FirebaseAnalytics? analyticsMain;

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

