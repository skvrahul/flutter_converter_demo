// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:flutter/material.dart';
// @required is defined in the meta.dart package
import 'package:meta/meta.dart';
import 'categoryItem.dart';
import 'CategoryModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _backgroundColor = Colors.green[100];
class CategoryList extends StatelessWidget{
  CategoryList();
  var _categories = [
    CategoryModel(name: 'Length', color: Colors.teal, icon: FontAwesomeIcons.ruler, unitMap: { 'm':1.0,'cm':0.01, 'mm':0.001}),
    CategoryModel(name: 'Area', color: Colors.orange, icon: FontAwesomeIcons.square, unitMap: {'m²':1.0, 'cm²':0.001,'mm²':0.00001}),
    CategoryModel(name: 'Mass', color: Colors.pinkAccent, icon:FontAwesomeIcons.balanceScale, unitMap: {'Kg':1.0, 'grams':0.001, 'tonnes':1000.0, 'lb':0.453592}),
    CategoryModel(name: 'Digital Storage', color: Colors.blueAccent, icon:FontAwesomeIcons.hdd, unitMap: {'B':1.0, 'KB':1024.0, 'b':0.125, 'MB':1048576.0}),
    CategoryModel(name: 'Energy', color: Colors.greenAccent, icon:FontAwesomeIcons.fire, unitMap: {'Joules':1.0, 'Calories':4.184, 'KJ':1000.0}),
    CategoryModel(name: 'Currency', color: Colors.red, icon:FontAwesomeIcons.coins, unitMap: {"USD":1.0, 'INR':70.57, 'KWD':3.29, "EUR":0.88, "YEN":111.12}),
  ];
//  static const _categoryNames = [
//    'Length',
//    'Area',
//    'Volume',
//    'Mass',
//    'Time',
//    'Digital Storage',
//    'Energy',
//    'Currency',
//  ];
//  static const _baseColors = <Color>[
//    Colors.teal,
//    Colors.orange,
//    Colors.pinkAccent,
//    Colors.blueAccent,
//    Colors.yellow,
//    Colors.greenAccent,
//    Colors.purpleAccent,
//    Colors.red,
//  ];
  Widget _buildCategoryWidgets(List<Widget> categories) {
    if(Orientation.landscape == true){
      return GridView.builder(
        itemBuilder: (BuildContext context, int index) => categories[index],
        itemCount: categories.length,
      );
    }else{
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => categories[index],
        itemCount: categories.length,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = <CategoryItem>[];
    for(var i=0;i< _categories.length;i++){
      categories.add(
          CategoryItem(
              index: i,
              category: _categories[i],
              onTap: (index){

              })
      );
    }
    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );
    return listView;

  }
}