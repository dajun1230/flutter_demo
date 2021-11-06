import 'package:flutter/material.dart';

class CompanyHotJob extends StatelessWidget {
  const CompanyHotJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: new Row(
        children: <Widget>[
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: '敬请期待',
                style: TextStyle(fontSize: 16, color: Colors.grey[600])),
            TextSpan(
                text: '敬请期待',
                style: TextStyle(fontSize: 24, color: Colors.black)),
            TextSpan(
                text: '敬请期待',
                style: TextStyle(fontSize: 16, color: Colors.orange))
          ]))
        ],
      ),
    );
  }
}
