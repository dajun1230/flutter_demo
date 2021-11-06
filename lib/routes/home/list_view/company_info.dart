import 'package:flutter/material.dart';
import 'package:flutter_demo/routes/home/list_view/company.dart';

class CompanyInfo extends StatelessWidget {
  // const CompanyInfo({Key? key}) : super(key: key);

  final Company _company;

  CompanyInfo(this._company);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        elevation: 0,
        child: Row(
          children: <Widget>[
            new Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 15.0, right: 15.0, bottom: 0.0),
                child: new Image.network(
                  _company.logo,
                  width: 50.0,
                  height: 50.0,
                )),
            new Expanded(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: 5.0, left: 0.0, right: 5.0, bottom: 5.0),
                  child: Text(
                    _company.name,
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 5.0, left: 0.0, right: 5.0, bottom: 5.0),
                  child: Text(
                    _company.location,
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 5.0, left: 0.0, right: 5.0, bottom: 5.0),
                  child: Text(
                    _company.type + '|' + _company.size,
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
