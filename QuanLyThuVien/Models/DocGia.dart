import '../Models/Sach.dart';

class DocGia {
  String _maDocGia;
  String _tenDocGia;
  List<Sach> _danhSachSachMuon = [];

  //Constructor
  DocGia(this._maDocGia, this._tenDocGia);

  //Getters
  String get maDocGia => _maDocGia;
  String get tenDocGia => _tenDocGia;
  List<Sach> get danhSachSachMuon => _danhSachSachMuon;

  //Setters
  set maDocGia(String maDocGia) {
    if (maDocGia.isNotEmpty) {
      _maDocGia = maDocGia;
    }
  }

  set tenDocGia(String tenDocGia) {
    if (tenDocGia.isNotEmpty) {
      _tenDocGia = tenDocGia;
    }
  }

  // Phương thức mượn sách
  void muonSach(Sach sach) {
    // Kiểm tra trạng thái sách
    if (sach.trangThai == 'Đã mượn') {
      print('Sách "${sach.tenSach}" đã được mượn, không thể mượn lại.');
      return;
    }
    // Thêm sách vào danh sách mượn
    _danhSachSachMuon.add(sach);
    // Cập nhật trạng thái sách
    sach.trangThai = 'Đã mượn';
    print('Sách "${sach.tenSach}" đã được mượn thành công.');
  }

  // Hiển thị danh sách sách đã mượn
  void hienThiDanhSachMuon() {
    if (_danhSachSachMuon.isEmpty) {
      print('Không có sách nào trong danh sách mượn.');
      return;
    }

    print('Danh sách sách đã mượn của $_tenDocGia:');
    for (var sach in _danhSachSachMuon) {
      print('- ${sach.tenSach} (Mã sách: ${sach.maSach})');
    }
  }
}
