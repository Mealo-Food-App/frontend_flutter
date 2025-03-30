import 'package:app/custom_button.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height );
    print(MediaQuery.of(context).size.width );
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFF9F9F9),
                  Color(0xFFFFBCC0),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/signin_img.png'),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'AppName',
                          style: TextStyle(
                            fontSize: 36,
                            color: Color(0xFFCF353F),
                            fontFamily: 'Pacifico',
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Facilitating Seamless Connections Between Culinary Enthusiasts and Dining Establishments',
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        // Log In button triggers bottom sheet
                        CustomButton(
                          onTap: () {
                            _showLoginOptions(context);
                          },
                          text: 'Log In',
                          backgroundColor: Colors.transparent,
                          textColor: const Color(0xFFCF353F),
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          onTap: () {
                            Navigator.pushNamed(context, '/biodata');
                          },
                          text: 'Sign Up',
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to show bottom modal with 2 custom buttons
  void _showLoginOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, '/navigate');
                },
                text: 'Subscriber',
              ),
              const SizedBox(height: 10),
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, '/restro_navigate');
                },
                text: 'Restro',
                backgroundColor: Colors.transparent,
                textColor: const Color(0xFFCF353F),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
