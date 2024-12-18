import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'gold-app-screen.dart';

//get used for
//it is state management and its architecture and for code shortage --
//1st usage --- used for navigations ...Get.to(()=> FbScreen())


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const //Calculator()
        GoldHome()
      //LoginPage()
      //SignupPage()
      // FbScreen()
      // InputClass()
      //TasbeehCounter()
      // ChatsScreen()
      //SplashScreen()
      //TextButtonClass(),
      //IconButtonClass()
      //OutputClass(),

      //HomeScreen(),

      //  Scaffold(
      //  backgroundColor: const Color(0xFFF7F2FA),
      //  body: Center(
      //  child: Container(
      //  height: 500,
      //  width: 500,
      //  decoration: BoxDecoration(
      //  color: const Color(0xFFE8EAF6),
      //  borderRadius: BorderRadius.circular(20),
      //  boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.5),
      //     blurRadius: 10,
      //    offset: const Offset(0, 5),
      //   ),
      //  ],
      //  ),
      //  child: Column(

      //   children: [
      //     const Text(
      //      "Sign Up",
      //  style: TextStyle(
      //    fontSize: 28,
      //    fontWeight: FontWeight.bold,
      //    color: Color(0xFF6A1B9A),
      //   ),
      //   ),
      //   const SizedBox(height: 20),
      //   _buildInputField("Enter Your First Name"),
      //  const SizedBox(height: 15),
      //  _buildInputField("Enter Your Last Name"),
      //   const SizedBox(height: 15),
      //   _buildInputField("Enter Your Phone Number"),
      //   const SizedBox(height: 15),
      //   _buildInputField("Enter Your Email"),
      //   const SizedBox(height: 15),
      //   _buildInputField("Enter Your Password"),
      //    const SizedBox(height: 15),
      //   _buildInputField("Confirm Password"),
      //   const SizedBox(height: 20),
      //  GestureDetector(
      //   onTap: () {
      // Add your signup action here
      //  },
      //  child: Container(
      //    height: 45,
      //    width: 150,
      //  decoration: BoxDecoration(
      //   gradient: const LinearGradient(
      //    colors: [
      //      Color(0xFFAB47BC),
      //     Color(0xFF8E24AA),
      //  ],
      //  begin: Alignment.topLeft,
      //  end: Alignment.bottomRight,
      // ),
      //   borderRadius: BorderRadius.circular(25),
      //   boxShadow: [
      //   BoxShadow(
      //   color: Colors.purple.withOpacity(0.5),
      //  blurRadius: 10,
      //   offset: const Offset(0, 5),
      //   ),
      //   ],
      //  ),
      // child: const Center(
      // child: Text(
      // 'Submit',
      // style: TextStyle(
      //  color: Colors.white,
      //  fontSize: 18,
      // fontWeight: FontWeight.bold,
      //  ),
      // ),
      //  ),
      //  ),
      // ),
      //],
      // ),
      //  ),
      // ),
      //),
    );
  }

  // Reusable function for creating input fields
  Widget _buildInputField(String placeholder) {

    return Container(
      height: 45,
      width: 300,
      decoration: BoxDecoration(
        color: const Color(0xFFC5CAE9), // Soft blue input background
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          placeholder,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF283593), // Dark blue text
          ),
        ),
      ),
    );
  }
}
