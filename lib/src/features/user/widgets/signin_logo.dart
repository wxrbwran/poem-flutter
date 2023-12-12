import 'package:flutter/material.dart';

class SigninLogo extends StatelessWidget {
  const SigninLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          FlutterLogo(size: 64,),
          SizedBox(width: 16,),
          Text("诗文库",
            style: TextStyle(fontSize: 48)),
        ],
      ),
    );
  }
}
