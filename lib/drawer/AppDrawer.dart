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

  // _test() {
  //   final x = Drawer(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween, // place the logout at the end of the drawer
  //       children: <Widget>[
  //         Flexible(
  //           child: ListView(
  //             shrinkWrap: true,
  //             children: <Widget>[
  //               UserAccountsDrawerHeader(
  //                 decoration: BoxDecoration(
  //                   color: myColour,
  //                 ),
  //                 accountName: Padding(
  //                   child: Row(
  //                     children: <Widget>[
  //                       Text("Marcelo Augusto Elias"),
  //                       IconButton(
  //                         icon: Icon(
  //                           Icons.edit,
  //                           color: whiteColour,
  //                         ),
  //                         onPressed: () {},
  //                       ),
  //                     ],
  //                   ),
  //                   padding: EdgeInsets.only(top: 10),
  //                 ),
  //                 accountEmail: Text("N° Cartão: XXXX XXXX XXXX 5154"),
  //                 currentAccountPicture: CircleAvatar(
  //                   backgroundColor: Theme.of(context).platform == TargetPlatform.iOS ? myColour : Colors.white,
  //                   child: Icon(
  //                     Icons.person,
  //                     size: 50,
  //                   ),
  //                 ),
  //               ),
  //               ListTile(
  //                 dense: true,
  //                 title: Text("Fatura"),
  //                 leading: new Image.asset(
  //                   "assets/images/icon_fatura_barra_menu.png",
  //                   width: 20.0,
  //                 ),
  //                 onTap: () {
  //                   AppRouter.of(context).pop();
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(builder: (context) => Fatura()),
  //                   );
  //                 },
  //               ),
  //               ListTile(
  //                 onTap: () {
  //                   AppRouter.of(context).pop();
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(builder: (context) => ConsultaMargem()),
  //                   );
  //                 },
  //                 dense: true,
  //                 title: Text("Extrato"),
  //                 leading: new Image.asset(
  //                   "assets/images/icon_barra_menu_extrato.png",
  //                   width: 20.0,
  //                 ),
  //               ),
  //               ListTile(
  //                 onTap: () {
  //                   AppRouter.of(context).pop();
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(builder: (context) => DesbloquearPrimeiraVia()),
  //                   );
  //                 },
  //                 dense: true,
  //                 title: Text("Desbloquear Cartão"),
  //                 leading: new Image.asset(
  //                   "assets/images/icon_barra_menu_desbloquearcartao.png",
  //                   width: 24.0,
  //                 ),
  //               ),
  //               ListTile(
  //                 dense: true,
  //                 title: Text("Meu Cartão"),
  //                 leading: new Image.asset(
  //                   "assets/images/icon_barra_menu_meucartao.png",
  //                   width: 20.0,
  //                 ),
  //                 onTap: () {
  //                   AppRouter.of(context).pop();
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(builder: (context) => Contracheques()),
  //                   );
  //                 },
  //               ),
  //               ListTile(
  //                 onTap: () {
  //                   AppRouter.of(context).pop();
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(builder: (context) => HistoricoConsignacoes()),
  //                   );
  //                 },
  //                 dense: true,
  //                 title: Text("Adiantamento Salarial"),
  //                 leading: new Image.asset(
  //                   "assets/images/icon_barra_menu_adiantamentosalarial.png",
  //                   width: 20.0,
  //                 ),
  //               ),
  //               /* ListTile(
  //                   onTap: () {
  //                     AppRouter.of(context).pop();
  //                     Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                           builder: (context) => ConsultaMargem()),
  //                     );
  //                   },
  //                   dense: true,
  //                   title: Text("Consulta de Margem"),
  //                   leading: new Image.asset(
  //                     "assets/images/icon_consulta_margem.png",
  //                     width: 20.0,
  //                   ),
  //                 ), */
  //               /* ListTile(
  //             dense: true,
  //             title: Text("Informe de Rendimentos"),
  //             leading: new Image.asset(
  //               "assets/images/icon_rendimento.png",
  //               width: 20.0,
  //             ),
  //           ), */
  //               /* ListTile(
  //                   onTap: () {
  //                     AppRouter.of(context).pop();
  //                     Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                           builder: (context) => SimularEmprestimos()),
  //                     );
  //                   },
  //                   dense: true,
  //                   title: Text("Simular Empréstimo"),
  //                   leading: new Image.asset(
  //                     "assets/images/Icon_cal.png",
  //                     width: 20.0,
  //                   ),
  //                 ), */
  //               Divider(),
  //               ListTile(
  //                 dense: true,
  //                 title: Text("Compartilhar"),
  //                 leading: new Image.asset(
  //                   "assets/images/icon_compartilhar.png",
  //                   width: 20.0,
  //                 ),
  //               ),
  //               ListTile(
  //                 dense: true,
  //                 title: Text("Avaliar"),
  //                 leading: new Image.asset(
  //                   "assets/images/icon_estrela.png",
  //                   width: 20.0,
  //                 ),
  //               ),
  //               Divider(),
  //             ],
  //           ),
  //         ),
  //         ListTile(
  //           onTap: () {
  //             AppRouter.of(context).pop();
  //           },
  //           dense: true,
  //           title: Text("Sair"),
  //           trailing: Text(
  //             "Versão 2.0",
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
  //           ),
  //           leading: new Image.asset(
  //             "assets/images/icon_porta_sair.png",
  //             width: 20.0,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  // Widget _buildMenuItems(BuildContext context, int index) {
  //   final color = _selectedIndex == index
  //       ? Theme.of(context).primaryColor
  //       : Theme.of(context).backgroundColor;
  //   return ListTile(
  //     leading: Icon(_menuItems[index].icon),
  //     title: Text(_menuItems[index].caption),
  //     tileColor: color,
  //     onTap: () {
  //       // Update the state of the app
  //       // ...
  //       // Then close the drawer
  //       AppRouter.of(context).pop();
  //     },
  //   );
  // }
}

