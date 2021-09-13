import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MenuItem.dart';

const double menuFontSize = 16;

final List<MenuRouteItem> _menuItems = [
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
  final ThemeData themeData;
  final List<MenuRouteItem> menuItems;

  AppDrawer(
    this.themeData,
    this.menuItems,
  );

  factory AppDrawer.standard(BuildContext context) {
    final drawer = AppDrawer( Theme.of(context), _menuItems);
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
            _getFooter(),
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
          child: _buildHeader(),
        ),
        ..._buildMenuList(context),
        _buildDivider(),
      ],
    );
  }

  Widget _getFooter() {
    return TextButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text('www.dotup.de'),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: themeData.dividerTheme.color,
      thickness: 1,
      height: 1,
    );
  }

  List<Widget> _buildMenuList(BuildContext context) {
    var result = <Widget>[];

    for (var i = 0; i < menuItems.length; i++) {
      result.add(_buildDivider());
      result.add(_buildMenuItem(context, menuItems[i], i));
    }
    return result;
  }

  Widget _buildMenuItem(BuildContext context, MenuItem menuItem, int index) {
    return _getListTile(context, menuItem, index);
  }

  ListTile _getListTile(BuildContext context, MenuItem menuItem, int index) {
    final textStyle =  themeData.textTheme.headline6?.copyWith(fontSize: menuFontSize);

    final itemAccentColor =  null;

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

  Widget _buildHeader() {
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
        style: TextStyle(color: themeData.accentColor, fontSize: 12.0),
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
