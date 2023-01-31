import 'package:flutter/material.dart';

class home_message extends StatelessWidget {
  home_message({
    super.key,
    this.message = "",
    this.loading = false,
  });

  String message;
  bool loading;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (loading) const CircularProgressIndicator(color: Colors.white),
          SizedBox(
            height: 20,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
