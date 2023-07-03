import 'package:dcalculator/design_code.dart';
import 'package:dcalculator/screens/calculator/Input.dart';
import 'package:dcalculator/screens/calculator/bloc.dart';
import 'package:dcalculator/screens/calculator/header.dart';
import 'package:dcalculator/screens/calculator/insulin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Диабетический калькулятор'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final CalculatorBloc calculatorBloc = CalculatorBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(title, textScaleFactor: 1.5, style: DesignCode.textStyleSecond),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CalculatorListHeader(),
            Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
              ),
              height: 300,
              child: StreamBuilder(
                stream: calculatorBloc.list,
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      final item = snapshot.data?[index];

                      return Dismissible(
                        key: Key((item?.id ?? 0).toString()),
                        onDismissed: (direction) {
                          calculatorBloc.removeFromList.add(index);
                        },
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black
                                  )
                              )
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                child: FractionallySizedBox(
                                  widthFactor: 0.9,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          (index + 1).toString(),
                                          style: DesignCode.textStyleNumbersFirst
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: FractionallySizedBox(
                                  widthFactor: 0.5,
                                  child: CalculatorInput(
                                      calculatorBloc.getWeightController(item?.id ?? 0),
                                      calculatorBloc.setWeight,
                                      index
                                  ),
                                ),
                              ),
                              Flexible(
                                child: FractionallySizedBox(
                                  widthFactor: 0.8,
                                  child: CalculatorInput(
                                      calculatorBloc.getCarbohydratesController(item?.id ?? 0),
                                      calculatorBloc.setCarbohydrates,
                                      index
                                  ),
                                ),
                              ),
                            ],
                          )
                        )
                      );
                    }
                  );
                }
              ),
            ),
            TotalInsulin(calculatorBloc.totalInsulin)
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { calculatorBloc.addToList.add(null); },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}