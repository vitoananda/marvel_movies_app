import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Profile Page",style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'
          ),),
          backgroundColor: Colors.black,
          centerTitle: true,),
        body: Container(
          color: Colors.black87,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 290,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 6,
                        color: Colors.white12,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                          child: FittedBox(
                            fit: BoxFit.fill,
                              child: Image.asset("assets/photo.jpg"))
                )
          ,

                Padding(
                  padding: const EdgeInsets.only(bottom:20),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama  :   Salsha Nabilla Putri",style: TextStyle(fontFamily: 'Montserrat',color: Colors.white,fontWeight: FontWeight.w600,fontSize: 19),),
                    Padding(
                      padding: const EdgeInsets.only(bottom:15),
                    ),
                    Text("NIM      :   21120120140173",style: TextStyle(fontFamily: 'Montserrat',color: Colors.white,fontWeight: FontWeight.w600,fontSize: 19),),
                  ],
                )
              ],
            ),
          ),
        ),
        ),
      );
  }
}
