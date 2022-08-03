class Arac {
  final String _aracMarka;
  final String _aracModel;
  final String _aracYil;
  final String _aracDetay;
  final String _aracKucukResim;
  final String _aracBuyukResim;
 
  get aracMarka => this._aracMarka;

  get aracModel => this._aracModel;

  get aracYil => this._aracYil;

  get aracDetay => this._aracDetay;

  get aracKucukResim => this._aracKucukResim;

  get aracBuyukResim => this._aracBuyukResim;


  Arac(this._aracMarka, this._aracModel, this._aracYil, this._aracDetay,
      this._aracKucukResim, this._aracBuyukResim);

  @override
  String toString() {
    // TODO: implement toString
    return '$_aracMarka - $_aracKucukResim';
  }
}
