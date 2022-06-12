import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../firebase/FireCloud.dart';
import '../../../providers/PrayerProvider.dart';

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
    final Stream<QuerySnapshot>prayers = FirebaseFirestore.instance
        .collection('users_prayer')
        .where("user",isEqualTo:"alfra@test.uz")
        .snapshots()
    ;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      child: StreamBuilder<QuerySnapshot>(stream: prayers,builder:(
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot
          ){
        if(snapshot.hasError) {
          return Text('we have error');
        }
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading');
        }
        return snapshot.hasData  ? ListView.builder(
          itemCount: snapshot.requireData.size,
          itemBuilder: (context, index) {
            print(snapshot.requireData.docs[index].reference.id);
            var data = snapshot.requireData.docs[index];
            return Container(
                padding: EdgeInsets.all(10),
                child: Wrap(
                  children: [
                    SinglePrayer(
                        prayerType: data['prayerType'],
                        prayerQuantity:data['times'],
                        id:data['order']+1,
                        document_id:data.reference.id,

                    ),
                  ],
                ));
          },
        ) : Text('data is not avaible');
      }),
      //['prayerType']

    );
  }
  }

class SinglePrayer extends StatelessWidget {
  const SinglePrayer({Key? key, required this.id, required this.prayerQuantity, required this.prayerType, required this.document_id}) : super(key: key);

  final int id;
  final dynamic prayerQuantity;
  final String prayerType;
  final String document_id;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:   GestureDetector(
        onTap: () {
          Provider.of<Prayer>(context, listen: false).setPrayer(
            prayerType,
            prayerQuantity,
            false
          );
          Modular.to.pushNamed('/counter',
          arguments: {
            'prayer_type':prayerType,
            'quantity':prayerQuantity,
            'document':document_id,
            'order':id-1,
          }
          );
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





