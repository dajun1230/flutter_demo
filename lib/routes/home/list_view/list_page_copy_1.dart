import 'dart:convert';
import 'dart:io';

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

  @override
  void initState() {
    super.initState();

    // getDataList();
    getDataList2();
  }

  getDataList() {
    setState(() {
      _dataList = Company.fromJson("""
      {
        "list": [
          {
            "logo": "https://pics1.baidu.com/feed/cc11728b4710b9128fec0c0e4f9cda05934522fc.jpeg?token=8bffca570fec04f3cf51b7742f8b3176&s=AB209F086CB07D9E920007C30300E0AF",
            "name": "233s",
            "location": "上海市浦东新",
            "type": "互联网",
            "size": "10000",
            "employee": "资深产品工程师",
            "hot": "资深产品工程师",
            "count": "500",
            "inc": "B轮"
          },
          {
            "logo": "https://pics1.baidu.com/feed/cc11728b4710b9128fec0c0e4f9cda05934522fc.jpeg?token=8bffca570fec04f3cf51b7742f8b3176&s=AB209F086CB07D9E920007C30300E0AF",
            "name": "233s",
            "location": "上海市浦东新",
            "type": "互联网",
            "size": "B轮",
            "employee": "100000",
            "hot": "资深产品工程师",
            "count": "500",
            "inc": "B轮"
          },
          {
            "logo": "https://pics1.baidu.com/feed/cc11728b4710b9128fec0c0e4f9cda05934522fc.jpeg?token=8bffca570fec04f3cf51b7742f8b3176&s=AB209F086CB07D9E920007C30300E0AF",
            "name": "第三数据",
            "location": "上海市浦东新",
            "type": "互联网",
            "size": "B轮",
            "employee": "100000",
            "hot": "资深产品工程师",
            "count": "500",
            "inc": "B轮"
          }
        ]
      }
      """);
    });
  }

  void getDataList2() async {
    String url = "http://m.app.haosou.com/index/getData?type=1&page=1";
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    HttpClientResponse response = await request.close();
    var data = await response.transform(utf8.decoder).join();
    print(data);
    httpClient.close();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _dataList.length,
        itemBuilder: (context, index) {
          var model = _dataList[index];
          return ListItemPage(model);
        });
  }
}
