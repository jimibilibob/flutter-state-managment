class User {
  final String name;
  final int age;
  final List<String> proffesions;

  User({required this.name, required this.age, required this.proffesions});

  User copyWith({String? name, int? age, List<String>? professionsList}) =>
      User(
          name: name ?? this.name,
          age: age ?? this.age,
          proffesions: professionsList ?? proffesions);
}
