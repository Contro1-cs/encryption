import 'package:encryption/widgets/buttons.dart';
import 'package:encryption/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RailFenceCipher extends StatefulWidget {
  const RailFenceCipher({super.key});

  @override
  State<RailFenceCipher> createState() => _RailFenceCipherState();
}

class _RailFenceCipherState extends State<RailFenceCipher> {
  TextEditingController _encrypt = TextEditingController(text: 'abc');
  TextEditingController _encryptedMsg = TextEditingController(text: 'abc');
  String first = 'abc', second = 'abc';
  @override
  Widget build(BuildContext context) {
    int maxLength = first.length > second.length ? first.length : second.length;
    first = first.padRight(maxLength);
    second = second.padRight(maxLength);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Rail Fence Cipher',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xffD33F49),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              children: [
                encryptTextField(context,'Encrypt your message' ,_encrypt),
                const SizedBox(height: 10),
                encryptButton(
                  context,
                  () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    _encryptedMsg.text = '';
                    first = '';
                    second = '';
                    setState(
                      () {
                        for (int i = 0; i < _encrypt.text.length; i++) {
                          if (_encrypt.text[i] != ' ') {
                            if (i % 2 == 0) {
                              first += _encrypt.text[i];
                            } else {
                              second += _encrypt.text[i];
                            }
                          }
                        }
                        _encryptedMsg.text = '$first$second';
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your message:',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        _encrypt.text,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Encrypted message:',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        _encryptedMsg.text,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Table(
                    border: TableBorder.all(color: Colors.black),
                    children: [
                      TableRow(
                        children: first.split('').map((letter) {
                          return TableCell(
                            child: Center(
                              child: Text(letter),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Table(
                    border: TableBorder.all(color: Colors.black),
                    children: [
                      TableRow(
                        children: second.split('').map((letter) {
                          return TableCell(
                            child: Center(
                              child: Text(letter),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
