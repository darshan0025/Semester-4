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

  if(per <35) {
    print("Fail");
  } else
  if(35<per && per<45) {
    print("Pass");
  } else
  if(45<per && per<60) {
    print("Second Class");
  } else
  if(60<per && per<70) {
    print("First Class");
  } else
  if(per>70) {
    print("Distinction");
  }
}