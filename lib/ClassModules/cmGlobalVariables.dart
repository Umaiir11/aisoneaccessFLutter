import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../Models/EModel/ModCompanySettingQuery.dart';



class cmGlobalVariables {
  static String Pb_WebAPIURL = "www.aisonesystems.com";
  static String? Pb_ERPApiUrl = "";
  static String? Pb_ERP_API = "";
  static String? Pb_Token;
  static bool Pb_isOffline = false;
  static String? Pb_UserDID;

  static String? Pb_UserName;
  static String? Pb_UserEmail;
  static String? Pb_UserNumber;
  static var Pb_Report;


  static int? PbSelectedBranch;
  static int? PbDefaultBranch;


  static List<ModCompanySettingQuery> PbCompanySettingQuery =
  new List<ModCompanySettingQuery>.empty(growable: true);




}
