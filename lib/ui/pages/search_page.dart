import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resep_masak/blocs/resep_search/resep_search_bloc.dart';
import 'package:resep_masak/shared/theme.dart';
import 'package:resep_masak/ui/widgets/card_resep.dart';
import 'package:resep_masak/ui/widgets/empty_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

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
                    margin: const EdgeInsets.only(left: 15, top: 8, right: 15),
                    padding: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    height: 36,
                    decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextField(
                      controller: controller,
                      autofocus: true,
                      onChanged: (value) {
                        if (_debounce?.isActive ?? false) _debounce?.cancel();
                        _debounce =
                            Timer(const Duration(milliseconds: 800), () {
                          (value.isNotEmpty)
                              ? context
                                  .read<ResepSearchBloc>()
                                  .add(GetResepSearchEvent(keySearch: value))
                              : context
                                  .read<ResepSearchBloc>()
                                  .add(GetResepSearchEvent(keySearch: ''));
                        });
                      },
                      cursorColor: colorBlack,
                      style: blackTextStyle,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.search_rounded,
                          color: colorGrey,
                        ),
                        hintText: 'Mau Cari Resep Apa Bunda?',
                        hintStyle: greyTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: mediaQueryHeight / 10),
              width: MediaQuery.of(context).size.width,
              child: BlocConsumer<ResepSearchBloc, ResepSearchState>(
                listener: (context, state) {
                  print(state.toString());
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is ResepSearchLoading) {
                    return circularProgressIndicator;
                  } else if (state is ResepSearchSuccess) {
                    if (state.resepNowModel.listResults.isNotEmpty) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.resepNowModel.listResults.length,
                          itemBuilder: (context, index) {
                            if (state.resepNowModel.listResults.isNotEmpty) {
                              return Column(
                                children: [
                                  CardResepWidget(
                                      state.resepNowModel.listResults[index]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            } else {
                              return EmptyWidget(
                                mediaQueryHeight: mediaQueryHeight,
                                nameText:
                                    'Yahh..\nMaaf Pencarian Resepnya Tidak Ada',
                              );
                            }
                          },
                        ),
                      );
                    } else {
                      return EmptyWidget(
                        mediaQueryHeight: mediaQueryHeight,
                        nameText: 'Yahh..\nMaaf Pencarian Resepnya Tidak Ada',
                      );
                    }
                  }
                  return EmptyWidget(
                    mediaQueryHeight: mediaQueryHeight,
                    nameText: 'Yuk Cari Resep Yang Disukai...',
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
