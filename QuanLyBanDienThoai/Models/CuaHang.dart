import '../Models/DienThoai.dart';
import '../Models/HoaDon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _dsDienThoai = [];
  List<HoaDon> _dsHoaDon = [];

  //Constructors
  CuaHang(this._diaChi, this._tenCuaHang);

  //Getters
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;

  //Phương thức quản lý điện thoại
  void themDienThoai(DienThoai dienThoai) {
    _dsDienThoai.add(dienThoai);
    print("Đã thêm điện thoại: ${dienThoai.tenDT}");
  }

  //Cập nhập thông tin điện thoại
  void capNhatDienThoai(String maDT, DienThoai thongTinMoi) {
    //tìm phần tử đầu tiên trong ds thoả mãn đkien
    var dt = _dsDienThoai.firstWhere(
      (dt) => dt.maDT == maDT,
      orElse: () => throw Exception("Không tìm thấy điện thoại với mã $maDT"),
    );
    dt
      ..tenDT = thongTinMoi.tenDT
      ..hangSX = thongTinMoi.hangSX
      ..giaNhap = thongTinMoi.giaNhap
      ..giaBan = thongTinMoi.giaBan
      ..slTonkho = thongTinMoi.slTonkho;
    print("Đã cập nhật thông tin cho điện thoại mã $maDT.");
  }

  //Kiểm tra ngừng kinh doanh điện thoại
  void ngungKinhDoanhDT(String maDT) {
    //tìm phần tử đầu tiên trong ds thoả mãn đkien
    var dt = _dsDienThoai.firstWhere(
      (dt) => dt.maDT == maDT,
      orElse: () => throw Exception("Không tìm thấy điện thoại với mã $maDT"),
    );
    dt.slTonkho = 0;
    print("Đã ngừng kinh doanh điện thoại mã $maDT.");
  }

  //Tìm kiếm điện thoại
  List<DienThoai> timKiemDienThoai({String? ma, String? ten, String? hang}) {
    return _dsDienThoai.where((dt) {
      bool matchMa = ma == null || dt.maDT.contains(ma);
      bool matchTen = ten == null ||
          dt.tenDT.toLowerCase().contains(ten
              .toLowerCase()); //toLowerCase(): Để tìm kiếm không phân biệt chữ hoa và chữ thường.
      bool matchHang =
          hang == null || dt.hangSX.toLowerCase().contains(hang.toLowerCase());
      return matchMa && matchTen && matchHang;
    }).toList();
  }

  //Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    print("Danh sách điện thoại:");
    _dsDienThoai.forEach((dt) {
      dt.hienThiThongTin();
      print('---');
    });
  }

  //Phương thức quản lý hóa đơn
  void taoHoaDon(HoaDon hoaDon) {
    if (hoaDon.dienThoai.slTonkho >= hoaDon.slMua) {
      hoaDon.dienThoai.slTonkho -= hoaDon.slMua;
      _dsHoaDon.add(hoaDon);
      print("Đã tạo hóa đơn: ${hoaDon.maHD}");
    } else {
      throw Exception("Không đủ tồn kho để tạo hóa đơn.");
    }
    List<HoaDon> timKiemHoaDon(
        {String? ma, DateTime? ngay, String? tenKhachHang}) {
      return _dsHoaDon.where((hd) {
        bool matchMa = ma == null || hd.maHD.contains(ma);
        bool matchNgay = ngay == null ||
            hd.ngayBan.day == ngay.day &&
                hd.ngayBan.month == ngay.month &&
                hd.ngayBan.year == ngay.year;
        bool matchKhach = tenKhachHang == null ||
            hd.tenKH.toLowerCase().contains(tenKhachHang.toLowerCase());
        return matchMa && matchNgay && matchKhach;
      }).toList();
    }
  }

  //Hiển thị danh sách hoá đơn
  void hienThiDanhSachHoaDon() {
    print("Danh sách hóa đơn:");
    _dsHoaDon.forEach((hd) {
      hd.hienThiThongTin();
      print('---');
    });
  }

  //Tính tổng doanh thu
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    return _dsHoaDon.where((hd) {
      return hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay);
    }).fold(
        0,
        (tong, hd) =>
            tong +
            hd.tinhTongTien()); //.fold trong Dart là một cách để tích lũy giá trị từ một danh sách.
  }

  //Tính tổng lợi nhuận
  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    return _dsHoaDon.where((hd) {
      return hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay);
    }).fold(
        0,
        (tong, hd) =>
            tong +
            hd.tinhLoiNhuanThucTe()); //.fold trong Dart là một cách để tích lũy giá trị từ một danh sách.
  }

  List<DienThoai> thongKeTopDienThoaiBanChay() {
    var banChay = <DienThoai, int>{};
    for (var hd in _dsHoaDon) {
      banChay[hd.dienThoai] = (banChay[hd.dienThoai] ?? 0) + hd.slMua;
    }
    var sorted = banChay.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sorted.map((e) => e.key).toList();
  }

  List<DienThoai> thongKeTonKho() {
    return _dsDienThoai.where((dt) => dt.slTonkho > 0).toList();
  }

}
