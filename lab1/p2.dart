import 'dart:io';
void main(){
  print("Enter first int here:");
  int x = int.parse(stdin.readLineSync()!);
  print("Enter second int here:");
  int y = int.parse(stdin.readLineSync()!);
  print(x+y);
}