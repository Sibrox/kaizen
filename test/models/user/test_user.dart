import 'dart:convert';

import 'package:kaizen/models/common/reward.dart';
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

  test('Test add reward to User rewardsHistory', () {
    var user = User(credits: 150);
    assert(user.rewardsHistory.isEmpty);

    const newReward = Reward(
        title: "New Reward", description: "Description", price: 100, rating: 2);
    user.addReward(newReward);
    assert(user.rewardsHistory.length == 1);

    var reward = user.rewardsHistory[0];
    assert(reward.title == newReward.title);
    assert(reward.description == newReward.description);
    assert(reward.price == newReward.price);
    assert(reward.rating == newReward.rating);
  });
}
