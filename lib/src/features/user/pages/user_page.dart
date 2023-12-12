import 'package:flutter/material.dart';
import 'package:poem/src/features/user/widgets/navigation_item.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f2f3),
      appBar: AppBar(
        title: Text("用户"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code_scanner)),
          const SizedBox(width: 12,)
        ],
      ),
      body: CustomScrollView(
        slivers: [
          _buildInfo(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          const SliverToBoxAdapter(child:
            NavigationItem(title: "VIP", icon: Icons.diamond, link: '/vip')),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          _buildAgreements(),
          _buildSignOut(),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: const Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage("http://dummyimage.com/200x200"),
            ),
            SizedBox(width: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("wxr",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 6,),
                Text("signsignsignsignsign~"),
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
        "link": "/agreement/privacy"
      },
      {
        "title": "用户协议",
        "icon": Icons.article,
        "link": "/agreement/user"
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

  Widget _buildSignOut() {
    return SliverToBoxAdapter(
      child: FilledButton(
        onPressed: () {},
        child: const Text("退出登录"),
      ),
    );
  }
}
