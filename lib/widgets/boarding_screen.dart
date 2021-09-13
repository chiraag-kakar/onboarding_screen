import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:onboarding_screen/models/slide.dart';
import 'package:onboarding_screen/widgets/card_layout_widget.dart';
import 'package:onboarding_screen/widgets/splash_screen_widget.dart';

class BoardingPage extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingPage> {
  // creating all the widget before making our home screeen
  var pagecurrect = 0;
  int _currentPage = 0;
  List<Slide> _slides = [];
  PageController _pageController = PageController();

  @override
  void initState() {
    _currentPage = 0;
    _slides = [
      Slide("lib/resources/slide1.png", "Build ATS Free Resumes"),
      Slide("lib/resources/slide2.png",
          "Increase your chances of getting shortlisted"),
      Slide("lib/resources/slide3.png", "And Ace your interviews"),
    ];
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  // the list which contain the build slides
  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

  // building single slide

  Widget _buildSlide(Slide slide) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(32),
            child: Image.asset(slide.image, fit: BoxFit.contain),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Text(
            slide.heading,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(
          height: 230,
        )
      ],
    );
  }

  // handling the on page changed
  void _handlingOnPageChanged(int page) {
    setState(() => _currentPage = page);
    print(page);
  }

  // building page indicator
  Widget _buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != _slides.length - 1)
        row.children.add(SizedBox(
          width: 12,
        ));
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    return Container(
      width: index == _currentPage ? 8 : 5,
      height: index == _currentPage ? 8 : 5,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == _currentPage
              ? Color.fromRGBO(136, 144, 178, 1)
              : Color.fromRGBO(206, 209, 223, 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: _handlingOnPageChanged,
            physics: BouncingScrollPhysics(),
            children: _buildSlides(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: <Widget>[
                _buildPageIndicator(),
                SizedBox(
                  height: 32,
                ),
                Container(
                  // see the page indicators

                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        // onTap: () {
                        //   print("ontap runned");
                        // },
                        child: _currentPage == 2
                            ? GradientButton(
                                callback: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => MyHomePage()));
                                },
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(11, 198, 200, 1),
                                  Color.fromRGBO(68, 183, 183, 1)
                                ]),
                                elevation: 0,
                                increaseHeightBy: 28,
                                increaseWidthBy: double.infinity,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Text(
                                  "LET'S GO",
                                  style: TextStyle(
                                    letterSpacing: 4,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Container(),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _currentPage < 2
                        ? CupertinoButton(
                            child: Text(
                              "NEXT",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                            ),
                            onPressed: () {
                              if (_currentPage == 0) {
                                _handlingOnPageChanged(1);
                                setState(() {
                                  _currentPage = 1;
                                });
                              } else if (_currentPage == 1) {
                                _handlingOnPageChanged(2);
                                setState(() {
                                  _currentPage = 2;
                                });
                              }
                            })
                        : Container(),
                    _currentPage > 0
                        ? CupertinoButton(
                            child: Text(
                              "PREVIOUS",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                            ),
                            onPressed: () {
                              if (_currentPage == 1) {
                                _handlingOnPageChanged(0);
                                setState(() {
                                  _currentPage = 0;
                                });
                              } else if (_currentPage == 2) {
                                _handlingOnPageChanged(1);
                                setState(() {
                                  _currentPage = 1;
                                });
                              }
                            })
                        : Container()
                  ],
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
