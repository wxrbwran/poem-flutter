import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poem/src/config/colors.dart';
import 'package:poem/src/config/constants.dart';
import 'package:poem/src/features/enums/sex_enum.dart';
import 'package:poem/src/features/user/controllers/settings_controller.dart';
import 'package:poem/src/features/user/controllers/user_controller.dart';
import 'package:poem/src/features/user/widgets/settings_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    final settings = [
      {
        "title": "头像",
        "tailing": Obx(() => CircleAvatar(
            backgroundImage: NetworkImage(userController.user.value?.avatar ?? ""),
        )),
        "onTap": ()  => changeAvatar(context),
      },
      {
        "title": "昵称",
        "tailing": Obx(() => Text(userController.user.value?.name ?? "")),
        "onTap": ()  => changeName(context),
      },
      {
        "title": "性别",
        "tailing": Obx(() => Text(userController.user.value?.sex != null ?
          AppConstants.sexPlainText[userController.user.value!.sex] : "未知")),
        "onTap": ()  => changeSex(context),
      },
      {
        "title": "签名",
        "tailing": Obx(() => Text(userController.user.value?.bio ?? "用户暂未签名")),
        "onTap": ()  => changeBio(context),
      },
    ];
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(title: Text("编辑资料"),),
      body: CustomScrollView(
        slivers: [
          const SliverGap(20),
          SliverList.separated(
              itemCount: settings.length,
              itemBuilder: (context, index) => SettingsItem(
                  title: settings[index]["title"] as String,
                  onTap: settings[index]["onTap"] as Function(),
                  tailing: settings[index]["tailing"] as Widget,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 12)
          )
        ],
      ),
    );
  }

  void changeAvatar(BuildContext context) {
    final controller = Get.find<SettingsController>();

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Container(
          height: 400,
          child: CustomScrollView(
            slivers: [
              Obx(() => SliverToBoxAdapter(
                  child: controller.file.value == null ?
                  Container() :
                  Container(
                    height: 200,
                    width: 72,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: FileImage(
                          controller.file.value!,
                        )
                      ),
                    ),
                  )
              )),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: TextButton(
                    onPressed: () {
                      controller.pickAndCropImage(ImageSource.gallery);
                    },
                    child: Text("从相册选取"),
                  ),
                ),
              ),
              SliverGap(12),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: TextButton(
                    onPressed: () {
                      controller.pickAndCropImage(ImageSource.camera);
                    },
                    child: Text("拍摄"),
                  ),
                ),
              ),
              const SliverGap(12),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("取消"),
                  ),
                ),
              ),
            ]
          ),
        )
      )
    );
  }

  void changeName(BuildContext context) {
    final controller = Get.find<SettingsController>();
    final formKey = GlobalKey<FormState>();
    showModalBottomSheet(
        context: context,
        builder: (context) => SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.only(
                      // 键盘高度
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                        left: 12, right: 12, top: 16
                    ),
                    child: Column(
                      children: [
                        Form(
                          key: formKey,
                          child: TextFormField(
                            maxLength: 32,
                            decoration: const InputDecoration(
                              hintText: "请输入名字",
                            ),
                            validator: (v) {
                              if (v == null || v!.isEmpty)  {
                                return "名字不能为空";
                              }
                              return null;
                            },
                            initialValue: "",
                            onChanged: (v) {
                              controller.setName(v);
                            },
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 120,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('取消'),
                                ),
                              ),
                              Gap(12),
                              SizedBox(
                                width: 120,
                                child: FilledButton(
                                  onPressed: () {
                                    if (!formKey.currentState!.validate()) {
                                      return;
                                    }
                                    controller.saveName(controller.name.value).then((value){
                                      Get.snackbar("Success", "修改姓名成功");
                                    }).catchError((e) {
                                      Get.snackbar("Fail", "修改姓名失败");
                                    }).whenComplete(() => Navigator.of(context).pop());
                                  },
                                  child: Text('保存'),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                )
            )
        )
    );
  }

  void changeBio(BuildContext context) {
    final controller = Get.find<SettingsController>();
    final formKey = GlobalKey<FormState>();
    showModalBottomSheet(
        context: context,
        builder: (context) => SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.only(
                      // 键盘高度
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                        left: 12, right: 12, top: 16
                    ),
                    child: Column(
                      children: [
                        Form(
                            key: formKey,
                            child: TextFormField(
                              maxLength: 64,
                              decoration: const InputDecoration(
                                hintText: "请输入签名",
                              ),
                              validator: (v) {
                                if (v == null || v!.isEmpty)  {
                                  return "签名不能为空";
                                }
                                return null;
                              },
                              initialValue: "",
                              onChanged: (v) {
                                controller.setBio(v);
                              },
                            )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 120,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('取消'),
                                ),
                              ),
                              Gap(12),
                              SizedBox(
                                width: 120,
                                child: FilledButton(
                                  onPressed: () {
                                    if (!formKey.currentState!.validate()) {
                                      return;
                                    }
                                    controller.saveBio(controller.bio.value).then((value){
                                      Get.snackbar("Success", "修改签名成功");
                                    }).catchError((e) {
                                      Get.snackbar("Fail", "修改签名失败");
                                    }).whenComplete(() => Navigator.of(context).pop());
                                  },
                                  child: Text('保存'),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                )
            )
        )
    );
  }

  void changeSex(BuildContext context) {
    final controller = Get.find<SettingsController>();
    showModalBottomSheet(
        context: context,
        builder: (context) => SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.only(
                      // 键盘高度
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                        left: 12, right: 12, top: 16
                    ),
                    child: Column(
                      children: [
                        Obx(() => Column(
                          children: [
                            ...SexEnum.values.map((e) => ListTile(
                              title: Text(e.label),
                              leading: Radio(
                                value: e.index,
                                onChanged: (s) {
                                  debugPrint('$s');
                                  controller.setSex(s!);
                                },
                                groupValue: controller.sex.value,
                              ),
                            ))
                          ],
                        )),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 120,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('取消'),
                                ),
                              ),
                              Gap(12),
                              SizedBox(
                                width: 120,
                                child: FilledButton(
                                  onPressed: () {
                                    controller.saveSex(controller.sex.value).then((value){
                                      Get.snackbar("Success", "修改性别成功");
                                    }).catchError((e) {
                                      Get.snackbar("Fail", "修改性别失败");
                                    }).whenComplete(() => Navigator.of(context).pop());
                                  },
                                  child: Text('保存'),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                )
            )
        )
    );
  }

}
