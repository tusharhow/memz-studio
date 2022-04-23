import 'package:flutter/material.dart';

class MiniButton extends StatelessWidget {
  const MiniButton({
    Key key,
    @required this.childText,
    @required this.onPressed,
  }) : super(key: key);

  final String childText;

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 2.8,
        height: 45,
        color: Color(0xffD0CEE8),
        child: Text(
          childText,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            color: Colors.black,
          ),
        ),
        onPressed: onPressed as void Function(),
      ),
    );
  }
}
