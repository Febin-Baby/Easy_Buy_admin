import 'package:easybuy_admin_app/view/brand/all_brands/all_brands.dart';
import 'package:easybuy_admin_app/view/order_section/order_mainpage.dart';
import 'package:easybuy_admin_app/view/pages/home_page/widgets/dash_items.dart';
import 'package:easybuy_admin_app/view/pages/products_page/products_page.dart';
import 'package:easybuy_admin_app/view/pages/users_page/users_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routename = '/Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('DashBoard'),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                primary: false,
                padding: const EdgeInsets.only(top: 10),
                children: [
                  SingleDashItems(
                    tittle: 'All products',
                    subtitle: '12',
                    onPressed: () {
                      Navigator.of(context).pushNamed(ProductScreen.routeFromhome);
                    },
                  ),
                  SingleDashItems(
                    tittle: 'All brands',
                    subtitle: '12',
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AllBrands.routname),
                  ),
                  SingleDashItems(
                    tittle: 'Users',
                    subtitle: '12',
                    onPressed: () {
                      Navigator.of(context).pushNamed(UsersPage.routename);
                    },
                  ),
                  SingleDashItems(
                    tittle: 'Orders',
                    subtitle: '12',
                    onPressed: () {
                      Navigator.of(context).pushNamed(OrderMainScreen.orderRoute);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
