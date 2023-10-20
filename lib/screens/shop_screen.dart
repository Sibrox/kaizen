import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/reward/view/milestone_widget.dart';
import 'package:kaizen/models/reward/view/reward_widget.dart';
import 'package:kaizen/models/user/bloc/user_bloc.dart';
import '../models/shop/bloc/shop_bloc.dart';
import '../models/shop/shop.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, Shop>(
      builder: (context, state) {
        ShopBloc shopBloc = BlocProvider.of<ShopBloc>(context);
        UserBloc userBloc = BlocProvider.of<UserBloc>(context);

        return Column(
          children: [
            Expanded(
              flex: 2,
              child: shopBloc.state.milestone != null
                  ? MilestoneWidget(
                      milestone: shopBloc.state.milestone!,
                      user: userBloc.state)
                  : const Text("Drag here a reward to set a milestone!"),
            ),
            Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: shopBloc.state.rewards.length,
                itemBuilder: (BuildContext context, int index) {
                  return RewardWidget(reward: shopBloc.state.rewards[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
