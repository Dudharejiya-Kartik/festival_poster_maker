import 'dart:io';
import 'dart:typed_data';

import 'package:festival_poster_maker/components/textEditComponents.dart';
import 'package:festival_poster_maker/utils/colorsList.dart';
import 'package:festival_poster_maker/utils/fontFamilyList.dart';
import 'package:festival_poster_maker/utils/saveAndShare.dart';
import 'package:festival_poster_maker/utils/templateList.dart';
import 'package:festival_poster_maker/utils/variables_Lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

import '../../utils/widgets.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

GlobalKey finalImage = GlobalKey();

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    int index1 = ModalRoute.of(context)?.settings.arguments as int;
    temp = index1;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: editScreenAppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RepaintBoundary(
                key: finalImage,
                child: Container(
                  height: 400,
                  // margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              templates[index1][templateImageIndex])),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            offset: const Offset(0, 5),
                            blurRadius: 20)
                      ]),
                  child: Stack(
                    children: [
                      Positioned(
                          top: textFromTopPosition,
                          left: textFromLeftPosition,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                txtAddText.text,
                                style: fontFamily[fontFamilySelectedIndex]
                                        ['font'](
                                    fontSize: textSize,
                                    fontStyle:
                                        (isItalic) ? FontStyle.italic : null,
                                    fontWeight:
                                        (isBold) ? FontWeight.bold : null,
                                    color: txtColor[txtColorIndex]),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            (isEditingStarted) //when any navigation button is clicked == true
                ? AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 220,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(color: Color(0xff1D2539)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    (isEditingStarted && !isTextEditingStarted)
                                        ? 'Choose Background'
                                        : 'Edit Your Text Here',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isEditingStarted = false;
                                        isAlignmentSelected = false;
                                        isTextEditingStarted = false;
                                        isFontColorSelected = false;
                                        isFontFamilySelected = false;
                                      });
                                    },
                                    icon: const Icon(Icons.close),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              (isEditingStarted &&
                                      !isTextEditingStarted) // index 0 of bottom navigation is true
                                  ? Container(
                                      margin: const EdgeInsets.only(top: 15),
                                      height: 90,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: templates[index1].length,
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                          onTap: () {
                                            setState(() {
                                              templateImageIndex = index;
                                            });
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: 80,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        templates[index1]
                                                            [index]))),
                                          ),
                                        ),
                                      ),
                                    )
                                  : (isTextEditingStarted &&
                                          !isAlignmentSelected &&
                                          !isFontFamilySelected &&
                                          !isFontColorSelected) // Text Edit buttons
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          AlertDialog(
                                                        title: Text(
                                                          "Add Text",
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color: Colors.black,
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        content: TextField(
                                                          controller:
                                                              txtAddText,
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                              "Cancel",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: const Color(
                                                                    0xff1D2539),
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                              "Add",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: const Color(
                                                                    0xff1D2539),
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  child: textEditButtons(
                                                      buttonType: 'Add Text'),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      isFontFamilySelected =
                                                          true;
                                                    });
                                                  },
                                                  child: textEditButtons(
                                                      buttonType:
                                                          'Font Family'),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      isAlignmentSelected =
                                                          true;
                                                    });
                                                  },
                                                  child: textEditButtons(
                                                      buttonType: 'Alignment'),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      isFontColorSelected =
                                                          true;
                                                    });
                                                  },
                                                  child: textEditButtons(
                                                      buttonType: 'Font Color'),
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      : (isAlignmentSelected) // alignment
                                          ? Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "Alignment",
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color: Colors.grey,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    if (textFromTopPosition >=
                                                                        0) {
                                                                      textFromTopPosition =
                                                                          textFromTopPosition -
                                                                              10;
                                                                    }
                                                                  });
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .keyboard_arrow_up,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                            IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    if (textFromTopPosition <=
                                                                        350) {
                                                                      textFromTopPosition =
                                                                          textFromTopPosition +
                                                                              10;
                                                                    }
                                                                  });
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                            IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    if (textFromLeftPosition >=
                                                                        20) {
                                                                      textFromLeftPosition =
                                                                          textFromLeftPosition -
                                                                              10;
                                                                    }
                                                                    print(
                                                                        textFromLeftPosition);
                                                                  });
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .keyboard_arrow_left,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                            IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    if (textFromLeftPosition <=
                                                                        260) {
                                                                      textFromLeftPosition =
                                                                          textFromLeftPosition +
                                                                              10;
                                                                    }
                                                                  });
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .keyboard_arrow_right,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "Font Size",
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color: Colors.grey,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    if (textSize <
                                                                        50) {
                                                                      textSize =
                                                                          textSize +
                                                                              2;
                                                                    }
                                                                  });
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .text_increase,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                            IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    if (textSize >
                                                                        20) {
                                                                      textSize =
                                                                          textSize -
                                                                              2;
                                                                    }
                                                                  });
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .text_decrease,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            isBold = !isBold;
                                                          });
                                                        },
                                                        icon: const Icon(
                                                          Icons.format_bold,
                                                          color: Colors.white,
                                                        )),
                                                    IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            isItalic =
                                                                !isItalic;
                                                          });
                                                        },
                                                        icon: const Icon(
                                                          Icons.format_italic,
                                                          color: Colors.white,
                                                        )),
                                                  ],
                                                )
                                              ],
                                            )
                                          : (isFontColorSelected)
                                              ? SizedBox(
                                                  height: 162,
                                                  child: GridView.builder(
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount:
                                                                  4),
                                                      itemCount:
                                                          txtColor.length,
                                                      itemBuilder: (context,
                                                              index) =>
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                txtColorIndex =
                                                                    index;
                                                              });
                                                            },
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .all(10),
                                                              height: 60,
                                                              width: 70,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                  color: txtColor[
                                                                      index]),
                                                            ),
                                                          )),
                                                )
                                              : (isFontFamilySelected)
                                                  ? Expanded(
                                                      child: Stack(
                                                        children: [
                                                          Center(
                                                            child: Container(
                                                              height: 60,
                                                              width: 300,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.2)),
                                                            ),
                                                          ),
                                                          ListWheelScrollView
                                                              .useDelegate(
                                                                  physics:
                                                                      FixedExtentScrollPhysics(),
                                                                  itemExtent:
                                                                      55,
                                                                  onSelectedItemChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      fontFamilySelectedIndex =
                                                                          value;
                                                                    });
                                                                  },
                                                                  childDelegate:
                                                                      ListWheelChildBuilderDelegate(
                                                                    childCount:
                                                                        fontFamily
                                                                            .length,
                                                                    builder: (context,
                                                                            index) =>
                                                                        Text(
                                                                      fontFamily[
                                                                              index]
                                                                          [
                                                                          'name'],
                                                                      style: fontFamily[index]
                                                                              [
                                                                              'font'](
                                                                          fontSize:
                                                                              30.0,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ))
                                                        ],
                                                      ),
                                                    )
                                                  : SizedBox()
                            ],
                          ),
                        )))
                : const SizedBox(),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }

  Container bottomNavigation() {
    return Container(
        height: 75,
        color: const Color(0xff1D2539),
        child: ListView.builder(
          itemCount: bottomNavigationIcons.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  IconButton(
                      onPressed: () async {
                        isEditingStarted = true;
                        switch (index) {
                          case 1:
                            isTextEditingStarted = true;
                            setState(() {});
                            break;
                          case 0:
                            isTextEditingStarted = false;
                            setState(() {});
                            break;
                          case 2:
                            Uint8List imgData;
                            RenderRepaintBoundary boundary =
                                finalImage.currentContext!.findRenderObject()
                                    as RenderRepaintBoundary;

                            ui.Image image = await boundary.toImage();

                            ByteData? byteData = await image.toByteData(
                                format: ui.ImageByteFormat.png);
                            imgData = byteData!.buffer.asUint8List();

                            if (imgData != null) {
                              final directory =
                                  await getApplicationDocumentsDirectory();

                              File fileImage = await File(
                                      '${directory.path}/${homeFestivalContainerLists[temp]['festivalName']}.png')
                                  .create();
                              fileImage.writeAsBytesSync(imgData);
                              await ShareExtend.share(
                                  fileImage.path, 'festival');
                            }
                            break;
                          case 3:
                            Uint8List imgData;
                            RenderRepaintBoundary boundary =
                                finalImage.currentContext!.findRenderObject()
                                    as RenderRepaintBoundary;

                            ui.Image image = await boundary.toImage();

                            ByteData? byteData = await image.toByteData(
                                format: ui.ImageByteFormat.png);
                            imgData = byteData!.buffer.asUint8List();
                            await ImageGallerySaver.saveImage(imgData,
                                name: homeFestivalContainerLists[temp]
                                    ['festivalName'],
                                quality: 100);
                            isEditingStarted = false;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Saved to Gallery"),
                              duration: Duration(seconds: 2),
                              margin: EdgeInsets.all(40),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Color(0xff1D2539),
                            ));
                            setState(() {});
                        }
                      },
                      icon: Icon(
                        bottomNavigationIcons[index]['icon'],
                        size: 35,
                        color: Colors.white,
                      )),
                  Text(
                    bottomNavigationIcons[index]['name'],
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )),
        ));
  }

  AppBar editScreenAppBar() {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: const Color(0xff1D2539),
      title: Text(
        "Edit",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: IconButton(
          onPressed: () {
            templateImageIndex = 0;
            isEditingStarted = false;

            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh_rounded, color: Colors.white)),
      ],
    );
  }
}

int temp = 0;
