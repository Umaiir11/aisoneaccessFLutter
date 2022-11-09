import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../ClassModules/cmHttpCalls.dart';
import '../../Models/EModel/ModAccLedger.dart';
import '../../Models/EModel/ModBranchSetting.dart';
import '../../Models/EModel/ModPendingSalOrder.dart';

class SlEPendingSelOrder
{
  Future<List<ModI_PendingSaleOrder>?> Fnc_PendingSO() async {
    try {

      //" Where UserDID = '" & Pb_UserDID.ToString & "' and IsAssigned = 1"

      final body = {
        "Pr_Branchid": 1
      };
      // Uri l_uri = Uri.http(ipAddress, '/RptAssignedBranches/Fnc_Read_Sp');

      String l_jsonString = json.encode((body));
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response = await new cmHttpCalls().Fnc_HttpResponseERPBoth('/RptPendingSaleOrder/Fnc_Read_SP', l_UtfContent);

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

  ModI_PendingSaleOrder Fnc_JsonToModel(Map<String, dynamic> l_JsonObject)
  {
    ModI_PendingSaleOrder l_ModI_PendingSaleOrder = new ModI_PendingSaleOrder();

    l_ModI_PendingSaleOrder.Pr_PKGUID = l_JsonObject["Pr_PKGUID"];
    l_ModI_PendingSaleOrder.Pr_VNO = l_JsonObject["Pr_VNO"];
    l_ModI_PendingSaleOrder.Pr_VoucherNo = l_JsonObject["Pr_VoucherNo"];
    l_ModI_PendingSaleOrder.Pr_VDate = DateTime.parse(l_JsonObject["Pr_VDate"]);
    l_ModI_PendingSaleOrder.Pr_AccountDID = l_JsonObject["Pr_AccountDID"];
    l_ModI_PendingSaleOrder.Pr_AccountID = l_JsonObject["Pr_AccountID"];
    l_ModI_PendingSaleOrder.Pr_CityID = l_JsonObject["Pr_CityID"];
    l_ModI_PendingSaleOrder.Pr_CustomerRefNo = l_JsonObject["Pr_CustomerRefNo"];
    l_ModI_PendingSaleOrder.Pr_RefNo = l_JsonObject["Pr_RefNo"];
    l_ModI_PendingSaleOrder.Pr_Remarks = l_JsonObject["Pr_Remarks"];
    lat: l_ModI_PendingSaleOrder.Pr_FGrandTotal = l_JsonObject["Pr_FGrandTotal"].toDouble();
    lat: l_ModI_PendingSaleOrder.Pr_CGrandTotal = l_JsonObject["Pr_CGrandTotal"].toDouble();
    lat: l_ModI_PendingSaleOrder.Pr_FExportableAmount = l_JsonObject["Pr_FExportableAmount"].toDouble();
    lat: l_ModI_PendingSaleOrder.Pr_CExportableAmount = l_JsonObject["Pr_CExportableAmount"].toDouble();
    lat: l_ModI_PendingSaleOrder.Pr_FPendingAmount = l_JsonObject["Pr_FPendingAmount"].toDouble();
    lat: l_ModI_PendingSaleOrder.Pr_CPendingAmount = l_JsonObject["Pr_CPendingAmount"].toDouble();
    lat: l_ModI_PendingSaleOrder.Pr_PQty = l_JsonObject["Pr_PQty"].toDouble();
    l_ModI_PendingSaleOrder.Pr_StageID = l_JsonObject["Pr_StageID"];
    l_ModI_PendingSaleOrder.Pr_BranchID = l_JsonObject["Pr_BranchID"];
    return l_ModI_PendingSaleOrder;
  }

  List<ModI_PendingSaleOrder> Fnc_JsonToListOfModel(List<dynamic> l_JsonList)
  {
    List<ModI_PendingSaleOrder> l_ListModI_PendingSaleOrder = new List<ModI_PendingSaleOrder>.empty(growable: true);
    for(dynamic l_JsonObject in l_JsonList)
    {
      ModI_PendingSaleOrder l_ModI_PendingSaleOrder = new ModI_PendingSaleOrder();
      l_ModI_PendingSaleOrder = Fnc_JsonToModel(l_JsonObject);
      l_ListModI_PendingSaleOrder.add(l_ModI_PendingSaleOrder);
    }
    return l_ListModI_PendingSaleOrder;
  }



}
