import 'package:flutter/material.dart';

import 'package:onmascota/views/auth/login_screen.dart';
import 'package:onmascota/views/auth/reset_password.dart';
import 'package:onmascota/views/screens/about_us_screen.dart';
import 'package:onmascota/views/screens/add_product_screen.dart';
import 'package:onmascota/views/screens/edit_profile_screen.dart';
import 'package:onmascota/views/screens/history/history_screen.dart';
import 'package:onmascota/views/screens/map_screens/drop_off_details_screen.dart';
import 'package:onmascota/views/screens/map_screens/parcel_details_screen.dart';
import 'package:onmascota/views/screens/map_screens/pick_up_address_screen.dart';
import 'package:onmascota/views/screens/map_screens/select_rider_map.dart';
import 'package:onmascota/views/screens/my_orders_screen.dart';
import 'package:onmascota/views/screens/my_products_screen.dart';
import 'package:onmascota/views/screens/notification_screen.dart';
import 'package:onmascota/views/screens/privacy_policy_screen.dart';
import 'package:onmascota/views/screens/profile.dart';
import 'package:onmascota/views/screens/rating_reviews_screen.dart';
import 'package:onmascota/views/screens/select_role_screen.dart';
import 'package:onmascota/views/screens/setting_screen.dart';
import 'package:onmascota/views/screens/splash_gif/splash_screen.dart';
import 'package:onmascota/views/screens/start_screen.dart';
import 'package:onmascota/views/screens/start_screen2.dart';
import 'package:onmascota/views/screens/support_screen.dart';
import 'package:onmascota/views/screens/terms_condition_screen.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashScreenWithGif());
      case 'StartScreen':
        return MaterialPageRoute(builder: (context) => StartScreen());
      case 'StartScreen2':
        return MaterialPageRoute(builder: (context) => StartScreen2());
      case 'LogIn':
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case 'ResetPassword':
        return MaterialPageRoute(builder: (context) => ResetPasswordScreen());
      case 'SelectRole':
        return MaterialPageRoute(builder: (context) => SelectRoleScreen());
      case 'MyProducts':
        return MaterialPageRoute(builder: (context) => MyProducts());
      case 'MyOrders':
        return MaterialPageRoute(builder: (context) => MyOrdersScreen());
      case 'History':
        return MaterialPageRoute(builder: (context) => HistoryScreen());
      case 'MyProfile':
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      case 'Notification':
        return MaterialPageRoute(builder: (context) => NotificationScreen());
      case 'SettingScreen':
        return MaterialPageRoute(builder: (context) => SettingScreen());
      case 'AddProduct':
        return MaterialPageRoute(builder: (context) => AddProductScreen());
      case 'EditProfile':
        return MaterialPageRoute(builder: (context) => EditProfileScreen());
      case 'TermsAndConditions':
        return MaterialPageRoute(
            builder: (context) => TermsAndConditionScreen());
      case 'AboutUs':
        return MaterialPageRoute(builder: (context) => AboutUs());
      case 'Support':
        return MaterialPageRoute(builder: (context) => CustomerSupportScreen());
      case 'Privacypolicy':
        return MaterialPageRoute(builder: (context) => PrivacyPolicyScreen());
      case 'RatingAndReviews':
        return MaterialPageRoute(builder: (context) => RatingReviewsScreen());
      //adadasd
      case 'DropOffDetails':
        return MaterialPageRoute(builder: (context) => DropOffDetailsScreen());
      case 'ParcelDetails':
        return MaterialPageRoute(builder: (context) => ParcelDetailsScreen());
      case 'PickUpAddress':
        return MaterialPageRoute(builder: (context) => PickUpDetailsScreen());
      case 'SelectRider':
        return MaterialPageRoute(builder: (context) => SelectRiderMap());
    }
  }
}
