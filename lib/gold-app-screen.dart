import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';

class GoldHome extends StatefulWidget {
  const GoldHome({super.key});

  @override
  State<GoldHome> createState() => _GoldHomeState();
}

class _GoldHomeState extends State<GoldHome> {
  TextEditingController goldPriceController = TextEditingController();
  TextEditingController tolaQuantityController = TextEditingController();
  TextEditingController gramQuantityController = TextEditingController();
  TextEditingController rattiQuantityController = TextEditingController();
  TextEditingController pointQuantityController = TextEditingController();
  double res = 0.0;
  double tolaPrice = 0.0;
  double gramTotalPrice = 0.0;
  double rattiPrice = 0.0;
  double pointstotalprice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  Text(
          'Gold Shop App',

          style: TextStyle(

            color: Color(0xFF926C15),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goldPriceController.clear();
          tolaQuantityController.clear();
          gramQuantityController.clear();
          rattiQuantityController.clear();
          pointQuantityController.clear();
        },
        backgroundColor: const Color(0xFF926C15),
        child: const Icon(Icons.clear, color: Colors.white),
      ),
      body: Stack(
        children: [
          // Animated Background Image
          Positioned.fill(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 3),
              opacity: 0.8,
              child: Image.asset(
                'assets/img13.jpg', // Add your image here
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blur Effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Input for Tola Price
                  buildInputField(goldPriceController, 'Enter Tola Price'),

                  // Input for Tola Quantity
                  buildInputField(tolaQuantityController, 'Enter Tola Quantity'),

                  // Input for Gram Quantity
                  buildInputField(gramQuantityController, 'Enter Gram Quantity'),

                  // Input for Ratti Quantity
                  buildInputField(rattiQuantityController, 'Enter Ratti Quantity'),

                  // Input for Price Per Point
                  buildInputField(pointQuantityController, 'Enter Price Per Point'),

                  const SizedBox(height: 20),

                  // Price for Tolas ...this is custom widgetsx
                  buildResultText('Price for Tolas = Rs ${tolaPrice.toStringAsFixed(2)}'),
                  const SizedBox(height: 8),
                  // Price for Grams
                  buildResultText('Price for Grams = Rs ${gramTotalPrice.toStringAsFixed(2)}'),
                  const SizedBox(height: 8),
                  // Price for Ratti
                  buildResultText('Price for Ratti = Rs ${rattiPrice.toStringAsFixed(2)}'),
                  const SizedBox(height: 8),
                  // Price for Points
                  buildResultText('Price Per Points = Rs ${pointstotalprice.toStringAsFixed(2)}'),
                  const SizedBox(height: 8),
                  // Total Price
                  buildResultText('Total Price = Rs ${res.toStringAsFixed(2)}'),

                  const SizedBox(height: 22),

                  Center(
                    child: IconButton(
                      onPressed: () {
                        if (goldPriceController.text == '') {
                          Get.snackbar(
                            icon: const Icon(Icons.error_outline, color: Colors.white),
                            'Error',
                            titleText: const Text(
                              'Error',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            duration: const Duration(seconds: 5),
                            'Field must be filled',
                            colorText: Colors.white,
                            backgroundColor: Colors.black26.withOpacity(0.2),
                          );
                        } else {
                          if (tolaQuantityController.text == '') tolaQuantityController.text = '0';
                          if (gramQuantityController.text == '') gramQuantityController.text = '0';
                          if (rattiQuantityController.text == '') rattiQuantityController.text = '0';
                          if (pointQuantityController.text == '') pointQuantityController.text = '0';

                          double goldPrice = double.parse(goldPriceController.text);
                          double tolaQuantity = double.parse(tolaQuantityController.text);
                          double gramQuantity = double.parse(gramQuantityController.text);
                          double rattiQuantity = double.parse(rattiQuantityController.text);

                          double pricePerGram = goldPrice / 11.664;
                          double pricePerRatti = goldPrice / 96;
                          double pricepoints = goldPrice / 960;

                          gramTotalPrice = pricePerGram * gramQuantity;
                          tolaPrice = goldPrice * tolaQuantity;
                          rattiPrice = pricePerRatti * rattiQuantity;
                          pointstotalprice = pricepoints * double.parse(pointQuantityController.text);

                          res = tolaPrice + gramTotalPrice + rattiPrice + pointstotalprice;

                          setState(() {});
                        }
                      },
                      icon: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFF926C15),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.calculate,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(TextEditingController controller, String hintText) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF805B10),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Color(0xFF6A4B1F), fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFF6A4B1F), fontWeight: FontWeight.bold),
          filled: true,
          fillColor: Colors.transparent,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        ),
      ),
    );
  }

  Widget buildResultText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF6A4B1F),
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }
}
