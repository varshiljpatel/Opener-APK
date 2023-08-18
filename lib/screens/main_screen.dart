 import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wsn/utils/constants.dart';
import 'package:wsn/widgets/snake_bar.dart';
import 'package:wsn/widgets/text_field.dart';
import 'package:wsn/services/create_url.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static MaterialPageRoute route() => MaterialPageRoute(builder: (context) => const MainScreen());

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController controller = TextEditingController();
  // VoidCallback onPressed = () {
  //
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WSN"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: <Widget>[
                        input(placeholder: "Enter a Number", controller: controller, enabled: true),

                        const SizedBox(height: 32.0),

                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Call Icon
                      InkWell(
                        onTap: () {
                          try {
                            launchUrlString("tel://+91${controller.text}");
                          } catch (e) {
                            showSnakeBar(content: "Please enter valid number", context: context);
                          }
                        },
                        child: Ink(
                          decoration: const BoxDecoration(
                            // border: Border.all(width: 3.0, color: appBrand),
                              shape: BoxShape.circle
                          ),
                          child: Icon(Icons.call_sharp, color: appBrand, size: 28),
                        ),
                      ),

                      const SizedBox(width: 24.0),

                      // SMS Icon
                      InkWell(
                        onTap: () {
                          try {
                            launchUrlString("sms://+91${controller.text}");
                          } catch (e) {
                            showSnakeBar(content: "Please enter valid number", context: context);
                          }
                        },
                        child: Ink(
                          decoration: const BoxDecoration(
                            // border: Border.all(width: 3.0, color: appBrand),
                              shape: BoxShape.circle
                          ),

                          child: Icon(Icons.message_sharp, color: appBrand, size: 28),
                        ),
                      ),

                      const SizedBox(width: 24.0),

                      InkWell(
                        onTap: () {
                          try {
                            launchUrlString(whatsappUrl(number: controller.text));
                          } catch (e) {
                            showSnakeBar(content: "Please enter valid number", context: context);
                          }
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            color: appBrand,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 3,
                                offset: const Offset(0, 5)
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Icon(Icons.arrow_right_alt_outlined, color: light100, size: 36),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
