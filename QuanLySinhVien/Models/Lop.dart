import '../Models/SinhVien.dart';
//Class LopHoc
class LopHoc {
  String _tenLop;
  List<SinhVien> _danhSachSV = [];

  LopHoc(this._tenLop);

  //Getters
  String get tenLop => _tenLop;
  List<SinhVien> get danhSachSV => _danhSachSV;

  //Setters
  set tenLop(String tenLop) {
    if (tenLop.isNotEmpty) {
      _tenLop = tenLop;
    }
  }

  // set danhSachSV(List<SinhVien> _danhSachSV) {
  //   if (danhSachSV.isEmpty) {
  //     _danhSachSV = danhSachSV;
  //   }
  // }

  //Them Sinh Vien
  void themSinhVien(SinhVien sv) {
    _danhSachSV.add(sv);
  }

  void HienThiDanhSach() {
    print('\n............................');
    print('\n............................');
    print('Danh SAch Sinh Vien Lop $_tenLop');
    for (var sv in _danhSachSV) {
      print('\n............................');
      sv.HienThiThongTin();
      print('Xep Loai: ${sv.XepLoai()}');
    }
  }
}
