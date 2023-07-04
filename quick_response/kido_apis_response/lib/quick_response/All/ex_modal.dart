import 'dart:convert';

AllQuickResponseModal myModalFromJson(String str) =>
    AllQuickResponseModal.fromJson(json.decode(str));

//String myData(AllQuickResponseModal myData) => json.encode(myData.toJson());

class AllQuickResponseModal {
  String? message;
  Data? data;
  int? code;
  bool? success;

  AllQuickResponseModal({this.message, this.data, this.code, this.success});

  AllQuickResponseModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    code = json['code'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = code;
    data['success'] = success;
    return data;
  }
}

class Data {
  int? totalRecords;
  List<Messages>? messages;

  Data({this.totalRecords, this.messages});

  Data.fromJson(Map<String, dynamic> json) {
    totalRecords = json['total_records'];
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_records'] = totalRecords;
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Messages {
  String? sId;
  String? title;
  String? msg;
  String? attachment;
  int? sent;

  Messages({this.sId, this.title, this.msg, this.attachment, this.sent});

  Messages.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    msg = json['msg'];
    attachment = json['attachment'];
    sent = json['sent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['msg'] = msg;
    data['attachment'] = attachment;
    data['sent'] = sent;
    return data;
  }
}
