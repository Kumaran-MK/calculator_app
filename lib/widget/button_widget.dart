import 'package:flutter/material.dart';

class EditingButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final Color? color;
  final Color? textColor;
  final double? height;
  final double? wighth;

  final double? fontsize;

  const EditingButton({
    super.key,
    required this.text,
    required this.onPressed,
   this.color,
    this.textColor,
    required this.height,
    required this.wighth,
    required this.fontsize,

  });

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: height ?? 50,
      width: wighth ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ??Theme.of(context).colorScheme.onSurface ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
            text, style: TextStyle(fontSize: fontsize ?? 25, color: textColor ??Theme.of(context).colorScheme.onSurface,)),
      ),
    );
  }
}
