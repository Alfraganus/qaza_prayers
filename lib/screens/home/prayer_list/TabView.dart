import 'package:flutter/material.dart';

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
                  height: 400, //height of TabBarView
                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                  ),
                  child: TabBarView(children: <Widget>[
                    Container(
                      child: Center(
                        child: Text('Display Tab 1', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
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
