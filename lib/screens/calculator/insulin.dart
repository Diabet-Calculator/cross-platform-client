import 'package:dcalculator/design_code.dart';
import 'package:flutter/cupertino.dart';

class TotalInsulin extends StatelessWidget {
  late final Stream<double> stream;
  TotalInsulin(this.stream, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: StreamBuilder(
              stream: stream,
              builder: (context, snapshot) {
                return Text(
                  ["Нужно инсулина", (snapshot.data ?? 0).toStringAsFixed(2)].join(" "),
                  textScaleFactor: 1.5,
                  style: DesignCode.textStyleFirst,
                );
              },
            ),
            // Text(
            //   ["Нужно инсулина:", totalInsulin.toStringAsFixed(2)].join(" "),
            //   textScaleFactor: 2,
            //   style: DesignCode.textStyleFirst,
            // )
        )
    );
  }
}