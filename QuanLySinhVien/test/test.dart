
import '../Models/Lop.dart';
import '../Models/SinhVien.dart';

// TEST
void main() {
  var sv = SinhVien('Nguyen Van A', 20, 'SV001', 8.0);
  print('Test getter: ${sv.hoTen}');
  sv.hoTen = 'Nguyen Van B';
  print('Sau khi set: ${sv.hoTen}');
  print('Xep Loai: ${sv.XepLoai()}');

  var lop = LopHoc('21DTHD5');
  lop.themSinhVien(SinhVien('Nguyen Van A', 21, 'SV001', 8.5));
  lop.themSinhVien(SinhVien('Nguyen Van B', 20, 'SV002', 6.5));
  lop.themSinhVien(SinhVien('Nguyen Van C', 19, 'SV003', 5.5));
  lop.themSinhVien(SinhVien('Nguyen Van D', 24, 'SV004', 2.5));
  lop.themSinhVien(SinhVien('Nguyen Van E', 23, 'SV005', 9.5));
  lop.HienThiDanhSach();
}
