import 'package:flutter/material.dart';
import 'package:kaizen/models/reward/view/reward_form.dart';

class RewardFormButton extends StatelessWidget {
  const RewardFormButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                  child: const Text("Show Reward Form"),
                  onPressed: () {
                    showBottomSheet(
                        context: context,
                        enableDrag: false,
                        builder: (BuildContext context) => const RewardForm());
                  });
  }
}