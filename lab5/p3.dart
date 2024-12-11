import 'dart:io';
void main(){
  List<String> li = ["Delhi","Mumbai","Banglore","Hyderabad","Ahmedabad"];
  int india = li.indexOf("Ahmedabad");
  li[india]="surat";
  print(li);
}