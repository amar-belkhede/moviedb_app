import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieDetailPoster extends StatelessWidget {
  MovieDetailPoster({
    super.key,
    required this.posterUrl,
  });

  String posterUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 300,
              child: CachedNetworkImage(
                imageUrl: posterUrl,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Container(
                  color: Colors.grey.shade900,
                  child: Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.grey.shade700,
                        backgroundColor: Theme.of(context).primaryColor,
                        strokeWidth: 1,
                        value: downloadProgress.progress,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 301,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
