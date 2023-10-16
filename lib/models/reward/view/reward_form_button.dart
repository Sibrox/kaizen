import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/reward/view/reward_form.dart';
import 'package:kaizen/models/shop/bloc/shop_bloc.dart';

class RewardFormButton extends StatelessWidget {
  const RewardFormButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const Text("Show Reward Form"),
        onPressed: () {
          showBottomSheet(
              context: context,
              builder: (BuildContext newContext) => BlocProvider.value(
                    value: BlocProvider.of<ShopBloc>(context),
                    child: const RewardForm(),
                  ));
        });
  }
}
