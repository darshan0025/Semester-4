import 'dart:io';
void main(){
  print("Enter Fahrenheit here:");
  int F = int.parse(stdin.readLineSync()!);
  double C=((F-32)*5/9);
  print("Celsius : $C");
}