import 'package:flutter/material.dart';
import 'package:myfitnessapp/Models/user_data.dart';
import 'package:myfitnessapp/Utils/session.dart';
import 'package:myfitnessapp/app_assets.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  UserData? userData;
  double bmi = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    print("===================>>>${userData}");
    Duration(seconds: 1);
  }

  getUser() async {
    Session user = Session();
    print("===================>>>${user}");

    userData = await user.getUserData();
    print("==================23=>>>${userData}");
    setState(() {
      bmi = (userData!.weight) /
          ((userData!.height * 0.3048) * (userData!.height * 0.3048));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //app bar theme for tablet
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('My Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.yellow,
                    backgroundImage: AssetImage(AppAssets.Atom),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          userData != null ? userData!.name : "Aaditya",
                          maxLines: 2,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          userData != null
                              ? userData!.email
                              : "aadityagupta778@gmail.com",
                          maxLines: 2,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(
                //   width: 10,
                // ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.45,
                  margin: EdgeInsets.only(left: 10, right: 5),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(2, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Height in foot",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          userData != null
                              ? userData!.height.toString()
                              : "5.3",
                          style: TextStyle(
                            fontSize: 15,
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 5, right: 10),
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(2, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Weight in kg",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(
                          userData != null ? userData!.weight.toString() : "60",
                          style: TextStyle(fontSize: 15))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.45,
                  margin: EdgeInsets.only(left: 10, right: 5),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(2, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Age ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(userData != null ? userData!.age.toString() : "555",
                          style: TextStyle(fontSize: 15))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.45,
                  margin: EdgeInsets.only(left: 5, right: 10),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(2, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("BMI status",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(
                          bmi < 18.5
                              ? "Underweight"
                              : 18.5 < bmi && bmi < 24.9
                                  ? "Healthy weight"
                                  : 25 < bmi && bmi < 29.9
                                      ? "Overweight"
                                      : bmi > 30
                                          ? "Obese"
                                          : "Not defined",
                          style: TextStyle(
                              color: bmi < 18.5
                                  ? Colors.yellow
                                  : 18.5 < bmi && bmi < 24.9
                                      ? Colors.green
                                      : 25 < bmi && bmi < 29.9
                                          ? Colors.red
                                          : bmi > 30
                                              ? Colors.red.shade700
                                              : Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      //bodyweight/(bodyheight)^2=BMI
                      Text(bmi.toStringAsFixed(2),
                          style: TextStyle(fontSize: 12))
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkResponse(
              onTap: () {
                showBMICalculator(context);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Calculate Latest BMI",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),

                    //bodyweight/(bodyheight)^2=BMI
                    Text(bmi.toStringAsFixed(2), style: TextStyle(fontSize: 15))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();

  showBMICalculator(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.8,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('BMI Calculation',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Icon(Icons.cancel_outlined),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                TextField(
                                  controller: height,
                                  decoration: InputDecoration(
                                    labelText: "Height in foot",
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  controller: weight,
                                  decoration: InputDecoration(
                                    labelText: "Weight in kg",
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      bmi = (double.parse(weight.text)) /
                                          ((double.parse(height.text) *
                                                  0.3048) *
                                              (double.parse(height.text) *
                                                  0.3048));
                                      setState(() {}); // update BMI display
                                      height.text = "";
                                      weight.text = "";
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Get BMI"),
                                  ),
                                ),
                                SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
