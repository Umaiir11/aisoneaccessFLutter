import 'dart:convert';
import '../../../ClassModules/cmCryptography.dart';
import '../../../ClassModules/cmHttpCalls.dart';
import '../../Models/EModel/ModCompanySettingQuery.dart';


class SlwLogin {
  Future<List<ModCompanySettingQuery>?> WLogin_Api_Call(
      String l_EmailID, String l_Password) async {
    try {
      //Validations
      if (l_EmailID.isEmpty == true) {
        return null;
      }
      if (l_Password.isEmpty == true) {
        return null;
      }
        //Preperation
      Map<String, String> l_ParCompantList = {
        'pr_EmailID': l_EmailID,
        'pr_Password': new cmCryptography().Fnc_Encrypt_AES(l_Password),
        'pr_CompanyDID': "00000000-0000-0000-0000-000000000000"
      };
      String l_jsonString = json.encode(l_ParCompantList);
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response = await new cmHttpCalls()
          .Fnc_HttpResponseWeb('/apiUser/Login/Post', l_UtfContent);
      if (l_response.statusCode == 200) {
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ModCompanySettingQuery Fnc_JsonToModel(Map<String, dynamic> l_JsonObject) {
    ModCompanySettingQuery l_ModCompanySettingQuery = ModCompanySettingQuery();
    l_ModCompanySettingQuery.Pr_Pkguid = l_JsonObject["Pr_PKGUID"];
    l_ModCompanySettingQuery.Pr_EmailId = l_JsonObject["Pr_EmailID"];
    l_ModCompanySettingQuery.Pr_RoleDid = l_JsonObject["Pr_RoleDID"];
    l_ModCompanySettingQuery.Pr_CompanyDid = l_JsonObject["Pr_CompanyDID"];
    l_ModCompanySettingQuery.Pr_CompanyName = l_JsonObject["Pr_CompanyName"];

    l_ModCompanySettingQuery.Pr_CompanyAddress =
        l_JsonObject["Pr_CompanyAddress"];
    l_ModCompanySettingQuery.Pr_CompanyCity = l_JsonObject["Pr_CompanyCity"];
    l_ModCompanySettingQuery.Pr_CompanyPhone = l_JsonObject["Pr_CompanyPhone"];
    return l_ModCompanySettingQuery;
  }

  //Method return list type
  List<ModCompanySettingQuery> Fnc_JsonToListOfModel(List<dynamic> l_JsonList) {
    //Declare Local Variable For list Of Model and instance

    List<ModCompanySettingQuery> l_ListModCompanySettingQuery =
        new List<ModCompanySettingQuery>.empty(growable: true);

    //Start Irritation From Json String

    for (dynamic l_JsonObject in l_JsonList) {
      ModCompanySettingQuery l_ModCompanySettingQuery =
          new ModCompanySettingQuery();
      l_ModCompanySettingQuery = Fnc_JsonToModel(l_JsonObject);
      l_ListModCompanySettingQuery.add(l_ModCompanySettingQuery);
    }
    return l_ListModCompanySettingQuery;
  }
}
