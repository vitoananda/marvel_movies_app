import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_movies_app/helper/baseNetwork.dart';
import 'package:marvel_movies_app/model/movieModel.dart';
import 'package:marvel_movies_app/screens/loginPage.dart';


import 'detailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Marvel Cinematic Universe Movies",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),
            centerTitle: true,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                icon:
                Icon(
                    Icons.logout),
              ),
            ],
          ),
          body: Container(
            color: Colors.black87,
            padding: EdgeInsets.all(8),
            child: FutureBuilder(
              future: BaseNetwork.get("movies"),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasError) {
                  return _buildErrorSection();
                }
                if (snapshot.hasData) {
                  MoviesModel moviesModel = MoviesModel.fromJson(snapshot.data);
                  return _buildSuccessSection(moviesModel);
                }
                return _buildLoadingSection();
              },
            ),
          ),
        )
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(MoviesModel data) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: data.movies?.length,
        itemBuilder: (BuildContext context, int index) {
          final Movies? movies = data.movies?[index];
          String splice = "${data.movies?[index].release_date}";
          String result = splice.substring(0, 4);
          return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DetailPage(movie: movies)));
              },
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black26,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 5)),
                      Container(
                        width: 100,
                        height: 132,
                        decoration: BoxDecoration(
                          border: Border.all( //<-- SEE HERE
                            width: 3,
                            color: Colors.black87,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.25),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network("${data.movies?[index].cover_url}",height: 132,)
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text((data.movies?[index].release_date != null) ?
                        "${data.movies?[index].title} (${result})"
                            : "${data.movies?[index].title} (TBA)",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.white,fontFamily: 'Montserrat'),textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(
                        height: 2,
                      ),
                      Text("Duration : ${data.movies?[index].duration} Minutes",style: TextStyle(fontFamily: 'Montserrat',fontSize: 12,color: Colors.white),textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }
}
