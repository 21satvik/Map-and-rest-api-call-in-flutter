import 'package:flutter/material.dart';
import 'package:innostack/main.dart';
import 'package:innostack/screens/art_detail_screen.dart';
import 'package:innostack/widgets/artwork/artwork_column.dart';

class ArtworksScreen extends StatefulWidget {
  const ArtworksScreen({Key? key}) : super(key: key);

  static const routeName = 'artworks';

  @override
  State<ArtworksScreen> createState() => _ArtworksScreenState();
}

class _ArtworksScreenState extends State<ArtworksScreen> {
  List<String>? artistTitle;
  List<String>? title;
  List<String>? origin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    artistTitle = sharedPreferences.getStringList('artist_title') ?? [];
    title = sharedPreferences.getStringList('title') ?? [];
    origin = sharedPreferences.getStringList('origin') ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artworks'),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemBuilder: (context, index) => Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ArtDetailScreen.routeName, arguments: [
                    title![index],
                    artistTitle![index],
                    origin![index],
                  ]);
                },
                leading: const Icon(Icons.art_track),
                title: Text(title![index]),
                subtitle: artistTitle![index] != 'null'
                    ? Text(artistTitle![index])
                    : const Text('No data'),
                trailing: Text(origin![index]),
              ),
              const Divider(),
            ],
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
