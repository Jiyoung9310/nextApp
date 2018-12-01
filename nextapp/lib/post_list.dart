import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nextapp/post_card.dart';
import 'package:nextapp/dog_model.dart';
import 'package:nextapp/post_model.dart';

class PostList extends StatelessWidget {
  final List<DocumentSnapshot> snapshot;

  PostList(this.snapshot);

  ListView _buildList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => new PostCard(Post.fromSnapshot(data))).toList(),
    );
    /*return new ListView.builder(
      itemCount: snapshot.length,
      itemBuilder: (context, int) {
        snapshot.map((data) => PostCard card = new PostCard(context, data)).toList();
        return new PostCard(postcards[int]);
      },
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }
}
