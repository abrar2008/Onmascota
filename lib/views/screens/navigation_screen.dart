import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onmascota/controllers/myController.dart';
import 'package:onmascota/utils/constants.dart';

import 'package:onmascota/views/screens/add_product_screen.dart';
import 'package:onmascota/views/screens/history/history_screen.dart';
import 'package:onmascota/views/screens/home_screens/agility_trainer/agility_add_service_screen.dart';
import 'package:onmascota/views/screens/home_screens/agility_trainer/agility_trainer_home.dart';
import 'package:onmascota/views/screens/home_screens/agility_trainer/my_services.dart';
import 'package:onmascota/views/screens/home_screens/groomer_screens/groomer_add_service.dart';
import 'package:onmascota/views/screens/home_screens/groomer_screens/groomer_home_screen.dart';
import 'package:onmascota/views/screens/home_screens/groomer_screens/groomer_services.dart';

import 'package:onmascota/views/screens/home_screens/pet_shop/home_screen.dart';
import 'package:onmascota/views/screens/home_screens/pet_sitter/pet_sitter_home.dart';
import 'package:onmascota/views/screens/home_screens/pet_sitter/add_pet_sitter_service.dart';
import 'package:onmascota/views/screens/home_screens/pet_sitter/pet_sitter_services.dart';

import 'package:onmascota/views/screens/my_products_screen.dart';

import 'package:onmascota/views/screens/profile.dart';

import 'package:onmascota/views/widgets/custom_appbar.dart';
import 'package:onmascota/views/widgets/custom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationScreen extends StatefulWidget {
  final int initialChangeIndex;

  const NavigationScreen({Key key, this.initialChangeIndex}) : super(key: key);
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with SingleTickerProviderStateMixin {

  var strName;
  Future<void> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nm = prefs.getString('name');
    setState(() {
      strName=nm;
    });
  }

  MyController _controller = Get.find();
  int _currentIndex = 0;

  TabController _tabController;
  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  List<String> _svgAssets = <String>[
    // 'assets/notfound.svg', // uncomment to test an asset that doesn't exist.
    "assets/icons/Menu Bar/User.svg",
    "assets/icons/Menu Bar/History.svg",
    // "assets/icons/Setting/Change Password.svg",
  ];

  @override
  void initState() {
    getName();
    _tabController = TabController(
        length: 5, vsync: this, initialIndex: widget.initialChangeIndex ?? 0);
    _tabController.addListener(_handleTabSelection);
    _currentIndex =
        widget.initialChangeIndex == 0 ? 0 : widget.initialChangeIndex;
    super.initState();
    print(_controller.selectedColor.value);
  }

  dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size(AppBar().preferredSize.width, AppBar().preferredSize.height),
          child: CusAppBar(
              withIcons: true,
              title: _currentIndex == 0
                  ? "Home"
                  : (_currentIndex == 1
                      ? "My Products(5)"
                      : (_currentIndex == 2)
                          ? "Add Product"
                          : (_currentIndex == 3
                              ? "History"
                              : (_currentIndex == 4 ? "Account" : "")))),
        ),
        drawer: CustomDrawer(strName: strName,),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            _controller.selectedColor.value == 0
                ? HomeScreen()
                : (_controller.selectedColor.value == 1
                    ? PetSitterHome()
                    : (_controller.selectedColor.value == 3
                        ? GroomerHome()
                        : (_controller.selectedColor.value == 4
                            ? AgilityTrainerHome()
                            : null))),
            _controller.selectedColor.value == 0
                ? MyProducts()
                : (_controller.selectedColor.value == 1
                    ? PetSitterServices()
                    : (_controller.selectedColor.value == 3
                        ? GroomerServices()
                        : (_controller.selectedColor.value == 4
                            ? AgilityTrainerService()
                            : null))),
            _controller.selectedColor.value == 0
                ? AddProductScreen()
                : (_controller.selectedColor.value == 1
                    ? AddPetSitterService()
                    : (_controller.selectedColor.value == 3
                        ? GroomerAddService()
                        : (_controller.selectedColor.value == 4
                            ? AgilityTrainerAddService()
                            : null))),
            HistoryScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 1,
          shape: CircularNotchedRectangle(),
          child: Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  blurRadius: 3,
                  offset: Offset(0, -3),
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: primaryColor,
              tabs: <Widget>[
                Container(
                  height: 42,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.home_outlined,
                          size: 26,
                          color:
                              _currentIndex == 0 ? primaryColor : Colors.grey,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 14),
                        decoration: BoxDecoration(
                          color:
                              _currentIndex == 0 ? primaryColor : Colors.white,
                        ),
                        height: 2,
                        width: 15,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 26,
                        color: _currentIndex == 1 ? primaryColor : Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 14),
                      decoration: BoxDecoration(
                        color: _currentIndex == 1 ? primaryColor : Colors.white,
                      ),
                      height: 2,
                      width: 15,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      height: 2,
                      width: 15,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.history,
                        size: 26,
                        color:
                        _currentIndex == 3 ? primaryColor : Colors.grey,)
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 14),
                      decoration: BoxDecoration(
                        color: _currentIndex == 3 ? primaryColor : Colors.white,
                      ),
                      height: 2,
                      width: 15,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.person,
                        size: 26,
                        color:
                        _currentIndex == 4 ? primaryColor : Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 14),
                      decoration: BoxDecoration(
                        color: _currentIndex == 4 ? primaryColor : Colors.white,
                      ),
                      height: 2,
                      width: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
