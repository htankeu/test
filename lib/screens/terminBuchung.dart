import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';

class TerminBuchung extends StatefulWidget {
const TerminBuchung({ Key? key }) : super(key: key);

@override
_TerminBuchungState createState() => _TerminBuchungState();
}

class _TerminBuchungState extends State<TerminBuchung>{
  void _showDatePicker(){
  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1999), lastDate: DateTime(2030));
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Terminvereinbarung",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: _showDatePicker,
          color: const Color.fromARGB(255, 54, 47, 180),
          hoverColor: Pallete.gradient3,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "Choose Date",
              style: TextStyle(
                color: Pallete.whiteColor,
                fontSize: 25
              ),
            ),
            ), 
          ),
      )
    );
  }
}
