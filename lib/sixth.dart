import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SixthPlace extends StatefulWidget {
  const SixthPlace({super.key});

  @override
  State<SixthPlace> createState() => _SixthPlaceState();
}

class _SixthPlaceState extends State<SixthPlace> {
  List<String> myList = [
  'پنجشیر یکی از ولایت‌های افغانستان است که در شمال کابل واقع شده و به خاطر زیبایی‌های طبیعی، تاریخ غنی و فرهنگ مقاومتی‌اش مشهور است. مرکز این ولایت، شهر "بازارک" است. پنجشیر به عنوان یکی از مناطق مهم تاریخی و فرهنگی افغانستان شناخته می‌شود و به ویژه در دوران جنگ‌های داخلی و مقاومت علیه رژیم طالبان و شوروی، نقشی کلیدی ایفا کرده است.\n'
  ];
  String newValue = '1. جغرافیا و طبیعت: پنجشیر در دره‌ای زیبا و کوهستانی قرار دارد که توسط رشته‌کوه‌های هندوکش احاطه شده است. این منطقه دارای مناظر طبیعی خیره‌کننده، دره‌های عمیق و رودخانه‌های پرآب است. آب و هوای معتدل و سرسبز بودن آن، باعث شده که این منطقه به یکی از مقاصد گردشگری محبوب تبدیل شود.\n2. تاریخ و فرهنگ: پنجشیر به عنوان زادگاه احمد شاه درانی، بنیان‌گذار امپراتوری افغانستان، شناخته می‌شود. همچنین، این منطقه در تاریخ معاصر افغانستان به عنوان مرکز مقاومت علیه اشغال شوروی و رژیم طالبان معروف است. شخصیت‌های برجسته‌ای مانند احمد شاه مسعود، رهبر جبهه مقاومت ملی، از این منطقه برخاسته‌اند.\n3. مردم و زبان: مردم پنجشیر عمدتاً از قوم تاجیک هستند و زبان اصلی آن‌ها فارسی (دری) است. فرهنگ مردم این منطقه غنی و متنوع است و آداب و رسوم خاصی دارند که به نسل‌های گذشته منتقل شده است.\n4. اقتصاد: اقتصاد مردم پنجشیر عمدتاً بر پایه کشاورزی و دامداری استوار است. محصولات زراعی شامل گندم، جو، میوه‌ها و سبزیجات است. همچنین، صنایع دستی نیز در این منطقه رونق دارد.\n5. جاذبه‌های گردشگری: پنجشیر دارای جاذبه‌های طبیعی و تاریخی زیادی است که شامل دره‌های زیبا، کوه‌ها، آبشارها و آثار تاریخی می‌شود. از جمله این جاذبه‌ها می‌توان به دره پنجشیر، یادبود احمد شاه مسعود و جنگل‌های سرسبز اشاره کرد.\nپنجشیر با تاریخ غنی، فرهنگ مقاومتی و مناظر طبیعی خیره‌کننده‌اش، یکی از مناطق مهم و جذاب افغانستان به شمار می‌آید که همواره در کانون توجهات قرار داشته است.';
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
            'پنجشیر',
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
                'assets/panj.jpg',
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
                            'https://fa.wikipedia.org/wiki/%D9%88%D9%84%D8%A7%DB%8C%D8%AA_%D9%BE%D9%86%D8%AC%D8%B4%DB%8C%D8%B1');
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
