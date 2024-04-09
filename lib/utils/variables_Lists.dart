import 'package:flutter/material.dart';

List homeFestivalContainerLists = [
  {
    'image': 'assets/images/Basant-Panchami.jpg',
    'festivalName': 'basant Panchami',
    'subtitle': 'Create your basant panchami template',
    'color': Colors.pinkAccent,
  },
  {
    'image': 'assets/images/chritmas.jpg',
    'festivalName': 'Christmas',
    'subtitle': 'Create your Christmas template',
    'color': Colors.blue
  },
  {
    'image': 'assets/images/diwali.jpg',
    'festivalName': 'Diwali',
    'subtitle': 'Create your Diwali template',
    'color': Colors.red
  },
  {
    'image': 'assets/images/durgaPuja.png',
    'festivalName': 'Durga Puja',
    'subtitle': 'Create your Durga Puja template',
    'color': Colors.orangeAccent
  },
  {
    'image': 'assets/images/dusserha.jpg',
    'festivalName': 'Dussehra',
    'subtitle': 'Create your Dussehra template',
    'color': Colors.green
  },
  {
    'image': 'assets/images/ganesh.jpg',
    'festivalName': 'Ganesh',
    'subtitle': 'Create your Ganesh template',
    'color': Colors.deepPurpleAccent
  },
  {
    'image': 'assets/images/gurunanak.jpg',
    'festivalName': 'Gurunanak Jayanti',
    'subtitle': 'Create your Gurunanak Jayanti template',
    'color': Colors.teal
  },
  {
    'image': 'assets/images/holi.jpg',
    'festivalName': 'Holi',
    'subtitle': 'Create your Holi template',
    'color': Colors.greenAccent
  },
  {
    'image': 'assets/images/independence.jpg',
    'festivalName': 'Independence',
    'subtitle': 'Create your Independence template',
    'color': Colors.redAccent
  },
  {
    'image': 'assets/images/janmashtami.jpg',
    'festivalName': 'Janmashtami',
    'subtitle': 'Create your Janmashtami template',
    'color': Colors.orangeAccent
  },
  {
    'image': 'assets/images/mahashivratri.jpg',
    'festivalName': 'Mahashivratri',
    'subtitle': 'Create your Mahashivratri template',
    'color': Colors.pinkAccent
  },
  {
    'image': 'assets/images/navratri.jpg',
    'festivalName': 'Navratri',
    'subtitle': 'Create your Navratri template',
    'color': Colors.blueAccent
  },
  {
    'image': 'assets/images/onam.jpg',
    'festivalName': 'Onam',
    'subtitle': 'Create your Onam template',
    'color': Colors.redAccent
  },
  {
    'image': 'assets/images/rakshabandhan.jpg',
    'festivalName': 'Raksha Bandhan',
    'subtitle': 'Create your Raksha Bandhan template',
    'color': Colors.deepPurpleAccent
  },
  {
    'image': 'assets/images/rath yatra.jpg',
    'festivalName': 'Rath Yatra',
    'subtitle': 'Create your Rath Yatra template',
    'color': Colors.red,
  },
];

bool isGridView = false;
bool isEditingStarted = false;
bool isTextEditingStarted = false;
bool isAlignmentSelected = false;
bool isFontFamilySelected = false;
bool isFontColorSelected = false;
bool isItalic = false;
bool isBold = false;
int templateImageIndex = 0;
bool centerAlignment = false;
bool leftAlignment = false;
bool rightAlignment = false;
TextEditingController txtAddText = TextEditingController();

int txtColorIndex = 0;
int fontFamilySelectedIndex = 0;
double textSize = 20;
double textFromTopPosition = 0;

double textFromLeftPosition = 0;

List bottomNavigationIcons = [
  {'icon': Icons.image, 'name': 'Background'},
  {'icon': Icons.text_format, 'name': 'Text'},
  {'icon': Icons.share, 'name': 'Share'},
  {'icon': Icons.save, 'name': 'Save'},
];
