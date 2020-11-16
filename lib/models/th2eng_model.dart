class Th2eng {
  int id;
  String tsearch;
  String tentrry;
  String eentry;
  String tcat;
  String tsyn;
  String tsample;
  String tant;
  String tdef;
  String tenglish;
  String tnum;
  String tnotes;
  int get getId => id;

  set setId(int id) => this.id = id;

  String get getTsearch => tsearch;

  set setTsearch(String tsearch) => this.tsearch = tsearch;

  String get getTentrry => tentrry;

  set setTentrry(String tentrry) => this.tentrry = tentrry;

  String get getEentry => eentry;

  set setEentry(String eentry) => this.eentry = eentry;

  String get getTcat => tcat;

  set setTcat(String tcat) => this.tcat = tcat;

  String get getTsyn => tsyn;

  set setTsyn(String tsyn) => this.tsyn = tsyn;

  String get getTsample => tsample;

  set setTsample(String tsample) => this.tsample = tsample;

  String get getTant => tant;

  set setTant(String tant) => this.tant = tant;

  String get getTdef => tdef;

  set setTdef(String tdef) => this.tdef = tdef;

  String get getTenglish => tenglish;

  set setTenglish(String tenglish) => this.tenglish = tenglish;

  String get getTnum => tnum;

  set setTnum(num tnum) => this.tnum = tnum as String;

  String get getTnotes => tnotes;

  set setTnotes(String tnotes) => this.tnotes = tnotes;
  Th2eng({
    this.id,
    this.tsearch,
    this.tentrry,
    this.eentry,
    this.tcat,
    this.tsyn,
    this.tsample,
    this.tant,
    this.tdef,
    this.tenglish,
    this.tnum,
    this.tnotes,
  });

  @override
  String toString() {
    return 'Th2eng(id: $id, tsearch: $tsearch, tentrry: $tentrry, eentry: $eentry, tcat: $tcat, tsyn: $tsyn, tsample: $tsample, tant: $tant, tdef: $tdef, tenglish: $tenglish, tnum: $tnum, tnotes: $tnotes)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tsearch': tsearch,
      'tentrry': tentrry,
      'eentry': eentry,
      'tcat': tcat,
      'tsyn': tsyn,
      'tsample': tsample,
      'tant': tant,
      'tdef': tdef,
      'tenglish': tenglish,
      'tnum': tnum,
      'tnotes': tnotes,
    };
  }

  factory Th2eng.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Th2eng(
      id: map['id'],
      tsearch: map['tsearch'],
      tentrry: map['tentrry'],
      eentry: map['eentry'],
      tcat: map['tcat'],
      tsyn: map['tsyn'],
      tsample: map['tsample'],
      tant: map['tant'],
      tdef: map['tdef'],
      tenglish: map['tenglish'],
      tnum: map['tnum'],
      tnotes: map['tnotes'],
    );
  }
}
