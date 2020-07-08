import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildListItem('Delicious hot dog', 4.0, '6', 'assets/hotdog.png'),
          _buildListItem('Cheese pizza', 5.0, '12', 'assets/pizza.png'),
        ],
      ),
    );
  }

  _buildListItem(
    String foodName,
    double rating,
    String price,
    String imgPath,
  ) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 210.0,
            child: Row(
              children: <Widget>[
                Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Color(0xFFFFE3DF),
                  ),
                  child: Center(
                    child: Image.asset(imgPath, height: 50.0, width: 50.0),
                  ),
                ),
                SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '$foodName',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SmoothStarRating(
                        allowHalfRating: false,
                        onRated: (v) {},
                        starCount: rating.toInt(),
                        rating: rating,
                        color: Color(0xFFFFD143),
                        borderColor: Color(0xFFFFD143),
                        size: 15.0,
                        spacing: 0.0),
                    Row(
                      children: <Widget>[
                        Text(
                          '\$$price',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Color(0xFFF68D7F),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 3.0),
                        Text(
                          '\$18',
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.grey.withOpacity(0.4),
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w600,
                              ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          FloatingActionButton(
            heroTag: foodName,
            mini: true,
            onPressed: () {},
            child: Center(
              child: Icon(Icons.add, color: Colors.white),
            ),
            backgroundColor: Color(0xFFFE7D6A),
          ),
        ],
      ),
    );
  }
}
