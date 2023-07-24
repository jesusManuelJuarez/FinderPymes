class ConsumerData {
  int id;
  String name;
  String email;
  String password;
  int idPlantFP;

  ConsumerData({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.idPlantFP,
  });

    factory ConsumerData.fromJson(Map<String, dynamic> json) {
    return ConsumerData(
      id: json['idUser'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json[''] ?? '',
      idPlantFP: json['idPlanFP'] ?? '',
    );
  }
}
