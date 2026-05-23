import 'package:checklist/presentation/checklist_main_screen/state/checklist_bloc.dart';
import 'package:checklist/presentation/checklist_main_screen/widgets/add_checklist_button.dart';
import 'package:checklist/presentation/checklist_main_screen/widgets/checklist_text_field.dart';
import 'package:checklist/presentation/checklist_main_screen/widgets/single_checklist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChecklistMainScreen extends StatefulWidget {
  const ChecklistMainScreen({super.key});

  @override
  State<ChecklistMainScreen> createState() => _ChecklistMainScreenState();
}

class _ChecklistMainScreenState extends State<ChecklistMainScreen> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late ChecklistBloc _checklistBloc;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _checklistBloc = BlocProvider.of<ChecklistBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Checklist'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: BlocBuilder<ChecklistBloc, ChecklistState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final checklistName in state.checklistNames)
                      SingleChecklist(checklistName: checklistName),
                    const SizedBox(height: 20),
                    if (state.isChecklistTextFieldOpen)
                      ChecklistTextField(
                        onTapOutside: () {
                          _focusNode.unfocus();
                          _checklistBloc.add(CloseChecklistTextFieldEvent());
                          _controller.clear();
                        },
                        controller: _controller,
                        focusNode: _focusNode,
                        onAdd: (checklistName) {
                          _checklistBloc.add(
                              AddChecklistEvent(checklistName: checklistName));
                          _controller.clear();
                        },
                      )
                    else
                      AddChecklistButton(
                        onAdd: () {
                          _checklistBloc.add(OpenChecklistTextFieldEvent());
                        },
                      )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
