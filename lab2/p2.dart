import 'dart:io';
void main(){
  print("Enter first int here:");
  double n1 = double.parse(stdin.readLineSync()!);
  print("Enter second int here:");
  double n2 = double.parse(stdin.readLineSync()!);
  double n3;
  print("Enter sine : ");
  String sine = stdin.readLineSync()!;
  if(sine=='+'){
    n3=n1+n2;
    print("Answer = $n3");
  } else
  if(sine=='-'){
    n3=n1-n2;
    print("Answer = $n3");
  } else
  if(sine=='*'){
    n3=n1*n2;
    print("Answer = $n3");
  } else
  if(sine=='/'){
    n3=n1/n2;
    print("Answer = $n3");
  }
}