class CounselorBankDetailsModel {
  String? id;
  String? bankId;
  String? ifscCode;
  String? accountNumber;
  String? accountHolderName;
  String? branchName;
  String? accountType;
  String? psychologist;
  String? bank;

  CounselorBankDetailsModel(
      {this.id,
      this.bankId,
      this.ifscCode,
      this.accountNumber,
      this.accountHolderName,
      this.branchName,
      this.accountType,
      this.psychologist,
      this.bank});

  CounselorBankDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankId = json['bank_id'];
    ifscCode = json['ifsc_code'];
    accountNumber = json['account_number'];
    accountHolderName = json['account_holder_name'];
    branchName = json['branch_name'];
    accountType = json['account_type'];
    psychologist = json['psychologist'];
    bank = json['bank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank_id'] = this.bankId;
    data['ifsc_code'] = this.ifscCode;
    data['account_number'] = this.accountNumber;
    data['account_holder_name'] = this.accountHolderName;
    data['branch_name'] = this.branchName;
    data['account_type'] = this.accountType;
    data['psychologist'] = this.psychologist;
    data['bank'] = this.bank;
    return data;
  }
}
