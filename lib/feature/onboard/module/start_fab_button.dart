import 'package:flutter/material.dart';

class StartFabButton extends StatelessWidget {
  const StartFabButton({super.key, required this.isLastPage, this.onPressed});
  final String _fabStart = "Start";
  final String _fabNext = "Next";
  final bool isLastPage;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onPressed;
      },
      child: Text(isLastPage ? _fabStart : _fabNext),
    );
  }
}
