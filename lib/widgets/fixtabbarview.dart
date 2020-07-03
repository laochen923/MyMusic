


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FixTabBarView extends StatefulWidget {
  const FixTabBarView({
    Key key,
    @required this.children,
    @required this.tabController,
    @required this.pageController,
    this.physics,
    this.dragStartBehavior = DragStartBehavior.start,
  })  : assert(children != null),
        assert(dragStartBehavior != null),
        super(key: key);

  final TabController tabController;
  final PageController pageController;
  final List<Widget> children;
  final ScrollPhysics physics;
  final DragStartBehavior dragStartBehavior;

  @override
  _FixTabBarViewState createState() => _FixTabBarViewState();
}

class _FixTabBarViewState extends State<FixTabBarView> {
  @override
  void dispose() {
    super.dispose();
    widget.tabController.dispose();
    widget.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      dragStartBehavior: widget.dragStartBehavior,
      physics: widget.physics,
      controller: widget.pageController,
      children: widget.children,
      onPageChanged: (index) {
        widget.tabController.animateTo(index);
      },
    );
  }
}
