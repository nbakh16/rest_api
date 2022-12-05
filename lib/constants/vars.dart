import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum TabOptions {
  allNews,
  trending,
}

enum SortListOptions{
  relevant,
  popular,
  time
}

TextStyle titleTxtStyle = GoogleFonts.gabriela(fontSize: 16, fontWeight: FontWeight.bold);
TextStyle descTxtStyle = GoogleFonts.gabriela(fontSize: 14, fontWeight: FontWeight.normal);