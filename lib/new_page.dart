import 'package:flutter/material.dart';
import 'package:flutter_animation_playground/user_model.dart';

import 'new_page2.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final listUser = List.generate(20, (index) {
    if (index % 2 == 0) {
      return UserModel(
        name: 'User - $index',
        urlImage:
            'https://media.licdn.com/dms/image/C4D0BAQGN6mX4vupfPg/company-logo_200_200/0/1671656697345?e=2147483647&v=beta&t=z-6QxQIlCKluGCIxOpGhBYThHZ7-MX1qAC9t31mxLhM',
      );
    }
    return UserModel(
      name: 'User - $index',
      urlImage: 'https://yt3.ggpht.com/ytc/AKedOLQi9UpqABoSJK_Dw9LsULNHizpYfEaRya5437Wv=s900-c-k-c0x00ffffff-no-rj',
    );
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: listUser.length,
        itemBuilder: (context, index) {
          final item = listUser[index];
          return Material(
            child: Center(
              child: ListTile(
                leading: Hero(
                  tag: 'container-$index',
                  child: CircleAvatar(
                    child: Image.network(item.urlImage),
                  ),
                ),
                title: Text(item.name),
                onTap: () async {
                  await Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 1500),
                      pageBuilder:
                          (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                        return NewPage2(
                          index: index,
                          user: item,
                        );
                      },
                      transitionsBuilder: (BuildContext context, Animation<double> animation,
                          Animation<double> secondaryAnimation, Widget child) {
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
              ),
            ),
          );
        },
      )),
    );
  }
}
