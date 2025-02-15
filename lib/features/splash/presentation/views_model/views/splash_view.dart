import 'package:bookly_app/features/splash/presentation/views_model/views/widget/spalsh_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpalshViewBody(),
    );
  }
}
