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
            // final logoFinder = find.descendant(
            //   of: find.byKey(scenarioWidgetKey),
            //   matching: find.byKey(Key('logoAvatar')),
            // );

            // final starIconFinder = find.descendant(
            //   of: find.byKey(scenarioWidgetKey),
            //   matching: find.byKey(Key('starAvatar')),
            // );

            // expect(logoFinder, findsOneWidget);
            // expect(starIconFinder, findsOneWidget);
          })
      ..addScenario(
          widget: AvatarCircle(
              size: 100,
              icon: Icon(Icons.people),
              name: "Amorn",
              hasBorder: true),
          name: 'Goal Reach',
          onCreate: (scenarioWidgetKey) async {
            final badgeFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('badge')),
            );

            final memberIconFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('memberIcon')),
            );

            final memberAmountFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('memberAmount')),
            );

            final progressBarFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('progressBar')),
            );
            // expect(badgeFinder, findsOneWidget);
            // expect(memberIconFinder, findsOneWidget);
            // expect(memberAmountFinder, findsOneWidget);
            // expect(progressBarFinder, findsOneWidget);
          })
      ..addScenario(
          widget: AvatarCircle(
            size: 100,
            icon: Icon(Icons.people),
            name: "Amorn",
            hasBorder: true,
            hasLogo: true,
          ),
          name: 'Goal Reach > 100%',
          onCreate: (scenarioWidgetKey) async {
            final badgeFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('badge')),
            );

            final memberIconFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('memberIcon')),
            );

            final memberAmountFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('memberAmount')),
            );

            final progressBarFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('progressBar')),
            );
            // expect(badgeFinder, findsOneWidget);
            // expect(memberIconFinder, findsOneWidget);
            // expect(memberAmountFinder, findsOneWidget);
            // expect(progressBarFinder, findsOneWidget);
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
          name: 'Minus Goal',
          onCreate: (scenarioWidgetKey) async {
            final badgeFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('badge')),
            );

            final memberIconFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('memberIcon')),
            );

            final memberAmountFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('memberAmount')),
            );

            final progressBarFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('progressBar')),
            );
            // expect(badgeFinder, findsNothing);
            // expect(memberIconFinder, findsNothing);
            // expect(memberAmountFinder, findsNothing);
            // expect(progressBarFinder, findsOneWidget);
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
          name: 'Zero',
          onCreate: (scenarioWidgetKey) async {
            final badgeFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('badge')),
            );

            final memberIconFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('memberIcon')),
            );

            final memberAmountFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('memberAmount')),
            );

            final progressBarFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('progressBar')),
            );
            // expect(badgeFinder, findsNothing);
            // expect(memberIconFinder, findsOneWidget);
            // expect(memberAmountFinder, findsOneWidget);
            // expect(progressBarFinder, findsOneWidget);
          })
      ..addScenario(
          widget: AvatarCircle(
              size: 100,
              icon: Icon(Icons.people),
              name: "Amorn",
              hasBorder: true,
              hasLogo: true,
              hasStar: true,
              hasCloudCenter: false),
          name: '30% Goal',
          onCreate: (scenarioWidgetKey) async {
            final badgeFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('badge')),
            );

            final memberIconFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('memberIcon')),
            );

            final memberAmountFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('memberAmount')),
            );

            final progressBarFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(Key('progressBar')),
            );
            // expect(badgeFinder, findsNothing);
            // expect(memberIconFinder, findsOneWidget);
            // expect(memberAmountFinder, findsOneWidget);
            // expect(progressBarFinder, findsOneWidget);
          });

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'avatar');
  });
}
