import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/common/reward/view/milestone_widget.dart';
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
            shopBloc.state.milestone != null
                ? MilestoneWidget(
                    milestone: shopBloc.state.milestone!, user: userBloc.state)
                : Container(),
          ],
        );
      },
    );
  }
}
