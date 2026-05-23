import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checklist_event.dart';
part 'checklist_state.dart';

class ChecklistBloc extends Bloc<ChecklistEvent, ChecklistState> {
  ChecklistBloc() : super(ChecklistState()) {
    on<AddChecklistEvent>(_handleAddChecklistEvent);
    on<OpenChecklistTextFieldEvent>(_handleOpenChecklistTextFieldEvent);
    on<CloseChecklistTextFieldEvent>(_handleCloseChecklistTextFieldEvent);
  }

  Future<void> _handleAddChecklistEvent(
      AddChecklistEvent event, Emitter<ChecklistState> emit) async {
    final checklistNames = [...state.checklistNames];
    checklistNames.add(event.checklistName);
    emit(state.copyWith(
        checklistNames: checklistNames, isChecklistTextFieldOpen: false));
  }

  Future<void> _handleOpenChecklistTextFieldEvent(
      OpenChecklistTextFieldEvent event, Emitter<ChecklistState> emit) async {
    emit(state.copyWith(isChecklistTextFieldOpen: true));
  }

  Future<void> _handleCloseChecklistTextFieldEvent(
      CloseChecklistTextFieldEvent event, Emitter<ChecklistState> emit) async {
    emit(state.copyWith(isChecklistTextFieldOpen: false));
  }
}
