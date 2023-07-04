import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kido_apis_response/quick_response/All/ex_modal.dart';
import 'package:kido_apis_response/quick_response/All/ex_repo.dart';

class AllQuickResponseProvider with ChangeNotifier {
  AllQuickResponseModal myQuickResponseAll = AllQuickResponseModal();
  AllQuickResponseModal get myAllData => myQuickResponseAll;
  var repo = AllQuickResponseRepo();

  Future getAllResponseData() async {
    var response = await repo.getAllData();
    myQuickResponseAll = response;
    log(myQuickResponseAll.data!.messages.toString());
    notifyListeners();
    return myQuickResponseAll;
  }
}
