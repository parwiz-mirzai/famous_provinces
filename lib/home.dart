import 'package:famous_prvinces/about.dart';
import 'package:famous_prvinces/eight.dart';
import 'package:famous_prvinces/fifth.dart';
import 'package:famous_prvinces/first.dart';
import 'package:famous_prvinces/forth.dart';
import 'package:famous_prvinces/ninth.dart';
import 'package:famous_prvinces/second.dart';
import 'package:famous_prvinces/seventh.dart';
import 'package:famous_prvinces/sixth.dart';
import 'package:famous_prvinces/tenth.dart';
import 'package:famous_prvinces/third.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 233, 210),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 223, 212, 179),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('ولایات مشهور افغانستان'),
            PopupMenuButton(
              color: const Color.fromARGB(255, 223, 212, 179),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.share),
                      TextButton(
                        onPressed: () {
                          const String appLink =
                              'https://play.google.com/store/apps/details?id=com.example.famous_prvinces';
                          Share.share(appLink);
                        },
                        child: const Text('به اشتراک گذاشتن  '),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.self_improvement),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutPage()));
                        },
                        child: const Text(' درباره'),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.exit_to_app),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text('خروج'),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          MyGridTile(context, ' هرات', 'assets/herat.jpg', const FirstPlace()),
          MyGridTile(context, 'کابل', 'assets/kabul.jpg', const SecondPlace()),
          MyGridTile(
              context, 'قندهار', 'assets/kandahar.jpg', const ThirdPlace()),
          MyGridTile(
              context, ' مزارشریف', 'assets/mazar.jpg', const ForthPlace()),
          MyGridTile(
              context, 'نورستان', 'assets/norstan.jpg', const FifthPlace()),
          MyGridTile(context, ' پنجشیر', 'assets/panj.jpg', const SixthPlace()),
          MyGridTile(context, 'بلخ ', 'assets/balkh.jpg', const SeventhPlace()),
          MyGridTile(
              context, 'بدخشان', 'assets/badakh.jpg', const EightPlace()),
          MyGridTile(context, 'نیمروز', 'assets/Nimro.jpg', const NinthPlace()),
          MyGridTile(context, 'ننگرهار', 'assets/nan.jpg', const TenthPlace()),
        ],
      ),
    );
  }
}

Widget MyGridTile(BuildContext context, String title, String imagePath,
    Widget destinationPage) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destinationPage),
      );
    },
    child: Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover, 
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(8.0), 
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
