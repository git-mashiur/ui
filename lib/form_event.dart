part of 'form_bloc.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object?> get props => [];
}

class SelectCountry extends FormEvent {
  final String? country;

  const SelectCountry(this.country);

  @override
  List<Object?> get props => [country];
}

class SelectCity extends FormEvent {
  final String? city;

  const SelectCity(this.city);

  @override
  List<Object?> get props => [city];
}

class SelectArea extends FormEvent {
  final String? area;

  const SelectArea(this.area);

  @override
  List<Object?> get props => [area];
}

class SelectLanguage extends FormEvent {
  final String? language;

  const SelectLanguage(this.language);

  @override
  List<Object?> get props => [language];
}

class SaveForm extends FormEvent {
  const SaveForm();
}