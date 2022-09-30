// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  const ReusableRow({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);
  final Widget leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.09,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        border:
            Border.all(style: BorderStyle.solid, color: Colors.blue, width: 3),
        color: Colors.blue.shade800,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leading,
            trailing,
          ],
        ),
      ),
    );
  }
}
