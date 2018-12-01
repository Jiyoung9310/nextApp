import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nextapp/post_list.dart';
import 'package:nextapp/dog_model.dart';
import 'package:nextapp/new_post_form.dart';
import 'package:nextapp/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'NEXTERS',
      theme: new ThemeData(brightness: Brightness.dark),
      home: new MyHomePage(title: 'NEXTERS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var initialPosts = <Post>[]
    ..add(new Post("0", 'Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(new Post("1,", 'Rex', 'Seattle, WA, USA', 'A Very Good Boy'))
    ..add(new Post("2", 'Rod Stewart', 'Prague, CZ', 'A Very Good Boy'))
    ..add(new Post("3", 'Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(new Post("4", 'Buddy', 'North Pole, Earth', 'A Very Good Boy'));

  Future<Null> _showNewDogForm() async {
    Post newPost = await Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new AddPostFormPage();
        },
      ),
    );
    if (newPost != null) {
      initialPosts.add(newPost);
    }
  }


  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot> (
        stream: Firestore.instance.collection('board').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return LinearProgressIndicator();
          return new PostList(snapshot.data.documents);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
        key: key,
        appBar: new AppBar(
          backgroundColor: Colors.black87,
          title: new Text(widget.title),
          actions: [
            new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () => _showNewDogForm(),
            ),
          ],
        ),
        body: new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Colors.indigo[800],
                Colors.indigo[700],
                Colors.indigo[600],
                Colors.indigo[400],
              ],
            ),
          ),
          child: new Center(
            child: _buildBody(context),
          ),
        ),
        floatingActionButton: new Builder(builder: (context) {
          return new FloatingActionButton(
            onPressed:() => _showNewDogForm(),
            child: Icon(Icons.add),
          );
        }));
  }
}
