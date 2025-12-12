import 'package:delivery_app/utils/app_size.dart';
import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({
    super.key,
    required this.onTap,
    required this.buttonText,
  });
  final VoidCallback onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: AppSize.w(200),
        height: AppSize.h(60),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff5117AC), Color(0xff20D0C4)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(AppSize.w(12)),
        ),
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
