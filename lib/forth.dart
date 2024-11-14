import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ForthPlace extends StatefulWidget {
  const ForthPlace({super.key});

  @override
  State<ForthPlace> createState() => _ForthPlaceState();
}

class _ForthPlaceState extends State<ForthPlace> {
  List<String> myList = [
    'مزارشریف، یکی از شهرهای بزرگ و مهم افغانستان است که در شمال کشور واقع شده و مرکز ولایت بلخ به شمار می‌آید. این شهر به خاطر تاریخ غنی، فرهنگ متنوع و جاذبه‌های گردشگری‌اش شناخته می‌شود.\n'
  ];
  String newValue = '1. تاریخ و فرهنگ: مزارشریف دارای تاریخی بسیار قدیمی است و به عنوان یکی از مراکز فرهنگی و مذهبی افغانستان شناخته می‌شود. این شهر در دوران‌های مختلف تحت تأثیر فرهنگ‌های مختلف قرار گرفته و به عنوان یک نقطه تقاطع تمدن‌ها عمل کرده است.\n2. مسجد جامع مزارشریف: یکی از جاذبه‌های مشهور این شهر، مسجد جامع مزارشریف است که به "مسجد سخی" نیز معروف است. این مسجد به خاطر گنبد زیبا و معماری خاص خود شناخته می‌شود و مکانی مقدس برای مسلمانان به شمار می‌آید. طبق افسانه‌ها، در این مکان، موی مبارک پیامبر اسلام (ص) نگهداری می‌شود.\n3. اقتصاد: مزارشریف به عنوان یک مرکز تجاری در شمال افغانستان شناخته می‌شود. بازارهای محلی این شهر پررونق هستند و محصولات کشاورزی، صنایع دستی و کالاهای مختلف در آنجا خرید و فروش می‌شود.\n4. موقعیت جغرافیایی: مزارشریف در دشت‌های وسیع و در نزدیکی رودخانه بلخ قرار دارد و به خاطر موقعیت جغرافیایی‌اش، دسترسی آسانی به سایر نقاط افغانستان و کشورهای همسایه دارد.\n5. زبان و مردم: زبان اصلی مردم مزارشریف، دری (فارسی) است و جمعیت آن شامل اقوام مختلفی از جمله تاجیک‌ها، هزاره‌ها و ازبک‌ها می‌شود. این تنوع قومی باعث غنای فرهنگی این شهر شده است.\n6. جاذبه‌های گردشگری: علاوه بر مسجد جامع، مزارشریف دارای جاذبه‌های تاریخی و طبیعی دیگری نیز هست، از جمله آرامگاه‌های تاریخی، باغ‌ها و مناطق طبیعی زیبا.\n7. نقش سیاسی: مزارشریف در تاریخ معاصر افغانستان نقش مهمی ایفا کرده است و به عنوان یکی از مراکز کلیدی در تحولات سیاسی کشور شناخته می‌شود. این شهر در دوره‌های مختلف به عنوان پایگاه مقاومت علیه رژیم‌ها و نیروهای خارجی عمل کرده است.\nمزارشریف با تاریخ غنی، فرهنگ متنوع و جاذبه‌های طبیعی خود، یکی از شهرهای مهم و جذاب افغانستان به شمار می‌آید و همواره مورد توجه گردشگران و محققان قرار دارد.';
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
            'مزارشریف ',
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
                'assets/mazar.jpg',
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
                            'https://fa.wikipedia.org/wiki/%D9%85%D8%B2%D8%A7%D8%B1_%D8%B4%D8%B1%DB%8C%D9%81');
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
