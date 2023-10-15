import 'package:bloc_test/bloc_test.dart';
import 'package:kaizen/models/common/reward/reward.dart';
import 'package:kaizen/models/shop/bloc/shop_bloc.dart';
import 'package:kaizen/models/shop/shop.dart';

void main() {
  blocTest("Test add Reward to empty Shop",
      build: () => ShopBloc(),
      act: (bloc) => bloc.add(
          const NewRewardEvent(Reward(title: "Test", price: 10, rating: 1))),
      expect: () => [
            const Shop(
                milestone: null,
                rewards: [Reward(title: "Test", price: 10, rating: 1)])
          ]);

  blocTest("Test add Reward to not empty Shop",
      build: () => ShopBloc(
          initialState: const Shop(
              milestone: null,
              rewards: [Reward(title: "Test1", price: 10, rating: 1)])),
      act: (bloc) => bloc.add(
          const NewRewardEvent(Reward(title: "Test2", price: 20, rating: 2))),
      expect: () => [
            const Shop(milestone: null, rewards: [
              Reward(title: "Test1", price: 10, rating: 1),
              Reward(title: "Test2", price: 20, rating: 2)
            ])
          ]);

  blocTest("Test delete Reward from Shop",
      build: () => ShopBloc(
              initialState: const Shop(milestone: null, rewards: [
            Reward(title: "Test1", price: 10, rating: 1),
            Reward(title: "Test2", price: 20, rating: 2)
          ])),
      act: (bloc) => bloc.add(const DeleteRewardEvent(1)),
      expect: () => [
            const Shop(milestone: null, rewards: [
              Reward(title: "Test1", price: 10, rating: 1),
            ])
          ]);

  blocTest("Test delete not existing Reward from Shop",
      build: () => ShopBloc(
              initialState: const Shop(milestone: null, rewards: [
            Reward(title: "Test1", price: 10, rating: 1),
            Reward(title: "Test2", price: 20, rating: 2)
          ])),
      act: (bloc) => bloc.add(const DeleteRewardEvent(2)),
      expect: () => []);

  blocTest("Test set Milestone in a Shop without milestone",
      build: () => ShopBloc(
              initialState: const Shop(milestone: null, rewards: [
            Reward(title: "Test1", price: 10, rating: 1),
            Reward(title: "Test2", price: 20, rating: 2)
          ])),
      act: (bloc) => bloc.add(const SetMilestoneEvent(1)),
      expect: () => [
            const Shop(
                milestone: Reward(title: "Test2", price: 20, rating: 2),
                rewards: [Reward(title: "Test1", price: 10, rating: 1)])
          ]);

  blocTest("Test set milestone in a shop with milestone",
      build: () => ShopBloc(
          initialState: const Shop(
              milestone: Reward(title: "Test1", price: 10, rating: 1),
              rewards: [Reward(title: "Test2", price: 20, rating: 2)])),
      act: (bloc) => bloc.add(const SetMilestoneEvent(0)),
      expect: () => [
            const Shop(
                milestone: Reward(title: "Test2", price: 20, rating: 2),
                rewards: [Reward(title: "Test1", price: 10, rating: 1)])
          ]);

  blocTest("Test setMilestone with wrong index",
      build: () => ShopBloc(
          initialState: const Shop(
              milestone: Reward(title: "Test1", price: 10, rating: 1),
              rewards: [Reward(title: "Test2", price: 20, rating: 2)])),
      act: (bloc) => bloc.add(const SetMilestoneEvent(2)),
      expect: () => []);
}
