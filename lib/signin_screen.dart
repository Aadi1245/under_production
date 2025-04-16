import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myfitnessapp/Auth/firebase_auth_service.dart';
import 'package:myfitnessapp/Dashboard/dashboard.dart';
import 'package:myfitnessapp/Models/user_data.dart';
import 'package:myfitnessapp/Utils/session.dart';
import 'package:myfitnessapp/Widgets/toast.dart';
import 'package:myfitnessapp/custom_text_form_field.dart';
import 'package:myfitnessapp/sign_up.dart';
import '../../../globels.dart' as globals;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isSigning = false;
  // final FirebaseAuthService _auth = FirebaseAuthService();
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),

              CustomTextFormField().SimpleTextFormField(
                  context: context,
                  hintText: "Email",
                  controller: _emailController),

              // FormContainerWidget(
              //   controller: _emailController,
              //   hintText: "Email",
              //   isPasswordField: false,
              // ),
              SizedBox(
                height: 10,
              ),

              CustomTextFormField().SimpleTextFormField(
                  context: context,
                  hintText: "password",
                  controller: _passwordController),

              // FormContainerWidget(
              //   controller: _passwordController,
              //   hintText: "Password",
              //   isPasswordField: true,
              // ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  // _signIn();
                  Session data = Session();
                  UserData? userD = await data.getUserData();
                  if (userD != null) {
                    globals.gender = userD.gender;
                    if (_emailController.text == userD.email &&
                        _passwordController.text == userD.pass) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DashboardScreen()));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Email & Password not matched'),
                      ),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child:
                        //  _isSigning
                        //     ? CircularProgressIndicator(
                        //         color: Colors.white,
                        //       )
                        //     :
                        Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // GestureDetector(
              //   onTap: () {
              //     // _signInWithGoogle();
              //   },
              //   child: Container(
              //     width: double.infinity,
              //     height: 45,
              //     decoration: BoxDecoration(
              //       color: Colors.red,
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: Center(
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Icon(
              //             FontAwesomeIcons.google,
              //             color: Colors.white,
              //           ),
              //           SizedBox(
              //             width: 5,
              //           ),
              //           Text(
              //             "Sign in with Google",
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),

              // SizedBox(
              //   height: 20,
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _signIn() async {
  //   setState(() {
  //     _isSigning = true;
  //   });

  //   String email = _emailController.text;
  //   String password = _passwordController.text;

  //   User? user = await _auth.signInWithEmailAndPassword(email, password);

  //   setState(() {
  //     _isSigning = false;
  //   });

  //   if (user != null) {
  //     showToast(message: "User is successfully signed in");
  //     Navigator.pushNamed(context, "/home");
  //   } else {
  //     showToast(message: "some error occured");
  //   }
  // }

//   _signInWithGoogle()async{

//     final GoogleSignIn _googleSignIn = GoogleSignIn();

//     try {

//       final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

//       if(googleSignInAccount != null ){
//         final GoogleSignInAuthentication googleSignInAuthentication = await
//         googleSignInAccount.authentication;

//         final AuthCredential credential = GoogleAuthProvider.credential(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken,
//         );

//         await _firebaseAuth.signInWithCredential(credential);
//         Navigator.pushNamed(context, "/home");
//       }

//     }catch(e) {
// showToast(message: "some error occured $e");
//     }

//   }
}












// import 'package:flutter/material.dart';
// import 'package:icons_plus/icons_plus.dart';
// import 'package:myfitnessapp/Utils/theme.dart';
// import 'package:myfitnessapp/Widgets/custom_scaffold.dart';
// import 'package:myfitnessapp/sign_up.dart';


// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   final _formSignInKey = GlobalKey<FormState>();
//   bool rememberPassword = true;
//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       child: Column(
//         children: [
//           const Expanded(
//             flex: 1,
//             child: SizedBox(
//               height: 10,
//             ),
//           ),
//           Expanded(
//             flex: 7,
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40.0),
//                   topRight: Radius.circular(40.0),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: _formSignInKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Welcome back',
//                         style: TextStyle(
//                           fontSize: 30.0,
//                           fontWeight: FontWeight.w900,
//                           color: lightColorScheme.primary,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 40.0,
//                       ),
//                       TextFormField(
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Email';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           label: const Text('Email'),
//                           hintText: 'Enter Email',
//                           hintStyle: const TextStyle(
//                             color: Colors.black26,
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12, // Default border color
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12, // Default border color
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       TextFormField(
//                         obscureText: true,
//                         obscuringCharacter: '*',
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Password';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           label: const Text('Password'),
//                           hintText: 'Enter Password',
//                           hintStyle: const TextStyle(
//                             color: Colors.black26,
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12, // Default border color
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12, // Default border color
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Checkbox(
//                                 value: rememberPassword,
//                                 onChanged: (bool? value) {
//                                   setState(() {
//                                     rememberPassword = value!;
//                                   });
//                                 },
//                                 activeColor: lightColorScheme.primary,
//                               ),
//                               const Text(
//                                 'Remember me',
//                                 style: TextStyle(
//                                   color: Colors.black45,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           GestureDetector(
//                             child: Text(
//                               'Forget password?',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: lightColorScheme.primary,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             if (_formSignInKey.currentState!.validate() &&
//                                 rememberPassword) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Processing Data'),
//                                 ),
//                               );
//                             } else if (!rememberPassword) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content: Text(
//                                         'Please agree to the processing of personal data')),
//                               );
//                             }
//                           },
//                           child: const Text('Sign up'),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: Divider(
//                               thickness: 0.7,
//                               color: Colors.grey.withOpacity(0.5),
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(
//                               vertical: 0,
//                               horizontal: 10,
//                             ),
//                             child: Text(
//                               'Sign up with',
//                               style: TextStyle(
//                                 color: Colors.black45,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Divider(
//                               thickness: 0.7,
//                               color: Colors.grey.withOpacity(0.5),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Logo(Logos.facebook_f),
//                           Logo(Logos.twitter),
//                           Logo(Logos.google),
//                           Logo(Logos.apple),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       // don't have an account
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             'Don\'t have an account? ',
//                             style: TextStyle(
//                               color: Colors.black45,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (e) => const SignUpScreen(),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               'Sign up',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: lightColorScheme.primary,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }