import 'package:flutter/material.dart';
import '../reward.dart';

class RewardForm extends StatefulWidget {
  const RewardForm({super.key});

  @override
  State<RewardForm> createState() => _RewardFormState();
}

class _RewardFormState extends State<RewardForm> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  double price = 100.0;
  double rating = 0.0;

  void createReward() {
    var newReward = Reward(
        title: nameController.text,
        description: descriptionController.text,
        price: price.toInt(),
        rating: rating.toInt());
    // TODO: call ShopBloc.add(NewRewardEvent(newReward)))
    print(newReward);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Reward Name',
                errorText: false ? 'Reward name can be empty' : null,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Reward Description',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Slider(
                  value: price,
                  onChanged: (value) {
                    setState(() {
                      price = value;
                    });
                  },
                  min: 100,
                  max: 1000,
                  divisions: 9,
                  label: "Price: ${price.toInt()}",
                ),
                Text(
                  "Price: ${price.toInt()}",
                )
              ],
            ),
            Row(
              children: [
                Slider(
                  value: rating,
                  onChanged: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                  min: 0,
                  max: 5,
                  divisions: 5,
                  label: "Rating: ${rating.toInt()}",
                ),
                Text(
                  "Rating: ${rating.toInt()}",
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                createReward();
                Navigator.pop(context);
              },
              child: const Text('Create Reward'),
            ),
          ],
        ));
  }
}
