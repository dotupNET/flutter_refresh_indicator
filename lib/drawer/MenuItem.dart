import 'package:flutter/widgets.dart';

class MenuItem {
  late String caption;
  late IconData icon;
  // late String route;

  MenuItem({required this.caption, required this.icon});
}

class MenuRouteItem extends MenuItem {
  late String route;

  MenuRouteItem({
    required String caption,
    required IconData icon,
    required this.route,
  }) : super(
          caption: caption,
          icon: icon,
        );
}
