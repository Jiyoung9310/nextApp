import 'package:flutter/material.dart';
import 'package:nextapp/dog_model.dart';
import 'package:nextapp/post_model.dart';

class AddPostFormPage extends StatefulWidget {
  @override
  _AddPostFormPageState createState() => new _AddPostFormPageState();
}

class _AddPostFormPageState extends State<AddPostFormPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  void submitPup(context) {
    if (nameController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(
            new SnackBar(
              backgroundColor: Colors.redAccent,
              content: new Text('Pups neeed names!'),
            ),
          );
    } else {
      var newPost = new Post("5" ,nameController.text, locationController.text,
          descriptionController.text);
      Navigator.of(context).pop(newPost);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add a new Post'),
        backgroundColor: Colors.black87,
      ),
      body: new Container(
        color: Colors.black54,
        child: new Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: new Column(
            children: [
              new Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new TextField(
                    controller: nameController,
                    decoration: new InputDecoration(
                      labelText: 'author',
                    )),
              ),
              new Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new TextField(
                    controller: locationController,
                    decoration: new InputDecoration(
                      labelText: "title",
                    )),
              ),
              new Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new TextField(
                    controller: descriptionController,
                    decoration: new InputDecoration(
                      labelText: 'body',
                    )),
              ),
              new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Builder(
                  builder: (context) {
                    return new RaisedButton(
                      color: Colors.indigoAccent,
                      child: new Text('Submit'),
                      onPressed: () => submitPup(context),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
