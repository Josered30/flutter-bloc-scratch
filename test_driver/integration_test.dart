import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  group("Integration", () {
    test("Login", () async {
      driver.tap(find.byValueKey("Email field"));
      await driver.enterText('josered');
      await driver.waitFor(find.text('josered'));

      driver.tap(find.byValueKey("Password field"));
      await driver.enterText('123');
      await driver.waitFor(find.text('123'));

      await driver.tap(find.byValueKey("Login buttom"));
    });
  });
}
