import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

import '../../../controller/network/endpoint.dart';
import '../../../model/MoivesModel.dart';

class DetailsScreen extends StatefulWidget {
  MoivesModel moviemodel;


  DetailsScreen(this.moviemodel);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "${IMAGE_URL}${widget.moviemodel.poster_path}",
            fit: BoxFit.cover,
          ),
          BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.transparent.withOpacity(0.1),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      label: Container(
                        margin: EdgeInsets.only(left: 13),
                        child: Text(
                          "Back",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      )),
                  FlipCard(
                    fill: Fill.fillBack,
                    direction: FlipDirection.HORIZONTAL,

                    front: Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${IMAGE_URL}${widget.moviemodel.poster_path}"),
                              fit: BoxFit.cover)),
                    ),
                    back: Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${IMAGE_URL}${widget.moviemodel.poster_path}"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [

                        Expanded(
                            flex: 190,
                            child: Text(
                              "${widget.moviemodel.original_title}",
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            )),
                        Expanded(
                            flex: 70,
                            child: Text(
                              "${widget.moviemodel.vote_average}/10",
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            )),
                        
                        /*FloatingActionButton(onPressed: (){
                          return
                        });*/

                      ],
                    ),
                  ),

                  //overview
                  SizedBox(
                    height: MediaQuery.of(context).size.height /40,
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      "${widget.moviemodel.overview}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
