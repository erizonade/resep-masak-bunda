import 'package:flutter/material.dart';
import 'package:resep_masak/shared/theme.dart';
import 'package:resep_masak/ui/pages/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomePage(),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
          //     width: double.infinity,
          //     height: 60,
          //     decoration: BoxDecoration(
          //         color: colorBackground,
          //         borderRadius: BorderRadius.circular(15)),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         IconButton(
          //           onPressed: () {},
          //           icon: Icon(
          //             Icons.home,
          //             color: colorGreen,
          //           ),
          //         ),
          //         IconButton(
          //           onPressed: () {},
          //           icon: Icon(
          //             Icons.list_alt,
          //             color: colorGrey,
          //           ),
          //         ),
          //         IconButton(
          //           onPressed: () {},
          //           icon: Icon(
          //             Icons.person,
          //             color: colorGrey,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
