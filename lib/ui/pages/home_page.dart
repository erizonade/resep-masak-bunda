// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resep_masak/blocs/kategori/kategori_bloc.dart';
import 'package:resep_masak/blocs/resep_now/resep_now_bloc.dart';
import 'package:resep_masak/blocs/resep_search/resep_search_bloc.dart';
import 'package:resep_masak/models/resep_now_model.dart';
import 'package:resep_masak/repository/resep_repository.dart';
import 'package:resep_masak/ui/pages/search_delegate.dart';
import 'package:resep_masak/ui/pages/search_page.dart';
import 'package:resep_masak/ui/widgets/card_kategori.dart';
import 'package:resep_masak/ui/widgets/card_resep.dart';
import '../../shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ResepNowBloc? resepNowBloc;
  @override
  void initState() {
    context.read<ResepNowBloc>().add(GetResepNowEvent());
    context.read<KategoriBloc>().add(GetKategoriEvent());
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Assalamu’alaikum Bunda',
                style: whiteTextStyle.copyWith(fontWeight: bold, fontSize: 16),
              ),
              Text(
                'Mau masak apa hari ini ?',
                style:
                    whiteTextStyle.copyWith(fontWeight: regular, fontSize: 14),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // showSearch(context: context, delegate: SearchResepPage());
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchPage()));
            },
            child: Container(
              margin: const EdgeInsets.only(right: 15, top: 15, bottom: 10),
              width: 36,
              height: 20,
              decoration: BoxDecoration(
                  color: colorWhite, borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/search_icon.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: colorYellow,
        onRefresh: () async {
          context.read<ResepNowBloc>().add(GetResepNowEvent());
        },
        child: SafeArea(
          child: BlocConsumer<ResepNowBloc, ResepNowState>(
            listener: (context, state) {
              if (state is ResepNowError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Tidak ada koneksi Internet'),
                  backgroundColor: colorGreen,
                ));
              }
            },
            builder: (context, state) {
              if (state is ResepNowSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BannerWidget(),
                      const KategoriWidget(),
                      _resepWidget(state.resepNowModel.listResults, context)
                    ],
                  ),
                );
              } else if (state is ResepNowLoading) {
                return circularProgressIndicator;
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

Widget _resepWidget(List<ListResults> resep, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
        child: Text(
          'Resep Hari Ini',
          style: whiteTextStyle.copyWith(
            fontWeight: bold,
          ),
        ),
      ),
      Column(
        children: resep.map((ListResults resep) {
          return CardResepWidget(resep);
        }).toList(),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 12,
      ),
    ],
  );
}

class KategoriWidget extends StatelessWidget {
  const KategoriWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double mediaQueryHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, top: 20),
          child: Text(
            'Kategori Resep',
            style: whiteTextStyle.copyWith(fontWeight: bold),
          ),
        ),
        BlocConsumer<KategoriBloc, KategoriState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is KategoriLoading) {
              return circularProgressIndicator;
            } else if (state is KategoriSuccess) {
              return Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                width: MediaQuery.of(context).size.width,
                height: mediaQueryHeight * 0.18,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.kategoriModel.results.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Row(
                        children: [
                          CardKategori(state.kategoriModel.results[index]),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            return Container();
          },
        )
      ],
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
      width: MediaQuery.of(context).size.width,
      height: 139,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        image: DecorationImage(
          image: AssetImage('assets/banner.png'),
          fit: BoxFit.fill,
          // alignment: Alignment.center
        ),
      ),
    );
  }
}
