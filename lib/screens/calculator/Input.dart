import 'dart:async';

import 'package:dcalculator/design_code.dart';
import 'package:dcalculator/screens/calculator/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CalculatorInput extends StatelessWidget {
  late final StreamSink<SetItem> streamSink;
  late final int index;
  late final TextEditingController? controller;
  CalculatorInput(this.controller, this.streamSink, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Align(
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.blueAccent,
                width: 4,
              )
            ),
          ),
          child: TextField(
            keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
            textAlign: TextAlign.center,
            style: DesignCode.textStyleNumbersFirst,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              // labelText: value,
            ),
            controller: controller,
            onChanged: (value) {
              streamSink.add(SetItem(index: index, value: value.toString()));
            },
          )
        )
      )
    );
  }

}