import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_demo/routes/home/list_view/company.dart';
import 'package:flutter_demo/routes/home/list_view/list_item_page.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Company> _dataList = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    getCompanyList();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到最后了');
      }
    });
  }

  void getCompanyList() async {
    String url = "http://m.app.haosou.com/index/getData?type=1&page=1";
    var response = await http.get(Uri.parse(url));
    var data = response.body;
    var json = jsonDecode(data);
    setState(() {
      _dataList = Company.fromMapData(json);
    });
  }

  Widget _buildContent() {
    if (_dataList.isEmpty) {
      return new Center(child: CircularProgressIndicator());
    }

    // 下拉刷新定制性太差
    return RefreshIndicator(
        child: ListView.builder(
            controller: _scrollController,
            itemCount: _dataList.length,
            itemBuilder: (context, index) {
              var model = _dataList[index];
              return ListItemPage(model);
            }),
        onRefresh: _onRefresh);
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () => {print('object')});
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
