import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/reward/view/milestone_widget.dart';
import 'package:kaizen/models/reward/view/reward_widget.dart';
import 'package:kaizen/models/user/bloc/user_bloc.dart';
import '../models/shop/bloc/shop_bloc.dart';
import '../models/shop/shop.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late bool isDragging, inMilestone, inRemove;

  @override
  void initState() {
    isDragging = inMilestone = inRemove = false;
    super.initState();
  }

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
              child: DragTarget<int>(
                builder: (BuildContext context, List<dynamic> accepted,
                    List<dynamic> rejected) {
                  return shopBloc.state.milestone == null || isDragging
                      ? AnimatedContainer(
                          color: inMilestone ? Colors.blueAccent : Colors.white,
                          duration: const Duration(milliseconds: 500),
                          child: const Center(
                            child:
                                Text("Drag here a reward to set a milestone!"),
                          ))
                      : MilestoneWidget(
                          milestone: shopBloc.state.milestone!,
                          user: userBloc.state);
                },
                onAccept: (int index) {
                  shopBloc.add(SetMilestoneEvent(index));
                },
                onMove: (dragDetails) {
                  setState(() {
                    inMilestone = true;
                  });
                },
                onLeave: (dragDetails) {
                  setState(() {
                    inMilestone = false;
                  });
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: shopBloc.state.rewards.length,
                itemBuilder: (BuildContext context, int index) {
                  return LongPressDraggable<int>(
                      onDragStarted: () {
                        setState(() {
                          isDragging = true;
                        });
                      },
                      onDragEnd: (dragDetails) {
                        setState(() {
                          isDragging = inMilestone = inRemove = false;
                        });
                      },
                      dragAnchorStrategy: pointerDragAnchorStrategy,
                      data: index,
                      childWhenDragging: ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.saturation,
                        ),
                        child:
                            RewardWidget(reward: shopBloc.state.rewards[index]),
                      ),
                      feedback: const SizedBox(
                        height: 100,
                        width: 100,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Icon(Icons.add_box_rounded),
                        ),
                      ),
                      child:
                          RewardWidget(reward: shopBloc.state.rewards[index]));
                },
              ),
            ),
            DragTarget<int>(builder: (BuildContext context,
                List<dynamic> accepted, List<dynamic> rejected) {
              return Visibility(
                visible: isDragging,
                child: AnimatedContainer(
                    width: MediaQuery.of(context).size.width,
                    color: inRemove ? Colors.red : Colors.white,
                    duration: const Duration(milliseconds: 500),
                    child: const Icon(
                      Icons.remove_circle_outlined,
                      size: 70,
                    )),
              );
            }, onAccept: (index) {
              shopBloc.add(DeleteRewardEvent(index));
            }, onMove: (dragDetails) {
              setState(() {
                inRemove = true;
              });
            }, onLeave: (dragDetails) {
              setState(() {
                inRemove = false;
              });
            }),
          ],
        );
      },
    );
  }
}
