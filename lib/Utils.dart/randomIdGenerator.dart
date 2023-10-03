import 'dart:math';
String generateRandomId() {
  final random = Random();
  final randomNumber = random.nextInt(100000);
  return randomNumber.toString();
}
