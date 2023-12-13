
enum ClientIdEnum {
  unknown(label: "未知"),
  android(label: "安卓"),
  ios(label: "IOS"),
  windows(label: "Windows"),
  macos(label: "MacOS"),
  linus(label: "Linux");

  final String label;

  const ClientIdEnum({
    required this.label,
  });
}