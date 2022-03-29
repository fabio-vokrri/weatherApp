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
      title: const Text(
        'CURRENT WEATHER',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.all(16),
          width: size.width / 3,
          child: TextFormField(
            cursorColor: Colors.blue[900],
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue[900]!,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue[800]!,
                ),
              ),
              hintText: 'Search city',
              icon: Icon(
                Icons.search,
                color: Colors.blue[900],
              ),
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
