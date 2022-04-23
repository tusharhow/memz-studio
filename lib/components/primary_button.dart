import 'package:flutter/material.dart';

class ReusablePrimaryButton extends StatelessWidget {
  const ReusablePrimaryButton({
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
        minWidth: MediaQuery.of(context).size.width / 1.20,
        height: 55,
        color: Color(0xffE5E5E5),
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
