import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_process/services/const_service.dart';

class LoginPage extends StatefulWidget {
  static const id = "/login_page";

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#\$%^&+=])(?=\\S+\$).{8,20}\$";

  bool isEmail = false;
  bool isPassword = false;
  bool isVisibility = false;
  bool isHide = true;
  bool isErrorEmail = false;
  bool isErrorPassword = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        primary: true,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 80, 25, 55),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // #body
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // #app_logo
                    SvgPicture.asset("assets/icons/ic_logo.svg"),
                    const SizedBox(
                      height: 25,
                    ),

                    // #segment_control
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 47.5,
                      width: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.5),
                          color: AppConstants.colorUnSelectedButton),
                      child: Row(
                        children: [
                          // #log_in
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                primary: AppConstants.colorSelectedButton,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Log in",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),

                          // #registr
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                  color: AppConstants.colorText,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    // #email
                    const Text(
                      "Email address",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        color: AppConstants.colorText,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      onTap: () {
                        setState(() {
                          isPassword = false;
                          isVisibility = false;
                        });
                        if(emailController.text.isNotEmpty) {
                          setState(() {
                            isEmail = true;
                          });
                        } else {
                          setState(() {
                            isEmail = false;
                          });
                        }
                      },
                      onChanged: (text) {
                        setState(() {
                          isPassword = false;
                          isVisibility = false;
                        });
                        if(text.isNotEmpty) {
                          setState(() {
                            isEmail = true;
                          });
                        } else {
                          setState(() {
                            isEmail = false;
                          });
                        }
                      },
                      onEditingComplete: () {
                        setState(() {
                          isEmail = false;
                          isPassword = false;
                          isVisibility = false;
                        });
                      },
                      controller: emailController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15,),
                        alignLabelWithHint: true,
                        isCollapsed: true,
                        filled: true,
                        fillColor: AppConstants.colorField,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: AppConstants.colorTextFieldBorder, width: 1),
                        ),
                        hintText: "you@example.com",
                        hintStyle: const TextStyle(
                          color: AppConstants.colorText,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: AppConstants.colorTextFieldBorder, width: 1),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: AppConstants.colorError, width: 1),
                        ),
                        errorStyle: TextStyle(
                          color: isErrorEmail ? AppConstants.colorError : AppConstants.colorError,
                        ),
                        suffixIcon: isEmail ? GestureDetector(
                          onTap: () {
                            emailController.clear();
                            setState(() {
                              isEmail = false;
                            });
                          },
                          child: Icon(
                            Icons.close,
                            color: isErrorEmail ? AppConstants.colorError : AppConstants.colorTypingText,
                            size: 16,
                          ),
                        ) : const SizedBox.shrink(),
                      ),
                      style:  TextStyle(
                        color: isErrorEmail ? AppConstants.colorError : AppConstants.colorTypingText,
                        fontSize: 13,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                      cursorColor: AppConstants.colorTextButton,
                      cursorWidth: 2,
                      cursorHeight: 18,
                      validator: (email) {
                        if(email != null && email.isNotEmpty && email.contains("@")) {
                          setState(() {
                            isErrorEmail = false;
                          });
                          return null;
                        } else {
                          setState(() {
                            isErrorEmail = true;
                          });
                          return "Please enter valid email!";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // #password
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        color: AppConstants.colorText,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      onTap: () {
                        setState(() {
                          isEmail = false;
                          isVisibility = true;
                        });
                        if(passwordController.text.isNotEmpty) {
                          setState(() {
                            isPassword = true;
                          });
                        } else {
                          setState(() {
                            isPassword = false;
                          });
                        }
                      },
                      onChanged: (text) {
                        setState(() {
                          isEmail = false;
                          isVisibility = true;
                        });
                        if(text.isNotEmpty) {
                          setState(() {
                            isPassword = true;
                          });
                        } else {
                          setState(() {
                            isPassword = false;
                          });
                        }
                      },
                      onEditingComplete: () {
                        setState(() {
                          isEmail = false;
                          isPassword = false;
                          isVisibility = false;
                        });
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15,),
                        alignLabelWithHint: true,
                        isCollapsed: true,
                        filled: true,
                        fillColor: AppConstants.colorField,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: AppConstants.colorTextFieldBorder, width: 1),
                        ),
                        hintText: "Your password",
                        hintStyle: TextStyle(
                          color: isErrorPassword ? AppConstants.colorError : AppConstants.colorText,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: AppConstants.colorTextFieldBorder, width: 1),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: AppConstants.colorError, width: 1),
                        ),
                        errorStyle: const TextStyle(
                          color: AppConstants.colorError,
                        ),
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            isPassword ? GestureDetector(
                              onTap: () {
                                passwordController.clear();
                                setState(() {
                                  isPassword = false;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Icon(
                                  Icons.close,
                                  color: isErrorPassword ? AppConstants.colorError : AppConstants.colorTypingText,
                                  size: 16,
                                ),
                              ),
                            ) : const SizedBox.shrink(),
                            isVisibility ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHide = !isHide;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  isHide ? Icons.visibility: Icons.visibility_off,
                                  color: isErrorPassword ? AppConstants.colorError : AppConstants.colorTypingText,
                                  size: 16,
                                ),
                              ),
                            ) : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                      style: TextStyle(
                        color: isErrorPassword ? AppConstants.colorError : AppConstants.colorTypingText,
                        fontSize: 13,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                      cursorColor: AppConstants.colorTextButton,
                      cursorWidth: 2,
                      cursorHeight: 18,
                      obscureText: isHide,
                      obscuringCharacter: "*",
                      validator: (password) {
                        if(password != null && password.length >= 8 && password.contains(RegExp(regex))) {
                          setState(() {
                            isErrorPassword = false;
                          });
                          return null;
                        } else {
                          setState(() {
                            isErrorPassword = true;
                          });
                          return "Please enter valid password";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    // #sign_in
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppConstants.colorMainButton,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter",
                        ),
                        fixedSize: Size(MediaQuery.of(context).size.width, 60),
                      ),
                      onPressed: () {
                        formKey.currentState!.validate();
                      },
                      child: const Text(
                        "Sign In",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // #forgot_password
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: AppConstants.colorTextButton,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),

                // #footer
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // #sign_in_with
                    const Text(
                      "Sign in with",
                      style: TextStyle(
                          color: AppConstants.colorText,
                          fontFamily: "Inter",
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    // #icons
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            clipBehavior: Clip.antiAlias,
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppConstants.colorIconButton,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/ic_apple.svg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            clipBehavior: Clip.antiAlias,
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppConstants.colorIconButton,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/ic_meta.svg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            clipBehavior: Clip.antiAlias,
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppConstants.colorIconButton,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/ic_twitter.svg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
