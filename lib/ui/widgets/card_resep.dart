import 'package:flutter/material.dart';
import 'package:resep_masak/blocs/resep_detail/resep_detail_bloc.dart';
import 'package:resep_masak/models/resep_now_model.dart';
import 'package:resep_masak/shared/theme.dart';
import 'package:resep_masak/ui/pages/detail_resep_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardResepWidget extends StatefulWidget {
  final ListResults listResepNow;
  const CardResepWidget(
    this.listResepNow, {
    Key? key,
  }) : super(key: key);

  @override
  State<CardResepWidget> createState() => _CardResepWidgetState();
}

class _CardResepWidgetState extends State<CardResepWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<ResepDetailBloc>()
            .add(GetResepDetailEvent(keyResepDetail: widget.listResepNow.key));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailResepPage(
                      keyResepDetail: widget.listResepNow.key,
                      urlBackgroundImage: widget.listResepNow.thumb,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).size.height * 0.02),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 143,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(widget.listResepNow.thumb),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 143,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colorBackground.withOpacity(0.0),
                colorGrey.withOpacity(0.95)
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 50,
                ),
                alignment: Alignment.center,
                width: 200,
                child: Text(
                  widget.listResepNow
                      .title /* 'Resep Bubur Ayam Cianjur,Menu Sarapan yang Dijamin Bakal Ludes' */,
                  textAlign: TextAlign.start,
                  style: whiteTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: Column(
                  children: [
                    const Icon(Icons.timelapse),
                    Text(widget.listResepNow.times)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: Column(
                  children: [
                    const Icon(Icons.supervised_user_circle_sharp),
                    Text(widget.listResepNow.serving)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
