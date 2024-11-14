import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EightPlace extends StatefulWidget {
  const EightPlace({super.key});

  @override
  State<EightPlace> createState() => _EightPlaceState();
}

class _EightPlaceState extends State<EightPlace> {
  List<String> myList = [
  'شهر بدخشان یکی از استان‌های شمال‌شرقی افغانستان است که به خاطر زیبایی‌های طبیعی و تاریخ غنی‌اش مشهور است. این استان به ویژه به خاطر کوهستانی بودن و مناظر بکرش شناخته می‌شود. بدخشان دارای فرهنگی غنی و متنوع است و مردم آن به زبان‌های مختلفی از جمله دری، پامیری و دیگر زبان‌های محلی صحبت می‌کنند.\n'
  ];
  String newValue = '1. جغرافیا:\nبدخشان در ناحیه کوهستانی هندوکش واقع شده و با کشورهای تاجیکستان و چین هم‌مرز است. این استان دارای کوه‌های بلند، دره‌های عمیق و رودخانه‌های زیبا است.\n• یکی از ویژگی‌های جغرافیایی بارز بدخشان، وجود دریاچه‌های طبیعی زیبا مانند دریاچه «قله» (یا دریاچه «پامیر») است که جذابیت خاصی برای گردشگران دارد.\n2. تاریخ و فرهنگ:بدخشان دارای تاریخی بسیار قدیمی است و در طول تاریخ به عنوان یک مرکز تجاری مهم در مسیر جاده ابریشم شناخته می‌شده است.\nاین منطقه به خاطر تنوع قومی و فرهنگی‌اش، شامل اقوام مختلفی مانند تاجیک‌ها، پامیری‌ها و دیگر گروه‌ها است که هر کدام دارای آداب و رسوم خاص خود هستند.\n3. اقتصاد:اقتصاد بدخشان عمدتاً بر پایه کشاورزی، دامداری و استخراج معادن استوار است. محصولات زراعی شامل گندم، جو، میوه‌ها و سبزیجات می‌باشد.\nهمچنین، بدخشان به خاطر منابع معدنی‌اش، به ویژه سنگ‌های قیمتی مانند لاجورد معروف است.\nبدخشان با تاریخ غنی، مناظر طبیعی زیبا و فرهنگ متنوعش، یکی از نقاط مهم افغانستان به شمار می‌آید و پتانسیل بالایی برای توسعه گردشگری و اقتصادی دارد.';
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
            'بدخشان',
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
                'assets/badakh.jpg',
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
                            'https://fa.wikipedia.org/wiki/%D8%A8%D8%AF%D8%AE%D8%B4%D8%A7%D9%86');
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
