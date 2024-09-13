import 'package:diploy/common/commonAppBar.dart';
import 'package:diploy/features/shopingScreens/relatedProducts.dart';
import 'package:diploy/features/shopingScreens/reviews.dart';
import 'package:diploy/res/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ProductDetail extends StatefulWidget {
   final String name;
   final String image;
   final String price;
  const ProductDetail({Key? key, required this.name, required this.image, required this.price}) : super(key: key);
  static const routePath='/productdetails';

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late List<String> Discription = ["The Rubber Plant, native to Southeast Asia, features large, leathery leaves that have a beautiful shine. It can grow up to several feet in height, making it an excellent choice as a statement plant or a focal point in your indoor garden. The Rubber Plant is well-known for its ability to remove toxins from the air, promoting a healthier and fresher living environment."];
  late List<String> AirPurification=["The Rubber Plant removes harmful toxins from the air, promoting cleaner and fresher indoor air quality."];
  late List<String> AestheticallyPleasing=[" With its glossy leaves and vibrant green color, the Rubber Plant adds a touch of natural beauty to any indoor space,"];
  late List<String> LowMaintenance=["The Rubber Plant is relativelyeasy to care for and can thrive in various indoor environments"];
  late List<String> StressReduction=["he presence of plants, including the Rubber Plant, has been shown to reduce stress and create a calming atmosphere."];

  int _rating = 4;
  int selectedIndex = 0;
  void updateIndex(int index) {
    // Update the selected index
    selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: selectedIndex,
        onTap: (index) {
          updateIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),
              child: Container(
                  width: MediaQuery.of(context).size.width*.42,
                  height: MediaQuery.of(context).size.width*.12,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.01),
                      border: Border.all(
                          color: Colors.green
                      )
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.01 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add to Cart",style: GoogleFonts.lato(fontSize:18,color:Colors.green,fontWeight: FontWeight.w500  ),),
                        const Icon(Icons.shopping_cart_outlined,color: Colors.green,size: 20,),

                      ],
                    ),
                  )
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon:
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),
              child: InkWell(
                onTap: (){

                },
                child: Container(
                    width: MediaQuery.of(context).size.width*.42,
                    height: MediaQuery.of(context).size.width*.12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.01),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.02 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Buy Now",style: GoogleFonts.roboto(fontSize:18,color:Colors.white,fontWeight: FontWeight.w500  ),),
                          const Icon(Icons.double_arrow,color: Colors.white,size: 20,),

                        ],
                      ),
                    )
                ),
              ),),
            label: '',
          ),
        ],
      ),
      appBar:   CommonAppBar(
        title: "Product Details",
        action: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,size: 25,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_outlined,size: 25,)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(widget.image),
                Positioned(
                  right: 5,
                  bottom: 20,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius:MediaQuery.of(context).size.height*.026,
                      child: Image.asset(ShopAssets.wishlisticon,height:MediaQuery.of(context).size.height*.03,width: MediaQuery.of(context).size.height*.03 ,)),
                ),
                Positioned(
                  right: 5,
                  bottom: 80,
                  child:Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, // Adjust color to create depth effect
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // Shadow color
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset: const Offset(0, 1), // Adjust the shadow position
                        ),
                      ],
                    ),child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.favorite_border,size:  MediaQuery.of(context).size.height*.03,),
                  ),
                  ),
                )
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.015,top: MediaQuery.of(context).size.height*.02 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(widget.name,style: GoogleFonts.poppins(fontSize:21,fontWeight: FontWeight.w500),)),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015,vertical: MediaQuery.of(context).size.height*.007,),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Row(
                    children: [
                      Text(widget.price,style: GoogleFonts.poppins(fontSize:22,fontWeight: FontWeight.w600),),
                      Padding(
                        padding:  const EdgeInsets.only(left: 10),
                        child: Text("₹150",style: GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.w600,decoration: TextDecoration.lineThrough,color: Colors.black54),),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Free Delivery",style: GoogleFonts.poppins(fontSize:16,fontWeight: FontWeight.w400,color: Colors.black45),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015 ),
                child: Row(
                  children: [
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      child: Container(
                        width:MediaQuery.of(context).size.width*.12 ,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:Colors.green
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*.01 ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("3.8",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
                              const Icon(Icons.star,color: Colors.white,size: 15,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text(" (20,345)",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600),)
                  ],
                )),
            SizedBox(height: MediaQuery.of(context).size.height*.025,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Description:",style:GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600),)),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015,vertical: MediaQuery.of(context).size.height*.015 ),
              child: Text(Discription.join(""),style: GoogleFonts.poppins(fontSize:14,fontWeight: FontWeight.w400 ),),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Benefits of Rubber Plants:",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.015,),
            Padding(
                padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015 ),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Air Purification: ',
                        style:GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),
                      ),
                      TextSpan(text: AirPurification.join(""),style:GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
                    ],
                  ),
                )
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.015,),
            Padding(
                padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015,),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Aesthetically Pleasing ',
                        style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),
                      ),
                      TextSpan(text: AestheticallyPleasing.join(""),style:GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
                    ],
                  ),
                )
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.015,),
            Padding(
                padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015,),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Low Maintenances: ',
                        style:GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),
                      ),
                      TextSpan(text: LowMaintenance.join(""),style:GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
                    ],
                  ),
                )
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.015,),
            Padding(
                padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015,),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Stress Reduction: ',
                        style:GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),
                      ),
                      TextSpan(text: StressReduction.join(""),style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
                    ],
                  ),
                )
            ),

            Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.030),
              child: Container(
                height:MediaQuery.of(context).size.height*.002 ,
                width: MediaQuery.of(context).size.width*1 ,
                color: Colors.blueGrey.withOpacity(.3),
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Related Product",style: GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.w500,color: Colors.black),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.013,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015, ),
                  child:  Row(
                    children: [
                      for(int i=0;i<5;i++)
                        const RelatedProductList(name: "Fiddle leaf", price: "100", image: ShopAssets.fiddleleaf)
                    ],
                  )
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.030),
              child: Container(
                height:MediaQuery.of(context).size.height*.002 ,
                width: MediaQuery.of(context).size.width*1 ,
                color: Colors.blueGrey.withOpacity(.3),
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.015 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Customer Reviews",style: GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.w500,color: Colors.black),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015 ),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                child: Row(
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _rating = index + 1;
                        });
                      },
                      child: Padding(
                        padding:  const EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(
                          index < _rating ? Icons.star : Icons.star_border,
                          color: index<_rating ?const Color.fromRGBO(255, 215, 0, 1.0):Colors.black38,
                          size: 36.0,
                        ),
                      ),
                    );
                  }),
                ),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Based On 100 Reviews",style: GoogleFonts.poppins(fontSize:18),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.015,),
            for(int i=0;i<4;i++)
              const ReviewList(name: "Neha Singh", rating: "3.8", disc:"I loved it.....recieved exactly same product as show in the picture."),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.050 ),
              child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("View More",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold,color:const Color(0xFF1F588E)),)),
            ),

          ],
        ),
      ),
    );

  }
}
