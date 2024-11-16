//BaiTap02.dart
//Giai phương trình bậc 2: 
import 'dart:io';
import 'dart:math';

void main(){

    double a;

    // Kiểm tra hệ số a (phải là số hợp lệ và khác 0)
    while (true) {
      stdout.write('Nhập hệ số a (a ≠ 0): ');
      String? input = stdin.readLineSync();
      double? parsedA = double.tryParse(input!); // Chuyển đổi chuỗi sang số thực
      if (parsedA == null) {
        // Nếu không phải số hợp lệ
        print("Vui lòng nhập một số hợp lệ cho a.");
      } else if (parsedA == 0) {
        // Nếu số nhập vào là 0
        print("Hệ số a phải khác 0. Vui lòng nhập lại!");
      } else {
        a = parsedA; // Giá trị hợp lệ, thoát vòng lặp
        break;
      }
  }

  // Nhập hệ số b
    stdout.write('Nhập hệ số b: ');
    String? inputB = stdin.readLineSync();
    double b = double.tryParse(inputB!) ?? 0; // Chuyển đổi và gán mặc định nếu null

  // Nhập hệ số c
    stdout.write('Nhập hệ số c: ');
    String? inputC = stdin.readLineSync();
    double c = double.tryParse(inputC!) ?? 0; // Chuyển đổi và gán mặc định nếu null

  // Tính delta
    double delta = b * b - 4 * a * c;

  // Kiểm tra nghiệm dựa trên delta
  if (delta < 0) {
      print("Phương trình vô nghiệm.");
  } else if (delta == 0) {
      double x = -b / (2 * a); // Tính nghiệm kép
      print("Phương trình có nghiệm kép: x = $x");
  } else {
      double x1 = (-b + sqrt(delta)) / (2 * a); // Tính nghiệm thứ nhất
      double x2 = (-b - sqrt(delta)) / (2 * a); // Tính nghiệm thứ hai
      print("Phương trình có 2 nghiệm phân biệt:");
      print("x1 = $x1");
      print("x2 = $x2");
  }
}