import 'package:flutter/material.dart';
import 'unitsDropDown.dart';
import 'CategoryModel.dart';
class Converter extends StatefulWidget{
  final CategoryModel category;
  Converter({
    @required this.category
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ConverterState(category: category);
  }
}

class _ConverterState extends State<Converter>{
  CategoryModel category;
  _ConverterState({@required this.category});
  String _inputUnit = "";
  String _outputUnit = "";

  UnitsDropDown inputDD, outputDD;
  String _output="0.00";

  void _updateInput(String s){
    if(s.isEmpty || s == null){
      setState(() {
        _output = "0";
      });
    }else{
      final double d = double.parse(s);
      _update_conversion(d);
    }
  }
  void  _update_conversion(double a){
    double inputMul = category.conversionMap[_inputUnit];
    double outputMul = category.conversionMap[_outputUnit];
    double res = (a*inputMul)/outputMul;
    print(res.toString()+"res");
    setState(() {
      _output = res.toString();
    });
  }
  Widget _createBody(BuildContext context){
    List<String> k = [];
    for(String s in category.conversionMap.keys){
      k.add(s);

    }
    inputDD = UnitsDropDown(units:k, callback: (s){
      setState(() {
        _inputUnit = s;
      });
    },);
    outputDD = UnitsDropDown(units: k, callback: (s){
      setState(() {
        _outputUnit = s;
      });
    },);

    //Building the Converter Page UI
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey,
                  width: 2.0
              )
          ),
          margin: EdgeInsets.all(20.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400.0,
                  child: inputDD,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.0),
                child:TextField(
                  onChanged: _updateInput,
                  keyboardType: TextInputType.numberWithOptions(),
                ),
              )

            ],
          ),
        ),
        RotatedBox(
          child: Icon(Icons.swap_horiz, size: 50.0,),
          quarterTurns: 1,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey,
                  width: 2.0
              )
          ),
          margin: EdgeInsets.all(20.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: outputDD,
                  width: 400.0,
                ),

              ),
              Padding(
                padding: EdgeInsets.all(1.0),
                child:Text(_output),
              )

            ],
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.keyboard_backspace),
                onPressed: (){
                  Navigator.of(context).pop();
                }),
            backgroundColor: category.color,
            elevation: 0.0,
            centerTitle: true,
            title: Text(category.name)
        ),
        body:_createBody(context) ,
      ),
    );
  }
}