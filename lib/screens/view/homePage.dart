import 'package:flutter/material.dart';
import 'package:locationapp/screens/provider/homeProvider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class permission_Page extends StatefulWidget {
  const permission_Page({Key? key}) : super(key: key);

  @override
  State<permission_Page> createState() => _permission_PageState();

}

class _permission_PageState extends State<permission_Page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    permission();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff383838),
        appBar: AppBar(
          centerTitle: true,
          primary: false,
          toolbarHeight: 65,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.shade900),
          ),
          elevation: 00,
          title: Text('Locaton'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<Class_Provider>(context, listen: false)
                        .getPositon();
                  },
                  child: Text("Get Cordinates"),style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade900),),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 220,
                height: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color:Colors.blue.shade900, width: 2)),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "latitude: ${Provider.of<Class_Provider>(context, listen: true).lat}",style: TextStyle(color: Color(0xffffffff)),),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        "longitude: ${Provider.of<Class_Provider>(context, listen: true).lon}",style: TextStyle(color: Color(0xffffffff)),),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount:
                        Provider.of<Class_Provider>(context, listen: false)
                            .l2
                            .length,
                    itemBuilder: (Context, index) {
                      return Container(
                        margin: EdgeInsets.all(7),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blue.shade900, width: 2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                "Address:- \n\n${Provider.of<Class_Provider>(context, listen: true).l1[0]}",style: TextStyle(color: Color(0xffffffff)),),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  void permission() async {
    Map<Permission, PermissionStatus> map =
        await [Permission.location, Permission.camera].request();

    if (await Permission.camera.isDenied) {
      print("Camera Deny");
    }
    if (await Permission.location.isDenied) {
      print("location");
    }
  }
}
