import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _bcontroller = TextEditingController();
  final TextEditingController _ccontroller = TextEditingController();
  final TextEditingController _dcontroller = TextEditingController();
  List<String> _operationList = ['+', '-', '*', '/'];    
  String _operationSelected = '+';
  double nume1 = 0.0, deno1 = 0.0, nume2 = 0.0, deno2 = 0.0, nume3 = 0.0, deno3 = 0.0, result = 0.0;
  String img = "assets/images/fractionimg.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fraction Calculator'),
        ),
        body: Column(
          children: <Widget>[
            Image.asset(img, height: 90.0,),
            Text("Fraction Calculator",style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w900)),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                    child: new TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _acontroller,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Roboto"),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w400),
                        hintText: "nume1",
                        border: OutlineInputBorder(
                          borderSide: BorderSide()
                        ),
                      ),
                    ),  
                  ),
                ),

                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                    child: new TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _bcontroller,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Roboto"),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w400),
                        hintText: "nume2",
                        border: OutlineInputBorder(
                          borderSide: BorderSide()
                        ),
                      ),
                    ),
                  ),
                ), 
              ],
            ), 
              
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Text("__________________",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Text("__________________",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                    child: new TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _ccontroller,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Roboto"),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w400),
                        hintText: "deno1",
                        border: OutlineInputBorder(
                          borderSide: BorderSide()
                        ),
                      ),
                    ),  
                  ),
                ),

                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                    child: new TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _dcontroller,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Roboto"),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w400),
                        hintText: "deno2",
                        border: OutlineInputBorder(
                          borderSide: BorderSide()
                        ),
                      ),
                    ),
                  ),
                ), 
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 10, 10),
                  child: Text("Choose Operation:",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                    child: SizedBox(
                      height: 30,
                      width: 60,
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: new DropdownButton<String>(
                          items: _operationList.map((String dropdownStringItem){
                            return DropdownMenuItem<String>(
                              value: dropdownStringItem,
                              child: Text(dropdownStringItem,
                                style: TextStyle(fontSize: 25.0,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String newValueSelected){
                            _onDropDownSelectedItem(newValueSelected);
                          },
                          value: _operationSelected,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue[200], width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(5.0),),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Result:",
                  style: TextStyle(fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: SizedBox(
                    height: 40,
                    width: 130,
                    child: Container(
                      child: Text("$nume3",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25.0,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w900,
                      ),
                      ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey[900], width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(5.0),),
                    ),
                    ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Text("_____________________",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    height: 40,
                    width: 130,
                    child: Container(
                      child: Text("$deno3",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25.0,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w900,
                      ),
                      ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey[900], width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(5.0),),
                    ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[ 
                Padding(
                  padding: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      color: Colors.blue[200],
                    child: Text("Calculate",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: _onPress,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      color: Colors.blue[200],
                    child: Text("Clear",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: _clear,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onPress(){
    setState(() {      
      nume1 = double.parse(_acontroller.text);
      nume2 = double.parse(_bcontroller.text);
      deno1 = double.parse(_ccontroller.text);
      deno2 = double.parse(_dcontroller.text);
      if (_operationSelected == '+'){  
        deno3 = gcd(deno1, deno2);
        nume3 = (nume1 * deno2) + (deno1 * nume2);
        deno3 = deno1 * deno2;
      }
      else if (_operationSelected == '-'){
        deno3 = gcd(deno1, deno2);
        nume3 = (nume1 * deno2) - (deno1 * nume2);
        deno3 = deno1 * deno2;
      }
      else if (_operationSelected == '*'){
        deno3 = gcd(deno1, deno2);
        nume3 = nume1 * nume2;
        deno3 = deno1 * deno2;
      }
      else if (_operationSelected == '/'){
        deno3 = gcd(deno1, deno2);
        nume3 = nume1 * deno2;
        deno3 = deno1 * nume2;
      }
      simplestform();
    });
  }
  
  double gcd(double y, double z){
    if (y == 0){
      return z;
    }
    else{
      return gcd(z % y, y);
    }
  }

  void simplestform(){
    double commonFactor = gcd(nume3, deno3);
    deno3 = deno3 / commonFactor;
    nume3 = nume3 / commonFactor;
  }

  void _clear(){
    setState(() {
      _acontroller.text = "";
      _bcontroller.text = "";
      _ccontroller.text = "";
      _dcontroller.text = "";
      nume3 = 0.0;
      deno3 = 0.0;
      _operationSelected = "+";
    });
  }
  
  void _onDropDownSelectedItem(String newValueSelected){
    setState(() {
      this._operationSelected = newValueSelected;
    });
  }

}