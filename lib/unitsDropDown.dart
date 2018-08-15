import 'package:flutter/material.dart';
import 'dart:collection';
class UnitsDropDown extends StatefulWidget{
  List<String> units = [];
  var callback;
  _UnitsDropDownState state;
  UnitsDropDown({
    @required this.units,
    @required this.callback
  });

  @override
  State<StatefulWidget> createState() {
    print(units);
    state =   _UnitsDropDownState(units: units,callback: callback);
    return state;
  }

  String getSelected(){
    print("getSelected");
    return state.selected();
  }

}
class _UnitsDropDownState extends State<UnitsDropDown>{
  var callback;
  List<DropdownMenuItem<String>> units = [];
  _UnitsDropDownState({@required units, @required this.callback}){
    for(String s in units){
      this.units.add(DropdownMenuItem(
          value: s,
          child: Container(
              child: Text(
                s,
                softWrap: true,
              ))));
    }
  }
  String dropdownSelected = null;
  

  String selected(){
    print("hello");
    print(dropdownSelected);
    return dropdownSelected;
  }
  @override
  Widget build(BuildContext context) {

    return DropdownButton(
        value:dropdownSelected,
        hint: Text("Select Input Unit"),
        items: units,
        onChanged: (s){
          setState(() {
            dropdownSelected = s;
          });
          callback(s);

        });
  }

}