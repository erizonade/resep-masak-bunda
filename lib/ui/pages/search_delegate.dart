import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resep_masak/blocs/resep_search/resep_search_bloc.dart';
import 'package:resep_masak/shared/theme.dart';
import 'package:resep_masak/ui/widgets/card_resep.dart';
import 'package:resep_masak/ui/widgets/empty_widget.dart';

class SearchResepPage extends SearchDelegate {
  SearchResepPage()
      : super(
          searchFieldLabel: "Yuk Cari Resep Nya Bunda?",searchFieldStyle: whiteTextStyle.copyWith(
            fontSize: 8, fontWeight: regular
          )
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme:
          const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      (query.isNotEmpty)
          ? IconButton(
              onPressed: () {
                query = '';
              },
              icon: const Icon(Icons.clear),
            )
          : Container()
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final String queryString = query.isNotEmpty ? query : '';
    context
        .read<ResepSearchBloc>()
        .add(GetResepSearchEvent(keySearch: queryString));
    final mediaQueryHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    // ignore: sized_box_for_whitespace
    return Container(
      // margin: EdgeInsets.only(top: mediaQueryHeight / 12),
      width: MediaQuery.of(context).size.width,
      child: BlocConsumer<ResepSearchBloc, ResepSearchState>(
        listener: (context, state) {
          print(state.toString());
        },
        builder: (context, state) {
          if (state is ResepSearchLoading) {
            return circularProgressIndicator;
          } else if (state is ResepSearchSuccess) {
            if (state.resepNowModel.listResults.isNotEmpty) {
              // ignore: sized_box_for_whitespace
              return Container(
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
                        nameText: 'Yahh..\nMaaf Pencarian Resepnya Tidak Ada',
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
            nameText: 'Cari Resep Yang Disukai...',
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mediaQueryHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    // ignore: sized_box_for_whitespace
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: EmptyWidget(
        mediaQueryHeight: mediaQueryHeight,
        nameText: 'Cari Resep Yang Disukai...',
      ),
    );
  }
}
