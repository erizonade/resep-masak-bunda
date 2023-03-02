import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:resep_masak/blocs/resep_detail/resep_detail_bloc.dart';
import 'package:resep_masak/shared/theme.dart';

class DetailResepPage extends StatelessWidget {
  final String? keyResepDetail;
  final String? urlBackgroundImage;
  const DetailResepPage(
      {Key? key, this.keyResepDetail, this.urlBackgroundImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ResepDetailBloc, ResepDetailState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is ResepDetailError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('Tidak ada koneksi Internet'),
              backgroundColor: colorGreen,
            ));
          }
        },
        builder: (context, state) {
          if (state is ResepDetailLoading) {
            return circularProgressIndicator;
          } else if (state is ResepDetailSuccess) {
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(urlBackgroundImage.toString()),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SafeArea(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      margin: const EdgeInsets.only(left: 15, top: 5),
                      decoration: BoxDecoration(
                          color: colorBackground,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                      // child: ,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: colorBackground,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 5, left: 20, right: 20, bottom: 10),
                              child: Text(
                                state.resepDetailModel.results.title,
                                textAlign: TextAlign.center,
                                style: whiteTextStyle.copyWith(
                                  fontWeight: semiBold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                state.resepDetailModel.results.author.user +
                                    ', ' +
                                    state.resepDetailModel.results.author
                                        .datePublished,
                                style: whiteTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: regular,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 15, right: 15),
                              child: Row(
                                children: [
                                  CardListInfo(
                                    nameIcon: Icon(Icons.access_time_filled,
                                        color: colorBlack, size: 40),
                                    nameTitle:
                                        state.resepDetailModel.results.times,
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  CardListInfo(
                                    nameIcon: Icon(
                                        Icons.emoji_emotions_outlined,
                                        color: colorBlack,
                                        size: 40),
                                    nameTitle: state
                                        .resepDetailModel.results.difficulty,
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  CardListInfo(
                                    nameIcon: Icon(
                                        Icons.supervised_user_circle_rounded,
                                        color: colorBlack,
                                        size: 40),
                                    nameTitle:
                                        state.resepDetailModel.results.servings,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Deskripsi',
                                    style: whiteTextStyle.copyWith(
                                        fontWeight: semiBold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: ReadMoreText(
                                      state.resepDetailModel.results.desc,
                                      style: whiteTextStyle.copyWith(
                                          fontWeight: regular, fontSize: 12),
                                      textAlign: TextAlign.justify,
                                      trimMode: TrimMode.Length,
                                      colorClickableText: colorYellow,
                                      trimCollapsedText: 'Selengkapnya',
                                      trimExpandedText: 'Lebih Sedikit',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 15,
                                  top:
                                      MediaQuery.of(context).size.height * 0.02,
                                  right:
                                      MediaQuery.of(context).size.width * 0.03),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bahan Masakan',
                                    style: whiteTextStyle.copyWith(
                                        fontWeight: semiBold),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                        children: state
                                            .resepDetailModel.results.ingredient
                                            .map((ingredient) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.circle_rounded,
                                              size: 12,
                                              color: Color(0XFFEAEC8D),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.2,
                                              child: Text(
                                                ingredient,
                                                style: whiteTextStyle.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: regular,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }).toList()),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 15,
                                  top:
                                      MediaQuery.of(context).size.height * 0.02,
                                  right:
                                      MediaQuery.of(context).size.width * 0.03,
                                  bottom:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cara Masak',
                                    style: whiteTextStyle.copyWith(
                                        fontWeight: semiBold),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                        children: state
                                            .resepDetailModel.results.step
                                            .map((step) {
                                      return Row(
                                        children: [
                                          const Icon(
                                            Icons.circle_rounded,
                                            size: 12,
                                            color: Color(0XFFEAEC8D),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                            margin: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            child: Text(
                                              step,
                                              style: whiteTextStyle.copyWith(
                                                fontSize: 14,
                                                fontWeight: regular,
                                              ),
                                              textAlign: TextAlign.justify,
                                            ),
                                          )
                                        ],
                                      );
                                    }).toList()),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

class CardListInfo extends StatelessWidget {
  final Icon nameIcon;
  final String nameTitle;

  const CardListInfo(
      {Key? key, required this.nameIcon, required this.nameTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 101,
        decoration: BoxDecoration(
            color: colorYellow, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Container(
              width: 64,
              height: 64,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: nameIcon,
            ),
            Text(
              nameTitle,
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
              ),
            )
          ],
        ),
      ),
    );
  }
}
