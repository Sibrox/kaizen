import 'package:flutter/material.dart';
import '../../../user/user.dart';
import '../reward.dart';

class MilestoneWidget extends StatelessWidget {
  final Reward milestone;
  final User user;

  const MilestoneWidget(
      {super.key, required this.milestone, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Expanded(
              flex: 3, child: Icon(Icons.account_balance_wallet_outlined)),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(milestone.title), Text(milestone.description)],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: user.credits / milestone.price >= 1
                      ? 1
                      : user.credits / milestone.price,
                  backgroundColor: Colors.grey,
                ),
                Text("  ${milestone.price}/${user.credits}")
              ],
            ),
          )
        ],
      ),
    );
  }
}
