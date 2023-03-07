class TransactionModel {
  int? _disclosureYear;
  String? _disclosureDate;
  String? _transactionDate;
  String? _owner;
  String? _ticker;
  String? _assetDescription;
  String? _type;
  String? _amount;
  String? _representative;
  String? _district;
  String? _state;
  String? _ptrLink;
  bool? _capGainsOver200Usd;
  String? _industry;
  String? _sector;
  String? _party;

  TransactionModel(
      {int? disclosureYear,
        String? disclosureDate,
        String? transactionDate,
        String? owner,
        String? ticker,
        String? assetDescription,
        String? type,
        String? amount,
        String? representative,
        String? district,
        String? state,
        String? ptrLink,
        bool? capGainsOver200Usd,
        String? industry,
        String? sector,
        String? party}) {
    if (disclosureYear != null) {
      this._disclosureYear = disclosureYear;
    }
    if (disclosureDate != null) {
      this._disclosureDate = disclosureDate;
    }
    if (transactionDate != null) {
      this._transactionDate = transactionDate;
    }
    if (owner != null) {
      this._owner = owner;
    }
    if (ticker != null) {
      this._ticker = ticker;
    }
    if (assetDescription != null) {
      this._assetDescription = assetDescription;
    }
    if (type != null) {
      this._type = type;
    }
    if (amount != null) {
      this._amount = amount;
    }
    if (representative != null) {
      this._representative = representative;
    }
    if (district != null) {
      this._district = district;
    }
    if (state != null) {
      this._state = state;
    }
    if (ptrLink != null) {
      this._ptrLink = ptrLink;
    }
    if (capGainsOver200Usd != null) {
      this._capGainsOver200Usd = capGainsOver200Usd;
    }
    if (industry != null) {
      this._industry = industry;
    }
    if (sector != null) {
      this._sector = sector;
    }
    if (party != null) {
      this._party = party;
    }
  }

  int? get disclosureYear => _disclosureYear;
  set disclosureYear(int? disclosureYear) => _disclosureYear = disclosureYear;
  String? get disclosureDate => _disclosureDate;
  set disclosureDate(String? disclosureDate) =>
      _disclosureDate = disclosureDate;
  String? get transactionDate => _transactionDate;
  set transactionDate(String? transactionDate) =>
      _transactionDate = transactionDate;
  String? get owner => _owner;
  set owner(String? owner) => _owner = owner;
  String? get ticker => _ticker;
  set ticker(String? ticker) => _ticker = ticker;
  String? get assetDescription => _assetDescription;
  set assetDescription(String? assetDescription) =>
      _assetDescription = assetDescription;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get amount => _amount;
  set amount(String? amount) => _amount = amount;
  String? get representative => _representative;
  set representative(String? representative) =>
      _representative = representative;
  String? get district => _district;
  set district(String? district) => _district = district;
  String? get state => _state;
  set state(String? state) => _state = state;
  String? get ptrLink => _ptrLink;
  set ptrLink(String? ptrLink) => _ptrLink = ptrLink;
  bool? get capGainsOver200Usd => _capGainsOver200Usd;
  set capGainsOver200Usd(bool? capGainsOver200Usd) =>
      _capGainsOver200Usd = capGainsOver200Usd;
  String? get industry => _industry;
  set industry(String? industry) => _industry = industry;
  String? get sector => _sector;
  set sector(String? sector) => _sector = sector;
  String? get party => _party;
  set party(String? party) => _party = party;

  TransactionModel.fromJson(Map<String, dynamic> json) {
    _disclosureYear = json['disclosure_year'];
    _disclosureDate = json['disclosure_date'];
    _transactionDate = json['transaction_date'];
    _owner = json['owner'];
    _ticker = json['ticker'];
    _assetDescription = json['asset_description'];
    _type = json['type'];
    _amount = json['amount'];
    _representative = json['representative'];
    _district = json['district'];
    _state = json['state'];
    _ptrLink = json['ptr_link'];
    _capGainsOver200Usd = json['cap_gains_over_200_usd'];
    _industry = json['industry'];
    _sector = json['sector'];
    _party = json['party'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disclosure_year'] = this._disclosureYear;
    data['disclosure_date'] = this._disclosureDate;
    data['transaction_date'] = this._transactionDate;
    data['owner'] = this._owner;
    data['ticker'] = this._ticker;
    data['asset_description'] = this._assetDescription;
    data['type'] = this._type;
    data['amount'] = this._amount;
    data['representative'] = this._representative;
    data['district'] = this._district;
    data['state'] = this._state;
    data['ptr_link'] = this._ptrLink;
    data['cap_gains_over_200_usd'] = this._capGainsOver200Usd;
    data['industry'] = this._industry;
    data['sector'] = this._sector;
    data['party'] = this._party;
    return data;
  }
}
