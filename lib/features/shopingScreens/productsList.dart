import 'package:diploy/features/shopingScreens/cartProducts.dart';
import 'package:diploy/features/shopingScreens/productDetails.dart';
import 'package:diploy/res/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProduct {
  final String name;
  final String image;
  final String price;
  final String prevPrice;
  final VoidCallback? onTap;

  MyProduct({
    required this.name,
    required this.image,
    required this.price,
    required this.prevPrice,
    this.onTap,
  });
}

class Products extends StatefulWidget {
  static const routePath = '/products';

  Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final List<MyProduct> products = [
    MyProduct(price: "100", prevPrice: "150", name: "Peace Lily", image: ShopAssets.peace_lily),
    MyProduct(price: "120", prevPrice: "150", name: "Rubber Plant", image: ShopAssets.rubber_plant),
    MyProduct(price: "120", prevPrice: "150", name: "Fiddle leaf", image: ShopAssets.fiddleleaf),
    MyProduct(price: "80", prevPrice: "150", name: "Succulent", image: ShopAssets.succulent),
    MyProduct(price: "130", prevPrice: "150", name: "Pothos", image: ShopAssets.pothos),
    MyProduct(price: "100", prevPrice: "150", name: "Monstera", image: ShopAssets.monstera),
  ];

  List<MyProduct> filteredProducts = [];
  List<MyProduct> cart = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = products; // initially, show all products
  }

  void addToCart(MyProduct product) {
    setState(() {
      cart.add(product);
    });
  }

  void removeFromCart(MyProduct product) {
    setState(() {
      cart.remove(product);
    });
  }

  bool isInCart(MyProduct product) {
    return cart.contains(product);
  }

  // Filter the products based on the search term
  void filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProducts = products; // Show all if query is empty
      } else {
        filteredProducts = products
            .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products", style: GoogleFonts.lato()),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(cart: cart),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart_outlined, size: 25),
              ),
              if (cart.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      '${cart.length}',
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // Search TextField
              TextField(
                controller: searchController,
                onChanged: filterProducts, // Call filter method when text changes
                decoration: InputDecoration(
                  hintText: "Search product...",
                  hintStyle: GoogleFonts.lato(),
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Products Grid
              AnimationLimiter(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 300,
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 12,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    MyProduct product = filteredProducts[index];
                    bool inCart = isInCart(product);

                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      columnCount: 2,
                      child: SlideAnimation(
                        verticalOffset: 50,
                        child: FadeInAnimation(
                          child: SizedBox(
                            child: Stack(
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.432,
                                    height: MediaQuery.of(context).size.height * 0.4,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: MediaQuery.of(context).size.height * 0.018,
                                          left: MediaQuery.of(context).size.width * 0.062,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                product.image,
                                                height: MediaQuery.of(context).size.height * 0.18,
                                                width: MediaQuery.of(context).size.height * 0.14,
                                              ),
                                              Text(
                                                product.name,
                                                style: GoogleFonts.lato(
                                                    fontSize: MediaQuery.of(context).size.height * 0.025),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    product.price,
                                                    style: GoogleFonts.lato(
                                                      fontSize: MediaQuery.of(context).size.height * 0.024,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                                                  Text(
                                                    product.prevPrice,
                                                    style: GoogleFonts.lato(
                                                      fontSize: MediaQuery.of(context).size.height * 0.024,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black54,
                                                      decoration: TextDecoration.lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                                              InkWell(
                                                onTap: () {
                                                  inCart ? removeFromCart(product) : addToCart(product);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    border: Border.all(
                                                      color: inCart ? Colors.red : const Color(0xFF327E47),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: MediaQuery.of(context).size.width * 0.03,
                                                        vertical: 5),
                                                    child: Center(
                                                      child: Text(
                                                        inCart ? "Remove" : "Add to Cart",
                                                        style: GoogleFonts.lato(
                                                          color: inCart ? Colors.red : const Color(0xFF327E47),
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => ProductDetail(
                                                        name: product.name,
                                                        image: product.image,
                                                        price: product.price,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF327E47),
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: MediaQuery.of(context).size.width * 0.052,
                                                        vertical: 5),
                                                    child: Center(
                                                      child: Text(
                                                        "Buy Now",
                                                        style: GoogleFonts.lato(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
