import 'package:flutter/material.dart';

class ArtDetailScreen extends StatelessWidget {
  const ArtDetailScreen({Key? key}) : super(key: key);

  static const routeName = 'art_detail';

  @override
  Widget build(BuildContext context) {
    List args = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
        appBar: AppBar(
          title: Text(args[0]),
        ),
        body: Center(
          child: Column(
            children: [
              const Text('Art Detail'),
              const Divider(),
              Text('Artist Title: ${args[1]}'),
              Text('Place of Origin: ${args[2]}'),
            ],
          ),
        ));
  }
}
