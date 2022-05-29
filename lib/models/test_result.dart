class TestResult {
  int age;
  int pregWeek;
  int healthProblem;
  int desiredPreg;
  int employed;
  int education;
  int income;
  int marital;
  int mental;
  int preference;

  TestResult(
      this.age,
      this.pregWeek,
      this.healthProblem,
      this.desiredPreg,
      this.employed,
      this.education,
      this.income,
      this.marital,
      this.mental,
      this.preference,
      );

  Map<String, dynamic> toJson() => {
    'age': age.toString(),
    'pregWeek': pregWeek.toString(),
    'healthProblem': healthProblem.toString(),
    'desiredPreg': desiredPreg.toString(),
    'employed': employed.toString(),
    'education': education.toString(),
    'income': income.toString(),
    'marital': marital.toString(),
    'mental': mental.toString(),
  };

  List<double> getList() => [
    this.age.toDouble(),
    this.pregWeek.toDouble(),
    this.healthProblem.toDouble(),
    this.desiredPreg.toDouble(),
    this.employed.toDouble(),
    this.education.toDouble(),
    this.income.toDouble(),
    this.marital.toDouble(),
    this.mental.toDouble()
  ];
}