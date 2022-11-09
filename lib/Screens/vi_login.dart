import 'dart:async';

import 'package:aisoneaccess/Screens/vi_CompanyLIst.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../ClassModules/cmGlobalVariables.dart';
import '../Models/EModel/ModUserProfile.dart';
import '../Models/EModel/ModCompanySettingQuery.dart';

import '../ServiceLayer/SlAisoneERP/SlWLogin.dart';
import '../ServiceLayer/SlAisoneERP/SlWUserProfile.dart';
import '../UserWidgets/Buttons/UWBUtton.dart';
import '../UserWidgets/Labels/Ulabels.dart';
import '../UserWidgets/TextFields/UWTxtString.dart';

class vi_login extends StatefulWidget {
  const vi_login({key}) : super(key: key);

  @override
  State<vi_login> createState() => _vi_loginState();
}

class _vi_loginState extends State<vi_login> {
  @override
  bool G_LoadingButtonReset = true;
  bool G_isSecurePassword = true;
  var subscription;
  String Status = "Offline";

  //DB
  late Box box1;
  bool isChecked = false;

  //Widgets
  UWTxtString txtEmail = new UWTxtString();
  TextEditingController txtPass = new TextEditingController();

  ULabels lblLogin = new ULabels();
  ULabels lblcredentials = new ULabels();
  ULabels lblAppmode = new ULabels();

  UWButton l_UWButton = new UWButton(
    text: '',
  );

  final RoundedLoadingButtonController Loading_Button =
      RoundedLoadingButtonController();

  void initState() {
    super.initState();

    //FncCheckWifiMobileNetwork();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult l_result) {
      if (l_result == ConnectivityResult.none) {
        setState(() {
          Status = "Offline";
          Get.snackbar("Network", "Device is Offline Check Your Internet");

          print(Status);
        });
      } else {
        Status = "Online";
        Get.snackbar("Network", "Device is Online");
        print(Status);
      }
    });
    createBox();
    G_LoadingButtonReset = true;
    FncstartupSettings();
    Loading_Button.reset();
    Loading_Button.stateStream.listen((value) {
      print(value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Widget togglepassword() {
      return IconButton(
        onPressed: () {
          setState(() {
            G_isSecurePassword = !G_isSecurePassword;
          });
        },
        icon: G_isSecurePassword
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off),
        color: Colors.indigo,
      );
    }

    //=============================================
    DateTime timeBackPressed = DateTime.now();

    return WillPopScope(
      onWillPop: () async {
        //current time and last time we press the back back button
        final difference = DateTime.now().difference(timeBackPressed);
        //in case 2 back button presses is greater then 2 ,then we only show warning
        bool isExitWarning = difference >= Duration(seconds: 3);

        //current state intime
        timeBackPressed = DateTime.now();

        //Stay in application
        if (isExitWarning) {
          final alert = "Press back again to exist";
          Fluttertoast.showToast(
              gravity: ToastGravity.SNACKBAR,
              backgroundColor: Colors.lightBlue,
              toastLength: Toast.LENGTH_SHORT,
              timeInSecForIosWeb: 1,
              msg: alert,
              fontSize: 14);

          return false;
        }
        //Exit from  application
        else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFFD1FFFF),
                  Color(0xFF88ECF8),
                  Color(0xFF65DCDC),
                ],
                stops: [0.1, 0.5, 0.7, 0.9],
              ),
            ),
            //color: Colors.black,
            padding: const EdgeInsets.all(16.0),
            // we use child container property and used most important property column that accepts multiple widgets

            child: ResponsiveWrapper(
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: const [
                ResponsiveBreakpoint.resize(480, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ResponsiveBreakpoint.autoScale(2460, name: '4K'),
              ],
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 150,
                  ),
                  Container(
                    height: 250,
                    child: Image.asset("assets/aisonr.png"),
                  ),
                  const SizedBox(
                    height: 29.0,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: lblLogin),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: lblcredentials),
                  const SizedBox(
                    height: 55,
                  ),
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 370,
                          child: Visibility(child: txtEmail),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const Divider(
                          endIndent: 79,
                          indent: 79,
                          thickness: 1.5,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          width: 370,
                          child: TextFormField(
                            obscureText: G_isSecurePassword,
                            controller: txtPass,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              hintStyle: const TextStyle(color: Colors.black26),
                              labelText: ' Password',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.white38)),
                              prefixIcon: const Icon(MdiIcons.fingerprint,
                                  size: 20, color: Colors.indigo),
                              suffixIcon: togglepassword(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Remember me"),
                      Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            isChecked = !isChecked;
                            setState(() {});
                          })
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Divider(
                    endIndent: 79,
                    indent: 79,
                    thickness: 1.5,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    width: 200,
                    child: RoundedLoadingButton(
                        elevation: 5.0,
                        borderRadius: 5,
                        resetAfterDuration: G_LoadingButtonReset,
                        resetDuration: Duration(seconds: 3),
                        child: Text('Login',
                            style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    letterSpacing: .5))),
                        controller: Loading_Button,
                        onPressed: () {
                          FncOnTap();
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    //=============================================
  }

  //#region Startup
  FncstartupSettings() {
    //TextFields
    txtEmail.TxtHintText = "Enter Email";
    txtEmail.labelText = "Email";

    //Labels
    lblLogin.TxtText = "Login";
    lblLogin.TxtFontSize = 30;
    lblLogin.color = Colors.black38;

    lblcredentials.TxtText = "Please Enter Your Credentials";
    lblcredentials.TxtFontSize = 12;
    lblcredentials.color = Colors.black38;

    lblAppmode.TxtText = "Application Mode";
    lblAppmode.TxtFontSize = 30;
    lblAppmode.color = Colors.black38;
  }

