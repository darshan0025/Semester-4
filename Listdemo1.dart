import 'package:flutter/material.dart';
import 'package:rushi161/Layout/splace_screen_1.dart';
import 'package:rushi161/Layout/tab.dart';

class Listdemo1 extends StatefulWidget {
  const Listdemo1({super.key});

  @override
  State<Listdemo1> createState() => _Listdemo1State();
}

class _Listdemo1State extends State<Listdemo1> {
  List<String> listdemo = ["A","B","C","D"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List View"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Text("Drawer")),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("About"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> TabBar1()));
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text("Contact"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SplashScreen()));
                },
              )
            ],
          ),
        ),
        body: ListView.builder(itemCount: listdemo.length,itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 1000,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  border: Border.all()
              ),
              child: Center(child:Image.asset("assets/image/printable-birthday-cards-beautiful-bouquet-bunch-flowers-400x400 (1).png")),
            ),
          );
        })
    );
  }
}
