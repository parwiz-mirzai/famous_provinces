import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TenthPlace extends StatefulWidget {
  const TenthPlace({super.key});

  @override
  State<TenthPlace> createState() => _TenthPlaceState();
}

class _TenthPlaceState extends State<TenthPlace> {
  List<String> myList = [
    'ولایت ننگرهار یکی از ولایات افغانستان است که در شرق کشور واقع شده و مرکز آن شهر جلال‌آباد است. این ولایت به خاطر تاریخ غنی، فرهنگ متنوع و موقعیت جغرافیایی‌اش شناخته می‌شود. در زیر به برخی از ویژگی‌ها و اطلاعات کلیدی درباره ولایت ننگرهار اشاره می‌شود:\n'
  ];
  String newValue =
      '1. موقعیت جغرافیایی: ننگرهار در شرق افغانستان و در مرز با پاکستان قرار دارد. این ولایت با ولایات مختلفی مانند کابل، لغمان، کنر و پکتیا هم‌مرز است.\nنهر کابل و رودخانه‌های دیگر از این ولایت عبور می‌کنند که باعث سرسبزی و حاصلخیزی زمین‌ها شده است.\n2. تاریخ:ننگرهار دارای تاریخ طولانی و غنی است و در طول تاریخ به عنوان یک مسیر تجاری و فرهنگی مهم بین شرق و غرب شناخته شده است.\n این منطقه در دوران باستان به عنوان بخشی از امپراتوری‌های بزرگ مانند امپراتوری هخامنشی و ساسانی نیز شناخته می‌شد.\nولایت ننگرهار با وجود چالش‌ها، پتانسیل بالایی برای توسعه اقتصادی و اجتماعی دارد و نقش مهمی در زندگی مردم افغانستان ایفا می‌کند.';
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
            ' ننگرهار  ',
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
                'assets/nan.jpg',
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
                            'https://fa.wikipedia.org/wiki/%D9%88%D9%84%D8%A7%DB%8C%D8%AA_%D9%86%D9%86%DA%AF%D8%B1%D9%87%D8%A7%D8%B1');
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