// import 'package:dotup_flutter_license/dotup_flutter_license.dart';
// import 'package:dotup_flutter_zefas/app/AppRouter.dart';
// import 'package:dotup_flutter_zefas/app/Licensing/AppLicenseController.dart';
// import 'package:dotup_flutter_zefas/auth/AuthController.dart';
// import 'package:dotup_flutter_zefas/pages/Account/AccountUiHelper.dart';
// import 'package:dotup_flutter_zefas/shared/Launcher.dart';
// import 'package:dotup_flutter_zefas/shared/widgets/Nothing.dart';
// import 'package:dotup_flutter_zefas/theme/AppTheme.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'AppDrawerState.dart';
// import 'AppDrawerStateProvider.dart';
// import 'MenuItem.dart';

// const double menuFontSize = 16;

// class AppDrawer extends StatelessWidget {
//   // final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
//   final image = "";
//   // final AppDrawerState state;
//   final ThemeData themeData;
//   final List<MenuRouteItem> menuItems;

//   AppDrawer(
//     // this.state,
//     this.themeData,
//     this.menuItems,
//   );

//   factory AppDrawer.standard(BuildContext context) {
//     // final state = Provider.of<AppDrawerStateProvider>(context, listen: false);
//     final drawer = AppDrawer(Theme.of(context), AppRouter.getMenuItems());
//     return drawer;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppDrawerStateProvider>(
//       builder: (context, value, child) {
//         return Drawer(
//           child: ClipPath(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: ListView(
//                     shrinkWrap: true,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
//                         child: _buildHeader(),
//                       ),
//                       ..._buildMenuList(context, value.state),
//                       _buildDivider(),
//                     ],
//                   ),
//                 ),
//                 _getFooter(),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _getFooter() {
//     return TextButton(
//       onPressed: () => Launcher.website('https://dotup.de'),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Text('www.dotup.de'),
//       ),
//     );
//   }

//   Divider _buildDivider() {
//     return Divider(
//       color: themeData.dividerTheme.color,
//       thickness: 1,
//       height: 1,
//     );
//   }

//   List<Widget> _buildMenuList(BuildContext context, AppDrawerState state) {
//     var result = <Widget>[];

//     for (var i = 0; i < menuItems.length; i++) {
//       result.add(_buildDivider());
//       result.add(_buildMenuItem(context, state, menuItems[i], i));
//     }
//     return result;
//   }

//   Widget _buildMenuItem(BuildContext context, AppDrawerState state, MenuItem menuItem, int index) {
//     if (menuItem.licenseDescriptor == null) {
//       return _getListTile(context, state, menuItem, index);
//     } else {
//       return WithLicense.banner(
//         license: menuItem.licenseDescriptor!,
//         child: _getListTile(context, state, menuItem, index),
//         notLicensedDecoration: AppLicenseController.notLicensedDecoration,
//       );
//     }
//   }

//   ListTile _getListTile(BuildContext context, AppDrawerState state, MenuItem menuItem, int index) {
//     final textStyle = state.selectedIndex == index
//         ? themeData.textTheme.headline6!.copyWith(
//             color: themeData.accentColor,
//             fontSize: menuFontSize,
//           )
//         : themeData.textTheme.headline6?.copyWith(fontSize: menuFontSize);

