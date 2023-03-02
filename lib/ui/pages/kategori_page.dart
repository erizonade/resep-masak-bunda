import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resep_masak/blocs/kategori_detail/kategori_detail_bloc.dart';
import 'package:resep_masak/shared/theme.dart';
import 'package:resep_masak/ui/widgets/card_resep.dart';

class KategoriPage extends StatefulWidget {
  final String? keyDetail;
  final String? namaKey;

  const KategoriPage({
    Key? key,
    this.keyDetail,
    this.namaKey,
  }) : super(key: key);

  @override
  State<KategoriPage> createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      margin: const EdgeInsets.only(left: 15, top: 8),
                      decoration: BoxDecoration(
                          color: colorWhite,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                      // child: ,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    margin: const EdgeInsets.only(top: 8, right: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 36,
                    child: Align(
                      child: Text(
                        widget.namaKey.toString(),
                        style: whiteTextStyle.copyWith(
                            fontWeight: bold, fontSize: 25),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: mediaQueryHeight / 12),
              width: MediaQuery.of(context).size.width,
              child: BlocConsumer<KategoriDetailBloc, KategoriDetailState>(
                listener: (context, state) {
                  if (state is KategoriDetailError) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Tidak ada koneksi Internet'),
                      backgroundColor: colorGreen,
                    ));
                  }
                },
                builder: (context, state) {
                  print(state);
                  if (state is KategoriDetailLoading) {
                    return circularProgressIndicator;
                  } else if (state is KategoriDetailSuccess) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.resepNowModel.listResults.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CardResepWidget(
                                  state.resepNowModel.listResults[index]),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
