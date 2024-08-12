import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMesssage});
  final String errorMesssage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMesssage,
        style: Styles.textStyle18,
      ),
    );
  }
}
