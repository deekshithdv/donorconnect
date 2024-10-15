import 'package:donorconnect/language/helper/language_extention.dart';
import 'package:flutter/material.dart';
import '../login/login.dart';
import '../register/signup.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    // Define the transition effect function
    Route _createRoute(Widget page) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 6.0;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return FadeTransition(
            opacity: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration:
            const Duration(milliseconds: 700), // Increase the duration to 700ms
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // IMAGE
          Image.asset(
            'assets/images/home.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => Navigator.of(context)
                    .push(_createRoute(const Signuppage())),
                child: Center(
                  child: Container(
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.85,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Center(
                      child: Text(
                        context.localizedString.signup,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.04),
                child: InkWell(
                  onTap: () => Navigator.of(context)
                      .pushReplacement(_createRoute(const LoginPage())),
                  child: Center(
                    child: Container(
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.85,
                      decoration: BoxDecoration(
                          color: Colors.green.shade900,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      child: Center(
                        child: Text(
                          context.localizedString.login,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
