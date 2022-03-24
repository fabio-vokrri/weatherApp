import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.searchCity}) : super(key: key);
  final Function(String input)? searchCity;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text('Weather Forecast'),
      actions: [
        Container(
          padding: const EdgeInsets.all(16),
          width: size.width / 4,
          child: TextFormField(
            cursorColor: Colors.amber[900],
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber[900]!,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber[800]!,
                ),
              ),
              hintText: 'Search city',
              icon: const Icon(Icons.search),
            ),
            onFieldSubmitted: searchCity,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
