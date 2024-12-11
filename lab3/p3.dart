import 'dart:io';
void main() {
  print("Enter int here:");
  int n = int.parse(stdin.readLineSync()!);
  int count=0;
  for(int i=2;i<=n-1;i++){
    if(n%i==0){
      count++;
    }
  }
  if(count==0){
    print('number is prime');
  } else {
    print('number is not prime');
  }
}