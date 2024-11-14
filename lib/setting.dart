// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class SettingPage extends StatefulWidget {
//   const SettingPage({super.key});

//   @override
//   State<SettingPage> createState() => _SettingPageState();
// }

// class _SettingPageState extends State<SettingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 218, 233, 210),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 223, 212, 179),
//         title: Center(
//             child: Text(
//           'تنظیمات',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         )),
//       ),
//       body: Consumer<UiProvider>(
//         builder: (context, UiProvider notifier, child) {
//           return Column(children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: primaryColor),
//                 child: ListTile(
//                   leading: const Icon(Icons.dark_mode),
//                   trailing: Switch(
//                       value: notifier.isDark,
//                       onChanged: (value) => notifier.changeTheme()),
//                 ),
//               ),
//             ),
//             // بخاطر بیرون شدن از برنامه  
//             // Botton(
//             //     label: "SIGN OUT",
//             //     press: () {
//             //       notifier.logout(context);
//             //     })
//           ]);
//         },
//       ),
//     );
//   }
// }

// class UiProvider extends ChangeNotifier {
//   // this is for the dark mod

//   bool _isDark = false;
//   bool get isDark => _isDark;
//   late SharedPreferences storagee;

//   final darkTheme = ThemeData(
//     primaryColor: Color.fromARGB(31, 129, 123, 123),
//     brightness: Brightness.dark,
//     primaryColorDark: Color.fromARGB(31, 85, 81, 81),
//   );
//   final lightTheme = ThemeData(
//       primaryColor: Colors.white,
//       brightness: Brightness.light,
//       primaryColorDark: Colors.white);
//   changeTheme() {
//     _isDark = !isDark;
//     storage.setBool("isDark", _isDark);
//     notifyListeners();
//   }

//   init() async {
//     storagee = await SharedPreferences.getInstance();
//     _isDark = storagee.getBool("isDark") ?? false;
//     notifyListeners();
//   }
// }
