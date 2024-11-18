import '../Models/DocGia.dart';
import '../Models/Sach.dart';

class ThuVien {
  List<Sach> _danhSachSach = [];
  List<DocGia> _danhSachDocGia = [];

  //getters
  List<Sach> get danhSachSach => _danhSachSach;
  List<DocGia> get danhSachDocGia => _danhSachDocGia;

  // Phương thức thêm sách vào thư viện
  void themSach(Sach sach) {
    _danhSachSach.add(sach);
    print('Đã thêm sách "${sach.tenSach}" vào thư viện.');
  }

  // Phương thức thêm độc giả vào thư viện
  void themDocGia(DocGia docGia) {
    _danhSachDocGia.add(docGia);
    print('Đã thêm độc giả "${docGia.tenDocGia}" vào thư viện.');
  }

  // Phương thức hiển thị danh sách sách
  void hienThiDanhSachSach() {
    if (_danhSachSach.isEmpty) {
      print('Không có sách.');
      return;
    }

    print('Danh sách sách trong thư viện:');
    for (var sach in _danhSachSach) {
      print(
          '- ${sach.tenSach} (Mã sách: ${sach.maSach}, Trạng thái: ${sach.trangThai})');
    }
  }

  // Phương thức hiển thị danh sách độc giả
  void hienThiDanhSachDocGia() {
    if (_danhSachDocGia.isEmpty) {
      print('Không có độc giả.');
      return;
    }

    print('Danh sách độc giả trong thư viện:');
    for (var docGia in _danhSachDocGia) {
      print('- ${docGia.tenDocGia} (Mã độc giả: ${docGia.maDocGia})');
    }
  }
}
