 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wsn/utils/constants.dart';
import 'package:wsn/widgets/snake_bar.dart';
import 'package:wsn/widgets/text_field.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static MaterialPageRoute route() => MaterialPageRoute(builder: (context) => const MainScreen());

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String desc = "Introducing \"eChat\" the all-new WhatsApp Direct Dialer! This handy app lets you quickly and easily dial any WhatsApp contact without having to worry about exposing your own number. Simply enter the contact's phone number, and our app will do the rest. We'll even redirect you to their WhatsApp chat so you can start talking right away.\neChat(WhatsApp Direct Dialer) is the perfect way to stay connected with your friends and family without having to worry about privacy. It's easy to use, fast, and secure. So what are you waiting for? Download WhatsApp Direct Dialer today!";

  String isPerfectText(TextEditingController controller) {
    return controller.text.toString().replaceAll("+91", '')..replaceAll(RegExp('[a-zA-Z0-9]'), '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset("assets/ic_logo.svg", colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn), height: 20),
            const SizedBox(width: 10,),
            SvgPicture.asset("assets/OpenEr.svg", height: 20, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          ],
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            color: light100,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 1,
                  child: const Text('Source'),
                  onTap: () {
                    try {
                      launchUrl(Uri.parse("https://www.github.com/varshiljpatel/Opener-APK"));
                    } catch (e) {
                      if (kDebugMode) {
                        print("Error :- $e");
                      }
                      showSnakeBar(content: "Failed to open", context: context);
                    }
                  },
                )
              ];
            }

          ),
        ],
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
                        // const SizedBox(height: 32.0),
                        input(placeholder: "Enter a Number", controller: controller, enabled: true),
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
                      GestureDetector(
                        onTap: () {
                          try {
                            if (controller.text.isNotEmpty) {
                              launchUrlString("tel:+91${isPerfectText(controller)}");
                            } else {
                              throw Error();
                            }
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
                      GestureDetector(
                        onTap: () {
                          try {
                            if (controller.text.isNotEmpty) {
                              launchUrlString("sms:+91${isPerfectText(controller)}");
                            } else {
                              throw Error();
                            }
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
                        borderRadius: BorderRadius.circular(1000),
                        onTap: () {
                          try {
                            launchUrlString(whatsappUrl(number: isPerfectText(controller)));
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
