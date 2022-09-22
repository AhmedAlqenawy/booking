class FiltterStatusModel {
  final String type;
  final String messageAr;
  final String messageEn;

  FiltterStatusModel({
    required this.type,
    required this.messageAr,
    required this.messageEn,
  });

  factory FiltterStatusModel.fromJson(Map<String, dynamic> json) {
    return FiltterStatusModel(
      type: json['type'] ?? '0',
      messageAr:
          json['title'] != null ? json['title']['ar'] ?? 'empty' : 'empty',
      messageEn:
          json['title'] != null ? json['title']['en'] ?? 'empty' : 'empty',
    );
  }
}
