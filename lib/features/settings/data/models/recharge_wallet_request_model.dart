class RechargeWalletRequestModel {
  final String code;

  RechargeWalletRequestModel({required this.code});

  Map<String, dynamic> toJson() {
    return {
      'code': code,
    };
  }

  factory RechargeWalletRequestModel.fromJson(Map<String, dynamic> json) {
    return RechargeWalletRequestModel(
      code: json['code'],
    );
  }
}
