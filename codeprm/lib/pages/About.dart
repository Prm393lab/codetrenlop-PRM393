import 'package:flutter/material.dart';
import 'package:codeprm/pages/ProductListPage1.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(Icons.menu),
        title: Center(child: Text("About me")),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductListPage1()),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          if (index == 0) {Navigator.of(context).pop()},
        },
        backgroundColor: Colors.greenAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigate_next),
            label: "NEXT",
          ),
        ],
      ),
      body: AboutBody(),
    );
  }
}

class AboutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [AboutImage(), AboutContent()]);
  }
}

class AboutImage extends StatelessWidget {
  const AboutImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: Image.asset("assets/images/images.jpg", fit: BoxFit.fill),
    );
  }
}

class AboutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      right: 20,
      left: 20,
      height: 270,
      child: Container(
        height: 250,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(50),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Do Mixi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  "📞 Alo, em có phải vu không? 😨 Ui vu ơi… em đừng có chối 😭📄 Thông tin về tên 🧑‍💼, địa chỉ nhà 🏡, trường học 🎓, ở đâu 📍, bố mẹ tên là gì 👨‍👩‍👧‍👦… anh có cả ở đây rồi 🗂️🔊 vu có cần anh đọc cho nghe một số thông tin không?… 👂📢🥺 vu ơi… em còn trẻ quá 👶, hơn con anh có mấy tuổi à 😢🤦‍♂️Sao vu lại làm thế… 😔🌱 Còn cả tương lai đằng trước… ✨🎓🏃‍♂️📬 vu thích anh cho người đến tận nhà nói chuyện với bố mẹ em đấy à?? 😤🏠👮‍♂️ ",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
