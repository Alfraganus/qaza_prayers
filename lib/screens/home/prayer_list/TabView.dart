import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {

  static const List<Tab> _tabs = [
    const Tab(child: const Text('Tab One',style: TextStyle(color: Colors.black38),)),
    const Tab( child: Text('Tab One',style: TextStyle(color: Colors.black38))),
    const Tab(child: Text('Tab One',style: TextStyle(color: Colors.black38))),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
        SizedBox(height: 36.0),
        DefaultTabController(
            length: 3, // length of tabs
            initialIndex: 0,
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
              Container(
                child: TabBar(
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(text: 'Farz ibodat'),
                    Tab(text: 'Roza'),
                    Tab(text: 'Nafl'),
                  ],
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height/1.5,
                  width: double.infinity,//height of TabBarView
                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                  ),
                  child: TabBarView(children: <Widget>[
                    Container(
                      child: PrayerName(),
                    ),
                    Container(
                      child: Center(
                        child: Text('Display Tab 2', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text('Display Tab 3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),

                  ])
              )
            ])
        ),
      ]),
    );
  }
}

class PrayerName extends StatelessWidget {
  const PrayerName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
        Container(

        ),
          Column(
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15,top: 10),
                        child: Text('1',),
                      ),
                      Image(image: AssetImage('assets/images/star.png')),
                    ],
                  ),
                  Text('Bomdot',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: HexColor('#240F4F')
                  ),)
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}

