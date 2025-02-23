import 'package:assign_fibo_mobile/features/fibo/presentation/models/fibo_model_ui.dart';
import 'package:assign_fibo_mobile/features/fibo/presentation/viewmodel/fibo_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FiboViewModel', () {
    late FiboViewModel viewModel;

    setUp(() {
      viewModel = FiboViewModel();
    });

    test('init value 41 Fibonacci numbers', () {
      expect(viewModel.mainList.length, 41);
    });

    test('moves number from main list to type list', () {
      final fibo = viewModel.mainList.first;
      viewModel.moveToTypeList(fibo);

      expect(viewModel.mainList.contains(fibo), false);
      expect(viewModel.getTypeList(fibo.type).contains(fibo), true);
    });

    test('removes number from type list to main list', () {
      final fibo = viewModel.mainList.first;
      viewModel.moveToTypeList(fibo);
      viewModel.removeFromTypeList(fibo);

      expect(viewModel.mainList.contains(fibo), true);
      expect(viewModel.getTypeList(fibo.type).contains(fibo), false);
    });

    test('moves and removes circle type', () {
      final fibo = viewModel.mainList.firstWhere((f) => f.type == FiboType.circle);
      viewModel.moveToTypeList(fibo);
      expect(viewModel.mainList.contains(fibo), false);
      expect(viewModel.circleList.contains(fibo), true);

      viewModel.removeFromTypeList(fibo);
      expect(viewModel.mainList.contains(fibo), true);
      expect(viewModel.circleList.contains(fibo), false);
    });

    test('moves and removes cross type', () {
      final fibo = viewModel.mainList.firstWhere((f) => f.type == FiboType.cross);
      viewModel.moveToTypeList(fibo);
      expect(viewModel.mainList.contains(fibo), false);
      expect(viewModel.crossList.contains(fibo), true);

      viewModel.removeFromTypeList(fibo);
      expect(viewModel.mainList.contains(fibo), true);
      expect(viewModel.crossList.contains(fibo), false);
    });

    test('moves and removes square type', () {
      final fibo = viewModel.mainList.firstWhere((f) => f.type == FiboType.square);
      viewModel.moveToTypeList(fibo);
      expect(viewModel.mainList.contains(fibo), false);
      expect(viewModel.squareList.contains(fibo), true);

      viewModel.removeFromTypeList(fibo);
      expect(viewModel.mainList.contains(fibo), true);
      expect(viewModel.squareList.contains(fibo), false);
    });

    test('getTypeList returns correct list for circle', () {
      final fibo = viewModel.mainList.firstWhere((f) => f.type == FiboType.circle);
      viewModel.moveToTypeList(fibo);
      expect(viewModel.getTypeList(FiboType.circle).contains(fibo), true);
    });

    test('getTypeList returns correct list for cross', () {
      final fibo = viewModel.mainList.firstWhere((f) => f.type == FiboType.cross);
      viewModel.moveToTypeList(fibo);
      expect(viewModel.getTypeList(FiboType.cross).contains(fibo), true);
    });

    test('getTypeList returns correct list for square', () {
      final fibo = viewModel.mainList.firstWhere((f) => f.type == FiboType.square);
      viewModel.moveToTypeList(fibo);
      expect(viewModel.getTypeList(FiboType.square).contains(fibo), true);
    });
  });
}
