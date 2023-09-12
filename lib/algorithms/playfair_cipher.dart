import 'package:encryption/widgets/buttons.dart';
import 'package:encryption/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayfairCipher extends StatefulWidget {
  const PlayfairCipher({super.key});

  @override
  State<PlayfairCipher> createState() => _PlayfairCipherState();
}

TextEditingController _key = TextEditingController();
TextEditingController _plainText = TextEditingController();
TextEditingController _encryptedMsg = TextEditingController();
String _arrangedLetters = '';

List<String> alphabets = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z'
];

class _PlayfairCipherState extends State<PlayfairCipher> {
  rearrangeLetter() {
    for (int i = 0; i < _key.text.length; i++) {
      if (alphabets.contains(_key.text[i])) {
        alphabets.remove(_key.text[i]);
      }
    }
    _arrangedLetters = _plainText.text;
    setState(() {
      _arrangedLetters =
          (_key.text.replaceAll(" ", "") + alphabets.join()).toLowerCase();
    });
  }

  List<Widget> _buildTableRows() {
    List<Widget> rows = [];

    for (int i = 0; i < 5; i++) {
      List<Widget> rowChildren = [];
      for (int j = 0; j < 5; j++) {
        int index = i * 5 + j;
        if (index < _arrangedLetters.length) {
          rowChildren.add(
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Text(
                (_arrangedLetters[index] == 'i')
                    ? 'i/j'
                    : _arrangedLetters[index],
                style: GoogleFonts.poppins(),
              ),
            ),
          );
          if (_arrangedLetters[index] == 'i' ||
              _arrangedLetters[index] == 'j') {
            index++;
          }
        }
      }
      rows.add(Row(children: rowChildren));
    }
    return rows;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _key.text = '';
    _plainText.text = '';
    _encryptedMsg.text = '';
    _arrangedLetters = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Playfair Cipher',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xffD33F49),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                encryptTextField(context, 'Enter your key', _key),
                encryptTextField(context, 'Encrypt your message', _plainText),
                const SizedBox(height: 10),
                encryptButton(
                  context,
                  () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    alphabets = List.generate(
                      26,
                      (index) => String.fromCharCode('a'.codeUnitAt(0) + index),
                    );
                    setState(
                      () {
                        rearrangeLetter();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
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
                        _plainText.text,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          _arrangedLetters,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _buildTableRows(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
