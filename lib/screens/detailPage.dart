import 'package:flutter/material.dart';
import '../model/movieModel.dart';



class DetailPage extends StatefulWidget {
  final Movies? movie;
  const DetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context){
    String splice = "${widget.movie?.release_date}";
    String result = splice.substring(0,4);
    return Scaffold(
      appBar: AppBar(
        title: Text((widget.movie?.release_date != null) ?
        "${widget.movie?.title} (${result})"
            :"${widget.movie?.title}",style: TextStyle(fontFamily: 'Montserrat',color: Colors.white,fontWeight: FontWeight.w700),),
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
              children : [
                Container(
                  child :
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 200, height: 300,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 6,
                                color: Colors.white12,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.network("${widget.movie?.cover_url}"))),
                        Padding(padding: const EdgeInsets.only(top:15.0)),
                        Text((widget.movie?.directed_by != null)
                            ? "Directed By : ${widget.movie?.directed_by}"
                            : "Directed By : TBA",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 23,fontFamily: 'Montserrat',),textAlign: TextAlign.center,),
                        Padding(padding: const EdgeInsets.only(top:8.0)),
                        Text(
                          (widget.movie?.overview != null) ? "${widget.movie?.overview}" : "TBA",
                          style: TextStyle(color: Colors.white,fontFamily: 'Montserrat',), textAlign: TextAlign.justify,
                        ),
                        Padding(padding: const EdgeInsets.only(top:20.0)),
                      ],
                    ),
                  ),

                ),

              ]
          ),
        ),
      ),
    );
  }
}
