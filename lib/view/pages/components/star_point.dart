import 'package:final_project_beamin_app/view/pages/components/my_star_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarPoint extends StatefulWidget {
  const StarPoint({required this.starPoint, Key? key}) : super(key: key);
  final double starPoint;

  @override
  State<StarPoint> createState() => _StarPointState();
}

class _StarPointState extends State<StarPoint> {
  int count = 0;
  double fullStar = 0.0;
  double halfStar = 0.0;
  int star = 0;

  void increaseCount() {
    setState(() {
      count++;
    });
  }

  void increaseFullStar() {
    setState(() {
      fullStar++;
    });
  }

  void increaseHalfStar() {
    setState(() {
      halfStar++;
    });
  }

  void increaseStar() {
    setState(() {
      star++;
    });
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 1; i < widget.starPoint; i++) {
      increaseFullStar();
      increaseCount();
    }
    double aa = 5.0 - count;
    if (0.0 <= aa && 0.3 >= aa) {
      increaseStar();
    } else if (0.4 <= aa && 0.7 >= aa) {
      increaseHalfStar();
    } else {
      increaseStar();
    }
    if (1 <= aa && aa < 5) {
      for (int i = 1; i <= 5 - widget.starPoint; i++) {
        increaseStar();
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (double i = 0; i < widget.starPoint; i++) MyStarIcon(CupertinoIcons.star_fill, 16),
        for (double i = 0; i < halfStar; i++) MyStarIcon(CupertinoIcons.star_lefthalf_fill, 16),
        for (double i = 0; i < star; i++) MyStarIcon(CupertinoIcons.star, 16),
      ],
    );
  }
}
