import 'package:flutter/material.dart';

import '../models/favorite.dart';
import '../models/seven_models.dart';
import 'home_screen.dart';

class Seven extends StatelessWidget {
  const Seven({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 4, 4, 4),
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Container(
                    child: Image.asset(
                      seven[0].imgAssetAddress,
                      height: MediaQuery.of(context).size.height / 2.4,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                  ),
                  Text(
                    "Berikan Rating Film Ini...!",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FavoriteButton(),
                      FavoriteButton(),
                      FavoriteButton(),
                      FavoriteButton(),
                      FavoriteButton(),
                    ],
                  ),
                  Text(
                    seven[0].text1,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(seven[0].text2,
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  Text(seven[0].text3,
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  Text(seven[0].text4,
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
            )
          ]),
        ));
  }
}