//#endregion

  //#region Events

  FncOnTap() async {
//==================Validations

    if (await FncCheckWifiMobileNetwork() == true) {
      if (await FncCheckInternetAvailible() == true ) {
        print("InternetDOne");
        login_DB();
        void _doSomething(RoundedLoadingButtonController controller) async {
          Timer(Duration(seconds: 3), () async {
            controller.reset();
            if (Fnc_ValidateLogin() == false) {
              G_LoadingButtonReset = false;
            } else {
              G_LoadingButtonReset = false;

              if (await Fnc_WValidateUser() == true) {
                if (await Fnc_OnlineProcedures() == true) {
                  Get.to(() => const vi_CompanyLIst());
                  //Get.to(() => const Test());
                }
              } else {
                Get.snackbar("ALERT", "Login Failed ");
              }
            }
          });
        }

        if (Fnc_ValidateLogin() == false) {
          return;
        }

        if (await Fnc_WValidateUser() == true) {
          if (await Fnc_OnlineProcedures() == true) {
            Get.to(() => const vi_CompanyLIst());
            //Get.to(() => const Test());
          }
        }
      }



    }


  }

//#endregion

//#region Validations
  bool Fnc_ValidateLogin() {
    if (txtEmail.txtController.text.isEmpty == true) {
      Get.snackbar("ALERT", "Email is required ");
      return false;
    }

    if (txtPass.text.isEmpty == true) {
      Get.snackbar("ALERT", "Password is required ");
      return false;
    }

    return true;
  }

  Future<bool> Fnc_WValidateUser() async {
    ModUserProfile? l_ModUserProfile = await new SlwUserLogin().Fnc_UserProfile(
        txtEmail.txtController.text.toString(), txtPass.text.toString());
    if (l_ModUserProfile == null) {
      Get.snackbar("Alert", "Invalid Login Information");
      return false;
    }
    cmGlobalVariables.Pb_UserDID = l_ModUserProfile.Pr_PKGUID;
    cmGlobalVariables.Pb_UserName = l_ModUserProfile.Pr_FullName;
    cmGlobalVariables.Pb_UserEmail = l_ModUserProfile.Pr_EmailID;
    cmGlobalVariables.Pb_UserNumber = l_ModUserProfile.Pr_ContactNo;

    Get.snackbar("Alert", "Login Successful");

    return true;
  }

//#endregion

  Future<bool> Fnc_OnlineProcedures() async {
    List<ModCompanySettingQuery>? l_list_CompanyList =
        new List<ModCompanySettingQuery>.empty(growable: true);

    l_list_CompanyList = await new SlwLogin().WLogin_Api_Call(
        txtEmail.txtController.text.toString(), txtPass.text.toString());

    if (l_list_CompanyList == null) {
      Get.snackbar("Alert", "Invalid Login Information");
      return false;
    }
    RxList<ModCompanySettingQuery>? l_Rxlist_CompanyList =
        <ModCompanySettingQuery>[].obs;
    l_Rxlist_CompanyList.addAll(l_list_CompanyList);
    //Put that list to an container
    cmGlobalVariables.PbCompanySettingQuery.addAll(l_list_CompanyList);

    Get.put(l_Rxlist_CompanyList, tag: "l_ListCompanyList");

    return true;
  }

  void createBox() async {
    box1 = await Hive.openBox("name");
    GetData();
  }

  void GetData() {
    if (box1.get('txtEmail') != null) {
      txtEmail.txtController.text = box1.get('txtEmail');
      isChecked = true;
    }
    ;

    if (box1.get('txtPass') != null) {
      txtPass.text = box1.get('txtPass');
      isChecked = true;
    }
    ;
  }

  void login_DB() {
    if (isChecked) {
      box1.put('txtEmail', txtEmail.txtController.text);
      box1.put('txtPass', txtPass.text);
    }
  }

  Future<bool?>FncCheckInternetAvailible() async {
    bool result = await InternetConnectionChecker().hasConnection;



    if(result == false){

      print("Your Network has No Internet");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          action: SnackBarAction(
            label: "",
            onPressed: () {},
          ),
          content: const Text('Your Network has No Internet',style: TextStyle(color: Colors.black87),),
          duration: const Duration(milliseconds: 2550),
          width: 280.0,
          // Width of the SnackBar.
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0, // Inner padding for SnackBar content.
          ),

          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );



      return result;

    }
    return result;


  }

  Future<bool> FncCheckWifiMobileNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      print("I am connected to a mobile network");

      Get.snackbar("Network Alert", "Device is Connected With Mobile Network");

      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      Get.snackbar("Network Alert", "Device is Connected With WiFi ");
      print("I am connected to a Wifi network");

      return true;
    } else {
      Get.snackbar("Network Error", "Connect WiFi Or Mobile Data ");
      print("No Internet");
      return false;
    }

    return true;

  }
}
