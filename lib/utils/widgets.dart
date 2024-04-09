import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container homeContainers(
    {required String festivalName,
    required String subtitle,
    required String festivalImage,
    required Color color}) {
  return Container(
    margin: EdgeInsets.all(15),
    height: 100,
    width: double.maxFinite,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colors.black.withOpacity(0.5),
          offset: Offset(0, 7),
          blurRadius: 20)
    ], color: color, borderRadius: BorderRadius.circular(15)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                festivalName,
                overflow: TextOverflow.visible,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 200,
                height: 30,
                child: Text(
                  subtitle,
                  overflow: TextOverflow.visible,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 30),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        festivalImage,
                      ))),
            )
          ],
        ),
      ],
    ),
  );
}

Container bgContainerAndAppbar() {
  return Container(
    height: 150,
    alignment: Alignment.topCenter,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Color(0xff1D2539),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(180, 150),
            bottomLeft: Radius.elliptical(180, 150))),
  );
}

Container gridViewContainer({
  required Color color,
  required String festivalImage,
  required String festivalName,
}) {
  return Container(
      margin: EdgeInsets.all(12),
      height: 100,
      width: double.maxFinite,
      alignment: Alignment.center,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: Offset(0, 6),
            blurRadius: 15)
      ], color: color, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          festivalImage,
                        ))),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 160,
                child: Text(
                  textAlign: TextAlign.center,
                  festivalName,
                  overflow: TextOverflow.visible,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ));
}
