import 'package:flutter/material.dart';


class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: Colors.red,
          )
        ],
      ),
   );
  }
}