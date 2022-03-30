import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.searchCity}) : super(key: key);
  final Function(String input)? searchCity;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'Current Weather',
        style: textTheme.headline2,
      ),
      actions: [
        Container(
          padding: const EdgeInsets.all(16),
          width: size.width / 3,
          child: TextFormField( 
            cursorColor: Colors.blue[900],
            style: textTheme.bodyText1,
            decoration: InputDecoration(
              hintText: 'Search city',
              hintStyle: textTheme.bodyText1,
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
