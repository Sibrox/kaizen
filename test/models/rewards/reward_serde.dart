import 'dart:convert';

import 'package:kaizen/models/common/reward.dart';
import 'package:test/test.dart';

void main() {
  test('Test reward serialization', () {
    const strReward = '''
      {
        "title": "Reward",
        "description": "Description",
        "price": 100,
        "rating": 2
      }
    ''';

    Map<String, dynamic> jsonReward = jsonDecode(strReward);
    var reward = Reward.fromJson(jsonReward);

    assert(reward.title == "Reward");
    assert(reward.description == "Description");
    assert(reward.price == 100);
    assert(reward.rating == 2);
  });

  test('Test reward deserialization', () {
    const reward = Reward(
        title: "Reward", description: "Description", price: 100, rating: 2);
    var jsonReward = reward.toJson();

    assert(jsonReward["title"] == "Reward");
    assert(jsonReward["description"] == "Description");
    assert(jsonReward["price"] == 100);
    assert(jsonReward["rating"] == 2);
  });
}
