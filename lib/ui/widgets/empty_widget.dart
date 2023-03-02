import 'package:flutter/material.dart';
import 'package:resep_masak/shared/theme.dart';

class EmptyWidget extends StatelessWidget {
  final double mediaQueryHeight;
  final String nameText;

  const EmptyWidget({Key? key, required this.mediaQueryHeight, required this.nameText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Image.asset(
            'assets/empty.png',
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.8,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(nameText,
            textAlign: TextAlign.center,
            style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
          ),
        )
      ],
    );
  }
}
