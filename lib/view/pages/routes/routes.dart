import 'package:easybuy_admin_app/controller/product_adding/product_image_controller.dart';
import 'package:easybuy_admin_app/controller/product_adding/varients_adding_controller.dart';
import 'package:easybuy_admin_app/model/product_detail_display_arguments.dart';
import 'package:easybuy_admin_app/view/brand/add_brands/add_brand_page.dart';
import 'package:easybuy_admin_app/view/brand/all_brands/all_brands.dart';
import 'package:easybuy_admin_app/view/order_section/order_mainpage.dart';
import 'package:easybuy_admin_app/view/pages/product_view/product_view.dart';
import 'package:easybuy_admin_app/view/pages/products_page/add_product_page.dart';
import 'package:easybuy_admin_app/view/pages/home_page/home_page.dart';
import 'package:easybuy_admin_app/view/pages/products_page/products_page.dart';
import 'package:easybuy_admin_app/view/pages/splashscreen/splash_screen.dart';
import 'package:easybuy_admin_app/view/pages/users_page/users_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RouteProviders {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SplashScreen.routename:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case HomeScreen.routename:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case AddProductScreen.routename:
        return MaterialPageRoute(
          builder: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => ProductImageController(),
              ),
              ChangeNotifierProvider(
                create: (context) => VarientAddingController(),
              )
            ],
            child: const AddProductScreen(),
          ),
        );
      case ProductScreen.routeFromhome:
        return MaterialPageRoute(
          builder: (context) => const ProductScreen(
            title: ProductScreen.routeFromhome,
          ),
        );
      case UsersPage.routename:
        return MaterialPageRoute(builder: (context) => const UsersPage());
      case AllBrands.routname:
        return MaterialPageRoute(builder: (context) => AllBrands());
      case AddBrandPage.routname:
        return MaterialPageRoute(builder: (context) => AddBrandPage());
      case OrderMainScreen.orderRoute:
        return MaterialPageRoute(builder: (context) => const OrderMainScreen());
      case ProductView.routename:
        return MaterialPageRoute(
          builder: (context) {
            final arg = routeSettings.arguments as ProductArgument;
            return ProductView(productDataO: arg);
          },
        );
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (ctx) {
        return  Scaffold(
          body: Center(
            child: Lottie.asset('asset/images/cancel.jpg.png')
          ),
        );
      },
    );
  }
}

