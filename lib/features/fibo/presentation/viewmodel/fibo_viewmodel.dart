import 'package:flutter/material.dart';
import '../models/fibo_model_ui.dart';

class FiboViewModel {
  final ValueNotifier<List<FiboModel>> mainList = ValueNotifier(
    List.generate(41, (i) => FiboModel(index: i, value: _fibonacci(i), type: _getType(_fibonacci(i)))),
  );

  final ValueNotifier<List<FiboModel>> circleList = ValueNotifier([]);
  final ValueNotifier<List<FiboModel>> squareList = ValueNotifier([]);
  final ValueNotifier<List<FiboModel>> crossList = ValueNotifier([]);

  final ValueNotifier<FiboModel?> recentAdd = ValueNotifier(null);
  final ValueNotifier<FiboModel?> recentRemove = ValueNotifier(null);

  void moveToTypeList(FiboModel number) {
    mainList.value = mainList.value.where((n) => n != number).toList();
    switch (number.type) {
      case FiboType.circle:
        circleList.value = [...circleList.value, number]..sort((a, b) => a.index.compareTo(b.index));
        break;
      case FiboType.cross:
        squareList.value = [...squareList.value, number]..sort((a, b) => a.index.compareTo(b.index));
        break;
      case FiboType.square:
        crossList.value = [...crossList.value, number]..sort((a, b) => a.index.compareTo(b.index));
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
        squareList.value = squareList.value.where((n) => n != number).toList();
        break;
      case FiboType.square:
        crossList.value = crossList.value.where((n) => n != number).toList();
        break;
    }
    mainList.value = [...mainList.value, number]..sort((a, b) => a.index.compareTo(b.index));
    recentRemove.value = number;
    recentAdd.value = null;
  }

  static int _fibonacci(int n) => n < 2 ? n : _fibonacci(n - 1) + _fibonacci(n - 2);

  static FiboType _getType(int num) {
    var mod = num % 3;
    if (mod == 0) return FiboType.circle; // 🔵 วงกลม
    if (mod == 1) return FiboType.square; // 🔳 สี่เหลี่ยม
    return FiboType.cross; // ❌ กากบาท
  }
}
