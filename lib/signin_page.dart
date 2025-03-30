import 'package:frontend_flutter/custom_button.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {

  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFF9F9F9),
                  Color(0xFFFFBCC0)
                ]
              )
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
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('AppName', style: TextStyle(fontSize: 36, color: Color(0xFFCF353F), fontFamily: 'Pacifico')),
                        SizedBox(height: 10,),
                        Text('Facilitating Seamless Connections Between Culinary Enthusiasts and Dining Establishments', overflow: TextOverflow.clip, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: 'Nunito', fontWeight: FontWeight.w700),),
                        SizedBox(height: 10,),
                        CustomButton(
                          onTap: () => {
                            Navigator.pushNamed(context, '/navigate')
                          },
                          text: 'Log In',
                          backgroundColor: Colors.transparent,
                          textColor: Color(0xFFCF353F),
                        ),
                        SizedBox(height: 10,),
                        CustomButton(
                          onTap: () => {
                            Navigator.pushNamed(context, '/biodata')
                          },
                          text: 'Sign Up',
                        ),
                        SizedBox(height: 48,),
                      ],
                    ),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
