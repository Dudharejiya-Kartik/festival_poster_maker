import 'package:festival_poster_maker/utils/variables_Lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 250,
                alignment: Alignment.topCenter,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff1D2539),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.elliptical(220, 250),
                        bottomLeft: Radius.elliptical(220, 250))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.download, color: Colors.white)),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: 100),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Image.asset(
                        homeFestivalContainerLists[index]['image'],
                        height: 330,
                      )),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('editScreen', arguments: index);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 80,
              width: double.maxFinite,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.tealAccent.shade400,
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                'Edit Template',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 180.2,
                width: 390,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xff1D2539),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(270, 250),
                        topLeft: Radius.elliptical(270, 250))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "FestiVals",
                      style: GoogleFonts.greatVibes(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2),
                    ),
                    Text(
                      "Create Your Template With Us!!",
                      style: GoogleFonts.greatVibes(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
