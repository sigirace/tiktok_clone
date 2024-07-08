import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _selected = false;

  void _onTap() {
    setState(() {
      _selected = !_selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
          horizontal: Sizes.size24,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.01)),
            color: _selected ? Theme.of(context).primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(Sizes.size32),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  spreadRadius: 5),
            ]),
        child: Text(
          widget.interest,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
