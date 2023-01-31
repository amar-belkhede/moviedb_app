import 'package:flutter/material.dart';
import 'package:moviedb_app/core/provider/movie_provider.dart';
import 'package:moviedb_app/core/theme/app_theme.dart';
import 'package:moviedb_app/screen/home/component/settings_radio_filter.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _queryController = TextEditingController();

  var outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: DbAppTheme.greyWhite,
    ),
  );

  var hintTextStyle = const TextStyle(color: DbAppTheme.greyWhite);

  void _showModalSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return Container(
          height: 200.0,
          decoration: BoxDecoration(
            color: DbAppTheme.transparentBlack,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: SettingsRadioFilter(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _searchMovie() async {
      var provider = Provider.of<MovieProvider>(context, listen: false);
      await provider.getMovie(query: _queryController.text, page: 1);
    }

    return Column(
      children: [
        const SizedBox(height: 10),
        Form(
          key: _formKey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width - 95,
                child: TextFormField(
                  controller: _queryController,
                  style: hintTextStyle,
                  decoration: InputDecoration(
                    hintText: 'Search movie',
                    hintStyle: hintTextStyle,
                    fillColor: DbAppTheme.greyWhite,
                    border: outlineInputBorder,
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
              IconButton(
                onPressed: _searchMovie,
                padding: const EdgeInsets.all(5),
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.search,
                  size: 30,
                  color: DbAppTheme.greyWhite,
                ),
              ),
              IconButton(
                onPressed: () {
                  _showModalSheet(context);
                },
                padding: const EdgeInsets.all(5),
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.settings,
                  size: 30,
                  color: DbAppTheme.greyWhite,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
