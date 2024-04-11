import 'package:flutter/material.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({super.key});

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class Notificartion {
  String? title;
  String? subtitle;
  int? id;

  Notificartion({this.title, this.subtitle, this.id});
}

List<Notificartion> data = [
  Notificartion(
    title: 'Notification Title',
    subtitle: 'Notification Subtitle',
    id: 1,
  ),
  Notificartion(
    title: 'Notification Title',
    subtitle: 'Notification Subtitle',
    id: 2,
  ),
  Notificartion(
    title: 'Notification Title',
    subtitle: 'Notification Subtitle',
    id: 3,
  ),
  Notificartion(
    title: 'Notification Title',
    subtitle: 'Notification Subtitle',
    id: 4,
  ),
];

class _ModelScreenState extends State<ModelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(data[index].title!),
              subtitle: Text(data[index].subtitle!),
              leading: Text(data[index].id.toString()),
            );
          }),
    );
  }
}
