import 'package:flutter/material.dart';

void main() {
  runApp(const Calculatrice());
}

class Calculatrice extends StatelessWidget {
  const Calculatrice
({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title:"Calculatrice de Daive",
      theme:ThemeData(primarySwatch: Colors.blue),
      home: const SimpleCalculatrice(),

    );
  }

}
class SimpleCalculatrice extends StatefulWidget {
  const SimpleCalculatrice({super.key});


  @override
  State<SimpleCalculatrice> createState() => _SimpleCalculatriceState();
}

class _SimpleCalculatriceState extends State<SimpleCalculatrice> {

  String equation ="0";
  String resultat = "0";
  String expression = "0";

  buttonPressed(String textButton){
    print(textButton);
    //permet d actualiser la vue ou sur l app
    setState(() {
      if(textButton =="C" )
      {
        equation = "0";
        resultat = "0";
      }
      else if(textButton == "del")
      {
        equation = equation.substring(0,equation.length-1);
        if(equation.isEmpty){
          equation = "0";
        }
      }
      else if(textButton == "="){
        // expresion
      }
      else
      {
        if(equation ==  )
            equation = equation + textButton;
      }
      
    });
   
  }

Widget calculatriceButton(String textButton, Color colorText,Color colorButton)
{
  return Container(
    height:MediaQuery.of(context).size.height * 0.1 ,
    color: colorButton,
    child:  MaterialButton(
      onPressed: ()=>buttonPressed(textButton) , 
  
      child: Text(textButton ,style: TextStyle(color: colorText, fontSize: 30,fontWeight: FontWeight.normal),),

      )
  );

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculatrice"),
      centerTitle: true,
      ),
      body: Column(children: [
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
          child:  Text(equation,style: const TextStyle(fontSize: 35),),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
          child: Text(resultat, style: const TextStyle(fontSize: 35),),
        ),
        const Expanded(child: Divider()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Table(
                  children:  [
                      TableRow(
                                children : [
                           calculatriceButton("c", Colors.redAccent, Colors.white),
                           calculatriceButton("del", Colors.blue, Colors.white),
                           calculatriceButton("%", Colors.blue, Colors.white),
                           calculatriceButton("÷", Colors.blue, Colors.white),
                       ]
                  ),
                  TableRow(
                                children : [
                           calculatriceButton("7", Colors.redAccent, Colors.white),
                           calculatriceButton("8", Colors.blue, Colors.white),
                           calculatriceButton("9", Colors.blue, Colors.white),
                           calculatriceButton("×", Colors.blue, Colors.white),
                       ]
                  ),
                  TableRow(
                                children : [
                           calculatriceButton("4", Colors.redAccent, Colors.white),
                           calculatriceButton("5", Colors.blue, Colors.white),
                           calculatriceButton("6", Colors.blue, Colors.white),
                           calculatriceButton("-", Colors.blue, Colors.white),
                       ]
                  ),
                  TableRow(
                                children : [
                           calculatriceButton("1", Colors.redAccent, Colors.white),
                           calculatriceButton("2", Colors.blue, Colors.white),
                           calculatriceButton("3", Colors.blue, Colors.white),
                           calculatriceButton("+", Colors.blue, Colors.white),
                       ]
                  ),
                  TableRow(
                                children : [
                           calculatriceButton(".", Colors.redAccent, Colors.white),
                           calculatriceButton("0", Colors.blue, Colors.white),
                           calculatriceButton("00", Colors.blue, Colors.white),
                           calculatriceButton("=", Colors.white, Colors.blue),
                       ]
                  ),
                  
                  
                  
                  
                  
              ],
            )
            ),
            
          ],
        )
      ],
      ),
    );
  }
}