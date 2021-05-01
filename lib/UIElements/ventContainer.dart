import 'package:flutter/material.dart';

class VentContainer extends StatelessWidget {
  const VentContainer({
    Key? key,
    required this.username,
    required this.vent,
    required this.details,
  }) : super(key: key);

  final String username;
  final String vent;
  final String details;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      margin: details == "PASS-NULL-EMPTY"
          ? EdgeInsets.only(top: 4.0, bottom: 4.0, left: 8.0, right: 8.0)
          : EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: details == "PASS-NULL-EMPTY" ? Colors.black : Colors.black,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "@" + username,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Divider(
            color: Colors.black,
            thickness: details == "PASS-NULL-EMPTY" ? 0.8 : 2.0,
          ),
          SizedBox(height: 2.0),
          Text(
            vent,
            style: TextStyle(
              fontWeight: details == "PASS-NULL-EMPTY"
                  ? FontWeight.normal
                  : FontWeight.bold,
            ),
          ),
          details == "PASS-NULL-EMPTY"
              ? SizedBox()
              : Divider(
                  color: Colors.black,
                  thickness: 0.8,
                ),
          SizedBox(height: 10.0),
          details != "PASS-NULL-EMPTY"
              ? Text(
                  details,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
