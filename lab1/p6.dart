import 'dart:io';
void main(){
  print("Enter Weight here:");
  int w = int.parse(stdin.readLineSync()!);

  double Weight=w*0.45359237;
  print("Kg : $Weight");

  print("Enter Height here:");
  int H = int.parse(stdin.readLineSync()!);

  double Height=H*0.254;
  print("Meter : $Height");

  double BMI =((Weight)/Height*Height);
  print("$BMI");

}