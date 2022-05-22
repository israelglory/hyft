// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hyft/model/matching_model.dart';
import 'package:hyft/notifer.dart';
import 'package:provider/provider.dart';

class AddFeeling extends StatefulWidget {
  const AddFeeling({Key? key}) : super(key: key);

  @override
  State<AddFeeling> createState() => _AddFeelingState();
}

class _AddFeelingState extends State<AddFeeling> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _mood = TextEditingController();
  final TextEditingController _detail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How are you feeling today?'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: TextField(
                  controller: _mood,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Mood',
                    prefixIcon: Icon(Icons.emoji_objects),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: TextField(
                  controller: _detail,
                  maxLines: 20,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Tell us more on how you are feeling today',
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_name.text.isEmpty) {
            return;
          }
          await Provider.of<ItemNotifier>(
            context,
            listen: false,
          ).addItem(_name.text, _mood.text, _detail.text);
          print('added');
          Navigator.pop(context);
        },
        child: Text('Submit'),
      ),
    );
  }
}
