import 'dart:io';
void main() {
  print("Enter first int here:");
  int n1 = int.parse(stdin.readLineSync()!);
  print("Enter second int here:");
  int n2 = int.parse(stdin.readLineSync()!);
  print("Enter Third int here:");
  int n3 = int.parse(stdin.readLineSync()!);
  int ans=(n1>n2)?((n1>n3)?n1:n3):((n2>n3)?n2:n3);
  print("Answer = $ans");
}