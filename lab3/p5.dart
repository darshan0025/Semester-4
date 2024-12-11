import 'dart:io';
void main() {
  String s = stdin.readLineSync()!;
  String r = "";
  String ch;
  List<String> list = s.split(' ');
  for (int i = 0; i < list.length;i++){
    ch=list[i];
    r=ch+r;
  }
  print('$r');
}