//     final itemAccentColor = state.selectedIndex == index ? themeData.accentColor : null;

//     return ListTile(
//       contentPadding: EdgeInsets.only(left: 16),
//       leading: Icon(
//         menuItem.icon,
//         color: itemAccentColor,
//         size: menuFontSize,
//       ),
//       trailing: Container(
//         width: 4,
//         color: itemAccentColor,
//       ),
//       title: Text(
//         menuItem.caption,
//         style: textStyle,
//       ),
//       onTap: () {
//         AppRouter.of(context).pushReplacementMenuIndex(index);
//       },
//     );
//   }

//   Widget _buildHeader() {
//     return Consumer<AuthController>(
//       builder: (context, controller, child) {
//         if (AuthController.currentUser == null) {
//           return Nothing();
//         }

//         final user = AuthController.currentUser!;

//         Text text;
//         Widget subTitle;

//         if (user.id == '0') {
//           text = Text(
//             'dotup IT solutions',
//             style: TextStyle(color: Colors.white, fontSize: 18.0),
//           );
//           subTitle = TextButton(
//             onPressed: () => Launcher.website('https://dotup.de'),
//             child: Text(
//               'www.dotup.de',
//               style: TextStyle(color: themeData.accentColor, fontSize: 12.0),
//             ),
//           );
//         } else {
//           text = Text(
//             user.displayName,
//             style: TextStyle(color: Colors.white, fontSize: 18.0),
//           );
//           subTitle = Text(
//             user.mailAddress,
//             style: TextStyle(color: themeData.accentColor, fontSize: 12.0),
//           );
//         }

