import 'dart:math';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:myfitnessapp/Dashboard/HomeScreen.dart';
import 'package:myfitnessapp/Dashboard/products.dart';
import 'package:myfitnessapp/Dashboard/shots.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_tuesday.dart';
import 'package:myfitnessapp/app_assets.dart';
import 'package:myfitnessapp/app_theme.dart';
import 'package:myfitnessapp/cart_btn.dart';
import 'package:myfitnessapp/cart_screen.dart';
import 'package:myfitnessapp/Dashboard/hidden_drawer.dart';
import 'package:myfitnessapp/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _EntryPointState();
}

class _EntryPointState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  bool isSideBarOpen = false;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int selectedIndex1 = -1, subSelectedIndex1 = -1, nestedSelectedIndex1 = -1;
  // Menu selectedBottomNav = bottomNavItems.first;
  // Menu selectedSideMenu = sidebarMenus.first;

  // void updateSelectedBtmNav(Menu menu) {
  //   if (selectedBottomNav != menu) {
  //     setState(() {
  //       selectedBottomNav = menu;
  //     });
  //   }
  // }

  late AnimationController _animationController;
  late Animation<double> scalAnimation;
  late Animation<double> animation;

  Color? bgColor = Colors.white;

  final List<Widget> bottomBarItems = [
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   children: [
    Icon(Icons.home),
    // Text("Home"),
    //   ],
    // ),
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   children: [
    Icon(Icons.grid_view_rounded),

    // Text("Workout"),
    //   ],
    // ),
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   children: [
    Icon(Icons.video_collection),
    // Text("Shots"),
    //   ],
    // ),
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   children: [
    Icon(Icons.sports_gymnastics_sharp),
    // Text("Products"),
    //   ],
    // ),
  ];

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
        () {
          setState(() {});
        },
      );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  int selectedIdx = 0;
  static List<Widget> _widgetOptions = <Widget>[
    // HomeScreen(),
    // // BlogScreenHandle("news"),
    // CategoryScreenFromMenu(false),
    // // CategoryScreenFromCollection(),
    // SearchScreen(),
    // MoreScreen()
  ];

  OpenCloseSideMenu() {
    if (_animationController.value == 0) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    setState(
      () {
        isSideBarOpen = !isSideBarOpen;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leading: SizedBox(
          width: 80,
          height: 42,
          child: InkResponse(
            child: Icon(
              PhosphorIcons.user_circle_fill,
              size: 30,
            ),
            onTap: () {
              print(">>> object");

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HiddenDrawer(),
              ));
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(ShopifyAppConfig.APP_NAME),

            Text(
              "Myfitness",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.black,
                    // fontFamily: FontFamily.fontNormal
                  ),
            )

            // Image(
            //   image: AssetImage(AppAssets.appLogo),
            //   fit: BoxFit.contain,
            //   height: 45,
            //   width: 130,
            // ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () async {
                // SharedPreferences sh = await SharedPreferences.getInstance();

                // sh.clear();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              icon: Icon(Icons.logout))
          // CartBtn(
          //   press: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (e) => CartScreen()),
          //     );
          //   },
          // ),
        ],
      ),
      // drawer: HiddenDrawer(),
      body: body(context),

      ///saloni Todo "to show buttom bar tabs here"
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        // buttonBackgroundColor: Colors.red,
        color: Colors.blue.shade200,
        backgroundColor:
            Colors.white, //bgColor != null ? bgColor! : Colors.blue,
        items: bottomBarItems,
        onTap: (index) {
          print("--------->${index}");
          if (index == 0) {
            selectedBottomBar = "home";
            // bgColor = Colors.blue;
          } else if (index == 1) {
            selectedBottomBar = "products";
            // bgColor = Colors.blue.shade200;
          } else if (index == 2) {
            selectedBottomBar = "shots";
            bgColor = Colors.yellowAccent;
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => HiddenDrawer(),
            // ));
          } else if (index == 3) {
            selectedBottomBar = "workout";
            // bgColor = Colors.blue;
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HiddenDrawer(),
            ));
          }
          setState(() {});
        },
      ),
    );
  }

  String selectedBottomBar = "home";

  Widget body(BuildContext context) {
    return Stack(
      children: [
        ///saloni Todo "to show side navigation here"
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(1 * animation.value - 30 * (animation.value) * pi / 180),
          child: Transform.translate(
            offset: Offset(animation.value * 265, 0),
            child: Transform.scale(
              scale: scalAnimation.value,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(0),
                  ),
                  child: selectedBottomBar == "home"
                      ? Homescreen().homeWidget(context)
                      // : selectedBottomBar == "workout"
                      //     ? Workout().workoutWidget(context)
                      : selectedBottomBar == "shots"
                          ? Shots().shotsWidget(context)
                          : selectedBottomBar == "products"
                              ? Products().productsWidget(context)
                              : Homescreen().homeWidget(context)),
            ),
          ),
        ),
      ],
    );
  }
}
