class FormLogic {
  static List<String> getCountries() => ['Bangladesh', 'India'];

  static Map<String, List<String>> getCities() => {
    'Bangladesh': ['Dhaka', 'Chittagong'],
    'India': ['Mumbai', 'Delhi'],
  };

  static Map<String, List<String>> getAreas() => {
    'Dhaka': ['Gulshan', 'Dhanmondi'],
    'Chittagong': ['Agrabad', 'Halishahar'],
    'Mumbai': ['Bandra', 'Colaba'],
    'Delhi': ['Connaught Place', 'South Extension'],
  };

  static Map<String, List<String>> getLanguages() => {
    'Bangladesh': ['Bangla', 'English'],
    'India': ['Hindi', 'English'],
  };

  static bool canSave(
      String? country,
      String? city,
      String? area,
      String? language,
      ) {
    return country != null && city != null && area != null && language != null;
  }
}