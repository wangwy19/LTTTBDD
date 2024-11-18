import '../Models/DocGia.dart';
import '../Models/Sach.dart';
import '../Models/ThuVien.dart';
  void main() {
    // Tạo sách
    var sach1 = Sach('S001', 'Tác giả A', 'Sách A', 'Chưa mượn');
    var sach2 = Sach('S002', 'Tác giả B', 'Sách B', 'Chưa mượn');
    var sach3 = Sach('S003', 'Tác giả C', 'Sách C', 'Chưa mượn');

    print('--- Kiểm tra getter/setter của lớp Sach ---');
    print('Tên sách ban đầu: ${sach1.tenSach}');
    sach1.tenSach = 'Sách A (Phiên bản mới)';
    print('Tên sách sau khi cập nhật: ${sach1.tenSach}');

    // Tạo độc giả
    var docGia1 = DocGia('DG001', 'Nguyễn Văn A');
    var docGia2 = DocGia('DG002', 'Trần Thị B');

    print('\n--- Kiểm tra getter/setter của lớp DocGia ---');
    print('Tên độc giả ban đầu: ${docGia1.tenDocGia}');
    docGia1.tenDocGia = 'Nguyễn Văn A (Cập nhật)';
    print('Tên độc giả sau khi cập nhật: ${docGia1.tenDocGia}');

    // Tạo thư viện
    ThuVien thuVien = ThuVien();

    print('\n--- Thêm sách vào thư viện ---');
    thuVien.themSach(sach1);
    thuVien.themSach(sach2);
    thuVien.themSach(sach3);

    print('\n--- Hiển thị danh sách sách trong thư viện ---');
    thuVien.hienThiDanhSachSach();

    print('\n--- Thêm độc giả vào thư viện ---');
    thuVien.themDocGia(docGia1);
    thuVien.themDocGia(docGia2);

    print('\n--- Hiển thị danh sách độc giả trong thư viện ---');
    thuVien.hienThiDanhSachDocGia();

    print('\n--- Kiểm tra quy trình mượn/trả sách ---');
    print('Nguyễn Văn A mượn sách Sách A:');
    docGia1.muonSach(sach1);

    print('\nDanh sách sách của Nguyễn Văn A sau khi mượn:');
    docGia1.hienThiDanhSachMuon();

    print('\nHiển thị trạng thái sách trong thư viện:');
    thuVien.hienThiDanhSachSach();

    print('\nNguyễn Văn A cố gắng mượn lại sách Sách A:');
    docGia1.muonSach(sach1);

    print('\nTrần Thị B mượn sách Sách B:');
    docGia2.muonSach(sach2);

    print('\nDanh sách sách của Trần Thị B sau khi mượn:');
    docGia2.hienThiDanhSachMuon();

    print('\nHiển thị trạng thái sách trong thư viện:');
    thuVien.hienThiDanhSachSach();
  }
