import 'package:flutter/material.dart';

class ChecklistTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onAdd;
  final Function() onTapOutside;
  const ChecklistTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onAdd,
    required this.onTapOutside,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onTapOutside: (_) =>  onTapOutside(),
      decoration: InputDecoration(
        hintText: 'Add Checklist',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(
              0xFF9A9A9A,
            ),
          ),
        ),
        hintStyle: TextStyle(color: Color(0xFF6A6A6A), fontSize: 13),
        suffix: GestureDetector(
          onTap: () => onAdd(controller.text),
          child: Icon(
            Icons.add,
            size: 24,
            color: Color(0xFF212121),
          ),
        ),
      ),
    );
  }
}
