import 'package:dcalculator/screens/calculator/bloc.dart';
import 'package:flutter/cupertino.dart';

class CalculatorPage extends StatelessWidget {
  final CalculatorBloc calculatorBloc = CalculatorBloc();

  CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (context, snapshot) {
          return Text(snapshot.data.toString());
        }
    );
  }
}