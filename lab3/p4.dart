import 'dart:io';
void main() {
  print("Enter int here:");
  int n = int.parse(stdin.readLineSync()!);
  int rem;
  int reverse=0;
  while (n != 0) {
    rem = n % 10;
    reverse = (reverse*10) + rem;
    n = n~/10;
  }
  print('number is $reverse');
}