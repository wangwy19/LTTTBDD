
class Sach {
  String _maSach;
  String _tenSach;
  String _tacGia;
  String _trangThai;

  //Constructor
  Sach(this._maSach, this._tacGia, this._tenSach, this._trangThai);

  //Getters
  String get maSach => _maSach;
  String get tenSach => _tenSach;
  String get tacGia => _tacGia;
  String get trangThai => _trangThai;

  //Setters
  set maSach(String maSach){
    if(maSach.isNotEmpty){
      _maSach=maSach;
    }
  }

  set tenSach(String tenSach){
    if(tenSach.isNotEmpty){
      _tenSach = tenSach;
    }
  }

  set tacGia(String tacGia){
    if(tacGia.isNotEmpty){
      _tacGia = tacGia;
    }
  }

  set trangThai(String trangThai){
  }

  void HienThiThongTin(){
    print('Mã Sách: $_maSach');
    print('Tên Sách: $_tenSach');
    print('Tác Giả: $_tacGia');
    print('Trạng Thái: $_trangThai');
  }


  
}