//         return Stack(
//           alignment: Alignment.topRight,
//           children: [
//             IconButton(
//               onPressed: () async {
//                 await controller.signOut();
//                 AppRouter.of(context).pushReplacementNamed(AppRouter.signUpOrInRoute);
//               },
//               icon: Icon(Icons.logout),
//               tooltip: 'Abmelden',
//             ),
//             Column(
//               children: <Widget>[
//                 Container(
//                   alignment: Alignment.center,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.transparent,
//                     radius: 40,
//                     backgroundImage: getAccountImageProvider(
//                       account: user,
//                       color: AppTheme.current.accentColor,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//                 text,
//                 subTitle,
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // _test() {
//   //   final x = Drawer(
//   //     child: Column(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween, // place the logout at the end of the drawer
//   //       children: <Widget>[
//   //         Flexible(
//   //           child: ListView(
//   //             shrinkWrap: true,
//   //             children: <Widget>[
//   //               UserAccountsDrawerHeader(
//   //                 decoration: BoxDecoration(
//   //                   color: myColour,
//   //                 ),
//   //                 accountName: Padding(
//   //                   child: Row(
//   //                     children: <Widget>[
//   //                       Text("Marcelo Augusto Elias"),
//   //                       IconButton(
//   //                         icon: Icon(
//   //                           Icons.edit,
//   //                           color: whiteColour,
//   //                         ),
//   //                         onPressed: () {},
//   //                       ),
//   //                     ],
//   //                   ),
//   //                   padding: EdgeInsets.only(top: 10),
//   //                 ),
//   //                 accountEmail: Text("N° Cartão: XXXX XXXX XXXX 5154"),
//   //                 currentAccountPicture: CircleAvatar(
//   //                   backgroundColor: Theme.of(context).platform == TargetPlatform.iOS ? myColour : Colors.white,
//   //                   child: Icon(
//   //                     Icons.person,
//   //                     size: 50,
//   //                   ),
//   //                 ),
//   //               ),
//   //               ListTile(
//   //                 dense: true,
//   //                 title: Text("Fatura"),
//   //                 leading: new Image.asset(
//   //                   "assets/images/icon_fatura_barra_menu.png",
//   //                   width: 20.0,
//   //                 ),
//   //                 onTap: () {
//   //                   AppRouter.of(context).pop();
//   //                   Navigator.push(
//   //                     context,
//   //                     MaterialPageRoute(builder: (context) => Fatura()),
//   //                   );
//   //                 },
//   //               ),
//   //               ListTile(
//   //                 onTap: () {
//   //                   AppRouter.of(context).pop();
//   //                   Navigator.push(
//   //                     context,
//   //                     MaterialPageRoute(builder: (context) => ConsultaMargem()),
//   //                   );
//   //                 },
//   //                 dense: true,
//   //                 title: Text("Extrato"),
//   //                 leading: new Image.asset(
//   //                   "assets/images/icon_barra_menu_extrato.png",
//   //                   width: 20.0,
//   //                 ),
//   //               ),
//   //               ListTile(
//   //                 onTap: () {
//   //                   AppRouter.of(context).pop();
//   //                   Navigator.push(
//   //                     context,
//   //                     MaterialPageRoute(builder: (context) => DesbloquearPrimeiraVia()),
//   //                   );
//   //                 },
//   //                 dense: true,
//   //                 title: Text("Desbloquear Cartão"),
//   //                 leading: new Image.asset(
//   //                   "assets/images/icon_barra_menu_desbloquearcartao.png",
//   //                   width: 24.0,
//   //                 ),
//   //               ),
//   //               ListTile(
//   //                 dense: true,
//   //                 title: Text("Meu Cartão"),
//   //                 leading: new Image.asset(
//   //                   "assets/images/icon_barra_menu_meucartao.png",
//   //                   width: 20.0,
//   //                 ),
//   //                 onTap: () {
//   //                   AppRouter.of(context).pop();
//   //                   Navigator.push(
//   //                     context,
//   //                     MaterialPageRoute(builder: (context) => Contracheques()),
//   //                   );
//   //                 },
//   //               ),
//   //               ListTile(
//   //                 onTap: () {
//   //                   AppRouter.of(context).pop();
//   //                   Navigator.push(
//   //                     context,
//   //                     MaterialPageRoute(builder: (context) => HistoricoConsignacoes()),
//   //                   );
//   //                 },
//   //                 dense: true,
//   //                 title: Text("Adiantamento Salarial"),
//   //                 leading: new Image.asset(
//   //                   "assets/images/icon_barra_menu_adiantamentosalarial.png",
//   //                   width: 20.0,
//   //                 ),
//   //               ),
//   //               /* ListTile(
//   //                   onTap: () {
//   //                     AppRouter.of(context).pop();
//   //                     Navigator.push(
//   //                       context,
//   //                       MaterialPageRoute(
//   //                           builder: (context) => ConsultaMargem()),
//   //                     );
//   //                   },
//   //                   dense: true,
//   //                   title: Text("Consulta de Margem"),
//   //                   leading: new Image.asset(
//   //                     "assets/images/icon_consulta_margem.png",
//   //                     width: 20.0,
//   //                   ),
//   //                 ), */
//   //               /* ListTile(
//   //             dense: true,
//   //             title: Text("Informe de Rendimentos"),
//   //             leading: new Image.asset(
//   //               "assets/images/icon_rendimento.png",
//   //               width: 20.0,
//   //             ),
//   //           ), */
//   //               /* ListTile(
//   //                   onTap: () {
//   //                     AppRouter.of(context).pop();
//   //                     Navigator.push(
//   //                       context,
//   //                       MaterialPageRoute(
//   //                           builder: (context) => SimularEmprestimos()),
//   //                     );
//   //                   },
//   //                   dense: true,
//   //                   title: Text("Simular Empréstimo"),
//   //                   leading: new Image.asset(
//   //                     "assets/images/Icon_cal.png",
//   //                     width: 20.0,
//   //                   ),
//   //                 ), */
//   //               Divider(),
//   //               ListTile(
//   //                 dense: true,
//   //                 title: Text("Compartilhar"),
//   //                 leading: new Image.asset(
//   //                   "assets/images/icon_compartilhar.png",
//   //                   width: 20.0,
//   //                 ),
//   //               ),
//   //               ListTile(
//   //                 dense: true,
//   //                 title: Text("Avaliar"),
//   //                 leading: new Image.asset(
//   //                   "assets/images/icon_estrela.png",
//   //                   width: 20.0,
//   //                 ),
//   //               ),
//   //               Divider(),
//   //             ],
//   //           ),
//   //         ),
//   //         ListTile(
//   //           onTap: () {
//   //             AppRouter.of(context).pop();
//   //           },
//   //           dense: true,
//   //           title: Text("Sair"),
//   //           trailing: Text(
//   //             "Versão 2.0",
//   //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//   //           ),
//   //           leading: new Image.asset(
//   //             "assets/images/icon_porta_sair.png",
//   //             width: 20.0,
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//   // Widget _buildMenuItems(BuildContext context, int index) {
//   //   final color = _selectedIndex == index
//   //       ? Theme.of(context).primaryColor
//   //       : Theme.of(context).backgroundColor;
//   //   return ListTile(
//   //     leading: Icon(_menuItems[index].icon),
//   //     title: Text(_menuItems[index].caption),
//   //     tileColor: color,
//   //     onTap: () {
//   //       // Update the state of the app
//   //       // ...
//   //       // Then close the drawer
//   //       AppRouter.of(context).pop();
//   //     },
//   //   );
//   // }
// }
