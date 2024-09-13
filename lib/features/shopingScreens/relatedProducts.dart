
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class RelatedProductList extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  const RelatedProductList({Key? key, required this.name, required this.price, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right:MediaQuery.of(context).size.height*.020  ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image,height: MediaQuery.of(context).size.height*.15,width: MediaQuery.of(context).size.width*.3,),
          SizedBox(height: MediaQuery.of(context).size.height*.013,),
          Container(
              alignment: AlignmentDirectional.topStart,
              child: Text(name,style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 16),)),

          Container(
              alignment:AlignmentDirectional.topStart,
              child: Text("₹${price}",style: GoogleFonts.poppins(fontSize: 12),))
        ],
      ),
    );
  }
}