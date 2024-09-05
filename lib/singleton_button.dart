library singleton_button;

import 'dart:collection';

import 'package:flutter/material.dart';

class SingletonButtonState {
  static var singletons = HashMap<String, SingletonButtonState>();

  static SingletonButtonState require(String id) {
    if (!singletons.containsKey(id)) {
      singletons[id] = SingletonButtonState(id);
    }
    return singletons[id]!;
  }

  String id;
  bool mHasBeenClicked = false;
  /*
  callbacks?
  doClick?
  subscriptions?
    hasBeenClicked, but named, like a subscription?
   */

  bool qHasBeenClicked({bool clear = true}) {
    if (mHasBeenClicked) {
      if (clear) {
        mHasBeenClicked = false;
      }
      return true;
    }
    return false;
  }

  SingletonButtonState(this.id);
}

class SingletonButton extends ElevatedButton {
  SingletonButton(
    this.id, {
      super.key,
      required super.child,
      VoidCallback? onPressed,
  }) : super(onPressed: () {
    SingletonButtonState.require(id).mHasBeenClicked = true;
    if (onPressed != null) {
      onPressed();
    }
  },);

  final String id;

  static SingletonButtonState get(String id) {
    return SingletonButtonState.require(id);
  }
}