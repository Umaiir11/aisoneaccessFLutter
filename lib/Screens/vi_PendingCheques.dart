import 'package:aisoneaccess/Screens/vi_LedgerPDF.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shimmer/shimmer.dart';

import '../ClassModules/cmGlobalVariables.dart';
import '../Models/EModel/ModPendingCheques.dart';
import '../ServiceLayer/SlAisoneERP/SleRptPdf.dart';
import '../UserWidgets/Labels/UWLabels.dart';
import '../UserWidgets/Labels/Ulabels.dart';


import 'dart:convert';
import 'dart:typed_data';



class vi_PendingCheques extends StatefulWidget {
  const vi_PendingCheques({Key? key}) : super(key: key);

  @override
  State<vi_PendingCheques> createState() => _vi_PendingChequesState();
}

class _vi_PendingChequesState extends State<vi_PendingCheques> {
  @override

  late RxList<ModI_PendingCheques> l_AccountLedger =
  Get.find(tag: "Rx_l_listIPendingCheques");

  ULabels lblCompanyList = new ULabels();
  ULabels lblCompanyName = new ULabels();

  final G_currencyFormat = new NumberFormat("#,00.#####", "en_US");
  final DateFormat G_DateTimeFormat = DateFormat('dd-MMM-yy');

  @override
  void initState() {
    super.initState();
    FncstartupSettings();
    FncReport();

  }

  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 500,
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 115, left: 398),
                    child: TextButton(onPressed: (){
                      Get.to(() => Controll());
                      print("zaxsd");
                    },
                      child: SizedBox(
                        height: 38,
                        child: Image.asset("assets/pdf.png"),
                      ),),

                  ),

                  Container(

                    margin: EdgeInsets.only(top: 65, left: 127),
                    child: Shimmer.fromColors(
                        baseColor: Colors.black26,
                        highlightColor: Colors.cyanAccent,
                        child: lblCompanyList),
                  ),
                  //Cards and Decorated Containers
                  Container(
                    margin: EdgeInsets.only(top: 140, left: 0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: l_AccountLedger.length,
                      itemBuilder: (context, index) {
                        //get selected index on tap,
                        //after that got Company Did that index
                        return Column(
                          children: [
                            InkWell(
                              onTap: () async {




                              },

                              //CARD
                              child: SizedBox(
                                width: 440,
                                height: 140,
                                child: Card(


                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0)),
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
                                    child: SingleChildScrollView(
                                      child: Stack(
                                        children: [

                                          Container(
                                              height:150,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [

                                                        (index % 2 == 0)
                                                            ? Colors.white
                                                            : Colors
                                                            .white,
                                                        (index % 2 == 0)
                                                            ? Colors.white
                                                            : Colors
                                                            .white,
                                                      ],


                                                      //(l_AccountLedger[index].Pr_Credit == 0) ?
                                                      // Colors.greenAccent.shade100 : Colors.lightBlue.shade100,
                                                      // (l_AccountLedger[index].Pr_Credit == 0) ?
                                                      // Colors.greenAccent.shade100 : Colors.lightBlue.shade100,
                                                      // ],
                                                      begin: Alignment.topLeft,
                                                      end: Alignment.bottomRight),
                                                  borderRadius:
                                                  BorderRadius.circular(5.0),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      offset: Offset(0, 4),
                                                      color: Colors.teal,
                                                      blurRadius: 10,
                                                    )
                                                  ])),
                                          Container(
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [

                                                        (index % 2 == 0)
                                                            ? Colors.white
                                                            : Colors
                                                            .white,
                                                        (index % 2 == 0)
                                                            ? Colors.white
                                                            : Colors
                                                            .white,

                                                      ],
                                                      begin: Alignment.topLeft,
                                                      end: Alignment.bottomRight),
                                                  borderRadius:
                                                  BorderRadius.circular(5.0),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      offset: Offset(0, 4),
                                                      color: Colors.teal,
                                                      blurRadius: 10,
                                                    )
                                                  ])),
                                          Container(
                                            margin:
                                            EdgeInsets.only(top: 26, left: 35),
                                            child: Text(
                                              l_AccountLedger[index].Pr_VNO.toString(),
                                              style:
                                              GoogleFonts.ubuntu(textStyle:
                                              TextStyle(
                                                  fontSize: 28,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: .5)
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                            EdgeInsets.only(top: 70, left: 35),
                                            child: Text(
                                              'Debit', style:
                                            GoogleFonts.ubuntu(textStyle:
                                            TextStyle(
                                                fontSize: 18,
                                                color: Colors.black26,
                                                //fontWeight: FontWeight.w600,
                                                letterSpacing: .5)
                                            ),

                                            ),
                                          ),
                                          Container(
                                            margin:
                                            EdgeInsets.only(top: 90, left: 38),
                                            child: Text(
                                              G_currencyFormat.format(l_AccountLedger[index].Pr_PendingDebit),
                                              //l_AccountLedger[index].Pr_Debit.toString(),
                                              style: GoogleFonts.ubuntu(textStyle:
                                              TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.lightBlue,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: .5)
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                            EdgeInsets.only(top: 29, left: 295),

                                            child: Text(


                                              G_DateTimeFormat.format(l_AccountLedger[index].Pr_VDate),
                                              style:
                                              GoogleFonts.ubuntu(textStyle:
                                              TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: .5)
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                            EdgeInsets.only(top: 63, left: 300),
                                            child: Text(
                                              'Balance', style:
                                            GoogleFonts.ubuntu(textStyle:
                                            TextStyle(
                                                fontSize: 24,
                                                color: Colors.black26,
                                                //fontWeight: FontWeight.w600,
                                                letterSpacing: .5)
                                            ),

                                            ),
                                          ),
                                          Container(
                                            margin:
                                            EdgeInsets.only(top: 90, left: 300),
                                            child: Text(


                                              //l_AccountLedger[index].Pr_Balance.toInt().toString() ,
                                            l_AccountLedger[index].Pr_Remarks,
                                              style: GoogleFonts.ubuntu(textStyle:
                                              TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: .5)
                                              ),
                                            ),
                                          ),



                                          Container(
                                            margin:
                                            EdgeInsets.only(top: 70, left: 170),
                                            child: Text(
                                              'Credit', style:
                                            GoogleFonts.ubuntu(textStyle:
                                            TextStyle(
                                                fontSize: 18,
                                                color: Colors.black26,
                                                //fontWeight: FontWeight.w600,
                                                letterSpacing: .5)
                                            ),

                                            ),
                                          ),


                                          Container(
                                            margin:
                                            EdgeInsets.only(top: 90, left: 174),
                                            child: Text(
                                              G_currencyFormat.format(l_AccountLedger[index].Pr_PendingCredit),
                                              style:GoogleFonts.ubuntu(textStyle:
                                              TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: .5)
                                              ),
                                            ),
                                          ),

                                          Container(
                                            margin:
                                            EdgeInsets.only(top: 95, left: 25),
                                            child: Text(
                                              'RS:', style:
                                            GoogleFonts.ubuntu(textStyle:
                                            TextStyle(
                                                fontSize: 8,
                                                color: Colors.black26,
                                                //fontWeight: FontWeight.w600,
                                                letterSpacing: .5)
                                            ),

                                            ),
                                          ),
                                          //bal
                                          Container(
                                            margin:
                                            EdgeInsets.only(top: 95, left: 288),
                                            child: Text(
                                              'RS:', style:
                                            GoogleFonts.ubuntu(textStyle:
                                            TextStyle(
                                                fontSize: 8,
                                                color: Colors.black26,
                                                //fontWeight: FontWeight.w600,
                                                letterSpacing: .5)
                                            ),

                                            ),
                                          ),
                                          //cr
                                          Container(
                                            margin:
                                            EdgeInsets.only(top: 95, left: 160),
                                            child: Text(
                                              'RS:', style:
                                            GoogleFonts.ubuntu(textStyle:
                                            TextStyle(
                                                fontSize: 8,
                                                color: Colors.black26,
                                                //fontWeight: FontWeight.w600,
                                                letterSpacing: .5)
                                            ),

                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  FncstartupSettings() {
    //Labels
    lblCompanyList.TxtText = "Pending Cheques";
    lblCompanyList.TxtFontSize = 30;
    lblCompanyList.color = Colors.black38;

    lblCompanyName.TxtText = "Details";
    lblCompanyName.TxtFontSize = 21;
    lblCompanyName.color = Colors.black87;
  }

  FncReport() async {
    String? l_result;

    l_result = await SlERptPdf().Fnc_reportpdf();
    print(l_result);

    if (l_result == null) {
      Get.snackbar("Alert", "Invalid Login Information");
    } else {
      Uint8List decoded = base64.decode(l_result);
      cmGlobalVariables.Pb_Report = decoded;
      print(cmGlobalVariables.Pb_Report);
    }
  }
}


