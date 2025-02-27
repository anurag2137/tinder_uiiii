import 'package:flutter/material.dart';

import 'package:tinder_cupboard/ui/screen/register_screen.dart';

import '../../util/constants.dart';
import '../widgets/app_image_with_text.dart';
import '../widgets/rounded_button.dart';
import '../widgets/rounded_outlined_button.dart';
import 'login_screen.dart';

class StartScreen extends StatelessWidget {
  static const String id = 'start_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: kDefaultPadding,
          child: Container(
            margin: EdgeInsets.only(bottom: 40, top: 120),
            child: Column(
              children: [
                AppIconTitle(),
                Expanded(child: Container()),
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Lorel ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Nulla in orci justo. Curabitur ac gravida quam.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                SizedBox(height: 60),
                RoundedButton(
                    text: 'CREATE ACCOUNT',
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, RegisterScreen.id);
                    }),
                SizedBox(height: 20),
                RoundedOutlinedButton(
                  text: 'LOGIN',
                  onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}