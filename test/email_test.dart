import 'package:automation_test_demo/validation.dart';
import 'package:test/test.dart';

void main() {

  group("Email test", () {
    List<dynamic> testCases = [
      {
        "email": "#!!!@@md.com",
        "expectedValue": false
      },
      {
        "email": "ads.asd2e@sad.sd",
        "expectedValue": true
      },
      {
        "email": "adsadasad",
        "expectedValue": false
      },
      {
        "email": "@",
        "expectedValue": false
      },
      {
        "email": "2131232@adadsaadsa.",
        "expectedValue": false
      },
    ];

    for ( dynamic testcase in testCases) {
      final email = testcase["email"];
      final expectedValue = testcase["expectedValue"];

      test("Email $email is $expectedValue", () {
        expect(Validation.validateEmail(email), expectedValue);
      });
    }
  });
  test('Test 1: email duongvan@teneocto.io is valid email', () {
    String email = "duongvan@teneocto.io";
    bool expectedValue = true;

    expect(Validation.validateEmail(email), expectedValue);    
  });
}
