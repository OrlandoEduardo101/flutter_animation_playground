import 'package:flutter/material.dart';
import 'package:flutter_animation_playground/user_model.dart';

class NewPage2 extends StatefulWidget {
  const NewPage2({Key? key, required this.index, required this.user})
      : super(key: key);
  final UserModel user;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'container-${widget.index}',
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(widget.user.urlImage))),
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                widget.user.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            height: 20,
          ),
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
