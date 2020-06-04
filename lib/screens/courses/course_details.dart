import 'package:codeclanmobile/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseDetailsScreen extends StatefulWidget {
  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            // color: Color(0xFFF5F4EF),
            gradient: LinearGradient(
          colors: [Color(0xFFbd005f), Color(0xFF500270)],
          begin: Alignment.center,
          end: new Alignment(-1.0, -1.0),
        )

            // image: DecorationImage(
            //   image: AssetImage("assets/images/ux_big.png"),
            //   alignment: Alignment.topRight,
            // ),
            ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/icons/arrow-left.svg",
                        color: Colors.white,
                      ),
                      SvgPicture.asset("assets/icons/more-vertical.svg",
                          color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 30),
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      color: kBestSellerColor,
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 20, bottom: 5),
                      child: Text(
                        "Newbies".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("Design Thinking", style: kcHeadingTextStyle),
                  SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/person.svg",
                          color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        "18K",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 20),
                      SvgPicture.asset(
                        "assets/icons/star.svg",
                        color: Color(0xFFfe8904),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "4.8",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "FREE",
                          style: kHeadingextStyle.copyWith(
                              fontSize: 32, color: Colors.white),
                        ),
                        // TextSpan(
                        //   text: "\$70",
                        //   style: TextStyle(
                        //     color: kTextColor.withOpacity(.5),
                        //     decoration: TextDecoration.lineThrough,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: new TabBar(
                                indicatorSize: TabBarIndicatorSize.label,
                                labelPadding:
                                    EdgeInsets.only(right: 10.0, left: 10.0),
                                indicatorWeight: 3.0,
                                isScrollable: false,
                                labelStyle: kSubtitleTextSyule,
                                indicatorColor: kPinkColor,
                                controller: this._tabController,
                                unselectedLabelColor: Colors.grey,
                                labelColor: Colors.black87,
                                tabs: <Widget>[
                                  new Tab(text: 'Playlist'),
                                  new Tab(text: 'Review'),
                                  new Tab(text: 'Author'),
                                ],
                              ),
                            ),
                            //new BookRow(),
                            Expanded(
                              child: TabBarView(
                                  controller: this._tabController,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        physics: ClampingScrollPhysics(),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            // Text("Course Content", style: kTitleTextStyle),
                                            SizedBox(height: 30),
                                            CourseContent(
                                              number: "01",
                                              duration: 5.35,
                                              title: "Welcome to the Course",
                                              isDone: true,
                                            ),
                                            CourseContent(
                                              number: '02',
                                              duration: 19.04,
                                              title: "Design Thinking - Intro",
                                              isDone: true,
                                            ),
                                            CourseContent(
                                              number: '03',
                                              duration: 15.35,
                                              title: "Design Thinking Process",
                                            ),
                                            CourseContent(
                                              number: '04',
                                              duration: 5.35,
                                              title: "Customer Perspective",
                                            ),
                                            CourseContent(
                                              number: '05',
                                              duration: 5.35,
                                              title: "Customer Perspective",
                                            ),
                                            CourseContent(
                                              number: '06',
                                              duration: 5.35,
                                              title: "Customer Perspective",
                                            ),
                                            CourseContent(
                                              number: '07',
                                              duration: 5.35,
                                              title: "Customer Perspective",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(),
                                    Container()
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 50,
                              color: kTextColor.withOpacity(.1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            // Container(
                            //   padding: EdgeInsets.all(14),
                            //   height: 56,
                            //   width: 80,
                            //   decoration: BoxDecoration(
                            //     color: Color(0xFFFFEDEE),
                            //     borderRadius: BorderRadius.circular(40),
                            //   ),
                            //   child: SvgPicture.asset(
                            //       "assets/icons/shopping-bag.svg"),
                            // ),
                            // SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: kPinkColor,
                                ),
                                child: Text(
                                  "Enroll Now",
                                  style: kSubtitleTextSyule.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  const CourseContent({
    Key key,
    this.number,
    this.duration,
    this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Text(
            number,
            style: kHeadingextStyle.copyWith(
              color: kTextColor.withOpacity(.15),
              fontSize: 32,
            ),
          ),
          SizedBox(width: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$duration mins\n",
                  style: TextStyle(
                    color: kTextColor.withOpacity(.5),
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: title,
                  style: kSubtitleTextSyule.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Expanded(
                      child: Container(
              margin: EdgeInsets.only(left: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kGreenColor.withOpacity(isDone ? 1 : .5),
              ),
              child: Icon(Icons.play_arrow, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
