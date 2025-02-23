import 'package:flutter/material.dart';
import '../models/fibo_model_ui.dart';

class FiboViewModel {
  final ValueNotifier<List<FiboModel>> mainList = ValueNotifier([]);
  final ValueNotifier<List<FiboModel>> circleList = ValueNotifier([]);
  final ValueNotifier<List<FiboModel>> squareList = ValueNotifier([]);
  final ValueNotifier<List<FiboModel>> crossList = ValueNotifier([]);

  final ValueNotifier<FiboModel?> recentAdd = ValueNotifier(null);
  final ValueNotifier<FiboModel?> recentRemove = ValueNotifier(null);

  FiboViewModel() {
    init();
  }

  void init() {
    final fiboList = List<FiboModel>.generate(
      41,
      (i) => FiboModel(index: i, value: _fibonacci(i), type: _getType(_fibonacci(i))),
    );

    mainList.value = fiboList;
  }

  int _fibonacci(int n) => n < 2 ? n : _fibonacci(n - 1) + _fibonacci(n - 2);

  FiboType _getType(int num) {
    var mod = num % 3;
    if (mod == 0) return FiboType.circle;
    if (mod == 1) return FiboType.square;
    return FiboType.cross;
  }

  void moveToTypeList(FiboModel number) {
    mainList.value = mainList.value.where((n) => n != number).toList();
    switch (number.type) {
      case FiboType.circle:
        circleList.value = [...circleList.value, number]..sort((a, b) => a.index.compareTo(b.index));
        break;
      case FiboType.cross:
        crossList.value = [...crossList.value, number]..sort((a, b) => a.index.compareTo(b.index));
        break;
      case FiboType.square:
        squareList.value = [...squareList.value, number]..sort((a, b) => a.index.compareTo(b.index));
        break;
    }
    recentAdd.value = number;
    recentRemove.value = null;
  }

  void removeFromTypeList(FiboModel number) {
    switch (number.type) {
      case FiboType.circle:
        circleList.value = circleList.value.where((n) => n != number).toList();
        break;
      case FiboType.cross:
        crossList.value = crossList.value.where((n) => n != number).toList();
        break;
      case FiboType.square:
        squareList.value = squareList.value.where((n) => n != number).toList();
        break;
    }
    mainList.value = [...mainList.value, number]..sort((a, b) => a.index.compareTo(b.index));
    recentRemove.value = number;
    recentAdd.value = null;
  }

  ValueNotifier<List<FiboModel>> getTypeList(FiboType type) {
    switch (type) {
      case FiboType.circle:
        return circleList;
      case FiboType.cross:
        return crossList;
      case FiboType.square:
        return squareList;
    }
  }
}
