import 'package:flutter/material.dart';

import 'new_page2.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Hero(
            tag: 'container-$index',
            child: Material(
              child: InkWell(
                key: Key('InkWell-$index'),
                onTap: () async {
                  // Navigator.push(
                  //   context, MaterialPageRoute(builder: (context) => NewPage2(index: index)));
                  await Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 1000),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return NewPage2(index: index, user: {
                          'name': 'Orlando - $index'
                        },
                        );
                      },
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return Align(
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                    ),
                  );
                },
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    width: 300,
                    height: 50,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
