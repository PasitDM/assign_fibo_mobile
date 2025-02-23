import 'package:flutter/material.dart';
import '../models/fibo_model_ui.dart';

class FiboViewModel extends ChangeNotifier {
  List<FiboModel> mainList = [];
  List<FiboModel> circleList = [];
  List<FiboModel> squareList = [];
  List<FiboModel> crossList = [];

  FiboModel? recentAdd;
  FiboModel? recentRemove;

  FiboViewModel() {
    init();
  }

  void init() {
    mainList = List.generate(
      41,
      (i) => FiboModel(index: i, value: _fibonacci(i), type: _getType(_fibonacci(i))),
    );
    notifyListeners();
  }

  int _fibonacci(int n) => n < 2 ? n : _fibonacci(n - 1) + _fibonacci(n - 2);

  FiboType _getType(int num) {
    var mod = num % 3;
    if (mod == 0) return FiboType.circle;
    if (mod == 1) return FiboType.square;
    return FiboType.cross;
  }

  void moveToTypeList(FiboModel number) {
    mainList = mainList.where((n) => n != number).toList();
    switch (number.type) {
      case FiboType.circle:
        circleList = [...circleList, number]..sort((a, b) => a.index.compareTo(b.index));
        break;
      case FiboType.cross:
        crossList = [...crossList, number]..sort((a, b) => a.index.compareTo(b.index));
        break;
      case FiboType.square:
        squareList = [...squareList, number]..sort((a, b) => a.index.compareTo(b.index));
        break;
    }
    recentAdd = number;
    recentRemove = null;
    notifyListeners();
  }

  void removeFromTypeList(FiboModel number) {
    switch (number.type) {
      case FiboType.circle:
        circleList = circleList.where((n) => n != number).toList();
        break;
      case FiboType.cross:
        crossList = crossList.where((n) => n != number).toList();
        break;
      case FiboType.square:
        squareList = squareList.where((n) => n != number).toList();
        break;
    }
    mainList = [...mainList, number]..sort((a, b) => a.index.compareTo(b.index));
    recentRemove = number;
    recentAdd = null;
    notifyListeners();
  }

  List<FiboModel> getTypeList(FiboType type) {
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
