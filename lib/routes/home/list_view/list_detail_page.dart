import 'package:flutter/material.dart';
import 'package:flutter_demo/routes/home/list_view/company.dart';
import 'package:flutter_demo/routes/home/list_view/company_hot_job.dart';
import 'package:flutter_demo/routes/home/list_view/company_inc.dart';
import 'package:flutter_demo/routes/home/list_view/company_info.dart';
// import 'package:flutter_demo/routes/other/application.dart';
import 'package:flutter_demo/widgets/dots_indicator.dart';
// import 'package:shared_preferences/shared_preferences.dart';

const double _kAppBarHeight = 256;

class ListDetailPage extends StatefulWidget {
  // ListDetailPage({Key? key}) : super(key: key);

  final Company _company;

  ListDetailPage(this._company);

  @override
  _ListDetailPageState createState() => _ListDetailPageState();
}

class _ListDetailPageState extends State<ListDetailPage>
    with TickerProviderStateMixin {
  // final Future<SharedPreferences> _preferences =
  //     SharedPreferences.getInstance();

  List<Widget> _imagePages = [];
  List<String> _urls = [
    "https://img1.baidu.com/it/u=2864322938,1790026223&fm=15&fmt=auto",
    "https://img0.baidu.com/it/u=3753421363,913295810&fm=26&fmt=auto",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201505%2F18%2F20150518135459_QcWUF.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1638668301&t=8ba9d4c4023e46639ecb4a5ac7814235",
  ];
  List<Tab> _tabs = [];
  late TabController _controller;
  late VoidCallback onTapAction;
  int _currentIndex = 0;
  // late Widget _companyTabContent;

  @override
  void initState() {
    super.initState();

    _imagePages = [];
    _urls.forEach((String url) {
      _imagePages.add(new Container(
        color: Colors.black,
        child: new ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: new Image.network(
            url,
            height: _kAppBarHeight,
            fit: BoxFit.fill,
          ),
        ),
      ));
    });

    // _companyTabContent = new CompanyInc(widget._company.inc);
    _tabs = [new Tab(text: '公司概况'), new Tab(text: '热招职位')];
    _controller = new TabController(length: _tabs.length, vsync: this);
    onTapAction = () {
      // if (_currentIndex == 0) {
      //   _companyTabContent = new CompanyInc(widget._company.inc);
      // } else {
      //   _companyTabContent = new CompanyInc();
      // }
      setState(() {
        _currentIndex = _controller.index;
      });
    };
    _controller.addListener(onTapAction);
  }

  // Todo
  // void saveData() async {
  //   final SharedPreferences preferences = await _preferences;
  //   preferences.setString("someThingKey", "存储的数据");
  // }

  // void readData() async {
  //   final SharedPreferences preferences = await _preferences;
  //   String data = preferences.getString("someThingKey") ?? "";
  //   print(data);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox.fromSize(
                  size: Size.fromHeight(_kAppBarHeight),
                  child: IndicatorViewPager(
                    pages: _imagePages,
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      CompanyInfo(widget._company),
                      Divider(
                        color: Colors.red,
                      ),
                      new TabBar(
                        tabs: _tabs,
                        controller: _controller,
                        labelColor: Colors.black,
                        labelStyle: TextStyle(fontSize: 16.0),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 3,
                        indicatorColor: Colors.red,
                      )
                    ],
                  ),
                ),
                // _companyTabContent
                // 第二种
                IndexedStack(
                  index: _currentIndex,
                  children: <Widget>[
                    CompanyInc(widget._company.inc),
                    CompanyHotJob()
                  ],
                )
              ],
            ),
          ),
          new Positioned(
              // top: Application.statusBarHeight,
              top: 48,
              left: 10,
              child: BackButton(
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
