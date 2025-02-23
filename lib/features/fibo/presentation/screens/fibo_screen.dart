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
  final _scrollController = ScrollController();
  late FiboViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = FiboViewModel();
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
              builder: (context, child) {
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
                        _showBottomSheet(context, viewModel, fibo.type);
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

  void _showBottomSheet(BuildContext context, FiboViewModel viewModel, FiboType type) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AnimatedBuilder(
          animation: viewModel,
          builder: (context, child) {
            final numbers = viewModel.getTypeList(type);
            return ListView.builder(
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
                    _scrollToItem(viewModel.mainList.indexOf(fibo));
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  void _scrollToItem(int index) {
    _scrollController.animateTo(index * 56.0, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }
}
