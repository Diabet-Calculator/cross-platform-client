import 'package:dcalculator/design_code.dart';
import 'package:flutter/cupertino.dart';

class CalculatorListHeader extends StatelessWidget {
  const CalculatorListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 0.9,
              // heightFactor: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "ID",
                        style: DesignCode.textStyleNumbersFirst
                    )
                  // child: TextField(
                  //   style: const TextStyle(
                  //     fontSize: 15,
                  //   ),
                  //   controller: nameControllerList[index],
                  // )
                ),
              ),
            ),
          ),
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 0.5,
              // heightFactor: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "Вес,\nграмм",
                        style: DesignCode.textStyleNumbersFirst
                    )
                  // child: TextField(
                  //   style: const TextStyle(
                  //     fontSize: 15,
                  //   ),
                  //   controller: nameControllerList[index],
                  // )
                ),
              ),
            ),
          ),
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              // heightFactor: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "Углеводы,\n100г",
                        style: DesignCode.textStyleNumbersFirst
                    )
                  // child: TextField(
                  //   style: const TextStyle(
                  //     fontSize: 15,
                  //   ),
                  //   controller: nameControllerList[index],
                  // )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}