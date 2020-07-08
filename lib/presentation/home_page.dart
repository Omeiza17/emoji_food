import 'package:emoji_food/presentation/food_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.menu, color: Colors.black),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6.0,
                        spreadRadius: 4.0,
                        offset: Offset(0.0, 3.0),
                      ),
                    ],
                    color: Color(0xFFC6E7FE),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/tuxedo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'SEARCH FOR',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontSize: 27.0, fontWeight: FontWeight.w800),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'RECIPES',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontSize: 27.0, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(height: 24.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 16.0),
            child: Container(
              padding: EdgeInsets.only(left: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.black54,
                      ),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Recommended',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildListItem(
                  'Hamburg',
                  'assets/burger.png',
                  '21',
                  Color(0xFFFFE9C6),
                  Color(0xFFDA9551),
                ),
                _buildListItem(
                  'Chips',
                  'assets/fries.png',
                  '15',
                  Color(0xFFC2E3FE),
                  Color(0xFF6A8CAA),
                ),
                _buildListItem(
                  'Donuts',
                  'assets/doughnut.png',
                  '15',
                  Color(0xFFD7FADA),
                  Color(0xFF56CC7E),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(.5),
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontWeight: FontWeight.w700),
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 12.0),
              tabs: <Widget>[
                Tab(child: Text('FEATURED')),
                Tab(child: Text('COMBO')),
                Tab(child: Text('FAVOURITES')),
                Tab(child: Text('RECOMMENDED')),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 450.0,
            child: TabBarView(
              controller: _tabController,
              children: [
                FoodTab(),
                FoodTab(),
                FoodTab(),
                FoodTab(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildListItem(
    String foodName,
    String imgPath,
    String price,
    Color bgColor,
    Color textColor,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: InkWell(
        onTap: () {
          print('$foodName');
        },
        child: Container(
          height: 175.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: bgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: foodName,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      imgPath,
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Text(
                '$foodName',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: textColor, fontSize: 18.0),
              ),
              Text(
                '\$$price',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: textColor, fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this._tabController = TabController(length: 4, vsync: this);
  }
}

// Lat stop : https://youtu.be/A1ski_fjSlY?list=PLogA2UbVIt0rcc9oJvfxEsuDrXR3ZXolB&t=1042
