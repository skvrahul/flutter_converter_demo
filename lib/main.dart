import 'package:flutter/material.dart';
import 'converter.dart';
import 'categoryList.dart';
final _backgroundColor = Colors.green[100];
void main(){
  var main = MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
          backgroundColor: _backgroundColor,
          appBar: AppBar(
            backgroundColor: _backgroundColor,
            elevation: 0.0,
            title:
            Text('Unit Converter',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
              ),
            ),
            centerTitle: true,
          ),
          body: CategoryList()
      )
  );

  runApp(main);

}
