import 'package:flutter/material.dart';
import 'package:investynn/core/config/dimensions/dimensions.dart';
import 'package:investynn/core/const/app_assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? userName;
  final bool isMainScreen;
  final bool hasNotification;
  final bool isHomeScreen;
  const CustomAppBar({
    super.key,
    this.title,
    this.userName,
    required this.isHomeScreen,
    required this.isMainScreen,
    required this.hasNotification,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          isHomeScreen
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.onPrimary,
      elevation: 0,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          !isMainScreen
              ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              )
              : Container(),
          SizedBox(width: Dimensions(context).width(10)),
          isHomeScreen
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome,',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    userName!,
                    style: Theme.of(
                      context,
                    ).textTheme.displayLarge!.copyWith(fontSize: 20),
                  ),
                ],
              )
              : Text(
                title!,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
        ],
      ),
      actions: [
        hasNotification
            ? Row(
              children: [
                Badge(
                  label: Text('2'),
                  smallSize: 1,
                  child: Image.asset(AppAssets.myAlert),
                ),
                SizedBox(width: Dimensions(context).width(20)),
                CircleAvatar(
                  radius: 15,
                  foregroundImage: AssetImage(AppAssets.illustration),
                ),
                SizedBox(width: Dimensions(context).width(10)),
              ],
            )
            : Container(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(66);
}
