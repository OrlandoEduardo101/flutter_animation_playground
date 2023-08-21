import 'package:flutter/material.dart';
import 'package:flutter_animation_playground/animated_list.dart';
import 'package:flutter_animation_playground/new_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  //implicitas

  //Container #1
  double containerHeight1 = 30;
  double containerTopPosition1 = 0;
  double containerwidth1 = 30;
  double containerLeftPosition1 = 0;
  int counter = 1;
  Color containerColor1 = Colors.red;
  BoxShape shape1 = BoxShape.rectangle;

  void _updateContainer1() {
    setState(() {
      if (containerwidth1 == 60) {
        containerwidth1 = 30;
        containerHeight1 = 30;
        containerTopPosition1 = 0;
      } else {
        containerwidth1 = 60;
        containerHeight1 = 100;
        containerTopPosition1 = 50;
      }
    });
  }

  //Container #2
  double containerHeight2 = 50;
  double containerTopPosition2 = 200;
  double containerwidth2 = 50;
  double containerLeftPosition2 = 0;
  Color containerColor2 = Colors.green;
  BoxShape shape2 = BoxShape.rectangle;

  void _updateContainer2() {
    setState(() {
      if (containerLeftPosition2 == 200) {
        containerLeftPosition2 = 0;
        shape2 = BoxShape.rectangle;
        containerColor2 = Colors.green;
      } else {
        containerLeftPosition2 = 200;
        shape2 = BoxShape.circle;
        containerColor2 = Colors.brown;
      }
    });
  }

  //Container #3
  double containerHeight3 = 100;
  double containerTopPosition3 = 100;
  double containerwidth3 = 100;
  double containerBorderRadius3 = 0;
  double containerOpacity3 = 0;
  double containerLeftPosition3 = 300;
  Color containerColor3 = Colors.deepPurple;
  BoxShape shape3 = BoxShape.rectangle;

  void _updateContainer3() {
    setState(() {
      if (containerOpacity3 == 1) {
        containerBorderRadius3 = 0;
        containerOpacity3 = 0;
        // containerHeight3 = 100;
        // containerwidth3 = 100;
      } else {
        containerBorderRadius3 = 40;
        containerOpacity3 = 1;
        // containerHeight3 = 250;
        // containerwidth3 = 250;
      }
    });
  }

  //controladas
  // late AnimationController animationController;
  // double value = 0.0;

  // @override
  // void initState() {
  //   super.initState();
  //   animationController = AnimationController(
  //       vsync: this,
  //       value: value,
  //       lowerBound: value,
  //       upperBound: 100,
  //       duration: const Duration(milliseconds: 5000));

  //   animationController.addListener(() {
  //     setState(() {
  //       value = animationController.value;
  //     });
  //   });
  // }

  // dynamic run() {
  //   if (animationController.isCompleted) {
  //     return animationController.reverse();
  //   }
  //   return animationController.forward();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kToolbarHeight),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // controlada
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     const SizedBox(
            //       height: 300,
            //     ),
            //     Text(
            //       'Download progress',
            //       style: Theme.of(context).textTheme.headline6,
            //     ),
            //     const SizedBox(
            //       height: 15,
            //     ),
            //     Text(
            //       '${value.toStringAsFixed(2)} %',
            //       style: Theme.of(context).textTheme.headline4,
            //     ),
            //     const SizedBox(
            //       height: 15,
            //     ),
            //     LayoutBuilder(builder: (context, constraits) {
            //       return Align(
            //         alignment: Alignment.centerLeft,
            //         child: Container(
            //           width: value * (constraits.maxWidth / 100),
            //           height: 20,
            //           color: Colors.green,
            //         ),
            //       );
            //     })
            //   ],
            // ),
            //implicita
            //Container #1
            AnimatedPositioned(
              top: containerTopPosition1,
              left: containerLeftPosition1,
              duration: const Duration(milliseconds: 800),
              child: InkWell(
                onTap: _updateContainer1,
                child: AnimatedContainer(
                  onEnd: () {
                    // _updateContainer();
                    _updateContainer2();
                  },
                  margin: const EdgeInsets.all(8.0),
                  duration: const Duration(milliseconds: 800),
                  height: containerHeight1,
                  width: containerwidth1,
                  decoration: BoxDecoration(color: containerColor1, shape: shape1),
                ),
              ),
            ),

            //Container #2
            AnimatedPositioned(
              top: containerTopPosition2,
              left: containerLeftPosition2,
              duration: const Duration(milliseconds: 800),
              child: AnimatedContainer(
                onEnd: () {
                  _updateContainer3();
                },
                margin: const EdgeInsets.all(8.0),
                duration: const Duration(milliseconds: 800),
                height: containerHeight2,
                width: containerwidth2,
                decoration: BoxDecoration(color: containerColor2, shape: shape2),
              ),
            ),

            //Container #3
            AnimatedPositioned(
              top: containerTopPosition3,
              left: containerLeftPosition3,
              duration: const Duration(milliseconds: 800),
              child: AnimatedOpacity(
                opacity: containerOpacity3,
                duration: const Duration(milliseconds: 200),
                child: AnimatedContainer(
                  onEnd: () {
                    _updateContainer1();
                  },
                  margin: const EdgeInsets.all(8.0),
                  duration: const Duration(milliseconds: 1000),
                  height: containerHeight3,
                  width: containerwidth3,
                  decoration: BoxDecoration(
                    color: containerColor3,
                    shape: shape3,
                    borderRadius: BorderRadius.circular(containerBorderRadius3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // FloatingActionButton(
          //   onPressed: run,
          //   tooltip: 'Run',
          //   child: const Icon(Icons.play_arrow),
          // ),
          const SizedBox(
            height: 20,
          ),
          //Animated List Demo
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimatedListSample()));
            },
            tooltip: 'Animated List',
            child: const Icon(Icons.list),
          ),
          const SizedBox(
            height: 20,
          ),
          //Hero Demo
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPage()));
            },
            tooltip: 'Next',
            child: const Icon(Icons.next_plan_outlined),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   //implicitas
