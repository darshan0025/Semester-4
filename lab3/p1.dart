import 'dart:io';
void main() {
  print("Enter first int here:");
  int n1 = int.parse(stdin.readLineSync()!);
  print("Enter second int here:");
  int n2 = int.parse(stdin.readLineSync()!);
  for(int i=n1;i<n2;i++){
    if(i%2==0 && i%3!=0){
      print('Answer = $i');
    }
  }
}
