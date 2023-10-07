import 'package:flutter/material.dart';
import 'package:kaizen/models/common/reward/reward.dart';

class RewardWidget extends StatelessWidget {
  const RewardWidget({super.key, required this.reward});

  final Reward reward;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color.fromARGB(255, 78, 1, 150),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(reward.title),
              Text(reward.description),
              Text('${reward.rating}'),
              Text('${reward.price}')
            ],
          ),
        ],
      ),
    );
  }
}
