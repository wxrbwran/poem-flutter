import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String link;
  const NavigationItem({super.key, required this.title, required this.icon, required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.grey.shade600,),
          const SizedBox(width: 12,),
          Text(title, style: TextStyle(fontSize: 18),),
          const Spacer(),
          Icon(Icons.navigate_next, color: Colors.grey.shade600,)
        ],
      )
    );
  }
}
