import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/shop/bloc/shop_bloc.dart';
import '../reward.dart';

class RewardForm extends StatefulWidget {
  const RewardForm({super.key});

  @override
  State<RewardForm> createState() => _RewardFormState();
}

class _RewardFormState extends State<RewardForm> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  double price = 100.0;
  double rating = 0.0;

  void createReward() {
    if (_formKey.currentState!.validate()) {
      var newReward = Reward(
          title: titleController.text,
          description: descriptionController.text,
          price: price.toInt(),
          rating: rating.toInt());

      BlocProvider.of<ShopBloc>(context).add(NewRewardEvent(newReward));
      Navigator.pop(context);
    }
  }

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "Campo necessario";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SizedBox(
            height: 500,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: titleController,
                  validator: validate,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: descriptionController,
                  validator: validate,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
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
                  },
                  child: const Text('Create Reward'),
                ),
              ],
            )));
  }
}
