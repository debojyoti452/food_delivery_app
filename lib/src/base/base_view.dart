import 'package:flutter/material.dart';

mixin BaseMixin {
  void onStart();

  void onStop();
}

abstract class BaseView<S extends StatefulWidget> extends State<S>
    with BaseMixin {
  Widget onBuild(BuildContext context, BoxConstraints constraints);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraint) {
      return onBuild(context, boxConstraint);
    });
  }

  @override
  void initState() {
    onStart();
    super.initState();
  }

  @override
  void dispose() {
    onStop();
    super.dispose();
  }
}
