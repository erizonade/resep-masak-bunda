import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resep_masak/shared/theme.dart';

class SpalshPage extends StatefulWidget {
  const SpalshPage({Key? key}) : super(key: key);

  @override
  State<SpalshPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 4), () {
      Navigator.pushNamedAndRemoveUntil(context, '/main-page', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash.png'),
            fit: BoxFit.fitWidth
          ),
        ),
      ),
    );
  }
}
