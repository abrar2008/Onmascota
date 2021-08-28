import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';

import 'package:onmascota/views/widgets/custom_rating_bar.dart';

class RatingReviewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rating and Reviews",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 28, 18, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: sizeHeight(context) / 3.2,
                width: sizeWidth(context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 2,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "rating and reviews",
                        style: heading1,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "4.5",
                                style: TextStyle(fontSize: 65),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RatingBar(
                                rating: 5,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "(300)",
                                style: TextStyle(color: secondaryTextColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("5"),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: primaryColor,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomReviewContainer(
                                    progress: 1,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "0%",
                                    style: TextStyle(color: secondaryTextColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text("4"),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: primaryColor,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomReviewContainer(
                                    progress: 0.7,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "0%",
                                    style: TextStyle(color: secondaryTextColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text("3"),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: primaryColor,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomReviewContainer(
                                    progress: 0.5,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "0%",
                                    style: TextStyle(color: secondaryTextColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text("2"),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: primaryColor,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomReviewContainer(
                                    progress: 0.3,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "0%",
                                    style: TextStyle(color: secondaryTextColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text("1"),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: primaryColor,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomReviewContainer(
                                    progress: 0.1,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "0%",
                                    style: TextStyle(color: secondaryTextColor),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 330,
                width: sizeWidth(context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 2,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "reviews".toUpperCase(),
                        style: heading1,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 17,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(500),
                              child: Image.asset(
                                'assets/images/profile_dummy.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "john smith".toUpperCase(),
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              RatingBar(
                                rating: 5,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "5/18/2021",
                            style: TextStyle(color: secondaryTextColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et netus et malesuada fames ac turpis egestas sed. Eget velit aliquet sagittis id.',
                        style: TextStyle(color: secondaryTextColor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 17,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(500),
                              child: Image.asset(
                                'assets/images/profile_dummy.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "john smith".toUpperCase(),
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              RatingBar(
                                rating: 5,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "5/18/2021",
                            style: TextStyle(color: secondaryTextColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et netus et malesuada fames ac turpis egestas sed. Eget velit aliquet sagittis id.',
                        style: TextStyle(color: secondaryTextColor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomReviewContainer extends StatelessWidget {
  final double progress;

  const CustomReviewContainer({
    Key key,
    @required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7,
      width: sizeWidth(context) / 2.5,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              width: 200 * progress,
              height: 7,
            ),
          ),
        ],
      ),
    );
  }
}
