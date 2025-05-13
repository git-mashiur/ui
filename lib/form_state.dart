part of 'form_bloc.dart';

enum SaveStatus { initial, success }

class SimpleFormState extends Equatable {
  final String? selectedCountry;
  final String? selectedCity;
  final String? selectedArea;
  final String? selectedLanguage;
  final bool canSelectCity;
  final bool canSelectArea;
  final bool canSelectLanguage;
  final SaveStatus saveStatus;

  const SimpleFormState({
    this.selectedCountry,
    this.selectedCity,
    this.selectedArea,
    this.selectedLanguage,
    required this.canSelectCity,
    required this.canSelectArea,
    required this.canSelectLanguage,
    required this.saveStatus,
  });

  factory SimpleFormState.initial() => const SimpleFormState(
    canSelectCity: false,
    canSelectArea: false,
    canSelectLanguage: false,
    saveStatus: SaveStatus.initial,
  );

  SimpleFormState copyWith({
    String? selectedCountry,
    String? selectedCity,
    String? selectedArea,
    String? selectedLanguage,
    bool? canSelectCity,
    bool? canSelectArea,
    bool? canSelectLanguage,
    SaveStatus? saveStatus,
  }) {
    return SimpleFormState(
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedCity: selectedCity ?? this.selectedCity,
      selectedArea: selectedArea ?? this.selectedArea,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      canSelectCity: canSelectCity ?? this.canSelectCity,
      canSelectArea: canSelectArea ?? this.canSelectArea,
      canSelectLanguage: canSelectLanguage ?? this.canSelectLanguage,
      saveStatus: saveStatus ?? this.saveStatus,
    );
  }

  @override
  List<Object?> get props => [
    selectedCountry,
    selectedCity,
    selectedArea,
    selectedLanguage,
    canSelectCity,
    canSelectArea,
    canSelectLanguage,
    saveStatus,
  ];
}