import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstPlace extends StatefulWidget {
  const FirstPlace({super.key});

  @override
  State<FirstPlace> createState() => _FirstPlaceState();
}

class _FirstPlaceState extends State<FirstPlace> {
  List<String> myList = [
    ' هرات یکی از شهرهای تاریخی و فرهنگی افغانستان است که در غرب این کشور واقع شده است. این شهر به عنوان یکی از قدیمی‌ترین شهرهای جهان شناخته می‌شود و تاریخ آن به هزاران سال پیش برمی‌گردد. هرات در دوران‌های مختلف تاریخ به عنوان یک مرکز مهم تجاری و فرهنگی شناخته شده است.\n',
  ];
  String newValue =
      '1. تاریخ و فرهنگ: هرات در دوره‌های مختلف تاریخی، به ویژه در دوران امپراتوری‌های مختلف مانند امپراتوری ساسانیان و تیموریان، نقش مهمی ایفا کرده است. این شهر به عنوان مرکز هنر و علم شناخته می‌شود و بسیاری از شاعران و دانشمندان بزرگ در آن زندگی کرده‌اند.\n2. معماری: هرات دارای بناهای تاریخی و معماری زیباست. از جمله مهم‌ترین آثار معماری این شهر می‌توان به مسجد جامع هرات، قلعه هرکول، و مقبره غیاث‌الدین کیانی اشاره کرد.\n3. اقتصاد: هرات به دلیل موقعیت جغرافیایی خود، یک مرکز تجاری مهم است و بازارهای محلی آن معروف هستند. صنایع دستی مانند قالی‌بافی و تولید فرش نیز در این شهر رواج دارد.\n4. زبان و مردم: زبان اصلی مردم هرات فارسی (دری) است و مردم این منطقه به مهمان‌نوازی معروف هستند.5\n. جغرافیا: هرات در دامنه‌های کوه‌های هندوکش قرار دارد و آب و هوای آن معمولاً خشک و نیمه‌خشک است.این شهر به عنوان یک مقصد گردشگری نیز شناخته می‌شود و جاذبه‌های تاریخی و فرهنگی آن هر ساله بازدیدکنندگان زیادی را جذب می‌کند.'; // Value to add
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
            'هرات',   
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
                'assets/herat.jpg',
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
                            'https://fa.wikipedia.org/wiki/%D9%87%D8%B1%D8%A7%D8%AA');
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
