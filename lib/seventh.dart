import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SeventhPlace extends StatefulWidget {
  const SeventhPlace({super.key});

  @override
  State<SeventhPlace> createState() => _SeventhPlaceState();
}

class _SeventhPlaceState extends State<SeventhPlace> {
  List<String> myList = [
  'شهر بلخ یکی از قدیمی‌ترین و تاریخی‌ترین شهرهای افغانستان است که در شمال این کشور واقع شده است. بلخ به عنوان یکی از مراکز فرهنگی و علمی در تاریخ افغانستان شناخته می‌شود و به ویژه در دوران باستان و قرون وسطی، نقش مهمی در توسعه علم، ادبیات و هنر ایفا کرده است.\n'
  ];
  String newValue = '1. تاریخ و فرهنگ:  • بلخ به عنوان زادگاه برخی از بزرگ‌ترین شخصیت‌های تاریخ، مانند شاعر بزرگ فارسی، جلال‌الدین محمد بلخی (مولوی)، شناخته می‌شود. این شهر در دوران باستان به عنوان "بلخ" یا "بغ" معروف بوده و در زمان‌های مختلف تحت حکومت‌های مختلفی مانند امپراتوری هخامنشیان، سلوکیان، اشکانیان و سامانیان قرار داشته است.• بلخ همچنین به عنوان یکی از مراکز مهم فرهنگ و دانش در دوران اسلامی شناخته می‌شود و دانشگاه‌ها و کتابخانه‌های بزرگی در آن وجود داشته است.\n2. جغرافیا: • بلخ در نزدیکی رودخانه بلخ واقع شده و دارای آب و هوای نیمه خشک است. این شهر به دلیل موقعیت جغرافیایی‌اش، به عنوان یک مرکز تجاری مهم در مسیر جاده ابریشم شناخته می‌شده است.\n3. جاذبه‌های تاریخی:• آتشکده بلخ: یکی از قدیمی‌ترین آتشکده‌ها که نشان‌دهنده تاریخ زرتشتیان در این منطقه است.\n• مقبره مولوی: جایی که شاعر بزرگ فارسی زبان، جلال‌الدین محمد بلخی، دفن شده است و سالانه گردشگران زیادی را به خود جذب می‌کند.\n• خرابه‌های بلخ: شامل آثار باستانی و معماری قدیمی که نشان‌دهنده عظمت گذشته این شهر هستند.\n4. اقتصاد:اقتصاد بلخ عمدتاً بر پایه کشاورزی، دامداری و تجارت استوار است. محصولات زراعی شامل گندم، جو، میوه‌ها و سبزیجات می‌باشد. همچنین، بلخ به عنوان یک مرکز تجاری مهم در شمال افغانستان شناخته می‌شود.\n5. مردم و زبان:مردم بلخ عمدتاً از قوم تاجیک هستند و زبان اصلی آن‌ها فارسی (دری) است. فرهنگ مردم این منطقه غنی و متنوع است و آداب و رسوم خاصی دارند.\nشهر بلخ با تاریخ غنی، فرهنگ پربار و جاذبه‌های تاریخی‌اش، همچنان یکی از نقاط مهم فرهنگی و تاریخی افغانستان به شمار می‌آید و نقش مهمی در هویت ملی این کشور دارد.';
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
            'بلخ',
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
                'assets/balkh.jpg',
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
                            'https://fa.wikipedia.org/wiki/%D8%A8%D9%84%D8%AE');
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
