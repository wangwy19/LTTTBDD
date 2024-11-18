class SinhVien {
  String _hoTen;
  int _tuoi;
  String _maSV;
  double _diemTB;

  //comsstructor
  SinhVien(this._hoTen, this._tuoi, this._maSV, this._diemTB);

  //Getters
  String get hoTen => _hoTen;
  int get tuoi => _tuoi;
  String get maSV => _maSV;
  double get diemTB => _diemTB;

  //Setters
  set hoTen(String hoTen) {
    if (hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  set tuoi(int tuoi) {
    if (tuoi > 0) {
      _tuoi = tuoi;
    }
  }

  set maSV(String maSV) {
    if (maSV.isNotEmpty) {
      _maSV = maSV;
    }
  }

  set diemTB(double diemTB) {
    if (diemTB >= 0 && diemTB <= 10) {
      _diemTB = diemTB;
    }
  }

  void HienThiThongTin() {
    print('Họ tên: $_hoTen');
    print('Tuổi: $_tuoi');
    print('Mã Sinh Viên: $_maSV');
    print('Điểm TB: $_diemTB');
  }

  String XepLoai() {
    if (_diemTB >= 8.0) return 'Giỏi';
    if (_diemTB >= 6.5) return 'Khá';
    if (_diemTB >= 5.0) return 'Trung Bình';
    return 'Yếu';
  }
}