import 'package:aisoneaccess/Screens/vi_LedgerPDF.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
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



class vi_SaleInvoiceList extends StatefulWidget {
  const vi_SaleInvoiceList({Key? key}) : super(key: key);

  @override
  State<vi_SaleInvoiceList> createState() => _vi_SaleInvoiceListState();
}

class _vi_SaleInvoiceListState extends State<vi_SaleInvoiceList> {
  @override

  late RxList<ModI_PendingCheques> l_AccountLedger =
  Get.find(tag: "Rx_l_listIPendingCheques");

  ULabels lblCompanyList = new ULabels();
  ULabels lblCompanyName = new ULabels();

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
                    margin: EdgeInsets.only(top: 103, left: 160),
                    child: SizedBox(
                      height: 165,
                      child: Image.asset("assets/com.png"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 230, left: 310),
                    child: ElevatedButton.icon(
                      onPressed: () {

                        Get.to(() => Controll());

                        print("zaxsd");
                      },
                      icon: Icon(Icons.visibility),
                      label: Text("Preview PDF"),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(

                    margin: EdgeInsets.only(top: 80, left: 127),
                    child: Shimmer.fromColors(
                        baseColor: Colors.black26,
                        highlightColor: Colors.cyanAccent,
                        child: lblCompanyList),
                  ),
                  //Cards and Decorated Containers
                  Container(
                    margin: EdgeInsets.only(top: 250, left: 0),
                    child: ListView.builder(
                      shrinkWrap: true,
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
                                width: 450,
                                height: 140,
                                child: Card(
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Colors.lightBlueAccent.shade100,
                                                    Colors.lightBlueAccent.shade100,
                                                    Colors.lightBlue.shade300
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
                                      Positioned.fill(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 2,
                                              child: Image.asset(
                                                "assets/company.png",
                                                height: 64,
                                                width: 64,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  lblCompanyName,
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                  UWLabels(
                                                      text: l_AccountLedger[index].Pr_VNO.toString(),
                                                      l_FontSize: 18,
                                                      color: Colors.black38),
                                                  const SizedBox(height: 16),
                                                  Wrap(
                                                    spacing: 5.0,
                                                    runSpacing: 5.0,
                                                    direction: Axis.vertical,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        children: <Widget>[
                                                          const Icon(
                                                            MdiIcons.gmail,
                                                            size: 18,
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          UWLabels(
                                                              text:
                                                              l_AccountLedger[
                                                              index]
                                                                  .Pr_ChequeNo,
                                                              l_FontSize: 18,
                                                              color:
                                                              Colors.black38),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    "",
                                                    style: GoogleFonts.ubuntu(
                                                        textStyle: const TextStyle(
                                                            color: Colors.black54,
                                                            fontWeight:
                                                            FontWeight.w600,
                                                            fontSize: 18,
                                                            letterSpacing: .5)),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
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


