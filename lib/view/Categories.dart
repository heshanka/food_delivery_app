import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/MainModel.dart';
import 'package:scoped_model/scoped_model.dart';

class Categories extends StatelessWidget {
  final MainModel model = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: model,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
        ),
        body: Center(
          child: Column(),
        ),
      ),
    );
  }
}
