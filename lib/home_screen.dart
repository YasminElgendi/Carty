import 'package:flutter/material.dart';

class ShoppingHomeScreen extends StatefulWidget {
  // const ShoppingHomeScreen({super.key, required String title});

  @override
  State<ShoppingHomeScreen> createState() => _ShoppingHomeScreenState();
}

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  final Set<String> cart = {};
  int _activeIndex = -1; // for product animation
  int _activeOfferIndex = -1; // for hot offer animation


   // Featured product images 
    final List<String> featuredProductsImages = [
    'assets/images/featured1.jpeg',
    'assets/images/featured2.jpeg',
    'assets/images/featured3.jpeg',
  ];

  // Grid products
  final List<Map<String, String>> productsImages = [
    {"name": "Hair Perfume", "image": "assets/images/product1.png"},
    {"name": "Pouch", "image": "assets/images/product2.png"},
    {"name": "Skin Serum", "image": "assets/images/product3.png"},
    {"name": "Skin Jelly", "image": "assets/images/product4.png"},
    {"name": "Eye Cream", "image": "assets/images/product5.png"},
    {"name": "Hair Mist", "image": "assets/images/product6.png"},

  ];
  
  final List<String> offerImages = [
    "assets/images/offer1.png",
    "assets/images/offer2.png",
    "assets/images/offer3.png",
    "assets/images/offer4.png",
    "assets/images/offer5.png",
  ];

  //Hot Offers
  final List<Map<String, String>> hotOffers = [
    {
     "title": "50% Off your first Purchase",
      "subtitle": "Limited time offer for all new users",
      "label": "50% OFF"
    },
    {
      "title": "Free Shipping Weekend",
      "subtitle": "No delivery charges on orders above \$50",
      "label": "FREESHIP"
    },
    {
      "title": "Buy 2 Get 1 Free",
      "subtitle": "On selected brands",
      "label": "B2G1"
    },
    {
      "title": "Student Discount",
      "subtitle": "Extra 10% off with valid student ID",
      "label": "10% OFF"
    },
    {
      "title": "Bundle Deals",
      "subtitle": "Save more when you buy complete sets",
      "label": "BUNDLE"
    },
  ];

  //added to cart function shows snack bar
  void _addedToCart(String productTitle) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("$productTitle added to your cart")),
    );
  }
  void _removedFromCart(String productTitle) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("$productTitle removed from your cart")),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Our Products"),
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            //////////////Featured Products Section//////////////
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Featured Products",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 114, 93, 149)
                    ),
              ),
            ),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: featuredProductsImages.length,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(featuredProductsImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Dots indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                featuredProductsImages.length,
                (index) => Container(
                  margin: EdgeInsets.all(4),
                  width: _currentPage == index ? 12 : 8,
                  height: _currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Color.fromARGB(255, 143, 118, 183)
                        : Colors.grey,
                  ),
                ),
              ),
            ),

            //////////////Products Grid View //////////////
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "All Products",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 114, 93, 149)
                    ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: productsImages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final product = productsImages[index];
                final productName = product["name"] ?? "Unnamed";
                final inCart = cart.contains(productName);

                return GestureDetector(
                  onTapDown: (_) {
                    setState(() => _activeIndex = index);
                  },
                  onTapUp: (_) {
                    setState(() => _activeIndex = -1);
                  },
                  onTapCancel: () {
                    setState(() => _activeIndex = -1);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    transform: _activeIndex == index
                        ? (Matrix4.identity()..scale(1.05))
                        : Matrix4.identity(),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: _activeIndex == index
                          ? [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 12,
                                offset: Offset(0, 6),
                              )
                            ]
                          : [],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              product["image"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  productName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  inCart
                                      ? Icons.shopping_cart
                                      : Icons.add_shopping_cart,
                                  color:
                                      inCart ? Colors.green : Colors.grey[700],
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (inCart) {
                                      cart.remove(productName);
                                      _removedFromCart(productName);
                                    } else {
                                      cart.add(productName);
                                      _addedToCart(productName);
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 20,),

            ////////////// Hot Offers //////////////
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "🔥 Hot Offers 🔥",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 114, 93, 149),
                    ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hotOffers.length,
              itemBuilder: (context, index) {
                final offer = hotOffers[index];
                final offerImage = offerImages[index];

                return GestureDetector(
                  onTapDown: (_) => setState(() => _activeOfferIndex = index),
                  onTapUp: (_) => setState(() => _activeOfferIndex = -1),
                  onTapCancel: () => setState(() => _activeOfferIndex = -1),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    transform: _activeOfferIndex == index
                        ? (Matrix4.identity()..scale(1.03))
                        : Matrix4.identity(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: _activeOfferIndex == index
                          ? [
                              const BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              )
                            ]
                          : [],
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            // Offer Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                offerImage,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Texts
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    offer["title"]!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    offer["subtitle"]!,
                                    style:
                                        TextStyle(color: Colors.grey[700], fontSize: 13),
                                  ),
                                ],
                              ),
                            ),

                            // Label
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 143, 118, 183),
                                    Color.fromARGB(255, 240, 141, 174)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                offer["label"]!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
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


          ]
        ),
        
     
      ),
      
    );
  }

  
}
