import 'package:cookpad_application/screens/widget/button_custom.dart';
import 'package:cookpad_application/screens/widget/user_card.dart';
import 'package:flutter/material.dart';

class MengikutiScreen extends StatefulWidget {
  const MengikutiScreen({super.key});

  @override
  State<MengikutiScreen> createState() => _MengikutiScreenState();
}

class _MengikutiScreenState extends State<MengikutiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F2),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: ListView(
            children: [
              // Section 1 - Gambar
              Image.asset(
                'assets/images/circle.png.jpeg',
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 10),

              // Section 2
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: const [
                    Text(
                      "Perluas jaringanmu",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Ikuti pengguna favoritmu untuk melihat resep terbaru, Cooksnap, dan lebih banyak lagi",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15)
                  ],
                ),
              ),

              // Section 3
              const Text(
                "Yuk ikuti pengguna ini!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 10),

              // Section 4
              Container(
                height: MediaQuery.of(context).size.height / 3,
                padding: const EdgeInsets.only(bottom: 15.0),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      5, // Ubah ini sesuai dengan jumlah pengguna yang ingin ditampilkan
                  separatorBuilder: (_, __) {
                    return const SizedBox(width: 16);
                  },
                  itemBuilder: (context, index) {
                    // Gantilah dengan data pengguna yang sebenarnya
                    return UsersCard();
                  },
                ),
              ),
              const SizedBox(height: 15),

              // Section 5
              ButtonCustom(
                onPressed: () {},
                label: "Lihat Semua",
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
