import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'form_logic.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, SimpleFormState> {
  FormBloc() : super(SimpleFormState.initial()) {
    on<SelectCountry>(_onSelectCountry);
    on<SelectCity>(_onSelectCity);
    on<SelectArea>(_onSelectArea);
    on<SelectLanguage>(_onSelectLanguage);
    on<SaveForm>(_onSaveForm);
  }

  void _onSelectCountry(SelectCountry event, Emitter<SimpleFormState> emit) {
    emit(state.copyWith(
      selectedCountry: event.country,
      selectedCity: null,
      selectedArea: null,
      selectedLanguage: null,
      canSelectCity: true,
      canSelectArea: false,
      canSelectLanguage: false,
      saveStatus: SaveStatus.initial,
    ));
  }

  void _onSelectCity(SelectCity event, Emitter<SimpleFormState> emit) {
    emit(state.copyWith(
      selectedCity: event.city,
      selectedArea: null,
      selectedLanguage: null,
      canSelectArea: true,
      canSelectLanguage: false,
      saveStatus: SaveStatus.initial,
    ));
  }

  void _onSelectArea(SelectArea event, Emitter<SimpleFormState> emit) {
    emit(state.copyWith(
      selectedArea: event.area,
      selectedLanguage: null,
      canSelectLanguage: true,
      saveStatus: SaveStatus.initial,
    ));
  }

  void _onSelectLanguage(SelectLanguage event, Emitter<SimpleFormState> emit) {
    emit(state.copyWith(
      selectedLanguage: event.language,
      saveStatus: SaveStatus.initial,
    ));
  }

  void _onSaveForm(SaveForm event, Emitter<SimpleFormState> emit) {
    if (FormLogic.canSave(
      state.selectedCountry,
      state.selectedCity,
      state.selectedArea,
      state.selectedLanguage,
    )) {
      emit(state.copyWith(saveStatus: SaveStatus.success));
    } else {
      emit(state.copyWith(saveStatus: SaveStatus.initial));
    }
  }
}