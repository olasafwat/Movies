import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../controller/network/endpoint.dart';
import '../../../model/MoivesModel.dart';

class CardPopular extends StatelessWidget {

  String poster_path;
  String title;

  CardPopular({
    required this.poster_path,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Image.network(
              "${IMAGE_URL}${poster_path}",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: Card(
                elevation: 15,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${title}",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
