
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tinder_cupboard/ui/screen/chat_screen.dart';
import 'package:tinder_cupboard/ui/screen/login_screen.dart';
import 'package:tinder_cupboard/ui/screen/matched_screen.dart';
import 'package:tinder_cupboard/ui/screen/register_screen.dart';
import 'package:tinder_cupboard/ui/screen/splash_screen.dart';
import 'package:tinder_cupboard/ui/screen/start_screen.dart';
import 'package:tinder_cupboard/ui/screen/top_navigation_screen.dart';
import 'package:tinder_cupboard/util/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'data/provider/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Future<Widget> build(BuildContext context) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: kFontFamily,
          buttonColor: kAccentColor,
          indicatorColor: kAccentColor,
          scaffoldBackgroundColor: kPrimaryColor,
          hintColor: kSecondaryColor,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            headline3: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold),
            headline4: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            button: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ).apply(
            bodyColor: kSecondaryColor,
            displayColor: kSecondaryColor,
          ),
          buttonTheme: ButtonThemeData(
            splashColor: Colors.transparent,
            padding: EdgeInsets.symmetric(vertical: 14),
            buttonColor: kAccentColor,
            textTheme: ButtonTextTheme.accent,
            highlightColor: Color.fromRGBO(0, 0, 0, .3),
            focusColor: Color.fromRGBO(0, 0, 0, .3),
          ), colorScheme: ColorScheme.fromSwatch(primarySwatch: MaterialColor(kBackgroundColorInt, kThemeMaterialColor)).copyWith(secondary: kSecondaryColor),
        ),
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          StartScreen.id: (context) => StartScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          TopNavigationScreen.id: (context) => TopNavigationScreen(),
          MatchedScreen.id: (context) => MatchedScreen(
            myProfilePhotoPath: (ModalRoute.of(context)?.settings.arguments
            as Map)['my_profile_photo_path'],
            myUserId: (ModalRoute.of(context)?.settings.arguments
            as Map)['my_user_id'],
            otherUserProfilePhotoPath: (ModalRoute.of(context)
                ?.settings
                .arguments as Map)['other_user_profile_photo_path'],
            otherUserId: (ModalRoute.of(context)?.settings.arguments
            as Map)['other_user_id'],
          ),
          ChatScreen.id: (context) => ChatScreen(
            chatId: (ModalRoute.of(context)?.settings.arguments
            as Map)['chat_id'],
            otherUserId: (ModalRoute.of(context)?.settings.arguments
            as Map)['other_user_id'],
            myUserId: (ModalRoute.of(context)?.settings.arguments
            as Map)['user_id'],
          ),
        },
      ),
    );
  }
}