import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/resources/auth_method.dart';
import 'package:insta_clone/responsive/responsive_layout_screen.dart';
import 'package:insta_clone/screens/login_screen.dart';
import 'package:insta_clone/utils/color.dart';
import 'package:insta_clone/widgets/text_field_input.dart';

import '../responsive/mobile_screen_layout.dart';
import '../responsive/webscreen_layout.dart';
import '../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passWordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            //SVG Image
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              color: primaryColor,
              height: 64,
            ),
            const SizedBox(
              height: 64,
            ),
            Stack(children: [
              CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage('https://lh3.googleusercontent.com/s7PTGMeASAukHub6Cuqdm5UpLGHc0VcPxjIW6GgymTeRcIVNsg9y974o3RqV9G-dgRTnTvPKMPby2maUgbMYGe4B5L95k3swOWaU12Un4hHbVukBDfJBarrCKN4zXfQswwZLTK4UXS--ZKJ1Acrr9XXfctqk_5XbSP1GbYalWjtP9LeJj7j_Qjd4cMm2y_FJe5g6xZjhPamU9SZutn_fRuBGWgcXdldkYmXXnaC0l49Ob_R2hWq9yRWjYgu1UtzPoAG9yZRnWHBwtgjXwELOfDk2_NPd1BwYOKedcJmL_kLlLHIkbIvJoMWhHoqfpSfZeQm6w9vjefy2q6MzGV1CvTBv7mvZG9BzuAjI_GwzrtlkGx0dqDy8eZZpZbfrGa37DelPeIwIx5JRxTC_50HRgOYUVB79021eFGgWRzeO7-DOKtHot09dDRY1DpUifJ-ryCX1IupTUi59rXIn4g0X2U3KqJO-sTlWOUYsuA5S2kdS5Q3ZkFdhBIAJaZDq5y6gnXS35iodVzBIZUZK9Jf9U2OzkiB_D7peKG_-tVsVEfvOeRgEdDjtZj0phmRYQp2SrK9RKpHtM02SGGJ1L2pYA_rDu8mHw_IwbGqk8B3wbwI4KkMUMdyLGiyzPehiHWX2HWEfS6UeUBcvyV-HdBa_lM5PYLX6VRXhILDJZj_AvORfxEcPKspTOXtRpLNu-hAPsNlfz89iUqNTFFiR98AFL3NN=s895-no?authuser=0'),
              )
            ],),
            //username
            TextFieldInput(
                hintText: "Enter your username",
                textEditingController: _usernameController,
                textInputType: TextInputType.text),
            const SizedBox(
              height: 24,
            ),

            //email

            TextFieldInput(
                hintText: "Enter your Email",
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress),
            const SizedBox(
              height: 24,
            ),
            //password
            TextFieldInput(
                hintText: "Enter your password",
                textEditingController: _passWordController,
                isPass: true,
                textInputType: TextInputType.text),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
                hintText: "Enter your Bio",
                textEditingController: _bioController,
                textInputType: TextInputType.text),
            const SizedBox(
              height: 24,
            ),

            //button signUp
            InkWell(
              onTap: () async {
                signUpUser();
              },
              child: Container(
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : const Text("Sign Up"),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                    color: blueColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)))),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            //Transisition signin
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text("Don't have an account ?"),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                InkWell(
                  onTap: () async {
                    navigateToLogin();
                  },
                  child: Container(
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  void navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });

    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passWordController.text,
        username: _usernameController.text,
        bio: _bioController.text);
    if (kDebugMode) {
      print(res);
    }
    if (res == "Success") {
      showSnackBar(context, res);
    } else {
      //
      showSnackBar(context, res);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout())));
    }
    setState(() {
      isLoading = false;
    });
  }
}