//   double containerHeight = 30;
//   double containerTopPosition = 0;
//   double containerwidth = 30;
//   double containerLeftPosition = 0;
//   int counter = 1;
//   Color containerColor = Colors.red;
//   BoxShape shape = BoxShape.rectangle;

//   void _updateContainer() {
//     setState(() {
//       if (containerwidth == 30) {
//         containerwidth = 180;
//       } else if (containerwidth == 180) {
//         containerwidth = 50;
//       } else {
//         containerwidth = 30;
//       }

//       if (containerHeight == 30) {
//         containerHeight = 50;
//       } else if (containerHeight == 50) {
//         containerHeight = 180;
//       } else {
//         containerHeight = 30;
//       }

//       if (containerTopPosition == 0) {
//         containerTopPosition = 480;
//       } else if (containerTopPosition == 480) {
//         containerTopPosition = 80;
//       } else {
//         containerTopPosition = 0;
//       }

//       if (containerLeftPosition == 0) {
//         containerLeftPosition = 480;
//       } else if (containerLeftPosition == 480) {
//         containerLeftPosition = 0;
//       } else if (containerLeftPosition == 80) {
//         containerLeftPosition = 480;
//       } else {
//         containerLeftPosition = 80;
//       }

//       if (containerColor == Colors.red) {
//         containerColor = Colors.blue;
//       } else if (containerColor == Colors.blue) {
//         containerColor = Colors.green;
//       } else {
//         containerColor = Colors.red;
//       }

//       if (counter % 5 == 0) {
//         shape = BoxShape.circle;
//       } else {
//         shape = BoxShape.rectangle;
//       }
//       counter++;
//     });
//   }

//   //controladas
//   late AnimationController animationController;
//   double value = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(
//         vsync: this,
//         value: value,
//         lowerBound: value,
//         upperBound: 100,
//         duration: const Duration(milliseconds: 5000));

//     animationController.addListener(() {
//       setState(() {
//         value = animationController.value;
//       });
//     });
//   }

//   dynamic run() {
//     if (animationController.isCompleted) {
//       return animationController.reverse();
//     }
//     return animationController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(kToolbarHeight),
//         child: Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             // controlada
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 100,
//                 ),
//                 const SizedBox(
//                   height: 200,
//                 ),
//                 Text(
//                   'Download progress',
//                   style: Theme.of(context).textTheme.headline6,
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Text(
//                   '${value.toStringAsFixed(2)} %',
//                   style: Theme.of(context).textTheme.headline4,
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 LayoutBuilder(builder: (context, constraits) {
//                   return Align(
//                     alignment: Alignment.centerLeft,
//                     child: Container(
//                       width: value * (constraits.maxWidth / 100),
//                       height: 20,
//                       color: Colors.green,
//                     ),
//                   );
//                 })
//               ],
//             ),
//             //implicita
//             AnimatedPositioned(
//               top: containerTopPosition,
//               left: containerLeftPosition,
//               duration: const Duration(milliseconds: 500),
//               child: InkWell(
//                 onTap: _updateContainer,
//                 child: AnimatedContainer(
//                   onEnd: () {
//                     // _updateContainer();
//                   },
                  
//                   margin: const EdgeInsets.all(8.0),
//                   duration: const Duration(milliseconds: 500),
//                   height: containerHeight,
//                   width: containerwidth,
//                   decoration:
//                       BoxDecoration(color: containerColor, shape: shape),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: run,
//             tooltip: 'Run',
//             child: const Icon(Icons.play_arrow),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           //Hero Demo
//           FloatingActionButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const NewPage()));
//             },
//             tooltip: 'Next',
//             child: const Icon(Icons.next_plan_outlined),
//           ),
//         ],
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
