import 'package:flutter/material.dart';
import 'package:flutter_demo/routes/home/list_view/company_copy.dart';

class CompanyListProvider with ChangeNotifier {
  List<Company> _companyList = [];
  int _currentPage = 1;
  int _showValue = 0;

  // 获取list数据
  List<Company> get companyList => _companyList;

  // 获取页码
  int get currentPage => _currentPage;

  // 获取显示状态
  int get showValue => _showValue;

  set companyList(List<Company> companyList) {
    _companyList = companyList;
    // 通知刷新
    notifyListeners();
  }
}
