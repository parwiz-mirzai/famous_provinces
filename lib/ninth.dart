import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NinthPlace extends StatefulWidget {
  const NinthPlace({super.key});

  @override
  State<NinthPlace> createState() => _NinthPlaceState();
}

class _NinthPlaceState extends State<NinthPlace> {
  List<String> myList = [
  'شهر نیمروز یکی از شهرهای مهم و مرکز استان نیمروز در غرب افغانستان است. این استان به خاطر موقعیت جغرافیایی خاص و تاریخ غنی‌اش شناخته می‌شود. در زیر به برخی از ویژگی‌ها و اطلاعات کلیدی درباره شهر نیمروز و استان آن اشاره می‌شود:\n'
  ];
  String newValue = '1. موقعیت جغرافیایی:استان نیمروز در جنوب‌غربی افغانستان واقع شده و با کشورهای ایران و پاکستان هم‌مرز است.\nین استان دارای جغرافیای متنوعی است که شامل دشت‌ها، کوه‌ها و مناطق بیابانی می‌شود.\n2. تاریخ:نیمروز دارای تاریخ طولانی و غنی است و در گذشته به عنوان یک مسیر تجاری مهم در جاده ابریشم شناخته می‌شد.\nاین منطقه تحت تأثیر فرهنگ‌ها و تمدن‌های مختلف قرار گرفته و آثار تاریخی متعددی از دوران‌های مختلف در آن یافت می‌شود.\n3. اقتصاد:اقتصاد استان نیمروز عمدتاً بر پایه کشاورزی، دامداری و تجارت استوار است. محصولات زراعی شامل گندم، جو، میوه‌ها و سبزیجات می‌باشد.\nبه دلیل موقعیت جغرافیایی، نیمروز همچنین به عنوان یک مرکز تجاری بین افغانستان و کشورهای همسایه شناخته می‌شود.\nشهر نیمروز به عنوان مرکز اداری و اقتصادی استان، نقش مهمی در زندگی مردم این منطقه ایفا می‌کند و با وجود چالش‌ها، پتانسیل بالایی برای توسعه اقتصادی و اجتماعی دارد.';
  bool hasAddedNewValue = false;

  void addValue() {
    if (!hasAddedNewValue) {
      setState(() {
        myList.add(newValue);
        hasAddedNewValue = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('برای اطلاعات بیشتر روی دکمه دیگر کلیک کنید')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    void launchURL(String url) async {
      // ignore: deprecated_member_use
      if (await canLaunch(url)) {
        // ignore: deprecated_member_use
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 233, 210),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 223, 212, 179),
        title: const Center(
          child: Text(
            ' نیمروز ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth * 0.9,
              height: 250,
              child: Image.asset(
                'assets/Nimro.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '${myList.join()}',
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        launchURL(
                            'https://fa.wikipedia.org/wiki/%D9%88%D9%84%D8%A7%DB%8C%D8%AA_%D9%86%DB%8C%D9%85%D8%B1%D9%88%D8%B2');
                      },
                      child: const Text(
                        'بیشتر ++',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        addValue();
                      },
                      child: const Text(
                        'بیشتر +',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
