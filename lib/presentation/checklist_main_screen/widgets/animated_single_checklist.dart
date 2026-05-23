import 'package:flutter/material.dart';

class AnimatedSingleChecklist extends StatefulWidget {
  final String checklistName;
  final bool isLastOne;
  const AnimatedSingleChecklist(
      {super.key, required this.checklistName, required this.isLastOne});

  @override
  State<AnimatedSingleChecklist> createState() =>
      _AnimatedSingleChecklistState();
}

class _AnimatedSingleChecklistState extends State<AnimatedSingleChecklist> {
  bool _isAnimationStarted = false;
  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      _isAnimationStarted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: _isAnimationStarted ? MediaQuery.of(context).size.width : 0 ,
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 1),
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF6A6A6A)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                widget.checklistName,
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
