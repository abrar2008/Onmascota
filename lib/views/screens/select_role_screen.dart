import 'package:flutter/material.dart';
import 'package:onmascota/controllers/myController.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/screens/create_account_partner/create_account_partner_screen.dart';
import 'package:onmascota/views/widgets/custom_button.dart';
import 'package:onmascota/model/general_model.dart';

import 'package:get/get.dart';

class SelectRoleScreen extends StatelessWidget {
  //  final General allData;
//  SelectRoleScreen({Key key, this.allData}) : super(key: key);
  final MyController myController = Get.put(MyController());
   
  // int selctedValue;

 
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 250.0,
                child: upperPortion(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                         myController.toggleColor(index);
                          print(index);
                          // colorFromController =
                          //     myController.selectedColor.value;
                          // colorFromController = index;
                          // print(colorFromController);
                          // setState(() {
                          //   _selectedColor = index;
                          // });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Obx(
                            () => Container(
                              width: sizeWidth(context) / 2.5,
                              decoration: BoxDecoration(
                                color: myController.selectedColor.value == index
                                    ? primaryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[200],
                                    blurRadius: 2,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset(
                                    myController.roles[index]['roleImage'],
                                    color: myController.selectedColor.value ==
                                            index
                                        ? Colors.white
                                        : primaryColor,
                                    height: 50,
                                    width: 50,
                                  ),
                                  Text(
                                    "",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: myController.selectedColor.value ==
                                              index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      myController.roles[index]
                                          ['roleDescription'],
                                      style: TextStyle(
                                        color:
                                            myController.selectedColor.value ==
                                                    index
                                                ? Colors.white
                                                : Colors.black,
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                buttonText: "Get Started",
                buttonColor: primaryColor,
                textColor: Colors.white,
                onPress: () {
                    // Get.off(() => CreateAccountPartnerScreen(
                    //     allData: allData,
                    //     index: myController.selectedColor.value,
                    //   ));
                  
                    Get.off(() =>CreateAccountPartnerScreen());

                },
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Container upperPortion() {
  return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [bodyUpper(), avatarUpper()],
      ));
}

Container bodyUpper() {
  return Container(
    margin: EdgeInsets.only(bottom: 40.0),
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/images/Create Partner Page Background.png"),
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("What Are You".toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0)),
          Text("Please Select Your Role",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0)),
        ],
      ),
    ),
  );
}

Container avatarUpper() {
  return Container(
    padding: EdgeInsets.only(top: 20.0),
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      image: DecorationImage(
        image: AssetImage("assets/images/Select Partner Icon.png"),
        fit: BoxFit.fill,
      ),
    ),
  );
}
