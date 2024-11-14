import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FifthPlace extends StatefulWidget {
  const FifthPlace({super.key});

  @override
  State<FifthPlace> createState() => _FifthPlaceState();
}

class _FifthPlaceState extends State<FifthPlace> {
  List<String> myList = [
    'نورستان یکی از ولایت‌های افغانستان است که در شرق کشور واقع شده و به خاطر طبیعت بکر، فرهنگ غنی و تنوع قومی‌اش شناخته می‌شود. مرکز این ولایت، شهر "نورستان" است که به عنوان یکی از مناطق زیبا و کوهستانی افغانستان شناخته می‌شود.\n'
  ];
  String newValue = '1. جغرافیا و طبیعت: نورستان در دامنه‌های کوه‌های هندوکش قرار دارد و به خاطر مناظر طبیعی خیره‌کننده‌اش، از جمله کوه‌ها، دره‌ها و جنگل‌های انبوه، مشهور است. این منطقه به عنوان یک مقصد محبوب برای طبیعت‌گردان و کوهنوردان شناخته می‌شود.\n2. تنوع قومی: مردم نورستان از اقوام مختلفی تشکیل شده‌اند، از جمله قوم نورستانی که دارای زبان و فرهنگ خاص خود هستند. زبان‌های اصلی در این منطقه شامل "نورستانی" و "پشتو" است.\n3. فرهنگ و سنت‌ها: نورستان دارای فرهنگی غنی و متنوع است که شامل آداب و رسوم خاص، موسیقی محلی، رقص‌ها و صنایع دستی می‌شود. مردم نورستان به میهمان‌نوازی معروف هستند و جشن‌ها و مراسم محلی را با شور و شوق برگزار می‌کنند.\n4. اقتصاد: اقتصاد مردم نورستان عمدتاً بر پایه کشاورزی، دامداری و صنایع دستی استوار است. محصولات زراعی مانند گندم، جو و میوه‌های محلی در این منطقه کشت می‌شود.\n5. تاریخ: نورستان به عنوان یکی از مناطق تاریخی افغانستان شناخته می‌شود و در طول تاریخ تحت تأثیر فرهنگ‌ها و تمدن‌های مختلف قرار گرفته است. این منطقه همچنین به خاطر روایات افسانه‌ای و داستان‌های اسطوره‌ای‌اش معروف است.\n6. چالش‌ها: نورستان به دلیل موقعیت جغرافیایی خاص خود، با چالش‌هایی مانند دسترسی محدود به زیرساخت‌ها، خدمات بهداشتی و آموزشی مواجه است. همچنین، در برخی دوره‌ها، این منطقه تحت تأثیر ناامنی‌ها و ناآرامی‌های سیاسی قرار داشته است.\n7. جاذبه‌های گردشگری: طبیعت بکر نورستان، کوه‌های سرسبز، دره‌های عمیق و آبشارهای زیبا از جاذبه‌های گردشگری این منطقه هستند. همچنین، فرهنگ محلی و آداب و رسوم خاص مردم نورستان نیز جذابیت زیادی برای گردشگران دارد.\nنورستان با زیبایی‌های طبیعی و فرهنگی منحصر به فردش، یکی از مناطق جذاب و کمتر شناخته شده افغانستان به شمار می‌آید و می‌تواند مقصدی مناسب برای افرادی باشد که به دنبال تجربه‌ای متفاوت از فرهنگ و طبیعت هستند.';
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
            'نورستان  ',
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
                'assets/norstan.jpg',
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
                            'https://fa.wikipedia.org/wiki/%D9%88%D9%84%D8%A7%DB%8C%D8%AA_%D9%86%D9%88%D8%B1%D8%B3%D8%AA%D8%A7%D9%86');
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
