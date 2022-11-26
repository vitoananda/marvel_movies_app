import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("About Page",style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'
          ),),
          backgroundColor: Colors.black,
          centerTitle: true,),
        body: Container(
          width: 500,
          color: Colors.black87,
          child: Padding(
            padding: const  EdgeInsets.all(20.0),
                  child: ListView(
                    children: [
                      Container(
                        child: Center(
                          child: Column(
                      children: [
                              SizedBox(
                              width: 250,
                              height: 200,
                              child: Image.network(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Marvel_Logo.svg/2560px-Marvel_Logo.svg.png")),
                              Text("  Marvel Studios, LLC (awalnya dikenal sebagai Marvel Films dari 1993 hingga 1996) adalah sebuah perusahaan produksi film dan televisi Amerika Serikat yang merupakan anak perusahaan dari Walt Disney Studios, sebuah divisi dari Walt Disney Company. Marvel Studios memproduksi film dan serial Marvel Cinematic Universe, berdasarkan karakter yang muncul dalam publikasi Marvel Comics.",
                              style: TextStyle(fontFamily: 'Montserrat',color: Colors.white),textAlign: TextAlign.justify,),
                              Padding(padding: EdgeInsets.only(bottom: 10)),
                              Text("  Sejak 2008, Marvel Studios telah merilis 30 film dalam Marvel Cinematic Universe, dari Iron Man (2008) hingga Black Panther: Wakanda Forever (2022), delapan serial televisi sejak 2021, dari WandaVision (2021) hingga She-Hulk: Attorney at Law (2022), dan dua acara spesial televisi, Werewolf by Night (2022) dan The Guardians of the Galaxy Holiday Special (2022). Serial televisi What If...? (2021) adalah properti animasi pertama studio tersebut. Film, serial televisi, dan spesial televisi ini semuanya berbagi kesinambungan satu sama lain, bersama dengan film pendek One-Shots yang diproduksi oleh studio. Serial televisi yang diproduksi oleh Marvel Television juga mengakui kesinambungannya.",
                              style: TextStyle(fontFamily: 'Montserrat',color: Colors.white),textAlign: TextAlign.justify,),

                          ],
                        ),
                        )
                      ),
                    ]
                  ),
                )
                )

        ),
    );
  }
}
