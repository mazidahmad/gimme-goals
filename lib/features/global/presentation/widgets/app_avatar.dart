import 'package:flutter/material.dart';
import 'package:gimme_goals/core/theme/app_assets.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.size = 22,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundImage: const AssetImage(
        AppAssets.avatarMan,
      ),
    );
  }
}
