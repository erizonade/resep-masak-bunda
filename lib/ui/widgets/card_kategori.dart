import 'package:flutter/material.dart';
import 'package:resep_masak/blocs/kategori_detail/kategori_detail_bloc.dart';
import 'package:resep_masak/models/kategori_model.dart';
import 'package:resep_masak/shared/theme.dart';
import 'package:resep_masak/ui/pages/kategori_page.dart';
import 'package:provider/provider.dart';

class CardKategori extends StatefulWidget {
  final Result kategoriModel;
  const CardKategori(
    this.kategoriModel, {
    Key? key,
  }) : super(key: key);

  @override
  State<CardKategori> createState() => _CardKategoriState();
}

class _CardKategoriState extends State<CardKategori> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<KategoriDetailBloc>().add(
              GetKategoriDetailByIdEvent(
                  keyDetail: widget.kategoriModel.key,
                  nameKey: widget.kategoriModel.category),
            );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KategoriPage(
              keyDetail: widget.kategoriModel.key,
              namaKey: widget.kategoriModel.category,
            ),
          ),
        );
      },
      child: Container(
        width: 97,
        height: 101,
        decoration: BoxDecoration(
          // color: colorYellow,
          gradient: LinearGradient(
            colors: [
              colorGreen,
              colorYellow,
            ],
            tileMode: TileMode.mirror,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 17, top: 8, right: 17),
              width: double.infinity,
              height: 60,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/kategori_icon.png'),
                ),
              ),
            ),
            Flexible(
              child: Text(
                widget.kategoriModel.category,
                style: blackTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 12,
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
