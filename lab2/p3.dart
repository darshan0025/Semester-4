import 'dart:io';
void main() {
  print("Enter first int here:");
  int n1 = int.parse(stdin.readLineSync()!);
  print("Enter second int here:");
  int n2 = int.parse(stdin.readLineSync()!);
  print("Enter Third int here:");
  int n3 = int.parse(stdin.readLineSync()!);
  if (n1 > n2) {
    if (n1 > n3) {
      print("largest is n1: $n1 ");
    }
    else {
      print("largest is n3: $n3 ");
    }
  }
  else {
    if (n2 > n3) {
      print("largest is n2: $n2 ");
    }
    else {
      print("largest is n3: $n3 ");
    }
  }
}