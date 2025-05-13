import 'package:flutter/material.dart';
import 'form_logic.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String? selectedCountry;
  String? selectedCity;
  String? selectedArea;
  String? selectedLanguage;

  bool canSelectCity = false;
  bool canSelectArea = false;
  bool canSelectLanguage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: selectedCountry,
                hint: Text('Select Country'),
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                    selectedCity = null;
                    selectedArea = null;
                    selectedLanguage = null;
                    canSelectCity = true;
                    canSelectArea = false;
                    canSelectLanguage = false;
                  });
                },
                items: FormLogic.getCountries().map((country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedCity,
                hint: Text('Select City'),
                onChanged: canSelectCity
                    ? (value) {
                  setState(() {
                    selectedCity = value;
                    selectedArea = null;
                    selectedLanguage = null;
                    canSelectArea = true;
                    canSelectLanguage = false;
                  });
                }
                    : null,
                items: selectedCountry != null
                    ? FormLogic.getCities()[selectedCountry!]!.map((city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList()
                    : [],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedArea,
                hint: Text('Select Area'),
                onChanged: canSelectArea
                    ? (value) {
                  setState(() {
                    selectedArea = value;
                    selectedLanguage = null;
                    canSelectLanguage = true;
                  });
                }
                    : null,
                items: selectedCity != null
                    ? FormLogic.getAreas()[selectedCity!]!.map((area) {
                  return DropdownMenuItem<String>(
                    value: area,
                    child: Text(area),
                  );
                }).toList()
                    : [],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedLanguage,
                hint: Text('Choose language'),
                onChanged: canSelectLanguage
                    ? (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                }
                    : null,
                items: selectedCountry != null
                    ? FormLogic.getLanguages()[selectedCountry!]!.map((language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language),
                  );
                }).toList()
                    : [],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: FormLogic.canSave(
                    selectedCountry,
                    selectedCity,
                    selectedArea,
                    selectedLanguage)
                    ? () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Form Saved!')),
                  );
                }
                    : null,
                child: Text('Save'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}