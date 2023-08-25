import 'package:encryption/algorithms/playfair_cipher.dart';
import 'package:encryption/algorithms/rail_fence_cipher.dart';
import 'package:encryption/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final pages = [
  {
    'title': 'Rail Fence Cipher',
    'page': const RailFenceCipher(),
  },
  {
    'title': 'Playfair Cipher',
    'page': const PlayfairCipher(),
  },
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'All algorithms',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: const Color(0xffD33F49),
      ),
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return algoButton(
            context,
            pages[index]['title'] as String,
            () {
              Get.to(
                () => pages[index]['page'] as Widget,
                transition: Transition.cupertino,
              );
            },
          );
        },
      ),
    );
  }
}
