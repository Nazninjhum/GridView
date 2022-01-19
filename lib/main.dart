import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: 'GridView',
      theme: ThemeData(
          primarySwatch: Colors.grey
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic >> _items =List.generate(
      31,
          (index)=>{
        "id": index,
        "title": "$index",
        "height": (100)+50.5,
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Grid View Calendar'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: (){},
          ),IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
        ],

      ),
      body: MasonryGridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        itemCount: _items.length,
        itemBuilder: (context, index){
          return Card(
            elevation: 10.0,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            key: ValueKey(_items[index]['id']),
            child: SizedBox(
              height: _items[index]['height'],
              child: Align(
                alignment: Alignment.center,
                  child: Text(_items[index]['title'],style: TextStyle(fontSize: 25),)),
            ),
          );
        },
      ),
    );
  }
}



