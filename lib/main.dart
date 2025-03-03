import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'ui/components/components.dart';
import 'main/factories/factories.dart';

import 'package:ForDev/main.dart' as last_stable;

void main() {
  var versionToRun = "current";
  if(versionToRun == "last_stable") {
    runApp(last_stable.App());
  } else {
    runApp(App());
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

    return GetMaterialApp(
      title: '4Dev',
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      navigatorObservers: [routeObserver],
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: makeSplashPage, transition: Transition.fade),
        GetPage(name: '/login', page: makeLoginPage, transition: Transition.fadeIn),
        GetPage(name: '/signup', page: makeSignUpPage),
        GetPage(name: '/surveys', page: makeSurveysPage, transition: Transition.fadeIn),
        GetPage(name: '/survey_result/:survey_id', page: makeSurveyResultPage),
      ],
    );
  }
}
