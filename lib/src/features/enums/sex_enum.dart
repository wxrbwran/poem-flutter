
enum SexEnum {
  unknown(label: "保密", value: 'unknown'),
  female(label: "女", value: "female"),
  male(label: "男", value: "male");

  final String label;
  final String value;

  const SexEnum({
    required this.label,
    required this.value
  });
}