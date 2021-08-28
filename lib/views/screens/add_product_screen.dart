import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/widgets/custom_button.dart';
import 'package:onmascota/views/widgets/custom_textfield.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  bool boldPressed = false;
  bool italicPressed = false;
  bool underlinePressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.white),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   title: Text(
      //     "Add Product",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 35.0,
              ),
              CustomTextFormField(
                hintText: "Product Name*",
                isObscure: false,
                keyBoardType: TextInputType.name,
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomTextFormField(
                hintText: "Price*",
                isObscure: false,
                keyBoardType: TextInputType.name,
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomTextFormField(
                hintText: "Quantity in Stock*",
                isObscure: false,
                keyBoardType: TextInputType.name,
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: DropdownSearch<String>(
                  dropdownSearchDecoration:
                      InputDecoration(border: InputBorder.none),
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: ["C1", "C2", "C3"],
                  hint: "Category",
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: DropdownSearch<String>(
                  dropdownSearchDecoration:
                      InputDecoration(border: InputBorder.none),
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: ["R1", "R2", "R3"],
                  hint: "Related Pets",
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 2.0,
                    offset: const Offset(0, 5),
                  )
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: DropdownSearch<String>(
                        searchBoxDecoration:
                            InputDecoration(border: InputBorder.none),
                        dropdownSearchDecoration:
                            InputDecoration(border: InputBorder.none),
                        showAsSuffixIcons: true,
                        mode: Mode.MENU,
                        showSelectedItem: true,
                        items: ["P1", "P2", "P3"],
                        hint: "Paragraph",
                        popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: print,
                      ),
                    ),
                    Container(
                      height: 35,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 2.0,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                boldPressed = !boldPressed;
                              });
                            },
                            child: Icon(
                              Icons.format_bold,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                italicPressed = !italicPressed;
                              });
                            },
                            child: Icon(
                              Icons.format_italic_outlined,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.attachment_outlined,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 35,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 2.0,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.more_vert),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 2.0,
                    offset: const Offset(0, 5),
                  )
                ]),
                child: TextFormField(
                  maxLines: null,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight:
                        boldPressed ? FontWeight.bold : FontWeight.normal,
                    fontStyle:
                        italicPressed ? FontStyle.italic : FontStyle.normal,
                  ),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "Description",
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: double.infinity,
                height: 120.0,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 2.0,
                    offset: const Offset(0, 5),
                  )
                ]),
                child: Stack(
                  children: <Widget>[
                    TextFormField(
                      enabled: false,
                      style: TextStyle(color: Colors.grey),
                      minLines: 6,
                      maxLines: 6,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: "",
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 35.0, left: 125.0),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                        color: Colors.grey.shade300,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                      // child: Icon(Icons.camera_alt)
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomButton(
                buttonText: "Save".toUpperCase(),
                buttonColor: primaryColor,
                textColor: Colors.white,
                onPress: () {},
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
