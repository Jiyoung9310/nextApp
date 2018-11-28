import 'package:flutter/material.dart';
import 'package:nextapp/dog_card.dart';
import 'package:nextapp/dog_model.dart';
import 'package:nextapp/post_model.dart';

class DogList extends StatelessWidget {
  final List<Post> doggos;

  DogList(this.doggos);

  ListView _buildList(context) {
    return new ListView.builder(
      itemCount: doggos.length,
      itemBuilder: (context, int) {
        return new DogCard(doggos[int]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }
}
