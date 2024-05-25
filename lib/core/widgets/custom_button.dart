import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 170,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  bottomLeft: Radius.circular(13),
                ),
              ),
            ),
            onPressed: () {
              print('Free');
            },
            child: Text(
              kBookPrice,
              style: Styles.textStyle20
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: 170,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffEF8262),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(13),
                  bottomRight: Radius.circular(13),
                ),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              kFreePreview,
              style: Styles.textStyle18
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
