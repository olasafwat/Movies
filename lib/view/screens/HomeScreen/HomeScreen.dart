import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:moives/controller/provider/GetPopular.dart';
import 'package:moives/view/components/card/CardPopular.dart';
import 'package:moives/view/components/textcomp/CustomText.dart';
import 'package:moives/view/screens/DetailsScreen/DetailsScreen.dart';
import 'package:provider/provider.dart';

import '../../../controller/network/endpoint.dart';
import '../../../controller/provider/GetTopRate.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: CustomText(
          colorText: Colors.red,
          title: "EGYBEST",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        leading: Icon(Icons.search_rounded, color: Colors.red),
      ),

      //staggerredgridview
      backgroundColor: Colors.black,

      body: Column(
        children: [
          Consumer<GetTopRate>(builder: (context, value, child) {

            if(value.loading == false && value.error==false)
              {
                return CarouselSlider.builder(
                  itemCount: value.MoviesList.length,
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return GridTile(
                        child: Image.network(
                          IMAGE_URL + value.MoviesList[index].poster_path,
                          fit: BoxFit.fill,
                        ),
                        footer: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "${value.MoviesList[index].title}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          color: Colors.red.withOpacity(0.7),
                        ));
                  },
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 3,
                    aspectRatio: 1.5,
                    viewportFraction: 0.7,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }
            else if(value.loading == false && value.error==true)
              {
                return Text("No Data",style: TextStyle(color: Colors.indigo),);
              }
            else
              {
                return Center(child: CircularProgressIndicator());
              }


          }),

          SizedBox(height: MediaQuery.of(context).size.height/20),

          Expanded(
            child: Consumer<GetPopular>(

                builder: (context, value, child) {
              return MasonryGridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 10,
                  itemCount: value.MoviesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return DetailsScreen(value.MoviesList[index]);
                          }));
                        },
                        child: CardPopular(
                            poster_path:
                                '${value.MoviesList[index].poster_path}',
                            title: '${value.MoviesList[index].title}'));
                  });
            }),
          ),
        ],
      ),
    );
  }
}
