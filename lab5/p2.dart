import 'dart:io';
void main(){
  display();
}
void display(){
  List<int> list= [];
  for(int i=1;i<=5;i++){
    stdout.write("Enter number $i: ");
    int a =int.parse(stdin.readLineSync()!);
    list.add(a);
  }
  list.sort();
  print("The List in increasing order is $list");
}