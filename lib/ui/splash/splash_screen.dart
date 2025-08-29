import 'package:cinebox/config/env.dart';
import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              Env.backApiUrl,
            ),
            Image.asset(R.ASSETS_IMAGES_LOGO_PNG),
          ],
        ),
      ),
    );
  }
}
