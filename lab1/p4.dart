import 'dart:io';
void main(){
  print("Enter First Subject Mark here:");
  int s1 = int.parse(stdin.readLineSync()!);

  print("Enter Second Subject Mark here:");
  int s2 = int.parse(stdin.readLineSync()!);

  print("Enter Third Subject Mark here:");
  int s3 = int.parse(stdin.readLineSync()!);

  print("Enter Fourth Subject Mark here:");
  int s4 = int.parse(stdin.readLineSync()!);

  print("Enter Fifth Subject Mark here:");
  int s5 = int.parse(stdin.readLineSync()!);

  double per=((s1+s2+s3+s4+s5)/500*100);
  print("Percentage : $per");
}