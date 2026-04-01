import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:disable_battery_optimization_2/disable_battery_optimization_2.dart';

void main() {
  const MethodChannel channel =
      MethodChannel('in.jvapps.disable_battery_optimization');

  TestWidgetsFlutterBinding.ensureInitialized();

  late List<MethodCall> log;

  setUp(() {
    log = <MethodCall>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall call) async {
      log.add(call);
      switch (call.method) {
        case 'isAutoStartEnabled':
          return true;
        case 'isBatteryOptimizationDisabled':
          return false;
        case 'isManBatteryOptimizationDisabled':
          return true;
        case 'isAllOptimizationsDisabled':
          return false;
        case 'showEnableAutoStart':
        case 'showDisableManBatteryOptimization':
        case 'showDisableBatteryOptimization':
        case 'disableAllOptimizations':
          return true;
        default:
          return null;
      }
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  group('status getters', () {
    test('isAutoStartEnabled calls correct method and returns result', () async {
      final result = await DisableBatteryOptimization.isAutoStartEnabled;
      expect(result, true);
      expect(log, hasLength(1));
      expect(log.single.method, 'isAutoStartEnabled');
    });

    test('isBatteryOptimizationDisabled calls correct method and returns result',
        () async {
      final result =
          await DisableBatteryOptimization.isBatteryOptimizationDisabled;
      expect(result, false);
      expect(log.single.method, 'isBatteryOptimizationDisabled');
    });

    test(
        'isManufacturerBatteryOptimizationDisabled calls correct method and returns result',
        () async {
      final result = await DisableBatteryOptimization
          .isManufacturerBatteryOptimizationDisabled;
      expect(result, true);
      expect(log.single.method, 'isManBatteryOptimizationDisabled');
    });

    test(
        'isAllBatteryOptimizationDisabled calls correct method and returns result',
        () async {
      final result =
          await DisableBatteryOptimization.isAllBatteryOptimizationDisabled;
      expect(result, false);
      expect(log.single.method, 'isAllOptimizationsDisabled');
    });
  });

  group('action methods', () {
    test('showEnableAutoStartSettings sends title and body', () async {
      final result = await DisableBatteryOptimization
          .showEnableAutoStartSettings('Title', 'Body');
      expect(result, true);
      expect(log.single.method, 'showEnableAutoStart');
      expect(log.single.arguments, ['Title', 'Body']);
    });

    test(
        'showDisableManufacturerBatteryOptimizationSettings sends title and body',
        () async {
      final result = await DisableBatteryOptimization
          .showDisableManufacturerBatteryOptimizationSettings(
              'Man Title', 'Man Body');
      expect(result, true);
      expect(log.single.method, 'showDisableManBatteryOptimization');
      expect(log.single.arguments, ['Man Title', 'Man Body']);
    });

    test('showDisableBatteryOptimizationSettings sends no arguments', () async {
      final result = await DisableBatteryOptimization
          .showDisableBatteryOptimizationSettings();
      expect(result, true);
      expect(log.single.method, 'showDisableBatteryOptimization');
      expect(log.single.arguments, isNull);
    });

    test('showDisableAllOptimizationsSettings sends all four arguments',
        () async {
      final result = await DisableBatteryOptimization
          .showDisableAllOptimizationsSettings(
              'AS Title', 'AS Body', 'MB Title', 'MB Body');
      expect(result, true);
      expect(log.single.method, 'disableAllOptimizations');
      expect(
          log.single.arguments, ['AS Title', 'AS Body', 'MB Title', 'MB Body']);
    });
  });

  group('null channel responses', () {
    setUp(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall call) async {
        return null;
      });
    });

    test('getters return null when platform returns null', () async {
      expect(await DisableBatteryOptimization.isAutoStartEnabled, isNull);
      expect(await DisableBatteryOptimization.isBatteryOptimizationDisabled,
          isNull);
      expect(
          await DisableBatteryOptimization
              .isManufacturerBatteryOptimizationDisabled,
          isNull);
      expect(await DisableBatteryOptimization.isAllBatteryOptimizationDisabled,
          isNull);
    });
  });
}
