import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBar1 extends StatelessWidget {
  TabBar1({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(
        title: Text("TABBAR"),
        bottom: TabBar(tabs: [
          Tab(text: "tab1",),
          Tab(text: "tab2",),
          Tab(text: "tab3",),
        ],),
        centerTitle: true,
      ),
      body: TabBarView(children: [
        ElevatedButton(onPressed: (){
          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text("Demo"),
              content: Text("Demo1"),
              actions: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(CupertinoIcons.back))
              ],
            );
          });
        }, child: Text("tab1")),
        ElevatedButton(onPressed: (){
          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text("Demo123"),
              content: Text("Demo456"),
              actions: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(CupertinoIcons.back))
              ],
            );
          });
        }, child: Text("tab2")),
        ElevatedButton(onPressed: (){
          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text("Demo"),
              content: Text("Demo1"),
              actions: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(CupertinoIcons.back))
              ],
            );
          });
        }, child: Text("tab3")),

      ],),
    ));
  }
}
