import 'package:cinebox/ui/core/themes/app_colors.dart';
import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:flutter/material.dart';

class SignInGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const SignInGoogleButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Visibility(
              visible: !isLoading,
              replacement: const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 1,
                  ),
                ),
              ),
              child: Image.asset(
                R.ASSETS_IMAGES_GOOGLE_LOGO_PNG,
              ),
            ),
          ),
          Text(
            !isLoading ? 'Sign in with Google' : 'Realizando login...',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
