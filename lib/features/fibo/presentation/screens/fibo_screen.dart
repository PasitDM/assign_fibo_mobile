import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../models/fibo_model_ui.dart';
import '../viewmodel/fibo_viewmodel.dart';
import '../widgets/fibo_list_tile.dart';

class FiboScreen extends StatefulWidget {
  @override
  State<FiboScreen> createState() => _FiboScreenState();
}

class _FiboScreenState extends State<FiboScreen> {
  late final ScrollController _scrollController;
  late final ScrollController _scrollSheetController;
  late final FiboViewModel viewModel;

  final double _itemHeight = 56.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollSheetController = ScrollController();
    viewModel = FiboViewModel();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _scrollSheetController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fibonacci List 40'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: AnimatedBuilder(
              animation: viewModel,
              builder: (_, __) {
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: viewModel.mainList.length,
                  itemBuilder: (context, index) {
                    final fibo = viewModel.mainList[index];

                    return FiboListTile(
                      fibonacciNumber: fibo,
                      titleText: 'Index: ${fibo.index}, Number: ${fibo.value}',
                      isHighlighted: fibo == viewModel.recentRemove,
                      color: AppColors.errorColor.withValues(alpha: 0.8),
                      onTap: () {
                        viewModel.moveToTypeList(fibo);
                        _showBottomSheet(fibo.type);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(FiboType type) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        final numbers = viewModel.getTypeList(type);

        // Scroll after frame rendered
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final index = numbers.indexWhere((item) => item == viewModel.recentAdd);
          if (index != -1) {
            _scrollToItem(
              index,
              controller: _scrollSheetController,
              duration: const Duration(milliseconds: 500),
            );
          }
        });

        return ListView.builder(
          controller: _scrollSheetController,
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            final fibo = numbers[index];

            return FiboListTile(
              fibonacciNumber: fibo,
              isHighlighted: fibo == viewModel.recentAdd,
              titleText: 'Number: ${fibo.value}',
              subtitleText: 'Index: ${fibo.index}',
              onTap: () {
                viewModel.removeFromTypeList(fibo);
                Navigator.pop(context);
                final mainListIndex = viewModel.mainList.indexOf(fibo);
                _scrollToItem(mainListIndex);
              },
            );
          },
        );
      },
    );
  }

  void _scrollToItem(
    int index, {
    ScrollController? controller,
    Duration duration = const Duration(seconds: 1),
  }) {
    final scrollController = controller ?? _scrollController;

    scrollController.animateTo(index * _itemHeight, duration: duration, curve: Curves.easeInOut);
  }
}
