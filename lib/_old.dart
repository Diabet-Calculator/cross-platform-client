
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   Map<int, TextEditingController> nameControllerList = {};
//   Map<int, TextEditingController> weightControllerList = {};
//   Map<int, TextEditingController> carbohydratesControllerList = {};
//   List<Carbohydrates> carbohydratesList = [Carbohydrates(0, "", 100, 0)];
//   double totalInsulin = 0.0;
//   int count = 0;
//   final locker = Mutex();
//   // bool isActive = true;
//   // final ValueNotifier _isLoadingNotifier = ValueNotifier(false);
//
//   @override
//   void initState() {
//     super.initState();
//     totalInsulin = Calculator.calculateTotalInsulin(carbohydratesList);
//
//     for (var index = 0; index < carbohydratesList.length; index++) {
//       final currentCount = count;
//       // nameControllerList.insert(0, TextEditingController(text: carbohydratesList[index].name));
//       weightControllerList[currentCount] = TextEditingController(text: carbohydratesList[index].weight.toString());
//       weightControllerList[currentCount]?.addListener(() {
//         final index = carbohydratesList.indexWhere((element) => element.id == currentCount);
//         setState(() {
//           carbohydratesList[index].weight = int.parse(weightControllerList[currentCount]!.text);
//           totalInsulin = Calculator.calculateTotalInsulin(carbohydratesList);
//         });
//       });
//       carbohydratesControllerList[currentCount] = TextEditingController(text: carbohydratesList[index].carbohydrates.toString());
//       carbohydratesControllerList[currentCount]?.addListener(() {
//         final index = carbohydratesList.indexWhere((element) => element.id == currentCount);
//         setState(() {
//           carbohydratesList[index].carbohydrates = int.parse(carbohydratesControllerList[currentCount]!.text);
//           totalInsulin = Calculator.calculateTotalInsulin(carbohydratesList);
//         });
//       });
//
//       count = count + 1;
//     }
//   }
//
//   void _addNewLine() {
//     locker.acquire();
//
//     setState(() {
//       // TODO: Исправить, сделать так, чтобы расчеты не ломались при быстром добавлении
//       // Тут можно использовать add(), то есть вставлять без привязки к индексу. А потом в конце сортировать
//       final currentCount = count;
//       carbohydratesList.insert(0, Carbohydrates(currentCount, "", 100, 0));
//       final elementId = carbohydratesList.first.id;
//
//       // nameControllerList.insert(0, TextEditingController(text: carbohydratesList.first.name));
//       weightControllerList[elementId] = TextEditingController(text: carbohydratesList.first.weight.toString());
//       weightControllerList[elementId]?.addListener(() {
//         final index = carbohydratesList.indexWhere((element) => element.id == elementId);
//         setState(() {
//           carbohydratesList[index].weight = int.parse(weightControllerList[elementId]!.text);
//           totalInsulin = Calculator.calculateTotalInsulin(carbohydratesList);
//         });
//       });
//       carbohydratesControllerList[elementId] = TextEditingController(text: carbohydratesList.first.carbohydrates.toString());
//       carbohydratesControllerList[elementId]?.addListener(() {
//         final index = carbohydratesList.indexWhere((element) => element.id == elementId);
//         setState(() {
//           carbohydratesList[index].carbohydrates = int.parse(carbohydratesControllerList[elementId]!.text);
//           totalInsulin = Calculator.calculateTotalInsulin(carbohydratesList);
//         });
//       });
//
//       totalInsulin = Calculator.calculateTotalInsulin(carbohydratesList);
//       count = count + 1;
//
//       locker.release();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         title: Text(widget.title, textScaleFactor: 1.5, style: DesignCode.textStyleSecond),
//       ),
//       body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const SizedBox(
//                 height: 50,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Flexible(
//                       child: FractionallySizedBox(
//                         widthFactor: 0.9,
//                         // heightFactor: 1,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 10),
//                           child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                   "ID",
//                                   style: DesignCode.textStyleNumbersFirst
//                               )
//                             // child: TextField(
//                             //   style: const TextStyle(
//                             //     fontSize: 15,
//                             //   ),
//                             //   controller: nameControllerList[index],
//                             // )
//                           ),
//                         ),
//                       ),
//                     ),
//                     Flexible(
//                       child: FractionallySizedBox(
//                         widthFactor: 0.5,
//                         // heightFactor: 1,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 10),
//                           child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                   "Вес,\nграмм",
//                                   style: DesignCode.textStyleNumbersFirst
//                               )
//                             // child: TextField(
//                             //   style: const TextStyle(
//                             //     fontSize: 15,
//                             //   ),
//                             //   controller: nameControllerList[index],
//                             // )
//                           ),
//                         ),
//                       ),
//                     ),
//                     Flexible(
//                       child: FractionallySizedBox(
//                         widthFactor: 0.8,
//                         // heightFactor: 1,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 10),
//                           child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                   "Углеводы,\n100г",
//                                   style: DesignCode.textStyleNumbersFirst
//                               )
//                             // child: TextField(
//                             //   style: const TextStyle(
//                             //     fontSize: 15,
//                             //   ),
//                             //   controller: nameControllerList[index],
//                             // )
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 decoration: const BoxDecoration(
//                   // color: Colors.grey[100],
//                   border: Border.symmetric(
//                     horizontal: BorderSide(
//                       color: Colors.grey,
//                       width: 2,
//                     ),
//                   ),
//                 ),
//                 height: 300,
//                 child: ListView.builder(
//                     physics: const ClampingScrollPhysics(),
//                     shrinkWrap: true,
//                     scrollDirection: Axis.vertical,
//                     itemCount: carbohydratesList.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final item = carbohydratesList[index];
//                       // carbohydratesList.forEach((element) {
//                       //   debugPrint("INNER_DEBUG::${element.id}");
//                       // });
//                       // debugPrint("DEBUG::${weightControllerList.asMap().keys}");
//
//                       return Dismissible(
//                         key: Key(carbohydratesList[index].id.toString()),
//                         onDismissed: (direction) {
//                           locker.acquire();
//                           setState(() {
//                             // debugPrint("DEBUG::${index.toString()}");
//
//                             // nameControllerList.removeAt(index);
//                             carbohydratesList.removeAt(index);
//                             weightControllerList.remove(item.id);
//                             carbohydratesControllerList.remove(item.id);
//                             totalInsulin = Calculator.calculateTotalInsulin(carbohydratesList);
//                             locker.release();
//                           });
//                         },
//                         child: Container(
//                             height: 50,
//                             decoration: const BoxDecoration(
//                                 border: Border(
//                                     bottom: BorderSide(
//                                         color: Colors.black
//                                     )
//                                 )
//                               // border: Border.all(
//                               //   color: Colors.blueAccent,
//                               // ),
//                               // color: Colors.white,
//                               // borderRadius: BorderRadius.circular(20)
//                             ),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 Flexible(
//                                   child: FractionallySizedBox(
//                                     widthFactor: 0.9,
//                                     // heightFactor: 1,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(left: 10),
//                                       child: Align(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                               (index + 1).toString(),
//                                               style: DesignCode.textStyleNumbersFirst
//                                           )
//                                         // child: TextField(
//                                         //   style: const TextStyle(
//                                         //     fontSize: 15,
//                                         //   ),
//                                         //   controller: nameControllerList[index],
//                                         // )
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Flexible(
//                                   child: FractionallySizedBox(
//                                     widthFactor: 0.5,
//                                     // heightFactor: 1,
//                                     child: Center(
//                                       child: Align(
//                                         alignment: Alignment.center,
//                                         child: Container(
//                                             decoration: const BoxDecoration(
//                                               border: Border(
//                                                 // left: BorderSide(
//                                                 //   color: Colors.black
//                                                 // ),
//                                                 // right: BorderSide(
//                                                 //   color: Colors.black
//                                                 // ),
//                                                   bottom: BorderSide(
//                                                     color: Colors.blueAccent,
//                                                     width: 4,
//                                                   )
//                                               ),
//                                             ),
//                                             child: TextField(
//                                               keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
//                                               textAlign: TextAlign.center,
//                                               style: DesignCode.textStyleNumbersFirst,
//                                               decoration: const InputDecoration(
//                                                 filled: true,
//                                                 fillColor: Colors.white,
//                                                 border: InputBorder.none,
//                                                 // contentPadding: EdgeInsets.only(bottom: 25)
//                                               ),
//                                               controller: weightControllerList[item.id],
//                                               onChanged: (value) {
//                                                 setState(() {
//                                                 });
//                                               },
//                                             )
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Flexible(
//                                     child: FractionallySizedBox(
//                                         widthFactor: 0.8,
//                                         // heightFactor: 1,
//                                         child: Align(
//                                             alignment: Alignment.centerLeft,
//                                             child: Container(
//                                                 decoration: const BoxDecoration(
//                                                   border: Border(
//                                                     // left: BorderSide(
//                                                     //     color: Colors.black
//                                                     // ),
//                                                     // right: BorderSide(
//                                                     //     color: Colors.black
//                                                     // ),
//                                                       bottom: BorderSide(
//                                                         color: Colors.blueAccent,
//                                                         width: 4,
//                                                       )
//                                                   ),
//                                                 ),
//                                                 child: TextField(
//                                                   keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
//                                                   textAlign: TextAlign.center,
//                                                   style: DesignCode.textStyleNumbersFirst,
//                                                   decoration: const InputDecoration(
//                                                     filled: true,
//                                                     fillColor: Colors.white,
//                                                     border: InputBorder.none,
//                                                   ),
//                                                   controller: carbohydratesControllerList[item.id],
//                                                   onChanged: (value) {
//                                                     setState(() {
//                                                       // carbohydratesList[index].carbohydrates = int.parse(carbohydratesControllerList[index].text);
//                                                     });
//                                                   },
//                                                 )
//                                             )
//                                         )
//                                     )
//                                 ),
//                               ],
//                             )
//                         ),
//                       );
//                     }
//                 ),
//               ),
//               Center(
//                   child: Padding(
//                       padding: const EdgeInsets.only(top: 20),
//                       child: Text(
//                         ["Нужно инсулина:", totalInsulin.toStringAsFixed(2)].join(" "),
//                         textScaleFactor: 2,
//                         style: DesignCode.textStyleFirst,
//                       )
//                   )
//               )
//             ],
//           )
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addNewLine,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//
//       // ValueListenableBuilder(
//       //   valueListenable: _isLoadingNotifier,
//       //   builder: (context, isLoading, _) {
//       //     debugPrint("DEBUG::$isLoading");
//       //     debugPrint("DEBUG::$isActive");
//       //     return
//       //   }
//       // ),
//     );
//   }
// }