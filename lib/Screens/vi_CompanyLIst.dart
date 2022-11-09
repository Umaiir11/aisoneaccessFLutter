import 'package:aisoneaccess/Screens/vi_AssignedBranches.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shimmer/shimmer.dart';

import '../ClassModules/cmGlobalVariables.dart';
import '../Models/EModel/ModBranchSetting.dart';
import '../Models/EModel/ModCompanySettingQuery.dart';
import '../Models/EModel/ModCompanyURLs.dart';
import '../ServiceLayer/SlAisoneERP/SlEAssignedBranches.dart';
import '../ServiceLayer/SlAisoneERP/SlWOnlineToken.dart';
import '../UserWidgets/Labels/Ulabels.dart';
import 'Drawer.dart';

class vi_CompanyLIst extends StatefulWidget {
  const vi_CompanyLIst({Key? key}) : super(key: key);

  @override
  State<vi_CompanyLIst> createState() => _vi_CompanyLIstState();
}

class _vi_CompanyLIstState extends State<vi_CompanyLIst> {
  int selectedIndeX = 0;
  bool isFolded = true;
  int count =1;
  late RxList<ModCompanySettingQuery> l_ListCompanyList =
      Get.find(tag: "l_ListCompanyList");

  List<ModAssignedBranches>? l_listAssignedBranches =
  new List<ModAssignedBranches>.empty(growable: true);



  List<ModCompanySettingQuery> items = <ModCompanySettingQuery>[];


  //UserWidgets
  ULabels lblCompanyList = new ULabels();
  ULabels lblCompanyName = new ULabels();

  //Controller
  TextEditingController _textController = TextEditingController();




  @override
  void initState() {
    super.initState();
    items.addAll(l_ListCompanyList);
    FncstartupSettings();
  }

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
              stops: [0.0, 0.5, 0.7, 0.9],
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
                    margin: EdgeInsets.only(top: 80, left: 127),
                    child: Shimmer.fromColors(
                        baseColor: Colors.black38,
                        highlightColor: Colors.cyanAccent,
                        child: lblCompanyList),
                  ),
                  //Cards and Decorated Containers

                  AnimatedContainer(duration: Duration(milliseconds: 370),
                    margin: EdgeInsets.only(top: 140, left:27),
                    width: isFolded ? 56 :320 ,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.lightBlueAccent.shade100,

                    ),
                    child:  Row(children: [
                      
                      Expanded(child: Container(
                        padding: EdgeInsets.only(left: 16),
                        child:  ! isFolded ? TextField(
                          controller: _textController,
                          onChanged: FncfilterSearchResults,
                          decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color:Colors.black),
                          border: InputBorder.none,


                        ),)
                            :null

                      )
                      ),
                      AnimatedContainer(duration: Duration(milliseconds: 370),

                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(isFolded? 32:0),
                              topRight: Radius.circular(32),
                              bottomLeft:Radius.circular(isFolded? 32:0),
                             bottomRight: Radius.circular(32),


                            ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(size: 20, isFolded? Icons.search : Icons.close,
                              color: Colors.black87,

                            ),
                          ),

                            onTap:(){
                            setState(() {
                              isFolded =! isFolded;
                            });
                            }
                      ),
                        ),



                      )

                    ],),
                  ),


                  Container(
                    margin: EdgeInsets.only(top: 180, left: 0),
                    child:  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                if (await Fnc_OnlineToken() == true) {
                                  if (await Fnc_OnlineAssignedBranches() == true)
                                    if(count >1 ){
                                      cmGlobalVariables.PbDefaultBranch = l_listAssignedBranches![0].pr_BranchDID;
                                      Get.to(() => vi_AssignedBranches());
                                      Get.snackbar(
                                          "Company URl", cmGlobalVariables.Pb_ERPApiUrl!);

                                    }
                                      else{

                                      Get.to(() => vi_Drawer());

                                                  }

                                }

                                setState(() {
                                  selectedIndeX = index;
                                });
                              },

                              child: SizedBox(
                                width: 440,
                                height: 185,
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

                                    child: Stack(
                                      children: [
                                        Container(
                                          height:200,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      (index % 2 == 0)
                                                          ? Colors.lightBlueAccent
                                                          .shade100
                                                          : Colors
                                                          .lightBlue.shade100,
                                                      (index % 2 == 0)
                                                          ? Colors.lightBlueAccent
                                                          .shade100
                                                          : Colors
                                                          .lightBlue.shade100,
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
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      (index % 2 == 0)
                                                          ? Colors.lightBlueAccent
                                                          .shade100
                                                          : Colors
                                                          .lightBlue.shade100,
                                                      (index % 2 == 0)
                                                          ? Colors.lightBlueAccent
                                                          .shade100
                                                          : Colors
                                                          .lightBlue.shade100,
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
                                            items[index].Pr_CompanyName,
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
                                          EdgeInsets.only(top: 66, left: 35),
                                          child: Text(
                                            'Email', style:
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
                                          EdgeInsets.only(top: 90, left: 35),
                                          child: Text(
                                            items[index].Pr_EmailId,
                                            style:
                                            GoogleFonts.ubuntu(textStyle:
                                            TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: .5)
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                          EdgeInsets.only(top: 110, left: 35),
                                          child: Text(
                                            'Address', style:
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
                                          EdgeInsets.only(top: 133, left: 35),
                                          child: Text(
                                            items[index].Pr_CompanyAddress.toString(),
                                            style: GoogleFonts.ubuntu(textStyle:
                                            TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: .5)
                                            ),
                                          ),
                                        ),

                                        Container(
                                          margin:
                                          EdgeInsets.only(top: 66, left: 310),
                                          child: Text(
                                            'Phone', style:
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
                                          EdgeInsets.only(top: 90, left: 310),
                                          child: Text(
                                            items[index].Pr_CompanyPhone.toString(),
                                            style: GoogleFonts.ubuntu(textStyle:
                                            TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
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
                          ],
                        );
                      }),
                    )),

                ],
              ),
            ),
          )),
    );
  }

