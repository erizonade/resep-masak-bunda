import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resep_masak/blocs/kategori/kategori_bloc.dart';
import 'package:resep_masak/blocs/kategori_detail/kategori_detail_bloc.dart';
import 'package:resep_masak/blocs/resep_detail/resep_detail_bloc.dart';
import 'package:resep_masak/blocs/resep_now/resep_now_bloc.dart';
import 'package:resep_masak/blocs/resep_search/resep_search_bloc.dart';
import 'package:resep_masak/repository/resep_repository.dart';
import 'package:resep_masak/ui/pages/home_page.dart';
import 'package:resep_masak/ui/pages/main_page.dart';
import 'package:resep_masak/ui/pages/splash_page.dart';
import 'dart:io';

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

void main() {
  // HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp(
    resepRespository: ResepRespository(),
  ));
}

class MyApp extends StatelessWidget {
  final ResepRespository resepRespository;

  const MyApp({Key? key, required this.resepRespository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ResepNowBloc(resepRespository),
        ),
        BlocProvider(
          create: ((context) => KategoriBloc()),
        ),
        BlocProvider(
          create: ((context) => KategoriDetailBloc()),
        ),
        BlocProvider(
          create: ((context) => ResepDetailBloc()),
        ),
        BlocProvider(
          create: ((context) => ResepSearchBloc()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SpalshPage(),
          '/main-page': (context) => const MainPage()
        },
      ),
    );
  }
}
