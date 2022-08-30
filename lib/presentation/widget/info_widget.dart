import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nano_inventory/presentation/widget/custom_button.dart';
import 'package:nano_inventory/presentation/widget/text_view.dart';
import 'package:nano_inventory/utils/dimens.dart';

class InfoWidget extends StatelessWidget {
  final String? image;
  final String? lottieFile;
  final bool? isLottie;
  final String? title;
  final Color? textColor;
  final double? fontSize;
  final VoidCallback? onClick;
  final bool? isButton;
  final String? buttonText;
  final double? lottieSize;
  final Color? buttonColor;
  final double? buttonWidth;

  const InfoWidget(
      {Key? key,
        this.image,
        this.lottieFile,
        this.isLottie,
        required this.title,
        this.textColor,
        this.fontSize,
        this.onClick,
        this.isButton, this.buttonText, this.lottieSize, this.buttonColor, this.buttonWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.all(kPadding14),
      ///  color: Theme.of(context).colorScheme.primaryContainer,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: lottieSize,
            width: double.infinity,
            child: isLottie ?? false
                ? Lottie.asset(lottieFile!)
                : Image.asset(
              image!,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextView(
            text: title ?? "",
            color: textColor,
            fontSize: fontSize ?? 14,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),

          if(isButton == true) SizedBox(
            width: buttonWidth?? 120,
            child: CustomButton(
              radius: 100,
              title:  buttonText??"",
              onClick: onClick!,
              textColor: Theme.of(context).textTheme.bodyText1!.color!,
              buttonColor:buttonColor?? Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}