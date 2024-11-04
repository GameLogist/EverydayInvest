import 'package:everyday_invest/src/constants/colors.dart';
import 'package:everyday_invest/src/features/authentication/view/onboarding/onboarding_page_view.dart';
import 'package:everyday_invest/src/features/authentication/view/onboarding/onboarding_view.dart';
import 'package:everyday_invest/src/features/authentication/view/welcome/welcome_view.dart';
import 'package:everyday_invest/src/features/home/view/navigation_page.dart';
import 'package:everyday_invest/src/repository/authentication_repository/authentication_repository.dart';
import 'package:everyday_invest/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  //     .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
  _setInitialNavigation();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: InvestTheme.lightTheme,
      darkTheme: InvestTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        child: Center(
            child: LoadingAnimationWidget.stretchedDots(
          color: mDarkBlue,
          size: 50,
        )),
      ),
    );
  }
}

_setInitialNavigation() async {
  final prefs = await SharedPreferences.getInstance();
  final isFirstLogin = prefs.getBool('isFirstLogin') ?? true;
  if (isFirstLogin) {
    print("Its the first login!");
    Get.offAll(() => OnboardingView());
    await prefs.setBool('isFirstLogin', false);
  } else {
    Get.offAll(() => const NavigationPage());
  }
}
