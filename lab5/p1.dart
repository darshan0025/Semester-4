import 'dart:io';
void main(){
    List<int> list1= [];
    List<int> list2= [];
    List<int> list3= [];
    for(int i=0;i<5;i++){
        stdout.write("Enter number $i: ");
        int a =int.parse(stdin.readLineSync()!);
        list1.add(a);
    }
    for(int i=0;i<5;i++){
        stdout.write("Enter number $i: ");
        int a =int.parse(stdin.readLineSync()!);
        list2.add(a);
    }
    for(int i=0;i<5;i++){
        for(int j=0;j<5;j++){
            if(list1[i]==list2[j]){
                list3.add(list1[i]);
            }
        }
    }
    print(" ${list3}");
}