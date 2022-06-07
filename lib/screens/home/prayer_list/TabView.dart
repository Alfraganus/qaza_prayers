import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  static const List<Tab> _tabs = [
    const Tab(
        child: const Text(
      'Tab One',
      style: TextStyle(color: Colors.black38),
    )),
    const Tab(child: Text('Tab One', style: TextStyle(color: Colors.black38))),
    const Tab(child: Text('Tab One', style: TextStyle(color: Colors.black38))),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 36.0),
            DefaultTabController(
                length: 3, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: const TabBar(
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
                          height: MediaQuery.of(context).size.height / 1.5,
                          width: double.infinity, //height of TabBarView
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(children: <Widget>[
                            Container(
                              child: const PrayerList(),
                            ),
                            Container(
                              child: const Center(
                                child: Text('Display Tab 2',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: const Center(
                                child: Text('Display Tab 3',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ]))
                    ])),
          ]),
    );
  }
}

class PrayerList extends StatelessWidget {
  const PrayerList({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Wrap(
          runSpacing: 20,
          children: [
            SinglePrayer(prayerType: 'Bomdot',prayerQuantity: 10, id:1),
            SinglePrayer(prayerType: 'Peshin',prayerQuantity: 10, id:1),
            SinglePrayer(prayerType: 'Asr',prayerQuantity: 10, id:1),
            SinglePrayer(prayerType: 'Shom',prayerQuantity: 10, id:1),
            SinglePrayer(prayerType: 'Xufton',prayerQuantity: 10, id:1),
          ],
        ));
  }
}

class SinglePrayer extends StatelessWidget {
  const SinglePrayer({Key? key, required this.id, required this.prayerQuantity, required this.prayerType}) : super(key: key);

  final int id;
  final int prayerQuantity;
  final String prayerType;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:   GestureDetector(
        onTap: () {
          Modular.to.pushNamed('/counter');
        },
        child: Row(
          children: [
            Container(
                child: Stack(
                  alignment: Alignment.topLeft,
                  children:  [
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(this.id.toString()),

                    ),
                    Image(image: AssetImage('assets/images/star.png')),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        this.prayerType,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: HexColor('#240F4F')),
                      ),
                      Text(
                        'Oqilganlar miqdori',
                        style:
                        TextStyle(fontSize: 14, color: HexColor('#240F4F')),
                      ),
                    ],
                  )),
            ),
            Spacer(),
            Text("${this.prayerQuantity} dona")
          ],
        ),
      ),
    );
  }
}





