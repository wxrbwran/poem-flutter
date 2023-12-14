import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poem/src/features/user/controllers/auth_controller.dart';
import 'package:poem/src/features/user/controllers/user_controller.dart';
import 'package:poem/src/features/user/models/user_model.dart';
import 'package:poem/src/features/user/widgets/navigation_item.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    final authController = Get.put(AuthController());
    return Scaffold(
      backgroundColor: const Color(0xfff1f2f3),
      appBar: AppBar(
        title: Text("用户"),
        actions: [
          IconButton(onPressed: () {
            Get.toNamed("/settings");
          }, icon: const Icon(Icons.settings)),
          const SizedBox(width: 12,)
        ],
      ),
      body: CustomScrollView(
        slivers: [
          Obx(() => _buildInfo(userController.user.value)),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          const SliverToBoxAdapter(child:
            NavigationItem(title: "VIP", icon: Icons.diamond, link: '/vip')),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          _buildAgreements(),
          _buildSignOut(authController),
        ],
      ),
    );
  }

  Widget _buildInfo(UserModel? userModel) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(userModel?.avatar ?? "http://dummyimage.com/200x200"),
            ),
            const SizedBox(width: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userModel?.name ?? "用户名",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                const SizedBox(height: 6,),
                Text(userModel?.bio ?? "用户签名"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAgreements() {
    final titles = [
      {
        "title": "隐私协议",
        "icon": Icons.privacy_tip,
        "link": "/agreement?kind=privacy"
      },
      {
        "title": "用户协议",
        "icon": Icons.article,
        "link": "/agreement?kind=user"
      },
    ];
    return SliverList.separated(
        itemBuilder: (context, index) => NavigationItem(
          title: titles[index]["title"] as String,
          icon: titles[index]["icon"] as IconData,
          link: titles[index]["link"] as String,
        ),
        separatorBuilder: (context, index) => const Divider(
          height: 0, indent: 45,
          color: Colors.grey,
        ),
        itemCount: titles.length
    );
  }

  Widget _buildSignOut(AuthController authController) {
    return SliverToBoxAdapter(
      child: FilledButton(
        onPressed: () async {
          try {
            await authController.signOut();
            Get.offNamed("/signin");
          } catch(e) {
            debugPrint("$e");
          }
        },
        child: const Text("退出登录"),
      ),
    );
  }
}
