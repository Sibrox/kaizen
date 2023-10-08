import 'dart:convert';

import 'package:kaizen/models/common/reward/reward.dart';
import 'package:kaizen/models/user/user.dart';
import 'package:test/test.dart';

void main() {
  test('Test user serialization', () {
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

  test('Test user deserialization', () {
    var user = User(credits: 150, rewardsHistory: []);
    var jsonReward = user.toJson();

    assert(jsonReward["credits"] == 150);
    assert(jsonReward["rewardsHistory"].isEmpty);
  });

  test('Test user equal', () {
    const reward = Reward(title: "Test", price: 150, rating: 2);
    var user1 = User(credits: 150, rewardsHistory: [reward]);
    var user2 = User(credits: 150, rewardsHistory: [reward]);

    assert(user1 == user2);
  });

  test('Test user not equal', () {
    const reward = Reward(title: "Test", price: 150, rating: 2);
    var user1 = User(credits: 150, rewardsHistory: [reward]);
    var user2 = User(credits: 130, rewardsHistory: [reward]);
    var user3 = User(credits: 130, rewardsHistory: []);

    assert(user1 != user2);
    assert(user2 != user3);
  });

  test('Test add reward to User rewardsHistory', () {
    var user = User(credits: 150, rewardsHistory: []);
    assert(user.rewardsHistory.isEmpty);

    const newReward = Reward(
        title: "New Reward", description: "Description", price: 100, rating: 2);

    var updatedUser = User.buyReward(user, newReward);
    assert(updatedUser.rewardsHistory.length == 1);

    var reward = updatedUser.rewardsHistory[0];
    assert(reward.title == newReward.title);
    assert(reward.description == newReward.description);
    assert(reward.price == newReward.price);
    assert(reward.rating == newReward.rating);
  });
}
