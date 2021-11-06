import 'dart:convert';
import 'package:flutter_demo/routes/home/list_view/list_detail_page.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  int page = 1;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();

    getCompanyList();
  }

  /*
    (1) 下拉刷新：请求数据后替换数据
    (2) 上拉加载更多：拼接数据
   */

  void getCompanyList() async {
    String url = "http://m.app.haosou.com/index/getData?type=1&page=$page";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = response.body;
      var json = jsonDecode(data);
      if (page == 1) {
        _refreshController.refreshCompleted();
        setState(() {
          _dataList = Company.fromMapData(json);
        });
      } else {
        _refreshController.loadComplete();
        // _refreshController.loadNoData();
        setState(() {
          _dataList.addAll(Company.fromMapData(json));
        });
      }
    } else {
      if (page == 1) {
        _refreshController.refreshFailed();
      } else {
        page--;
        _refreshController.loadFailed();
      }
    }
  }

  Widget _buildContent() {
    if (_dataList.isEmpty) {
      return new Center(child: CircularProgressIndicator());
    }

    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: true,
      header: ClassicHeader(
        refreshingText: '正在加载中...',
        idleText: '下拉刷新',
        completeText: '加载完成',
        failedText: '数据刷新异常',
        releaseText: '松开刷新',
      ),
      footer: ClassicFooter(
        loadingText: '玩命加载中...',
        failedText: '数据刷新异常',
        noDataText: '没有更多数据',
      ),
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
          itemCount: _dataList.length,
          itemBuilder: (context, index) {
            var model = _dataList[index];
            return InkWell(
              child: ListItemPage(model),
              onTap: () => {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => ListDetailPage(model)))
              },
            );
          }),
    );
  }

  void _onRefresh() async {
    // await Future.delayed(
    //     Duration(seconds: 2),
    //     () => {
    //           _refreshController.refreshCompleted()
    // _refreshController.refreshFailed()
    // _refreshController.loadComplete()
    // _refreshController.loadFailed()
    // _refreshController.loadNoData()
    // });
    page = 1;
    getCompanyList();
  }

  void _onLoading() async {
    page++;
    getCompanyList();
    // await Future.delayed(
    //     Duration(seconds: 2),
    //     () => {
    //           _refreshController.refreshCompleted()
    // _refreshController.refreshFailed()
    // _refreshController.loadComplete()
    // _refreshController.loadFailed()
    //   _refreshController.loadNoData()
    // });
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
