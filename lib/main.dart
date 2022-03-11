import 'package:flutter/material.dart';
import 'calculadora.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Minha calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final txt = TextEditingController();
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.centerRight,
                          child: Text(
                            userInput,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          color: Colors.white70,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          alignment: Alignment.centerRight,
                          child: Text(
                            answer,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.white60,
                        )
                      ]),
                color: Colors.black12,
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(children: [
                  Expanded(
                    child: Row(children: [
                      botaoNumero(Colors.pink, "7"),
                      botaoNumero(Colors.purple, "8"),
                      botaoNumero(Colors.lightBlueAccent, "9"),
                      botaoNumero(Colors.brown, "/"),
                      Expanded(
                        child: Container(child: ElevatedButton(
                          style: TextButton.styleFrom(backgroundColor: Colors.pink),
                          onPressed: (){
                            setState(() {
                              if("." == userInput.substring(userInput.length-1)){
                                existePonto = false;
                              }
                              userInput = userInput.substring(0, userInput.length - 1);

                            });
                          },
                          onLongPress: (){
                            setState(() {
                              existePonto = false;
                              userInput = "";
                              answer = "";
                            });
                          },
                          child: Text("←", style: new TextStyle(fontSize: 30),),
                        ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          margin: new EdgeInsets.all(2.0),
                        ),
                      ),
                    ],),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(children: [
                      Expanded(
                        flex: 4,
                        child: Column(children: [
                          Expanded(
                            child: Row(children: [
                              botaoNumero(Colors.blue, "4"),
                              botaoNumero(Colors.orange, "5"),
                              botaoNumero(Colors.lightGreenAccent, "6"),
                              botaoNumero(Colors.black, "*"),
                            ],),
                          ),
                          Expanded(
                            child: Row(children: [
                              botaoNumero(Colors.brown, "1"),
                              botaoNumero(Colors.blueGrey, "2"),
                              botaoNumero(Colors.black12, "3"),
                              botaoNumero(Colors.green, "-"),
                            ],),
                          ),
                        ],),
                      ),
                      Expanded(
                          child: Container(child: ElevatedButton(
                            style: TextButton.styleFrom(backgroundColor: Colors.black38),
                            onPressed: (){
                            },
                            child: Text("", style: new TextStyle(fontSize: 30),),
                          ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            margin: new EdgeInsets.all(2.0),
                          )
                      ),
                    ],),
                  ),
                  Expanded(
                    child: Row(children: [
                      botaoNumero(Colors.pinkAccent, "0"),
                      Expanded(
                        child: Container(child: ElevatedButton(
                          style: TextButton.styleFrom(backgroundColor: Colors.red),
                          onPressed: (){
                            setState(() {
                              userInput += validaConta(userInput, ".");
                            });
                          },
                          child: Text(",", style: new TextStyle(fontSize: 30),),
                        ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          margin: new EdgeInsets.all(2.0),
                        ),
                      ),
                      Expanded(
                          child: Container(child: ElevatedButton(
                            style: TextButton.styleFrom(backgroundColor: Colors.yellow),
                            onPressed: (){
                            },
                            child: Text("", style: new TextStyle(fontSize: 30),),
                          ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            margin: new EdgeInsets.all(2.0),
                          )
                      ),
                      botaoNumero(Colors.orange, "+"),
                      Expanded(
                          child: Container(child: ElevatedButton(
                            style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                            onPressed: (){
                              setState(() {
                                answer = calcula(userInput);
                              });
                              if(!userInput.contains(".")){
                                existePonto = false;
                              } else {
                                existePonto = true;
                              }
                            },
                            child: Text("=", style: new TextStyle(fontSize: 30),),
                          ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            margin: new EdgeInsets.all(2.0),
                          )
                      ),
                    ],),
                  ),
                ],),
              )
            ]
        ),

      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget botaoNumero( Color cor, String texto){
    return Expanded(
      child: Container(
        child: ElevatedButton(
          style: TextButton.styleFrom(backgroundColor: cor),
          onPressed: (){
            setState(() {
              userInput += validaConta(userInput, texto);
            });
          },
          child: Text(texto, style: new TextStyle(fontSize: 30),),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: new EdgeInsets.all(2.0),
      )
    );
  }
}
