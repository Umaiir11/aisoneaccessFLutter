import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../Models/EModel/ModAccLedger.dart';
import '../../ClassModules/cmHttpCalls.dart';
import '../../Models/EModel/ModAccLedger.dart';
import '../../Models/EModel/ModBranchSetting.dart';

class SlEAccountLedger {
  Future<List<ModI_AccountLedger>?> Fnc_AccountLedger() async {
    try {

      //" Where UserDID = '" & Pb_UserDID.ToString & "' and IsAssigned = 1"

      final body = {
        "Pr_AccountDID": "017FE3AC-068B-4D0A-86AA-C8987CD5E88C",
        "Pr_FromDate": "1900-01-01",
        "Pr_ToDate": "2023-01-01"
      };
      // Uri l_uri = Uri.http(ipAddress, '/RptAssignedBranches/Fnc_Read_Sp');

      String l_jsonString = json.encode((body));
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response = await new cmHttpCalls().Fnc_HttpResponseERPBoth('RptAccountLedger/Fnc_Read_SP', l_UtfContent);

      if (l_response.statusCode == 200) {

        var a = l_response;
        print(a);
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ModI_AccountLedger Fnc_JsonToModel(Map<String, dynamic> l_JsonObject)
  {
    ModI_AccountLedger l_ModI_AccountLedger = new ModI_AccountLedger();

    l_ModI_AccountLedger.Pr_PKGUID = l_JsonObject["Pr_PKGUID"];
    l_ModI_AccountLedger.Pr_SrNo = l_JsonObject["Pr_SrNo"];
    l_ModI_AccountLedger.Pr_VNO = l_JsonObject["Pr_VNO"];
    l_ModI_AccountLedger.Pr_VDate = DateTime.parse(l_JsonObject["Pr_VDate"]);
    l_ModI_AccountLedger.Pr_AccountDID = l_JsonObject["Pr_AccountDID"];
    l_ModI_AccountLedger.Pr_AccountID = l_JsonObject["Pr_AccountID"];
    l_ModI_AccountLedger.Pr_CurrencyCode = l_JsonObject["Pr_CurrencyCode"];
    l_ModI_AccountLedger.Pr_RefNo = l_JsonObject["Pr_RefNo"];
    l_ModI_AccountLedger.Pr_Remarks = l_JsonObject["Pr_Remarks"];
    l_ModI_AccountLedger.Pr_Narrations = l_JsonObject["Pr_Narrations"];
    l_ModI_AccountLedger.Pr_CrossAccountDID = l_JsonObject["Pr_CrossAccountDID"];
    l_ModI_AccountLedger.Pr_CrossAccountID = l_JsonObject["Pr_CrossAccountID"];
    l_ModI_AccountLedger.Pr_CrossCurrencyCode = l_JsonObject["Pr_CrossCurrencyCode"];
    lat: l_ModI_AccountLedger.Pr_Debit = l_JsonObject["Pr_Debit"].toDouble();
    lat: l_ModI_AccountLedger.Pr_Credit = l_JsonObject["Pr_Credit"].toDouble();
    lat: l_ModI_AccountLedger.Pr_ExRate = l_JsonObject["Pr_ExRate"].toDouble();
    lat: l_ModI_AccountLedger.Pr_Balance = l_JsonObject["Pr_Balance"].toDouble();
    l_ModI_AccountLedger.Pr_ST = l_JsonObject["Pr_ST"];
    l_ModI_AccountLedger.Pr_VMDID = l_JsonObject["Pr_VMDID"];
    l_ModI_AccountLedger.Pr_VDDID = l_JsonObject["Pr_VDDID"];
    l_ModI_AccountLedger.Pr_VType = l_JsonObject["Pr_VType"];
    l_ModI_AccountLedger.Pr_Voucher = l_JsonObject["Pr_Voucher"];
    l_ModI_AccountLedger.Pr_PostedID = l_JsonObject["Pr_PostedID"];
    l_ModI_AccountLedger.Pr_TransID = l_JsonObject["Pr_TransID"];
    l_ModI_AccountLedger.Pr_BranchID = l_JsonObject["Pr_BranchID"];
    return l_ModI_AccountLedger;
  }


  List<ModI_AccountLedger> Fnc_JsonToListOfModel(List<dynamic> l_JsonList)
  {
    List<ModI_AccountLedger> l_ListModI_AccountLedger = new List<ModI_AccountLedger>.empty(growable: true);
    for(dynamic l_JsonObject in l_JsonList)
    {
      ModI_AccountLedger l_ModI_AccountLedger = new ModI_AccountLedger();
      l_ModI_AccountLedger = Fnc_JsonToModel(l_JsonObject);
      l_ListModI_AccountLedger.add(l_ModI_AccountLedger);
    }
    return l_ListModI_AccountLedger;
  }
}
