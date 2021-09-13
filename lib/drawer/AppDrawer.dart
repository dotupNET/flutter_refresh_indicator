import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MenuItem.dart';

const double menuFontSize = 16;

final List<MenuRouteItem> menuItems = [
  MenuRouteItem(
    caption: "Home",
    icon: Icons.dashboard_outlined,
    route: '',
  ),
  MenuRouteItem(
    caption: "Zeiterfassung",
    icon: Icons.ac_unit,
    route: '',
  ),
  MenuRouteItem(
    caption: "Zeiterfassung",
    icon: Icons.ac_unit,
    route: '',
  ),
  MenuRouteItem(
    caption: "Zeiterfassung",
    icon: Icons.ac_unit,
    route: '',
  ),
  MenuRouteItem(
    caption: "Zeiterfassung",
    icon: Icons.ac_unit,
    route: '',
  ),
  MenuRouteItem(
    caption: "Zeiterfassung",
    icon: Icons.ac_unit,
    route: '',
  ),
  MenuRouteItem(
    caption: "Zeiterfassung",
    icon: Icons.ac_unit,
    route: '',
  ),
  MenuRouteItem(
    caption: "Zeiterfassung",
    icon: Icons.ac_unit,
    route: '',
  ),
  MenuRouteItem(
    caption: "Zeiterfassung",
    icon: Icons.ac_unit,
    route: '',
  ),
  MenuRouteItem(
    caption: "Zeiterfassung",
    icon: Icons.ac_unit,
    route: '',
  ),
  MenuRouteItem(
    caption: "Zeiterfassung",
    icon: Icons.ac_unit,
    route: '',
  ),
  MenuRouteItem(
    caption: "Zeiterfassung",
    icon: Icons.ac_unit,
    route: '',
  ),
  MenuRouteItem(
    caption: "Stundenzettel",
    icon: Icons.event_note_outlined,
    route: '',
  ),
  MenuRouteItem(
    caption: "Aufgaben",
    icon: Icons.access_alarm_sharp,
    route: '',
  ),
  MenuRouteItem(
    caption: "Projekte",
    icon: Icons.access_alarms_outlined,
    route: '',
  ),
  MenuRouteItem(
    caption: "Kunden",
    icon: Icons.business,
    route: '',
  ),
  MenuRouteItem(
    caption: "Einstellungen",
    icon: Icons.settings,
    route: '',
  ),
  MenuRouteItem(
    caption: "Konten",
    icon: Icons.people,
    route: '',
  ),
  MenuRouteItem(
    caption: "Info",
    icon: Icons.info_outline,
    route: '',
  ),
];

class AppDrawer extends StatelessWidget {
  // final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final image = "";

  AppDrawer();

  factory AppDrawer.standard(BuildContext context) {
    final drawer = AppDrawer();
    return drawer;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ClipPath(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _getContent(context),
            ),
            TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('www.dotup.de'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: _buildHeader(context),
        ),
        ..._buildMenuList(context),
        _buildDivider(context),
      ],
    );
  }

  Divider _buildDivider(BuildContext context) {
    return Divider(
      color: Theme.of(context).dividerTheme.color,
      thickness: 1,
      height: 1,
    );
  }

  List<Widget> _buildMenuList(BuildContext context) {
    var result = <Widget>[];

    for (var i = 0; i < menuItems.length; i++) {
      result.add(_buildDivider(context));
      result.add(_buildMenuItem(context, menuItems[i], i));
    }
    return result;
  }

  Widget _buildMenuItem(BuildContext context, MenuItem menuItem, int index) {
    return _getListTile(context, menuItem, index);
  }

  ListTile _getListTile(BuildContext context, MenuItem menuItem, int index) {
    final textStyle = Theme.of(context).textTheme.headline6?.copyWith(fontSize: menuFontSize);

    final itemAccentColor = null;

    return ListTile(
      contentPadding: EdgeInsets.only(left: 16),
      leading: Icon(
        menuItem.icon,
        color: itemAccentColor,
        size: menuFontSize,
      ),
      trailing: Container(
        width: 4,
        color: itemAccentColor,
      ),
      title: Text(
        menuItem.caption,
        style: textStyle,
      ),
      onTap: () {},
    );
  }

  Widget _buildHeader(BuildContext context) {
    Text text;
    Widget subTitle;

    text = Text(
      'dotup IT solutions',
      style: TextStyle(color: Colors.white, fontSize: 18.0),
    );
    subTitle = TextButton(
      onPressed: () {},
      child: Text(
        'www.dotup.de',
        style: TextStyle(color: Theme.of(context).accentColor, fontSize: 12.0),
      ),
    );

    return Stack(
      alignment: Alignment.topRight,
      children: [
        IconButton(
          onPressed: () async {},
          icon: Icon(Icons.logout),
          tooltip: 'Abmelden',
        ),
        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 40,
              ),
            ),
            SizedBox(height: 10.0),
            text,
            subTitle,
          ],
        ),
      ],
    );
  }
}
