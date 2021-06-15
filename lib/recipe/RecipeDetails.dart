import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:math';

import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class RecipeDetails extends StatelessWidget {
  final bingredientlist;
  final btitle;
  final bsource;
  final bscore;
  final btime;
  final bserve;
  final breakfastimg;

  RecipeDetails({
    this.bingredientlist,
    this.btitle,
    this.bsource,
    this.bscore,
    this.btime,
    this.bserve,
    this.breakfastimg,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SlidingUpPanel(
        parallaxEnabled: true,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        minHeight: (size.height / 2),
        maxHeight: size.height / 1.2,
        panel: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                btitle,
                style: _textTheme.headline6,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                bsource,
                style: _textTheme.caption,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    FlutterIcons.heart_circle_mco,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    bscore.toString(),
                    // style: _textTheme.caption,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    FlutterIcons.timer_mco,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    btime.toString(),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 2,
                    height: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    bserve.toString() + ' Servings',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black.withOpacity(0.3),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.red,
                        tabs: [
                          Tab(
                            text: "Ingredients metric".toUpperCase(),
                          ),
                          Tab(
                            text: "Ingredients US".toUpperCase(),
                          ),
                        ],
                        labelColor: Colors.black,
                        indicator: DotIndicator(
                          color: Colors.black,
                          distanceFromCenter: 16,
                          radius: 3,
                          paintingStyle: PaintingStyle.fill,
                        ),
                        unselectedLabelColor: Colors.black.withOpacity(0.3),
                        labelStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        labelPadding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Wrap(
                                  children: [
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: ScrollPhysics(),
                                      itemCount: bingredientlist.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 2.0,
                                          ),
                                          child: Text(bingredientlist[index]
                                                  ['name'] +
                                              ' ' +
                                              bingredientlist[index]['measures']
                                                      ['metric']['amount']
                                                  .toString() +
                                              ' ' +
                                              bingredientlist[index]['measures']
                                                  ['metric']['unitShort']),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Divider(
                                            color:
                                                Colors.black.withOpacity(0.3));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Wrap(
                                  children: [
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: ScrollPhysics(),
                                      itemCount: bingredientlist.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 2.0,
                                          ),
                                          child: Text(bingredientlist[index]
                                                  ['name'] +
                                              ' ' +
                                              bingredientlist[index]['measures']
                                                      ['us']['amount']
                                                  .toString() +
                                              ' ' +
                                              bingredientlist[index]['measures']
                                                  ['us']['unitShort']),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Divider(
                                            color:
                                                Colors.black.withOpacity(0.3));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: "recipeModel.imgPath",
                    child: ClipRRect(
                      child: Image.network(
                        breakfastimg,
                        width: double.infinity,
                        height: (size.height / 2) + 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 40,
                right: 20,
                child: Icon(
                  FlutterIcons.bookmark_outline_mco,
                  color: Colors.white,
                  size: 38,
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
