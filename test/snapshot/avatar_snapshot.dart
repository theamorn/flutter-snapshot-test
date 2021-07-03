import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:snapshot/avatar.dart';

// HOWTO: use flutterd test --update-goldens <path_to_test_file> to create image reference
void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  testGoldens('Avatar Scenario - Snapshot Test', (WidgetTester tester) async {
    final builder = DeviceBuilder(bgColor: Colors.white)
      ..overrideDevicesForAllScenarios(devices: [
        Device.iphone11,
        const Device(
          name: '140 x 140',
          size: Size(140, 140),
        ),
        const Device(
          name: '200 x 200',
          size: Size(200, 200),
        ),
      ])
      ..addScenario(
          widget:
              AvatarCircle(size: 100, icon: Icon(Icons.people), name: "Amorn"),
          name: 'Default',
          onCreate: (scenarioWidgetKey) async {
            final logoFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('logoAvatar')),
            );

            final starIconFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('starAvatar')),
            );

            expect(logoFinder, findsNothing);
            expect(starIconFinder, findsNothing);
          })
      ..addScenario(
          widget: AvatarCircle(
              size: 100,
              icon: Icon(Icons.people),
              name: "Amorn",
              hasBorder: true),
          name: 'Has Border',
          onCreate: (scenarioWidgetKey) async {
            final logoFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('logoAvatar')),
            );

            final starIconFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('starAvatar')),
            );

            expect(logoFinder, findsNothing);
            expect(starIconFinder, findsNothing);
          })
      ..addScenario(
          widget: AvatarCircle(
            size: 100,
            icon: Icon(Icons.people),
            name: "Amorn",
            hasBorder: true,
            hasLogo: true,
          ),
          name: 'Has Border and Has Logo',
          onCreate: (scenarioWidgetKey) async {
            final logoFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('logoAvatar')),
            );

            final starIconFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('starAvatar')),
            );

            expect(logoFinder, findsOneWidget);
            expect(starIconFinder, findsNothing);
          })
      ..addScenario(
          widget: AvatarCircle(
              size: 100,
              icon: Icon(Icons.people),
              name: "Amorn",
              hasBorder: true,
              hasLogo: true,
              hasStar: true,
              hasCloudCenter: true),
          name: 'Has Logo Star and Cloud',
          onCreate: (scenarioWidgetKey) async {
            final logoFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('logoAvatar')),
            );

            final starIconFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('starAvatar')),
            );

            expect(logoFinder, findsOneWidget);
            expect(starIconFinder, findsOneWidget);
          })
      ..addScenario(
          widget: AvatarCircle(
              size: 140,
              icon: Icon(Icons.people),
              name: "Amorn",
              hasBorder: true,
              hasLogo: true,
              hasCloudCenter: true),
          name: 'Has Logo Border and Center',
          onCreate: (scenarioWidgetKey) async {
            final logoFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('logoAvatar')),
            );

            final starIconFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('starAvatar')),
            );

            expect(logoFinder, findsOneWidget);
            expect(starIconFinder, findsNothing);
          })
      ..addScenario(
          widget: AvatarCircle(
              size: 200,
              image: Image.asset("images/pikachu.png"),
              name: "Amorn",
              hasBorder: true,
              hasStar: true),
          name: 'Has border logo star',
          onCreate: (scenarioWidgetKey) async {
            final logoFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('logoAvatar')),
            );

            final starIconFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('starAvatar')),
            );

            expect(logoFinder, findsNothing);
            expect(starIconFinder, findsOneWidget);
          });

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'avatar');
  });
}
