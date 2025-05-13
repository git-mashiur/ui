import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'form_bloc.dart';
import 'form_logic.dart';

class FormUI extends StatelessWidget {
  const FormUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormBloc, SimpleFormState>(
      listener: (context, state) {
        if (state.saveStatus == SaveStatus.success) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Form Saved!')),
          );
        }
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<FormBloc, SimpleFormState>(
                buildWhen: (previous, current) =>
                previous.selectedCountry != current.selectedCountry,
                builder: (context, state) {
                  return DropdownButtonFormField<String>(
                    value: state.selectedCountry,
                    hint: const Text('Select Country'),
                    onChanged: (value) {
                      context.read<FormBloc>().add(SelectCountry(value));
                    },
                    items: FormLogic.getCountries().map((country) {
                      return DropdownMenuItem<String>(
                        value: country,
                        child: Text(country),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<FormBloc, SimpleFormState>(
                buildWhen: (previous, current) =>
                previous.selectedCountry != current.selectedCountry ||
                    previous.selectedCity != current.selectedCity ||
                    previous.canSelectCity != current.canSelectCity,
                builder: (context, state) {
                  return DropdownButtonFormField<String>(
                    value: state.selectedCity,
                    hint: const Text('Select City'),
                    onChanged: state.canSelectCity
                        ? (value) {
                      context.read<FormBloc>().add(SelectCity(value));
                    }
                        : null,
                    items: state.selectedCountry != null
                        ? (FormLogic.getCities()[state.selectedCountry!] ?? [])
                        .map((city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      );
                    }).toList()
                        : [],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<FormBloc, SimpleFormState>(
                buildWhen: (previous, current) =>
                previous.selectedCity != current.selectedCity ||
                    previous.selectedArea != current.selectedArea ||
                    previous.canSelectArea != current.canSelectArea,
                builder: (context, state) {
                  return DropdownButtonFormField<String>(
                    value: state.selectedArea,
                    hint: const Text('Select Area'),
                    onChanged: state.canSelectArea
                        ? (value) {
                      context.read<FormBloc>().add(SelectArea(value));
                    }
                        : null,
                    items: state.selectedCity != null
                        ? (FormLogic.getAreas()[state.selectedCity!] ?? [])
                        .map((area) {
                      return DropdownMenuItem<String>(
                        value: area,
                        child: Text(area),
                      );
                    }).toList()
                        : [],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<FormBloc, SimpleFormState>(
                buildWhen: (previous, current) =>
                previous.selectedCountry != current.selectedCountry ||
                    previous.selectedLanguage != current.selectedLanguage ||
                    previous.canSelectLanguage != current.canSelectLanguage,
                builder: (context, state) {
                  return DropdownButtonFormField<String>(
                    value: state.selectedLanguage,
                    hint: const Text('Choose language'),
                    onChanged: state.canSelectLanguage
                        ? (value) {
                      context.read<FormBloc>().add(SelectLanguage(value));
                    }
                        : null,
                    items: state.selectedCountry != null
                        ? (FormLogic.getLanguages()[state.selectedCountry!] ?? [])
                        .map((language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList()
                        : [],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              BlocBuilder<FormBloc, SimpleFormState>(
                buildWhen: (previous, current) =>
                previous.selectedCountry != current.selectedCountry ||
                    previous.selectedCity != current.selectedCity ||
                    previous.selectedArea != current.selectedArea ||
                    previous.selectedLanguage != current.selectedLanguage ||
                    previous.saveStatus != current.saveStatus,
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: FormLogic.canSave(
                      state.selectedCountry,
                      state.selectedCity,
                      state.selectedArea,
                      state.selectedLanguage,
                    )
                        ? () {
                      context.read<FormBloc>().add(const SaveForm());
                    }
                        : null,
                    child: const Text('Save'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}