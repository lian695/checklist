part of 'checklist_bloc.dart';

class ChecklistState extends Equatable {
  final List<String> checklistNames;
  final bool isChecklistTextFieldOpen;
  const ChecklistState({
    this.checklistNames = const [],
    this.isChecklistTextFieldOpen = false,
  });

  ChecklistState copyWith({
    List<String>? checklistNames,
    bool? isChecklistTextFieldOpen,
  }) {
    return ChecklistState(
      checklistNames: checklistNames ?? this.checklistNames,
      isChecklistTextFieldOpen:
          isChecklistTextFieldOpen ?? this.isChecklistTextFieldOpen,
    );
  }

  @override
  List<Object?> get props => [
        checklistNames,
        isChecklistTextFieldOpen,
      ];
}
