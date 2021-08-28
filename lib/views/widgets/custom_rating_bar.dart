import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';

class RatingBar extends StatelessWidget {
  final double rating;

  const RatingBar({Key key, @required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totStars = 5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totStars, (i) {
        int index = i + 1;
        return Icon(
          Icons.star,
          color: index <= rating ? primaryColor : Colors.grey[400],
          size: 12,
        );
      }),
    );
  }
}
