import 'package:kaizen/models/reward/reward.dart';
import 'package:kaizen/models/user/bloc/user_bloc.dart';
import 'package:kaizen/models/user/user.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('Test UserBloc', () {
    late Reward reward_100;

    setUp(() {
      reward_100 = const Reward(title: "Title", price: 100, rating: 2);
    });

    blocTest('Test add buy new Reward with enough credits',
        build: () => UserBloc(const User(credits: 150, rewardsHistory: [])),
        act: (bloc) => bloc.add(BuyRewardEvent(reward_100)),
        expect: () => [
              User(credits: 50, rewardsHistory: [reward_100])
            ]);

    blocTest('Test add buy new Reward with NOT enough credits',
        build: () => UserBloc(const User(credits: 80, rewardsHistory: [])),
        act: (bloc) => bloc.add(BuyRewardEvent(reward_100)),
        expect: () => [const User(credits: 80, rewardsHistory: [])]);
  });
}
