import 'package:flutter/material.dart';

class coustomErrorMasseg extends StatelessWidget {
 
  const coustomErrorMasseg({super.key, required this.Error});
 final String Error;
  @override
  Widget build(BuildContext context) {
    return Text(Error,style: TextStyle(fontSize: 25,color:Colors.white),);
  }
}
