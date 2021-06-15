// import 'package:chatapp/helper/authenticate.dart';
// import 'package:chatapp/views/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:lottie/lottie.dart';
// import 'package:chatapp/utilities/styles.dart';
//
// class OnboardingScreen extends StatefulWidget {
//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final int _numPages = 3;
//   final PageController _pageController = PageController(initialPage: 0);
//   int _currentPage = 0;
//
//   List<Widget> _buildPageIndicator() {
//     List<Widget> list = [];
//     for (int i = 0; i < _numPages; i++) {
//       list.add(i == _currentPage ? _indicator(true) : _indicator(false));
//     }
//     return list;
//   }
//
//   Widget _indicator(bool isActive) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 150),
//       margin: EdgeInsets.symmetric(horizontal: 8.0),
//
//       height: 8.0,
//       width: isActive ? 24.0 : 16.0,
//       decoration: BoxDecoration(
//         color: isActive ? Colors.white : Colors.black,
//         borderRadius: BorderRadius.all(Radius.circular(12)),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnnotatedRegion<SystemUiOverlayStyle>(
//           value: SystemUiOverlayStyle.light,
//           child: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 stops: [0.1, 0.4, 0.7, 0.9],
//                 colors: [
//                   Color(0xFF47F000),
//                   Color(0xFFB6FF00),
//                   Color(0xFFCBF771),
//                   Color(0xFFE5F791)
//                 ],
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 40.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   Container(
//                     alignment: Alignment.centerRight,
//                     child: FlatButton(
//                       onPressed: () => Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(builder: (context) => Authenticate()),
//   ),
//
//                     ),
//                   ),
//                   Container(
//                     height: 600.0,
//                     child: PageView(
//                       physics: ClampingScrollPhysics(),
//                       controller: _pageController,
//                       onPageChanged: (int page) {
//                         setState(() {
//                           _currentPage = page;
//                         });
//                       },
//                       children: <Widget>[
//                         Padding(
//                           padding: EdgeInsets.all(40.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Center(
//                                 child: Lottie.asset('assets/images/hamburger.json'),
//
//                               ),
//                               SizedBox(height: 30.0),
//                               Text(
//                                 'Be healthy',
//                                 style: kTitleStyle,
//                               ),
//                               SizedBox(height: 15.0),
//                               Text(
//                                 'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
//                                 style: kSubtitleStyle,
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(40.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Center(
//                                 child:
//                                    Lottie.asset('assets/images/healthy-or-junk-food.json'),
//                               ),
//                               SizedBox(height: 30.0),
//                               Text(
//                                 'Sign Up',
//                                 style: kTitleStyle,
//                               ),
//                               SizedBox(height: 15.0),
//                               Text(
//                                 'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
//                                 style: kSubtitleStyle,
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(40.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Center(
//                                 child: Lottie.asset('assets/images/food-prepared-food.json'),
//                               ),
//                               SizedBox(height: 30.0),
//                               Text(
//                                 'Chat with a dietitian',
//                                 style: kTitleStyle,
//                               ),
//                               SizedBox(height: 15.0),
//                               Text(
//                                 'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
//                                 style: kSubtitleStyle,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: _buildPageIndicator(),
//                   ),
//                   _currentPage != _numPages - 1
//                       ? Expanded(
//
//                           child: Align(
//                             alignment: FractionalOffset.bottomRight,
//                             child: FlatButton(
//                               onPressed: () {
//                                 _pageController.nextPage(
//                                   duration: Duration(milliseconds: 500),
//                                   curve: Curves.ease,
//                                 );
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Text(
//                                     'Next',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 22.0,
//                                     ),
//                                   ),
//                                   SizedBox(width: 10.0),
//                                   Icon(
//                                     Icons.arrow_forward,
//                                     color: Colors.black,
//                                     size: 30.0,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                       : Text(''),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       bottomSheet: _currentPage == _numPages - 1
//           ? Container(
//               height: 100.0,
//               width: double.infinity,
//
//               child: GestureDetector(
//                 onTap: () => Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(builder: (context) => Authenticate()),
//   ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color : Color(0xFFE5F791)
//
//                   ),
//                   child: Center(
//
//                     child: Padding(
//
//                       padding: EdgeInsets.only(bottom: 30.0),
//                       child: Text(
//                         'Get started',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           : Text(''),
//     );
//   }
// }
import 'package:chatapp/helper/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:chatapp/utilities/styles.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Color(0xFF47F000),
                  Color(0xFFB6FF00),
                  Color(0xFFCBF771),
                  Color(0xFFE5F791)
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Authenticate()),
                      ),
                      // child: Text(
                      //   'Passer',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 20.0,
                      //   ),
                      // ),
                    ),
                  ),
                  Container(
                    height: 600.0,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Lottie.asset(
                                    'assets/images/hamburger.json'),
                              ),
                              SizedBox(height: 30.0),
                              Text(
                                'Sign Up',
                                style: kTitleStyle,
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                style: kSubtitleStyle,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Lottie.asset(
                                    'assets/images/healthy-or-junk-food.json'),
                              ),
                              SizedBox(height: 30.0),
                              Text(
                                'Chat with your Dietitian',
                                style: kTitleStyle,
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                style: kSubtitleStyle,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Lottie.asset(
                                    'assets/images/food-prepared-food.json'),
                              ),
                              SizedBox(height: 30.0),
                              Text(
                                'Be healthy',
                                style: kTitleStyle,
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                style: kSubtitleStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  // _currentPage != _numPages - 1
                  //     ? Expanded(
                  //         child: Align(
                  //           alignment: FractionalOffset.bottomRight,
                  //           child: FlatButton(
                  //             onPressed: () {
                  //               _pageController.nextPage(
                  //                 duration: Duration(milliseconds: 500),
                  //                 curve: Curves.ease,
                  //               );
                  //             },
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               mainAxisSize: MainAxisSize.min,
                  //               children: <Widget>[
                  //                 Text(
                  //                   'Suivant',
                  //                   style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontSize: 22.0,
                  //                   ),
                  //                 ),
                  //                 SizedBox(width: 10.0),
                  //                 Icon(
                  //                   Icons.arrow_forward,
                  //                   color: Colors.white,
                  //                   size: 30.0,
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //     : Text(''),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Authenticate()),
                ),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFFE5F791)),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30.0),
                      child: Text(
                        'Get started',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
