import 'package:flutter/material.dart';
class CategoryModel{
  Color color;
  String name;
  IconData icon;
  var conversionMap = {};
  CategoryModel({@required this.color, @required this.name, @required this.icon, unitMap}){
    if (unitMap != null) {
      conversionMap = unitMap;
    }
  }


  //Method to add units to the Category
  bool addUnit(String unitName, double conversion){
    if(conversionMap.containsKey(unitName)){
      return false;
    }else{
      conversionMap[unitName] = conversion;
      return true;
    }
  }

  void removeUnit(String unitName){
    if(conversionMap.containsKey(unitName)){
      conversionMap.remove(unitName);
    }
  }
}