//============================DART=================================

  FncstartupSettings() {
    //Labels
    lblCompanyList.TxtText = "C O M P A N I E S";
    lblCompanyList.TxtFontSize = 30;
    lblCompanyList.color = Colors.black38;

    lblCompanyName.TxtText = "Company Name";
    lblCompanyName.TxtFontSize = 21;
    lblCompanyName.color = Colors.black87;
  }

  Future<bool> Fnc_OnlineToken() async {
    String email = l_ListCompanyList[selectedIndeX].Pr_EmailId;
    String uuid = l_ListCompanyList[selectedIndeX].Pr_CompanyDid;
    String Pass = Get.find(tag: "Pass");
    //APi Call CompanyUrls
    ModCompanyURLs? l_ModCompanyURLs =
        await new SlCompanyURLs().Fnc_CompanyURls(email, Pass, uuid);
    //dynamic token = l_ModCompanyURLs?.Pr_Token;

    String? l_Token = l_ModCompanyURLs?.Pr_Token;
    if (l_Token == null) {
      return false;
    }
    cmGlobalVariables.Pb_ERPApiUrl = l_ModCompanyURLs?.Pr_ApiErpUrl;
    cmGlobalVariables.Pb_Token = l_Token;
    return true;
  }

  Future<bool> Fnc_OnlineAssignedBranches() async {


    //Assigned Branches Api Call
    l_listAssignedBranches = await SlEAssignedBranches().Fnc_AssignedBranches();
    {
      if (l_listAssignedBranches == null) {
        Get.snackbar(
            "Alert", "No Branch Assigned, Please Contact Your Administrator");
        return false;
      }
      count = l_listAssignedBranches!.length;
      print(cmGlobalVariables.PbDefaultBranch);


      RxList<ModAssignedBranches>? Rx_AssignedBranches =
          <ModAssignedBranches>[].obs;
      Rx_AssignedBranches.addAll(l_listAssignedBranches!);

      print(Rx_AssignedBranches);
      Get.put(Rx_AssignedBranches, tag: "Rx_AssignedBranches");
    }

    return true;
  }

  void FncfilterSearchResults(String UserInput) {
    List<ModCompanySettingQuery> dummySearchList = <ModCompanySettingQuery>[];
    dummySearchList.addAll(l_ListCompanyList);
    List<ModCompanySettingQuery> results = [];

    List<ModCompanySettingQuery> dummyListData = <ModCompanySettingQuery>[];
    if (UserInput.isNotEmpty) {
      UserInput.split(' ').forEach((s) {


        results.addAll(l_ListCompanyList.where((l_listelement) => l_listelement.Pr_CompanyName.toLowerCase().contains(s)));
        results.addAll(l_ListCompanyList.where((l_listelement) => l_listelement.Pr_CompanyName.toUpperCase().contains(s)));

        results.addAll(l_ListCompanyList.where((element) => element.Pr_CompanyAddress.toLowerCase().contains(s)));
        results.addAll(l_ListCompanyList.where((element) => element.Pr_CompanyAddress.toUpperCase().contains(s)));

        dummyListData = results.toSet().toList();
      });

      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(l_ListCompanyList);
      });
    }
  }

}
