import 'dart:convert';

import 'package:kaizen/models/user/user.dart';
import 'package:test/test.dart';

void main() {
  test('Test reward serialization', () {
    const strUser = '''
      {
        "credits": 150,
        "rewardsHistory": []
      }
    ''';

    Map<String, dynamic> jsonReward = jsonDecode(strUser);
    var user = User.fromJson(jsonReward);

    assert(user.credits == 150);
    assert(user.rewardsHistory.isEmpty);
  });

  test('Test reward deserialization', () {
    var user = User(credits: 150, rewardsHistory: []);
    var jsonReward = user.toJson(user);

    assert(jsonReward["credits"] == 150);
    assert(jsonReward["rewardsHistory"].isEmpty);
  });
}
