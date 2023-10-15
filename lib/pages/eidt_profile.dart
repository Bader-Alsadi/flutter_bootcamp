

import 'package:app/Data/edit_Page_data.dart';
import 'package:app/routeNames.dart';
import 'package:app/theme/colors.dart';
import 'package:app/theme/padding.dart';
import 'package:app/widgets/cuntom_Elevated_button.dart';
import 'package:app/widgets/custom_text_fild.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});
  static String route = editProfile;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String imageSre = "../../assets/image/index.jpeg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: primary,
        title: Text("Edit Profile".toUpperCase()),
        leading: Icon(
          Icons.arrow_back,
          color: yellow,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: miniSpacer),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: spacer,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      "assets/image/index.jpeg",
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 70,
                    child: InkWell(
                      onTap: () async {
                        ImagePicker imagePicker = ImagePicker();
                        XFile? imagePath = await imagePicker.pickImage(
                            source: ImageSource.camera);
                        imageSre != imagePath!.path;
                        setState(() {});
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: yellow,
                        child: Icon(
                          Icons.camera_alt,
                          color: black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: editData.length,
                  itemBuilder: (context, index) => customTextFild(
                    labelFild: editData[index],
                    suffixIconColor: white,
                    suffixIcon: index == 2 ? Icons.remove_red_eye : null,
                  ),
                ),
              ),
              SizedBox(
                height: spacer * 2,
              ),
              customElevatedButton(
                TextValue: "save changes",
                backgroundColor: divider,
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
