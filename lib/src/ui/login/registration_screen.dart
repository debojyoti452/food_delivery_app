import 'package:flutter/material.dart';
import 'package:ubx_vinne_admin_web/src/base/base_view.dart';
import 'package:ubx_vinne_admin_web/src/utils/constants/app_colors.dart';
import 'package:ubx_vinne_admin_web/src/utils/constants/app_icons.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends BaseView<RegistrationScreen> {
  late PageController _pageController;
  GlobalKey<FormState> formStateKey = GlobalKey();

  @override
  void onStart() {
    _pageController = PageController();
  }

  @override
  Widget onBuild(BuildContext context, BoxConstraints constraints) {
    var _pages = [
      signUpScreen(),
      loginScreen(),
    ];
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: _pages.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (itemContext, index) => _pages[index],
        ),
      ),
    );
  }

  Widget signUpScreen() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Getting started',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          SizedBox.square(
            dimension: 10,
          ),
          Text(
            'Create account to enjoy delicious food',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox.square(dimension: 20),
          containerSocialButton(),
          SizedBox.square(dimension: 30),
          Form(
            key: formStateKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                textFormField(
                  hint: 'Email',
                  onTextChange: (text) {},
                  validationMessage: 'Please enter your email',
                  prefixIcon: Icons.email,
                ),
                textFormField(
                  hint: 'Full Name',
                  onTextChange: (text) {},
                  validationMessage: 'Please enter your name',
                  prefixIcon: Icons.person,
                ),
                textFormField(
                  hint: 'Password',
                  onTextChange: (text) {},
                  validationMessage: 'Please enter your password',
                  prefixIcon: Icons.password,
                  isPassword: true,
                ),
              ],
            ),
          ),
          SizedBox.square(dimension: 30),
          registrationBtn(
            onClick: () {},
            title: 'Sign up',
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextButton(
              onPressed: () {
                _pageController.jumpToPage(1);
              },
              child: Text(
                'Already have an account? Click here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loginScreen() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Getting started',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          SizedBox.square(
            dimension: 10,
          ),
          Text(
            'Create account to enjoy delicious food',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox.square(dimension: 20),
          containerSocialButton(),
          SizedBox.square(dimension: 30),
          Form(
            key: formStateKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                textFormField(
                  hint: 'Email',
                  onTextChange: (text) {},
                  validationMessage: 'Please enter your email',
                  prefixIcon: Icons.email,
                ),
                textFormField(
                  hint: 'Password',
                  onTextChange: (text) {},
                  validationMessage: 'Please enter your password',
                  prefixIcon: Icons.password,
                  isPassword: true,
                ),
              ],
            ),
          ),
          SizedBox.square(dimension: 30),
          registrationBtn(
            onClick: () {},
            title: 'Login',
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextButton(
              onPressed: () {
                _pageController.jumpToPage(0);
              },
              child: Text(
                'Don\'t have an account? Click here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget registrationBtn({
    required VoidCallback onClick,
    required String title,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 45,
      child: TextButton(
        onPressed: onClick,
        style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            enableFeedback: true,
            primary: Colors.white60,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// Widget for textFormField
  Widget textFormField({
    bool isPassword = false,
    required String hint,
    required IconData prefixIcon,
    required String validationMessage,
    required Function(String text) onTextChange,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.grey),
          hintText: hint,
          prefixIcon: Icon(
            prefixIcon,
            color: AppColors.primaryColor,
          ),
          focusColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: AppColors.secondaryColor,
              width: 2,
            ),
          ),
          isDense: true,
          suffixIcon: isPassword
              ? IconButton(onPressed: () {}, icon: Icon(Icons.visibility))
              : null,
        ),
        obscureText: isPassword,
        onChanged: (value) => onTextChange,
        validator: (value) {
          if (value == null) {
            return validationMessage;
          } else {
            return value;
          }
        },
      ),
    );
  }

  /// Container for Social Account Login Button
  Row containerSocialButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppIcons.googleLoginBtn),
        SizedBox.square(dimension: 10),
        Image.asset(AppIcons.fbLoginBtn),
      ],
    );
  }

  @override
  void onStop() {}
}
