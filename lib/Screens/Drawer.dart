
import 'package:aisoneaccess/Screens/vi_AccountLedger.dart';
import 'package:aisoneaccess/Screens/vi_PendingCheques.dart';
import 'package:aisoneaccess/Screens/vi_PendingSaleOrder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../ClassModules/cmGlobalVariables.dart';
import '../Models/EModel/ModAccLedger.dart';
import '../Models/EModel/ModBranchSetting.dart';
import '../Models/EModel/ModPendingCheques.dart';
import '../Models/EModel/ModPendingSalOrder.dart';

import '../ServiceLayer/SlAisoneERP/SLEPendingCheques.dart';
import '../ServiceLayer/SlAisoneERP/SLEPendingSaleOrder.dart';
import '../ServiceLayer/SlAisoneERP/SlEAccountLedger.dart';
import '../Test.dart';
import '../UserWidgets/Labels/Ulabels.dart';







class vi_Drawer extends StatefulWidget {
  const vi_Drawer({Key? key}) : super(key: key);

  @override
  State<vi_Drawer> createState() => _vi_DrawerState();
}

class _vi_DrawerState extends State<vi_Drawer> {
  @override
  void initState() {
    super.initState();
    FncstartupSettings();
    Fnc_AccountLedger();
    Fnc_PendingCheques();
    Fnc_PendingSO();
  }

  ULabels lblDrawer = new ULabels();
  ULabels lblDrawerTile1 = new ULabels();
  ULabels lblDrawerTile2 = new ULabels();
  ULabels lblDrawerTile14 = new ULabels();
  ULabels lblDrawerTile15 = new ULabels();
  ULabels lblDrawerTile3 = new ULabels();
  ULabels lblDrawerTile4 = new ULabels();
  ULabels lblDrawerTile5 = new ULabels();
  ULabels lblDrawerTile6 = new ULabels();
  ULabels lblDrawerTile7 = new ULabels();
  ULabels lblDrawerTile8 = new ULabels();
  ULabels lblDrawerTile9 = new ULabels();
  ULabels lblDrawerTile10 = new ULabels();
  ULabels lblDrawerTile11 = new ULabels();
  ULabels lblDrawerTile12 = new ULabels();
  ULabels lblDrawerTile13 = new ULabels();

  int selectedIndex = 0;

