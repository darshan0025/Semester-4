import 'dart:io';
void main(){
  print("Enter first int here:");
  int n = int.parse(stdin.readLineSync()!);
  if(n>0){
    print("Enter Number is Positive ");
  } else {
    print("Enter Number is Negative ");
  }
}