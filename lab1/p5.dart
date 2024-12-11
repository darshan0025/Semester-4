import 'dart:io';
void main(){
  print("Enter Meter here:");
  int M = int.parse(stdin.readLineSync()!);
  double F=(M*0.304);
  print("Feet : $F");
}