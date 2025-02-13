import 'package:flutter/material.dart';

class LoginDetailsListWidget extends StatelessWidget {
  const LoginDetailsListWidget({super.key, required this.future});
  final Future<List> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(itemBuilder: (_, i) {
              return const Stack(
                clipBehavior: Clip.none,
                children: [
                  ListTile(),
                  Positioned(child: SizedBox.square(dimension: 150))
                ],
              );
            });
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
