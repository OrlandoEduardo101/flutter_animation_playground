import 'package:flutter/material.dart';

class NewPage2 extends StatefulWidget {
  const NewPage2({Key? key,  required this.index}) : super(key: key);

  final int index;

  @override
  State<NewPage2> createState() => _NewPage2State();
}

class _NewPage2State extends State<NewPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Flutter Demo Home Page'),
      // ),
      body: Center(
        child: Material(
          child: Hero(
            tag: 'container-${widget.index}',
            child: Container(
              width: 300,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 20,),
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            tooltip: 'Next',
            child: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
