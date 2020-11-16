

class Eng2th {
  int id;
  String esearch;
  String tentry;
  String ecat;
  String ethai;
  String esyn;
  String eant;
  int get getId => id;

  set setId(int id) => this.id = id;

  String get getEsearch => esearch;

  set setEsearch(String esearch) => this.esearch = esearch;

  String get getTentry => tentry;

  set setTentry(String tentry) => this.tentry = tentry;

  String get getEcat => ecat;

  set setEcat(String ecat) => this.ecat = ecat;

  String get getEthai => ethai;

  set setEthai(String ethai) => this.ethai = ethai;

  String get getEsyn => esyn;

  set setEsyn(String esyn) => this.esyn = esyn;

  String get getEant => eant;

  set setEant(String eant) => this.eant = eant;
  Eng2th({
    this.id,
    this.esearch,
    this.tentry,
    this.ecat,
    this.ethai,
    this.esyn,
    this.eant,
  });

  @override
  String toString() {
    return 'Eng2th(id: $id, esearch: $esearch, tentry: $tentry, ecat: $ecat, ethai: $ethai, esyn: $esyn, eant: $eant)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'esearch': esearch,
      'tentry': tentry,
      'ecat': ecat,
      'ethai': ethai,
      'esyn': esyn,
      'eant': eant,
    };
  }

  factory Eng2th.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Eng2th(
      id: map['id'],
      esearch: map['esearch'],
      tentry: map['tentry'],
      ecat: map['ecat'],
      ethai: map['ethai'],
      esyn: map['esyn'],
      eant: map['eant'],
    );
  }
}
