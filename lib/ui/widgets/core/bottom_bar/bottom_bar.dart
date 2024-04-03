import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutterflix/configs/configs.dart';
import 'package:flutterflix/router/routes.dart';

part '_data.dart';
part '_model.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final currentPath = ModalRoute.of(context)!.settings.name;

    return Container(
      padding: Space.a.t25 + (Platform.isIOS ? Space.b.t20 : Space.z),
      width: AppMedia.width,
      decoration: AppProps.card,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items.asMap().entries.map(
          (item) {
            final isSelected = currentPath == item.value.path;
            return Expanded(
              child: InkWell(
                onTap: () {
                  if (!isSelected) {
                    final path = item.value.path;
                    path.pushReplace(context);
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.value.icon,
                      size: 24,
                      color: isSelected ? AppTheme.c.primary : AppTheme.c.grey,
                    ),
                    Space.y.t15,
                    Text(
                      item.value.label,
                      style: AppText.s1 +
                          (isSelected ? AppTheme.c.primary : AppTheme.c.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
