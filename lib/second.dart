import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondPlace extends StatefulWidget {
  const SecondPlace({super.key});

  @override
  State<SecondPlace> createState() => _SecondPlaceState();
}

class _SecondPlaceState extends State<SecondPlace> {
  List<String> myList = [
    'کابل، پایتخت و بزرگ‌ترین شهر افغانستان، در دره‌ای در کوه‌های هندوکش واقع شده است. این شهر به عنوان مرکز سیاسی، اقتصادی و فرهنگی کشور شناخته می‌شود و تاریخ آن به بیش از ۳۰۰۰ سال پیش برمی‌گردد.\n',
  ];
  String newValue = '1. تاریخ و فرهنگ: کابل در طول تاریخ تحت تأثیر فرهنگ‌ها و تمدن‌های مختلف قرار گرفته است. این شهر در دوران‌های مختلف به عنوان یک مرکز تجاری و فرهنگی مهم شناخته می‌شد و تأثیرات فرهنگی هند، ایران و یونان را به خود جذب کرده است.\n 2. معماری: کابل دارای بناهای تاریخی و معماری خاصی است. از جمله مهم‌ترین آثار معماری این شهر می‌توان به قلعه‌ی "قلعه‌دار" (قلعه‌ی مهدی)، باغ بابر، و مسجد جامع "عبدالرحمن خان" اشاره کرد.\n3. اقتصاد: کابل به عنوان مرکز اقتصادی افغانستان شناخته می‌شود. بازارهای محلی و فروشگاه‌ها در این شهر به فروش انواع کالاها، از جمله صنایع دستی، فرش و غذاهای محلی معروف هستند.\n4. زبان و مردم: زبان‌های اصلی مردم کابل، فارسی (دری) و پشتو هستند. جمعیت این شهر متنوع است و اقوام مختلفی از جمله تاجیک‌ها، پشتون‌ها، هزاره‌ها و ازبک‌ها در آن زندگی می‌کنند.\n5. جغرافیا: کابل در ارتفاع حدود ۱۷۰۰ متر از سطح دریا واقع شده و به دلیل موقعیت کوهستانی‌اش، دارای آب و هوای سرد و خشک در زمستان و معتدل در تابستان است.\n6. جاذبه‌های گردشگری: کابل دارای جاذبه‌های متنوعی است که شامل باغ بابر، موزه ملی افغانستان، تپه مرنجان و بازارهای محلی می‌شود. این مکان‌ها نمایانگر تاریخ غنی و فرهنگ متنوع این شهر هستند.\nکابل با وجود چالش‌های سیاسی و اجتماعی که در دهه‌های اخیر با آن مواجه بوده، همچنان به عنوان قلب افغانستان شناخته می‌شود و تلاش‌هایی برای بازسازی و توسعه آن در حال انجام است.';
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
            'کابل',
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
                'assets/kabul.jpg',
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
                            'https://fa.wikipedia.org/wiki/%DA%A9%D8%A7%D8%A8%D9%84');
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
