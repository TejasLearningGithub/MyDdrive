import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kido_apis_response/quick_response/All/ex_modal.dart';

class AllQuickResponseRepo {
  AllQuickResponseModal responseModal = AllQuickResponseModal();

  Future getAllData() async {
    var token =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjQwNzczOWQ2ZWZkNmYxOWNmMDcxNiIsIm5hbWUiOiJzeXN0ZW0gYWRtaW4iLCJlbWFpbCI6InN5c2FkbWluQHN5c3RlbS5jb20iLCJpYXQiOjE2ODE5NzE0NTksImV4cCI6MTY4OTc0NzQ1OX0.bNrRbQA_Wo7lE_e5Ks8583vC_dCjSpyZ1-Zdk_bkWR8';
    try {
      var myHeaders = {
        'Authorization': token,
      };
      var response = await http.get(
        Uri.parse('http://45.79.123.102:49005/api/quickresponse/all/1'),
        headers: myHeaders,
      );
      if (response.statusCode == 200) {
        responseModal = myModalFromJson(response.body);
        log(responseModal.toString());
        return responseModal;
      }
    } catch (e) {
      log('Error in quick response = ${e.toString()}');
    }
  }
}
