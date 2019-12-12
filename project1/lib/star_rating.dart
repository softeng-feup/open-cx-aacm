import 'package:flutter/material.dart';

//*************************************************************************************************
//STAR DISPLAY

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 0}): assert(value != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        return Icon(index < value ? Icons.star : Icons.star_border, color: Colors.amber, size: 25);
      }),
    );}
}
//*************************************************************************************************

//*************************************************************************************************
// STAR RATING

class StarRating extends StatelessWidget {
  final void Function(int index) onChanged;
  final int value;
  final IconData filledStar;
  final IconData unfilledStar;

  int getValue(){return value;}

  const StarRating({
    Key key, @required this.onChanged, this.value = 0, this.filledStar, this.unfilledStar})
      : assert(value != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = 75.0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: onChanged != null ? () {onChanged(value == index + 1 ? index : index + 1);}
          : null,
          color: Colors.amber, iconSize: size,
          icon: Icon(
            index < value ? filledStar ?? Icons.star : unfilledStar ?? Icons.star_border,
          ),
          padding: EdgeInsets.zero, tooltip: "${index + 1} of 5",
        );}));}
}
//*************************************************************************************************
