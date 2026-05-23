part of 'checklist_bloc.dart';

abstract class ChecklistEvent {}

class AddChecklistEvent extends ChecklistEvent {
  final String checklistName;
  AddChecklistEvent({required this.checklistName});
}

class OpenChecklistTextFieldEvent extends ChecklistEvent {
  OpenChecklistTextFieldEvent();
}
class CloseChecklistTextFieldEvent extends ChecklistEvent {
  CloseChecklistTextFieldEvent();
}
