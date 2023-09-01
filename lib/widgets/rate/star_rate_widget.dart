import 'package:flutter/material.dart';

class StarRateWidget extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color ratedColor;
  final Color unRatedColor;
  final double size;
  final double spacing;
  const StarRateWidget({
    super.key,
    this.starCount = 5,
    this.rating = 0,
    this.ratedColor = Colors.amberAccent,
    this.unRatedColor = const Color(0xFFE0E0E0),
    this.size = 24.0,
    this.spacing = -2.0,
  })  : assert(starCount > 0),
        assert(rating >= 0.0 && rating <= starCount);

  @override
  Widget build(BuildContext context) {
    int lastRateStar = rating.floor().toInt();
    double minMaxRate = rating - lastRateStar;
    List<Widget> starWidgets = [];
    for (int i = 0; i <= starCount - 1; i++) {
      starWidgets.add(
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bounds) => LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [
              0.0,
              i == lastRateStar ? minMaxRate : 0.0,
              i == lastRateStar ? minMaxRate : 0.0,
              1.0,
            ],
            colors: [
              i <= lastRateStar ? ratedColor : unRatedColor,
              i <= lastRateStar ? ratedColor : unRatedColor,
              i < lastRateStar ? ratedColor : unRatedColor,
              i < lastRateStar ? ratedColor : unRatedColor,
            ],
          ).createShader(bounds),
          child: Icon(
            Icons.star_rounded,
            size: size,
          ),
        ),
      );
    }

    return Wrap(
      spacing: spacing,
      children: [...starWidgets],
    );
  }
}
