import 'dart:ui'; // Cần import thư viện này để dùng ImageFilter
import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       home: Scaffold(body: Center(child: GoldButton())),
//     ),
//   );
// }

class GoldButton extends StatelessWidget {
  const GoldButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Màu vàng nền của nút
    final Color goldColor = const Color(0xFFEBC300);

    return Container(
      width: 200,
      height: 70,
      decoration: BoxDecoration(
        color: goldColor,
        borderRadius: BorderRadius.circular(50),
        // Thêm một chút gradient nhẹ cho nền nút để nó trông kim loại hơn
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            goldColor.withOpacity(0.9),
            goldColor,
            goldColor.withOpacity(0.8),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      // Sử dụng ClipRRect để đảm bảo các vệt sáng không bị tràn ra ngoài nút
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // --- VỆT SÁNG DÀI Ở GÓC TRÊN TRÁI (Updated) ---
            Positioned(
              left: 10,
              top: -10, // Đẩy lên cao một chút
              child: Transform.rotate(
                angle: -0.25, // Xoay nhẹ ngược chiều kim đồng hồ
                child: _buildBlurStreak(
                  width: 160, // Kéo dài chiều rộng ra
                  height: 40,
                  opacity: 0.6,
                ),
              ),
            ),

            // --- VỆT SÁNG NHỎ Ở GÓC DƯỚI PHẢI (Updated) ---
            Positioned(
              right: -10,
              bottom: -15,
              child: Transform.rotate(
                angle: -0.3,
                child: _buildBlurStreak(
                  width: 100, // Dài hơn code cũ
                  height: 35,
                  opacity: 0.4,
                  reversed: true, // Đảo ngược hướng sáng cho góc dưới
                ),
              ),
            ),

            // --- NỘI DUNG CHÍNH (Ngôi sao và chữ GOLD) ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star, color: Colors.black, size: 32),
                SizedBox(width: 8),
                Text(
                  'GOLD',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'Serif', // Chọn font có chân cho giống ảnh
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Hàm hỗ trợ tạo vệt sáng dài và mờ
  Widget _buildBlurStreak({
    required double width,
    required double height,
    required double opacity,
    bool reversed = false,
  }) {
    // Sử dụng BackdropFilter kết hợp với ImageFilter.blur là cách hiệu quả
    // để tạo ra một vùng mờ mềm mại.
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          // Lớp tạo màu gradient tuyến tính (LinearGradient)
          Container(
            decoration: BoxDecoration(
              // Tạo hình dáng oval dài
              borderRadius: BorderRadius.all(Radius.elliptical(width, height)),
              gradient: LinearGradient(
                begin: reversed ? Alignment.centerRight : Alignment.centerLeft,
                end: reversed ? Alignment.centerLeft : Alignment.centerRight,
                colors: [
                  Colors.white.withOpacity(0.0), // Bắt đầu trong suốt
                  Colors.white.withOpacity(opacity), // Sáng nhất ở giữa
                  Colors.white.withOpacity(0.0), // Kết thúc trong suốt
                ],
                // Điều chỉnh vị trí các điểm màu để vệt sáng trông tự nhiên
                stops: const [0.1, 0.5, 0.9],
              ),
            ),
          ),
          // Lớp phủ làm mờ (Blur) để làm mềm các cạnh của gradient
          // Lưu ý: BackdropFilter cần một widget con (child) để hiển thị,
          // dù là Container rỗng.
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15.0, // Độ mờ ngang mạnh để kéo dài vệt sáng
                sigmaY: 8.0, // Độ mờ dọc vừa phải
              ),
              child: Container(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
