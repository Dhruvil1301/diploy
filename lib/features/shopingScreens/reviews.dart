import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewList extends StatelessWidget {
  final String name;
  final String rating;
  final String disc;
  const ReviewList({Key? key, required this.name, required this.rating, required this.disc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
          children: [
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Row(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height*.042 ,
                          width: MediaQuery.of(context).size.width*.09 ,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.030),
                              border: Border.all(
                                  width: 2,
                                  color: Colors.black
                              )
                          ),
                          child: Icon(Icons.person_outline_outlined,size: MediaQuery.of(context).size.height*.030,)),
                      SizedBox(width: MediaQuery.of(context).size.width*.02 ,),
                      Text(name,style: GoogleFonts.poppins(fontSize:18, ),),
                      SizedBox(width: MediaQuery.of(context).size.width*.042 ,),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015 ),
                          child: Container(
                            alignment: AlignmentDirectional.topStart,
                            child: Container(

                              height:  MediaQuery.of(context).size.height*.023,
                              width:  MediaQuery.of(context).size.width*.12,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.01),
                                  color: const Color(0xFF268E15)
                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.007 ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("3.8",style: GoogleFonts.poppins(color: Colors.white,fontSize: 16),),
                                    Icon(Icons.star,color: Colors.white,size: 12 ,)
                                  ],
                                ),
                              ),
                            ),
                          )),

                    ],
                  )
              ),




            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
                padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.05 ),
                child: Text(disc,style: GoogleFonts.poppins(fontSize:16,fontWeight: FontWeight.w300),)
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.015,),
          ]);
  }
}
