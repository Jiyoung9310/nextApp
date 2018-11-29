import 'package:flutter/material.dart';
import 'package:nextapp/post_card.dart';
import 'package:nextapp/dog_model.dart';
import 'package:nextapp/post_model.dart';

class PostList extends StatelessWidget {
  final List<Post> doggos;

  PostList(this.doggos);

  ListView _buildList(context) {
    return new ListView.builder(
      itemCount: doggos.length,
      itemBuilder: (context, int) {
        return new PostCard(doggos[int]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }
}
