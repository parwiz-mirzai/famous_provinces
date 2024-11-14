import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdPlace extends StatefulWidget {
  const ThirdPlace({super.key});

  @override
  State<ThirdPlace> createState() => _ThirdPlaceState();
}

class _ThirdPlaceState extends State<ThirdPlace> {
  List<String> myList = [
    'قندهار، یکی از شهرهای مهم و تاریخی افغانستان، در جنوب کشور واقع شده است و به عنوان دومین شهر بزرگ افغانستان پس از کابل شناخته می‌شود. این شهر به دلیل موقعیت جغرافیایی‌اش، تاریخ غنی و نقش کلیدی‌اش در فرهنگ و سیاست افغانستان اهمیت زیادی دارد.\n'
  ];
  String newValue = '1. تاریخ و فرهنگ: قندهار دارای تاریخی بسیار قدیمی است و به عنوان یکی از مراکز مهم تمدن‌های باستانی شناخته می‌شود. این شهر در دوران‌های مختلف تحت تأثیر فرهنگ‌ها و امپراتوری‌های مختلفی قرار گرفته است، از جمله امپراتوری هخامنشیان، یونانیان، و امپراتوری مغول.\n2. موقعیت جغرافیایی: قندهار در نزدیکی مرز پاکستان واقع شده و به عنوان یک مرکز تجاری و اقتصادی مهم در منطقه شناخته می‌شود. این شهر در دشت‌های وسیع و کوه‌های اطراف قرار دارد که به آن زیبایی خاصی می‌بخشد.\n3. اقتصاد: قندهار به عنوان یکی از مراکز تجاری افغانستان، دارای بازارهای محلی پررونق و صنایع دستی متنوع است. محصولات کشاورزی مانند میوه‌ها (به ویژه انار) و زعفران نیز از جمله منابع اقتصادی این منطقه هستند.\n4. زبان و مردم: زبان اصلی مردم قندهار، پشتو است و جمعیت آن عمدتاً از قوم پشتون تشکیل شده است. قندهار به عنوان یکی از مراکز فرهنگی پشتون‌ها شناخته می‌شود و آداب و رسوم خاص خود را دارد.\n5. جاذبه‌های گردشگری: قندهار دارای جاذبه‌های تاریخی و فرهنگی متعددی است. از جمله این جاذبه‌ها می‌توان به آرامگاه احمد شاه درانی (بنیان‌گذار امپراتوری افغانستان)، مسجد جامع قندهار، و آثار باستانی دیگر اشاره کرد.\n6. نقش سیاسی: قندهار در تاریخ معاصر افغانستان نقش مهمی ایفا کرده است. این شهر به عنوان پایگاه طالبان در دوره‌های مختلف شناخته می‌شود و در تحولات سیاسی کشور تأثیرگذار بوده است.\nبا وجود چالش‌ها و نوسانات سیاسی، قندهار همچنان به عنوان یک مرکز فرهنگی و اقتصادی مهم در افغانستان باقی مانده است و مردم آن تلاش می‌کنند تا زندگی خود را بازسازی کنند.';
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
            'قندهار',
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
                'assets/kandahar.jpg',
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
                            'https://fa.wikipedia.org/wiki/%D9%82%D9%86%D8%AF%D9%87%D8%A7%D8%B1');
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
