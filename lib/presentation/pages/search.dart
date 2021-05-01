import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeliner/business_logic/cubits/search/search_cubit.dart';
import 'package:timeliner/presentation/widgets/feed_card.dart';
import 'package:timeliner/presentation/widgets/responsive_text.dart';
import 'package:timeliner/presentation/widgets/search_bar.dart';
import 'package:timeliner/presentation/widgets/shimmer_card.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

String queryText = "";

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    BlocProvider.of<SearchCubit>(context).getSearchResults("", "20");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimeLinerSearchBar(
            onTextSearched: (value) {
              setState(() {
                queryText = value;
              });
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              BlocProvider.of<SearchCubit>(context).getSearchResults(queryText, "100");
            },
            onTextChanged: (value) {
              if (value.isEmpty) {
                BlocProvider.of<SearchCubit>(context).getSearchResults("", "10");
              }
            },
          ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                List<Widget> list = [];

                for (var i = 0; i < 10; i++) {
                  list.add(TimeLinerShimmerCard(height: height, width: width));
                }
                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
              } else if (state is SearchSuccess) {
                List<Widget> results = [];
                if (state.data.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                      child: ClayContainer(
                        borderRadius: 20,
                        color: Theme.of(context).canvasColor,
                        child: TimeLinerResponsiveText(
                          text: "Oops! No Results Found",
                          min: 30,
                          max: 30,
                          lines: 5,
                          pads: [15, 15, 15, 15],
                          isBold: false,
                          isItalic: false,
                          color: null,
                        ),
                      ),
                    ),
                  );
                } else {
                  for (var i = 0; i < state.data.length; i++) {
                    results.add(
                      TimeLinerFeedCard(
                        height: height,
                        width: width,
                        url: state.data[i]["image"],
                        title: state.data[i]["title"],
                        category: state.data[i]["category"],
                        date: state.data[i]["publishedAt"],
                        source: state.data[i]["source"],
                      ),
                    );
                  }

                  return Column(children: results);
                }
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
