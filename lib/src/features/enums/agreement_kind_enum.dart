
import 'package:poem/src/config/agreements.dart';

enum AgreementKindEnum {
  privacy(label: "隐私协议", value: 'privacy', content: Agreements.privacy),
  user(label: "用户协议", value: "user", content: Agreements.user);

  final String label;
  final String value;
  final String content;

  const AgreementKindEnum({
    required this.label,
    required this.value,
    required this.content,


  });
}