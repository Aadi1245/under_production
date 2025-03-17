import 'package:flutter/material.dart';
import 'package:myfitnessapp/app_theme.dart';

class CartBtn extends StatelessWidget {
  const CartBtn({super.key, required this.press});

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
          onTap: press,
          child: FittedBox(
            child: Stack(
              alignment: Alignment(1.5, -1.5),
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(1, 1),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  // This is your Badge
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  constraints: BoxConstraints(minHeight: 20, minWidth: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    // This controls the shadow
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 5,
                          color: Colors.black.withAlpha(50))
                    ],
                    // borderRadius: BorderRadius.circular(10),
                    color: AppTheme
                        .bottomNavBackgroundColor, // This would be color of the Badge
                  ),
                  // This is your Badge
                  child: Center(
                    // Here you can put whatever content you want inside your Badge
                    child: Text("0"),
                    //  BlocBuilder<CartScreenBloc, CartScreenState>(
                    //   builder: (context, state) {
                    //     return Text(
                    //         context.read<CartScreenBloc>().cart == null
                    //             ? "0"
                    //             : context
                    //                 .read<CartScreenBloc>()
                    //                 .cart!
                    //                 .cartItems!
                    //                 .cartItemList!
                    //                 .length
                    //                 .toString(),
                    //         style: TextStyle(
                    //           fontSize: 10,
                    //           color: Colors.white,
                    //           fontFamily: FontFamily.fontNormal,
                    //         ));
                    //   },
                    // ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
