
import 'package:flutter_driver/flutter_driver.dart';
import'package:gherkin/gherkin.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';

class InsertUserInfo extends GivenWithWorld<FlutterWorld> {
  InsertUserInfo()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 20));

  @override
  Future<void> executeStep() async {
    String input1 = "ana@gmail.com";    
    String input2 = "1234";

    await FlutterDriverUtils.enterText(world.driver, find.byValueKey('Email'), input1);
    await FlutterDriverUtils.enterText(world.driver, find.byValueKey('Password'), input2);
    await FlutterDriverUtils.tap(world.driver, find.byValueKey('Log In'));
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User information was inserted");
}

class LoggedIn extends ThenWithWorld<FlutterWorld> {
  LoggedIn()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 20));
  @override
  Future<void> executeStep() async {
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"The user is logged in");
}