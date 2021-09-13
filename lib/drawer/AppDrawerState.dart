

class AppDrawerState {
  AppDrawerState();

  int selectedIndex = 0;


  // void navigate(BuildContext context, int index) {
  //   logger.console("navigated");
  //   selectedIndex = index;

  //   final appBar = Provider.of<AppBarService>(context, listen: false);
  //   appBar.title = menuItems[index].caption;

  //   Navigator.pushReplacementNamed(context, menuItems[selectedIndex].route);
   
  //   // Navigator.pushNamed(context, menuItems[selectedIndex].route);
  // }

  // void close(BuildContext context) {
  //   AppRouter.of(context).pop();
  // }
}
