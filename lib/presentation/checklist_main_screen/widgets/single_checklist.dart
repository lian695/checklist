import 'package:flutter/material.dart';

class SingleChecklist extends StatelessWidget {
  final String checklistName;
  const SingleChecklist({super.key, required this.checklistName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF6A6A6A)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            checklistName,
            style: TextStyle(
              color: Color(0xFF212121),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