  late RxList<ModAssignedBranches> l_Rx_listBranchSettting =
      Get.find(tag: "Rx_AssignedBranches");
  GlobalKey<ScaffoldState> scafKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
      SizedBox(
        height: 23,
        child: BottomAppBar(elevation: 4.0,
            color: Colors.black,
            child: Marquee(fadingEdgeEndFraction: .2,
              text: 'Powered by - aisonesystems.com',
              style: TextStyle( fontSize:18,color: Colors.white),
              scrollAxis: Axis.horizontal, //scroll direction
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20.0,
              velocity: 50.0, //speed
              //pauseAfterRound: Duration(seconds: 5),
              startPadding: 10.0,
              accelerationDuration: Duration(seconds: 5),
              accelerationCurve: Curves.linear,
              decelerationDuration: Duration(milliseconds: 1000),
              decelerationCurve: Curves.easeOut,
            )

        ),
      ),
      drawer: SizedBox(
        width: 270,
        child:  Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/users.png"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.person_sharp,
                                    size: 14, color: Colors.indigo),
                              ),
                              TextSpan(
                                text: cmGlobalVariables.Pb_UserName,
                                style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        letterSpacing: .5)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  MdiIcons.bank,
                                  size: 14,
                                  color: Colors.indigo,
                                ),
                              ),
                              TextSpan(
                                text: l_Rx_listBranchSettting[selectedIndex]
                                    .pr_BranchName,
                                style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        letterSpacing: .5)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.alternate_email,
                                    size: 14, color: Colors.indigo),
                              ),
                              TextSpan(
                                text: cmGlobalVariables.Pb_UserEmail,
                                style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        letterSpacing: .5)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.maps_home_work_outlined,
                                    size: 14, color: Colors.indigo),
                              ),
                              TextSpan(
                                text: l_Rx_listBranchSettting[selectedIndex]
                                    .pr_Address,
                                style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        letterSpacing: .5)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 1,
                  ),

                  ListTile(
                    selected: selectedIndex == 0,
                    leading: Icon(
                      Icons.desktop_mac_outlined,
                      size: 28,
                    ),
                    title: lblDrawerTile1,
                    onTap: () async {
                      changeIndex(0);

                      Get.snackbar("Please Wait", "Data Is Loading");
                      Fnc_AccountLedger();

                      Get.to(() => vi_AccountLedger());
                      //Get.to(() => test1());



                      //}
                    },
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  //tile2
                  ListTile(
                      selected: selectedIndex == 1,
                      leading: Icon(
                        Icons.library_books_outlined,
                        size: 28,
                      ),
                      title: lblDrawerTile2,
                      onTap: () async {
                        changeIndex(0);
                        Get.snackbar("Please Wait", "Data Is Loading");
                        Fnc_PendingCheques();
                        Get.to(() => vi_PendingCheques());

                      }),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  ListTile(
                      selected: selectedIndex == 1,
                      leading: Icon(
                        Icons.library_books_outlined,
                        size: 28,
                      ),
                      title: lblDrawerTile14,
                      onTap: () async {
                        changeIndex(0);
                        Get.snackbar("Please Wait", "Data Is Loading");
                        Fnc_PendingSO();
                        Get.to(() => vi_PendingSaleOrderr());

                      }),

                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  ListTile(
                      selected: selectedIndex == 1,
                      leading: Icon(
                        Icons.library_books_outlined,
                        size: 28,
                      ),
                      title: lblDrawerTile15,
                      onTap: () async {
                        changeIndex(0);
                        Get.snackbar("Please Wait", "Data Is Loading");
                        Fnc_PendingSO();
                        Get.to(() => vi_PendingSaleOrderr());

                      }),



                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  //tile2
                ],
              ),
            ],
          ),
        ),
      ),
      key: scafKey,
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
        child: SingleChildScrollView(
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
            child: Stack(children: <Widget>[
              Container(
                height: 500,
              ),
              Container(
                margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                height: 220,
                width: 480,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                  gradient: LinearGradient(colors: [
                    Colors.lightBlueAccent.shade200,
                    Colors.lightBlueAccent.shade200,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 55, left: 180),
                      child: lblDrawerTile10,
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 42, left: 12),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu_sharp,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      scafKey.currentState?.openDrawer();
                    },
                  )),
              Container(
                margin: EdgeInsets.only(top: 110, left: 112),
                child: Text(
                  "80",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 103, left: 73),
                child: SizedBox(
                  height: 40,
                  child: Image.asset("assets/inc.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 129, left: 80),
                child: Text(
                  "Balance",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 110, left: 212),
                child: Text(
                  "30",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 103, left: 173),
                child: SizedBox(
                  height: 35,
                  child: Image.asset("assets/dec.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 129, left: 180),
                child: Text(
                  "Payment",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 110, left: 312),
                child: Text(
                  "7",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 103, left: 273),
                child: SizedBox(
                  height: 40,
                  child: Image.asset("assets/inc.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 129, left: 290),
                child: Text(
                  "Over Due Amount",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 180, left: 20),
                width: 215,
                height: 75,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 5),
                          blurRadius: 4)
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Colors.white),
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 100),
                      child: lblDrawerTile8,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 45, left: 100),
                        child: Text(
                          "RS: 45415",
                          style: TextStyle(color: Colors.black38, fontSize: 23),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 7),
                      child: SizedBox(
                        height: 35,
                        child: Image.asset("assets/cashr.png"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 180, left: 250),
                width: 215,
                height: 75,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 5),
                          blurRadius: 4)
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Colors.white),
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 100),
                      child: lblDrawerTile13,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 45, left: 100),
                        child: Text(
                          "RS: 45415",
                          style: TextStyle(color: Colors.black38, fontSize: 23),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 7),
                      child: SizedBox(
                        height: 35,
                        child: Image.asset("assets/cashp.png"),
                      ),
                    ),
                  ],
                ),
              ),




              //Grid



              //Grid

            ]),
          ),
        ),
      ),
    );
  }

  //=================DART==================



  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  FncstartupSettings() {
    //Labels
    lblDrawer.TxtText = "D R A W E R";
    lblDrawer.TxtFontSize = 15;
    lblDrawer.color = Colors.black38;

    lblDrawerTile1.TxtText = "Ledger";
    lblDrawerTile1.TxtFontSize = 17;
    lblDrawerTile1.color = Colors.black38;

    lblDrawerTile2.TxtText = "Pending Cheques";
    lblDrawerTile2.TxtFontSize = 17;
    lblDrawerTile2.color = Colors.black38;

    lblDrawerTile14.TxtText = "Pending Sale Order";
    lblDrawerTile14.TxtFontSize = 17;
    lblDrawerTile14.color = Colors.black38;


    lblDrawerTile15.TxtText = "Sale Invoice List";
    lblDrawerTile15.TxtFontSize = 17;
    lblDrawerTile15.color = Colors.black38;

    lblDrawerTile3.TxtText = "Chart";
    lblDrawerTile3.TxtFontSize = 17;
    lblDrawerTile3.color = Colors.black38;

    lblDrawerTile4.TxtText = "   Pending Sale Order";
    lblDrawerTile4.TxtFontSize = 12;
    lblDrawerTile4.color = Colors.black;

    lblDrawerTile5.TxtText = "Pending Delivery Notes";
    lblDrawerTile5.TxtFontSize = 12;
    lblDrawerTile5.color = Colors.black38;

    lblDrawerTile6.TxtText = "BANK BALANCE";
    lblDrawerTile6.TxtFontSize = 18;
    lblDrawerTile6.color = Colors.black38;

    lblDrawerTile7.TxtText = "CASH BALANCE";
    lblDrawerTile7.TxtFontSize = 18;
    lblDrawerTile7.color = Colors.black38;

    lblDrawerTile8.TxtText = "TOTAL DEBIT";
    lblDrawerTile8.TxtFontSize = 15;
    lblDrawerTile8.color = Colors.black38;


    lblDrawerTile13.TxtText = "TOTAL CREDIT";
    lblDrawerTile13.TxtFontSize = 15;
    lblDrawerTile13.color = Colors.black38;

    lblDrawerTile9.TxtText = "PAYABLE";
    lblDrawerTile9.TxtFontSize = 18;
    lblDrawerTile9.color = Colors.black38;

    lblDrawerTile10.TxtText = " Dashboard";
    lblDrawerTile10.TxtFontSize = 20;
    lblDrawerTile10.color = Colors.black38;

    lblDrawerTile11.TxtText = " Pending Sale Orders";
    lblDrawerTile11.TxtFontSize = 20;
    lblDrawerTile11.color = Colors.black38;

    lblDrawerTile12.TxtText = " Pending Delivery Notes";
    lblDrawerTile12.TxtFontSize = 20;
    lblDrawerTile12.color = Colors.black38;
  }

  Future<bool> Fnc_AccountLedger() async {
    List<ModI_AccountLedger>? l_listI_AccountLedger =
    new List<ModI_AccountLedger>.empty(growable: true);

    //Assigned Branches Api Call
    l_listI_AccountLedger =
    await SlEAccountLedger().Fnc_AccountLedger();
    {
      if (l_listI_AccountLedger == null) {
        Get.snackbar(
            "Alert", "No DATA, Please Contact Your Administrator");
        return false;
      }
      RxList<ModI_AccountLedger>? Rx_ListAccountLegdger = <ModI_AccountLedger>[].obs;
      Rx_ListAccountLegdger.addAll(l_listI_AccountLedger);

      //print(Rx_ListAccountLegdger);
      //cmGlobalVariables.Pbl_AccountLedger?.addAll(l_listI_AccountLedger);

     // print (cmGlobalVariables.Pbl_AccountLedger);
      Get.put(Rx_ListAccountLegdger, tag: "Rx_ListAccountLegdger");
    }

    return true;
  }



  Future<bool> Fnc_PendingCheques() async {
    List<ModI_PendingCheques>? l_listIPendingCheques =
    new List<ModI_PendingCheques>.empty(growable: true);

    //Assigned Branches Api Call
    l_listIPendingCheques =
    await SlEPendingCheques().Fnc_PendingCheques();
    {
      if (l_listIPendingCheques == null) {
        Get.snackbar(
            "Alert", "No DATA, Please Contact Your Administrator");
        return false;
      }
      RxList<ModI_PendingCheques>? Rx_l_listIPendingCheques = <ModI_PendingCheques>[].obs;
      Rx_l_listIPendingCheques.addAll(l_listIPendingCheques);

      //print(Rx_ListAccountLegdger);
      //cmGlobalVariables.Pbl_AccountLedger?.addAll(l_listI_AccountLedger);

      // print (cmGlobalVariables.Pbl_AccountLedger);
      Get.put(Rx_l_listIPendingCheques, tag: "Rx_l_listIPendingCheques");
    }

    return true;
  }

  Future<bool> Fnc_PendingSO() async {
    List<ModI_PendingSaleOrder>? l_listIPendingSaleOrder =
    new List<ModI_PendingSaleOrder>.empty(growable: true);

    //Assigned Branches Api Call
    l_listIPendingSaleOrder =
    await SlEPendingSelOrder().Fnc_PendingSO();
    {
      if (l_listIPendingSaleOrder == null) {
        Get.snackbar(
            "Alert", "No DATA, Please Contact Your Administrator");
        return false;
      }
      RxList<ModI_PendingSaleOrder>? Rx_l_listIPendingSaleOrder = <ModI_PendingSaleOrder>[].obs;
      Rx_l_listIPendingSaleOrder.addAll(l_listIPendingSaleOrder);

      //print(Rx_ListAccountLegdger);
      //cmGlobalVariables.Pbl_AccountLedger?.addAll(l_listI_AccountLedger);

      // print (cmGlobalVariables.Pbl_AccountLedger);
      Get.put(Rx_l_listIPendingSaleOrder, tag: "Rx_l_listIPendingSaleOrder");
    }

    return true;
  }

  Future<bool> Fnc_SaleInvList() async {
    
    
    
    List<ModI_PendingSaleOrder>? l_listIPendingSaleOrder =
    new List<ModI_PendingSaleOrder>.empty(growable: true);

    //Assigned Branches Api Call
    l_listIPendingSaleOrder =
    await SlEPendingSelOrder().Fnc_PendingSO();
    {
      if (l_listIPendingSaleOrder == null) {
        Get.snackbar(
            "Alert", "No DATA, Please Contact Your Administrator");
        return false;
      }
      RxList<ModI_PendingSaleOrder>? Rx_l_listIPendingSaleOrder = <ModI_PendingSaleOrder>[].obs;
      Rx_l_listIPendingSaleOrder.addAll(l_listIPendingSaleOrder);

      //print(Rx_ListAccountLegdger);
      //cmGlobalVariables.Pbl_AccountLedger?.addAll(l_listI_AccountLedger);

      // print (cmGlobalVariables.Pbl_AccountLedger);
      Get.put(Rx_l_listIPendingSaleOrder, tag: "Rx_l_listIPendingSaleOrder");
    }

    return true;
  }




}

