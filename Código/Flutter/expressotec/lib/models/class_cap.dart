

class NumeroCapsulas {
  int _cap;

  NumeroCapsulas(
    this._cap,
  ) {
    setCap(_cap);
    print('capsulas constructor');
  }

  void setCap(capsulas) {
    _cap = capsulas;
  }

  void somaCap() {
    _cap++;
  }

  int subCap() {
    if (_cap == 0) {
      return _cap = 0;
    } else {
      return _cap--;
    }
  }

  int getCap() {
    return _cap;
  }
}






