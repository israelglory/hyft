// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hyft/notifer.dart';
import 'package:hyft/screens/addfeeling.dart';
import 'package:hyft/widget/avartar.dart';
import 'package:hyft/widget/matching_body.dart';
import 'package:provider/provider.dart';

class Matching extends StatefulWidget {
  const Matching({Key? key}) : super(key: key);

  @override
  State<Matching> createState() => _MatchingState();
}

class _MatchingState extends State<Matching> {
  @override
  void initState() {
    super.initState();
    Provider.of<ItemNotifier>(context, listen: false).initsharedPreferences();
  }

  final PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey;
    List cla = Provider.of<ItemNotifier>(context, listen: false).listItem;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.candlestick_chart_sharp,
          color: Colors.grey,
        ),
        title: const Text(
          'Matching',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        centerTitle: true,
        actions: [
          const Icon(
            Icons.notifications,
            color: Colors.grey,
          ),
        ],
      ),
      body: Consumer<ItemNotifier>(builder: (context, value, _) {
        return RefreshIndicator(
          color: Colors.blue,
          onRefresh: () async {
            setState(() {
              Provider.of<ItemNotifier>(context, listen: false).loadData();
            });
            print('Reloaded');
          },
          child: PageView.builder(
            itemCount: value.listItem.length,
            controller: _controller,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(top: 25, left: 15.0, right: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Avartar
                    Avatar(),
                    // sizedbos
                    SizedBox(
                      height: 10,
                    ),
                    //text
                    Text(
                      value.listItem[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //sizedbos
                    SizedBox(
                      height: 10,
                    ),
                    //Time
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.timer,
                          color: Color.fromARGB(196, 158, 158, 158),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Posted 10min ago')
                      ],
                    ),
                    Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.only(top: 5.0, right: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color.fromARGB(255, 202, 197, 197),
                          ),
                          child: Text('Anxiety'),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color.fromARGB(255, 202, 197, 197),
                          ),
                          child: Text(value.listItem[index].mood),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Center(
                          child: Text(
                            value.listItem[index].description,
                            style: TextStyle(
                                color: Colors.black,
                                wordSpacing: 3.0,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return AddFeeling();
                  })));
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            /*GestureDetector(
              onTap: () {
                if (cla.isEmpty) {
                  final snackbar = SnackBar(
                    content: Text('No Matching Found. Please add one'),
                    backgroundColor: Colors.black,
                    action: SnackBarAction(
                      label: 'Dismiss',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                } else {
                  Provider.of<ItemNotifier>(context, listen: false)
                      .initsharedPreferences();
                  print('Reloaded');
                  final snackbar = SnackBar(
                    content: Text('Data Reloaded'),
                    backgroundColor: Colors.black,
                    action: SnackBarAction(
                      label: 'Dismiss',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              },
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Text(
                  'Reload',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),*/
          ]),
    );
  }
}

class NoMatching extends StatelessWidget {
  const NoMatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
          'No matching! Please use the + button to tell use how you are feeling'),
    );
  }
}
