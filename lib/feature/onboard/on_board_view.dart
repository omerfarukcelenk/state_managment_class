import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:state_managments/feature/onboard/module/start_fab_button.dart';
import 'package:state_managments/feature/onboard/on_board_model.dart';
import 'package:state_managments/feature/onboard/tab_indicator.dart';
import 'package:state_managments/product/padding/page_padding.dart';
import 'package:state_managments/product/widget/onboard_card.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  // var
  final String _skipTitle = "skip";
  int _selectedIndex = 0;
  final _pageLength = OnBoardModels.onBoardItems.length;
  bool get _isLastPage => _pageLength - 1 == _selectedIndex;

  bool get _firstPage => _selectedIndex == 0;

  // ---x
  ValueNotifier<bool> isBackEnable = ValueNotifier(false);
  // --x

  void _incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      _changeBackEnable(true);
      return;
    }
    _changeBackEnable(false);

    _incrementSelectedPage(value);
  }

  void _changeBackEnable(bool value) {
    if (value == isBackEnable.value) {
      return;
    }
    isBackEnable.value = true;
  }

  void _incrementSelectedPage([int? value]) {
    setState(() {
      if (value != null) {
        _selectedIndex = value;
      } else {
        _selectedIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      // ignore: prefer_const_literals_to_create_immutables
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(children: [
          Expanded(
            child: _pageViewItems(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabIndicator(selectedIndex: _selectedIndex),
              StartFabButton(
                  isLastPage: _isLastPage,
                  onPressed: () {
                    _incrementAndChange();
                  })
            ],
          )
        ]),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [
        ValueListenableBuilder<bool>(
          valueListenable: isBackEnable,
          builder: (BuildContext context, dynamic value, Widget? child) {
            return value
                ? const SizedBox()
                : TextButton(
                    onPressed: () {},
                    child: Text(_skipTitle),
                  );
          },
        ),
      ],
      leading: _firstPage
          ? null
          : IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.grey,
              )),
    );
  }

  Widget _pageViewItems() {
    return PageView.builder(
      onPageChanged: (value) {
        _incrementAndChange(value);
      },
      itemCount: _pageLength,
      itemBuilder: (context, index) {
        return OnBoardCard(model: OnBoardModels.onBoardItems[index]);
      },
    );
  }
}
