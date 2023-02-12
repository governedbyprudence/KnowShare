import 'package:flutter/material.dart';
import 'package:knowshare_app/knowshare/provider/component/bottomnavbar.dart';
import 'package:provider/provider.dart';
class CustomBottomNavigator extends StatefulWidget {
  const CustomBottomNavigator({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigator> createState() => _CustomBottomNavigatorState();
}

class _CustomBottomNavigatorState extends State<CustomBottomNavigator> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bottomNavState = context.read<bottomNavProvider>();
    return BottomNavigationBar(
        onTap: (index){
          bottomNavState.changeIndex(index);
        },
        currentIndex:context.watch<bottomNavProvider>().selectedIndex,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.book),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: ""),
        ]);
  }
}


class appBarComponents{
  static AppBar appBar1(BuildContext context){
    return AppBar(
      backgroundColor: Colors.transparent,
    );
  }
}
