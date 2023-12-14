import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Widget? tailing;
  const SettingsItem({super.key, required this.title, this.onTap, this.tailing});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(onTap != null) {
          onTap!();
        }
      },
      child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Row(
            children: [
              Text(title),
              Spacer(),
              if (tailing != null) tailing!,
              Icon(Icons.navigate_next,color: Colors.grey.shade500)
            ],
          )
      ),
    );
  }
}
