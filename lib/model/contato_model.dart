class ContatoModel {
  String nomeCompleto;
  String numeroConta;

  ContatoModel({
    required this.nomeCompleto,
    required this.numeroConta,
  });

  factory ContatoModel.fromJson(Map<String, dynamic> json) => ContatoModel(
        nomeCompleto: json["nomeCompleto"],
        numeroConta: json["numeroConta"],
      );

  Map<String, dynamic> toJson() => {
        "nomeCompleto": nomeCompleto,
        "numeroConta": numeroConta,
      };
}
