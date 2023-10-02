import 'dart:convert';

import 'package:kaizen/models/common/reward.dart';
import 'package:test/test.dart';

void main() {
  test('Test reward serialization', () {
    const strReward = '''
      {
        "title": "Reward",
        "description": "Description",
        "price": 9.00,
        "rating": 2
      }
    ''';

    Map<String, dynamic> jsonReward = jsonDecode(strReward);
    var reward = Reward.fromJson(jsonReward);

    assert(reward.title == jsonReward["title"]);
    assert(reward.description == jsonReward["description"]);
    assert(reward.price == jsonReward["price"]);
    assert(reward.rating == jsonReward["rating"]);
  });

  test('Test reward deserialization', () {
    const reward = Reward(
        title: "Reward", description: "Description", price: 9.00, rating: 2);
    var jsonReward = reward.toJson();

    assert(reward.title == jsonReward["title"]);
    assert(reward.description == jsonReward["description"]);
    assert(reward.price == jsonReward["price"]);
    assert(reward.rating == jsonReward["rating"]);
  });
}
