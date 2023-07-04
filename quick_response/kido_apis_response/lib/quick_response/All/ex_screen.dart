import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kido_apis_response/quick_response/All/ex_provider.dart';
import 'package:provider/provider.dart';

class AllResponseScreen extends StatefulWidget {
  const AllResponseScreen({super.key});

  @override
  State<AllResponseScreen> createState() => _AllResponseScreenState();
}

class _AllResponseScreenState extends State<AllResponseScreen> {
  late AllQuickResponseProvider allQuickRespone;

  Future initPrefs() async {
    await allQuickRespone.getAllResponseData();
  }

  @override
  void initState() {
    super.initState();
    allQuickRespone =
        Provider.of<AllQuickResponseProvider>(context, listen: false);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Quick Response Data'),
        ),
        body: getDataInListView());
  }

  Widget getDataInListView() {
    return ListView.builder(
        itemCount: allQuickRespone.myQuickResponseAll.data?.messages?.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                '${allQuickRespone.myQuickResponseAll.data?.messages?[index].title}'),
            subtitle: Text(
                '${allQuickRespone.myQuickResponseAll.data?.messages?[index].msg}\n============================================'),
          );
        });
  }
}
