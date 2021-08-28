

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmascota/views/auth/login_screen.dart';

enum RequestType { Post, Get, PostWithAuth, GetWithAuth }

class ApiUtil{
  /*----------------- Fpr development server -----------------*/

  static const String BASE_URL = "https://www.onmascota.thevistech.com/api/login";


  static const String MAIN_API_URL_DEV = BASE_URL;

  static const String MAIN_API_URL_PRODUCTION =  BASE_URL;

  //Main Url for production and testing
  static const String MAIN_API_URL = MAIN_API_URL_DEV;

  // ------------------ Status Code ------------------------//
  static const int SUCCESS_CODE = 200;
  static const int ERROR_CODE = 400;
  static const int UNAUTHORIZED_CODE = 401;

  //Custom codes
  static const int INTERNET_NOT_AVAILABLE_CODE = 500;
  static const int SERVER_ERROR_CODE = 501;
  static const int MAINTENANCE_CODE = 503;


  //------------------ Header ------------------------------//

  static Map<String, String> getHeader(
      {RequestType requestType = RequestType.Get, String token = ""}) {
    switch (requestType) {
      case RequestType.Post:
        return {
          "Accept": "application/json",
          "Content-type": "application/json"
        };
      case RequestType.Get:
        return {
          "Accept": "application/json",
        };
      case RequestType.PostWithAuth:
        return {
          "Accept": "application/json",
          "Content-type": "application/json",
          "Authorization": "Bearer " + token
        };
      case RequestType.GetWithAuth:
        return {
          "Accept": "application/json",
          "Authorization": "Bearer " + token
        };
    }
    //Not reachable
    return {"Accept": "application/json"};
  }

  // ----------------------  Body --------------------------//
  static Map<String, dynamic> getPatchRequestBody() {
    return {'_method': 'PATCH'};
  }


  //------------------- API LINKS ------------------------//

  //Maintenance
  static const String MAINTENANCE = "maintenance/";


  //App Data
  static const String APP_DATA = "app_data/";


  //User
  static const String USER = "user/";


  //Auth
  static const String AUTH_LOGIN = "login/";
  static const String AUTH_REGISTER = "register/";

  //----------------- Redirects ----------------------------------//
  static checkRedirectNavigation(BuildContext context, int statusCode) async {
    switch (statusCode) {
      case SUCCESS_CODE:
      case ERROR_CODE:
        return;
      case UNAUTHORIZED_CODE:
        // await AuthController.logoutUser();
        Get.off(LoginScreen());
        return;
      case MAINTENANCE_CODE:
      case SERVER_ERROR_CODE:
        // Get.off(MaintenanceScreen());
        return;
    }
    return;
  }


  static bool isResponseSuccess(int responseCode){
    return responseCode>=200 && responseCode<300;
  }
}