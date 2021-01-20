import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Driver Test', () {
    final textField = find.byValueKey('your-text-field');

    final inputText = 'Hello there, this is an input.';

    FlutterDriver driver;

    // Подключение к  Flutter driver перед выполнением теста
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    //   Конец подсоединения driver после выполнения тестов

    test('fill the field', () async {
      await driver.waitFor(textField);

      await driver.tap(textField);
      await driver.enterText(inputText);
    });
  }, timeout: Timeout(Duration(seconds: 10)));
}
