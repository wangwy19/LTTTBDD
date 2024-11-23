class DienThoai {
  String _maDT;
  String _tenDT;
  String _hangSX;
  double _giaNhap;
  double _giaBan;
  int _slTonkho;
  bool _trangThai;

  //Constructors
  DienThoai(this._giaBan, this._giaNhap, this._hangSX, this._maDT,
      this._slTonkho, this._tenDT, this._trangThai);

  //Getters
  String get maDT => _maDT;
  String get tenDT => _tenDT;
  String get hangSX => _hangSX;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get slTonkho => _slTonkho;
  bool get trangThai => _trangThai;

  //Setters
  set maDT(String maDT) {
    if (maDT.isNotEmpty && RegExp(r'^DT-\d{3}$').hasMatch(maDT)) {
      _maDT = maDT;
    } else {
      throw ArgumentError(
          "Mã điện thoại không hợp lệ! Phải có định dạng 'DT-XXX'.");
    }
  }

  set tenDT(String tenDT) {
    if (tenDT.isNotEmpty) {
      _tenDT = tenDT;
    } else {
      throw ArgumentError("Tên điện thoại không được rỗng.");
    }
  }

  set hangSX(String hangSX) {
    if (hangSX.isNotEmpty) {
      _hangSX = hangSX;
    } else {
      throw ArgumentError("Hãng sản xuất không được rỗng.");
    }
  }

  set giaNhap(double giaNhap) {
    if (giaNhap > 0) {
      _giaNhap = giaNhap;
    } else {
      throw ArgumentError("Giá nhập phải lớn hơn 0.");
    }
  }

  set giaBan(double giaBan) {
    if (giaBan > 0 && giaBan > _giaNhap) {
      _giaBan = giaBan;
    } else {
      throw ArgumentError("Giá bán phải lớn hơn giá nhập và lớn hơn 0.");
    }
  }

  set slTonkho(int slTonkho) {
    if (slTonkho >= 0) {
      _slTonkho = slTonkho;
    } else {
      throw ArgumentError("Số lượng tồn kho phải lớn hơn hoặc bằng 0.");
    }
  }

  set trangThai(bool trangThai) {}

  //Hiển thị thông tin
  void hienThiThongTin() {
    print("Mã điện thoại: $_maDT");
    print("Tên điện thoại: $_tenDT");
    print("Hãng sản xuất: $_hangSX");
    print("Giá nhập: $_giaNhap");
    print("Giá bán: $_giaBan");
    print("Số lượng tồn kho: $_slTonkho");
    print("Trạng thái: ${_trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh"}");
  }

  //Tính lợi nhuận dự kiến
  double tinhLoiNhuan() {
    return _giaBan - _giaNhap;
  }

  //Kiểm tra có thể bán không
  bool coTheBan() {
    return _slTonkho > 0 && _trangThai;
  }
}
