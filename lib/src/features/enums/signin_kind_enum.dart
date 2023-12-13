
enum SigninKindEnum {
  phone(label: "手机", value: 'phone'),
  email(label: "邮箱", value: "email");

  final String label;
  final String value;

  const SigninKindEnum({
    required this.label,
    required this.value
  });
}