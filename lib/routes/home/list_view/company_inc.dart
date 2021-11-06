// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CompanyInc extends StatelessWidget {
  String detail;

  CompanyInc(this.detail);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(detail),
    );
  }
}
