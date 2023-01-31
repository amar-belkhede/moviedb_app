import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moviedb_app/core/model/movie_filter.dart';
import 'package:moviedb_app/core/provider/movie_provider.dart';
import 'package:moviedb_app/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

class SettingsRadioFilter extends StatefulWidget {
  const SettingsRadioFilter({super.key});

  @override
  State<SettingsRadioFilter> createState() => _SettingsRadioFilterState();
}

class _SettingsRadioFilterState extends State<SettingsRadioFilter> {

  @override
  Widget build(BuildContext context) {
    Future<void> _changeMovieFilter(MovieFilter filter) async {
      var provider = Provider.of<MovieProvider>(context, listen: false);
      provider.changeMovieFilter(value: filter);
    }

    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: DbAppTheme.greyWhite,
      ),
      child: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          MovieFilter filter = movieProvider.getMovieFilter;
          return Column(
            children: [
              ListTile(
                onTap: () {
                  setState(
                    () {
                      _changeMovieFilter(MovieFilter.popular);
                    },
                  );
                },
                title: const Text(
                  'Popular',
                  style: TextStyle(
                    color: DbAppTheme.greyWhite,
                  ),
                ),
                leading: Radio<MovieFilter>(
                  activeColor: Colors.white,
                  value: MovieFilter.popular,
                  groupValue: filter,
                  onChanged: (MovieFilter? value) {
                    setState(() {
                      _changeMovieFilter( MovieFilter.popular);
                    });
                  },
                ),
              ),
              ListTile(
                onTap: () {
                  setState(
                    () {
                      _changeMovieFilter(MovieFilter.topRated);
                    },
                  );
                },
                title: const Text(
                  'Top Rating',
                  style: TextStyle(
                    color: DbAppTheme.greyWhite,
                  ),
                ),
                leading: Radio<MovieFilter>(
                  activeColor: Colors.white,
                  value: MovieFilter.topRated,
                  groupValue: filter,
                  onChanged: (MovieFilter? value) {
                    setState(() {
                      _changeMovieFilter(MovieFilter.topRated);
                    });
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
