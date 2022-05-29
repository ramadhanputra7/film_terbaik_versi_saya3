import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/models.dart';
import 'darkknight.dart';
import 'fight.dart';
import 'schindler.dart';
import 'shawshank.dart';
import 'seven.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: Text(
              "Film Terbaik Versi Saya",
              style: TextStyle(
                  color: Color(0xfffdfdfd),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
            ),
            centerTitle: true,
            elevation: 0),
        body: Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(models[currentIndex].imgAssetAddress),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.zero,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 500,
                      child: PageView.builder(
                          onPageChanged: (index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          controller: _controller,
                          itemCount: models.length,
                          itemBuilder: (BuildContext context, int index) {
                            currentIndex = index;
                            return Padding(
                              padding: EdgeInsets.only(
                                  top: 20, left: 30, right: 30, bottom: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (index == 0) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Shawshank()));
                                        } else if (index == 1) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DarkKnight()));
                                        } else if (index == 2) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Seven()));
                                        } else if (index == 3) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Schindler()));
                                        } else if (index == 4) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Fight()));
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(models[index]
                                                  .imgAssetAddress),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        margin: EdgeInsets.all(10),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2.4,
                                      ),
                                    ),
                                    Text(
                                      models[index].film,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        models[index].description,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: models.length,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
