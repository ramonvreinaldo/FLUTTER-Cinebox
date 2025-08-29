import 'package:cinebox/config/env.dart';
import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/core/widgets/loader_and_messages_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with LoaderAndMessagesWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cinebox'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () async {
              showLoader();
              await Future.delayed(const Duration(seconds: 3));
              hideLoader();
              showErrorSnackBar('This is an error message');
              showSuccessSnackBar('This is a success message');
              showInfoSnackBar('This is an info message');
            },
          ),
        ],
      ),
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
