import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../Models/EModel/ModPendingCheques.dart';
import '../../ClassModules/cmHttpCalls.dart';
import '../../Models/EModel/ModAccLedger.dart';
import '../../Models/EModel/ModBranchSetting.dart';
import '../../Models/EModel/ModPendingCheques.dart';

class SlEPendingCheques {
  Future<List<ModI_PendingCheques>?> Fnc_PendingCheques() async {
    try {

      //" Where UserDID = '" & Pb_UserDID.ToString & "' and IsAssigned = 1"

      final body = {
        "Pr_Branchid":"1",
        "Pr_WhereClause": "",
        "Pr_GroupByClause": "",
        "Pr_OrderByClause": ""


      };
      // Uri l_uri = Uri.http(ipAddress, '/RptAssignedBranches/Fnc_Read_Sp');

      String l_jsonString = json.encode((body));
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response = await new cmHttpCalls().Fnc_HttpResponseERPBoth('RptPendingCheques/Fnc_Read_SP', l_UtfContent);

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

  ModI_PendingCheques Fnc_JsonToModel(Map<String, dynamic> l_JsonObject)
  {
    ModI_PendingCheques l_ModI_PendingCheques = new ModI_PendingCheques();

    l_ModI_PendingCheques.Pr_PKGUID = l_JsonObject["Pr_PKGUID"];
    l_ModI_PendingCheques.Pr_VNO = l_JsonObject["Pr_VNO"];
    l_ModI_PendingCheques.Pr_VoucherNo = l_JsonObject["Pr_VoucherNo"];
    l_ModI_PendingCheques.Pr_VDate = DateTime.parse(l_JsonObject["Pr_VDate"]);
    l_ModI_PendingCheques.Pr_ChequeDate = DateTime.parse(l_JsonObject["Pr_ChequeDate"]);
    l_ModI_PendingCheques.Pr_AccountDID = l_JsonObject["Pr_AccountDID"];
    l_ModI_PendingCheques.Pr_AccountID = l_JsonObject["Pr_AccountID"];
    l_ModI_PendingCheques.Pr_ChequeNo = l_JsonObject["Pr_ChequeNo"];
    l_ModI_PendingCheques.Pr_RefNo = l_JsonObject["Pr_RefNo"];
    l_ModI_PendingCheques.Pr_Remarks = l_JsonObject["Pr_Remarks"];
    lat: l_ModI_PendingCheques.Pr_Amount = l_JsonObject["Pr_Amount"].toDouble();
    lat: l_ModI_PendingCheques.Pr_PendingDebit = l_JsonObject["Pr_PendingDebit"].toDouble();
    lat: l_ModI_PendingCheques.Pr_PendingCredit = l_JsonObject["Pr_PendingCredit"].toDouble();
    l_ModI_PendingCheques.Pr_ChequeStatusDID = l_JsonObject["Pr_ChequeStatusDID"];
    l_ModI_PendingCheques.Pr_ChequeStatus = l_JsonObject["Pr_ChequeStatus"];
    l_ModI_PendingCheques.Pr_ChequeType = l_JsonObject["Pr_ChequeType"];
    l_ModI_PendingCheques.Pr_PostedID = l_JsonObject["Pr_PostedID"];
    l_ModI_PendingCheques.Pr_BranchID = l_JsonObject["Pr_BranchID"];
    return l_ModI_PendingCheques;
  }

  List<ModI_PendingCheques> Fnc_JsonToListOfModel(List<dynamic> l_JsonList)
  {
    List<ModI_PendingCheques> l_ListModI_PendingCheques = new List<ModI_PendingCheques>.empty(growable: true);
    for(dynamic l_JsonObject in l_JsonList)
    {
      ModI_PendingCheques l_ModI_PendingCheques = new ModI_PendingCheques();
      l_ModI_PendingCheques = Fnc_JsonToModel(l_JsonObject);
      l_ListModI_PendingCheques.add(l_ModI_PendingCheques);
    }
    return l_ListModI_PendingCheques;
  }
}
