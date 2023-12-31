import 'dart:async';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemax_project/Bottom_nav_Screen/details_screen.dart';

import '../Provider/allprovider.dart';
import '../searchscreen.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  Timer? timer;
  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    // TODO: implement initStat
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageIndex <= 5) {
        pageIndex++;
      } else {
        pageIndex = 0;
      }
      pageController.animateToPage(pageIndex,
          duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
    });
    Provider.of<AllProductProvider>(context,listen: false).getAllproduct();
    Provider.of<AllElectroniProductProvider>(context,listen: false).getAllproduct();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
    timer = null;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _demo = [
      Container(
        height: 170,
        width: MediaQuery.of(context).size.width / 1.2,

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/slider1.jpg",
            fit: BoxFit.fill,
            height: 165,
            width: MediaQuery.of(context).size.width / 1.2,
          ),
        ),
      ),
      Container(
        height: 170,
        width: MediaQuery.of(context).size.width / 1.2,

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/slider2.jpg",
            fit: BoxFit.fill,
            height: 165,
            width: MediaQuery.of(context).size.width / 1.2,
          ),
        ),
      ),
      Container(
        height: 170,
        width: MediaQuery.of(context).size.width / 1.2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/slider3.jpg",
            fit: BoxFit.fill,
            height: 165,
            width: MediaQuery.of(context).size.width / 1.2,
          ),
        ),
      ),
      Container(
        height: 170,
        width: MediaQuery.of(context).size.width / 1.2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/slidr4.jpg",
            fit: BoxFit.fill,
            height: 165,
            width: MediaQuery.of(context).size.width / 1.2,
          ),
        ),
      ),
      Container(
        height: 170,
        width: MediaQuery.of(context).size.width / 1.2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/slider5.jpg",
            fit: BoxFit.fill,
            height: 165,
            width: MediaQuery.of(context).size.width / 1.2,
          ),
        ),
      ),
    ];
    return   SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
children: [
  const SizedBox(
    height: 6,
  ),
  const ListTile(
    title: Text("Home",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20)),
    trailing: Padding(
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(

        foregroundColor: Colors.white,
        backgroundImage: NetworkImage(
          "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
        ),
        radius: 25,
      ),
    ),
  ),
  const ListTile(
    title: Text("MD Fahad",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black)),
  ),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 1.3,
        child: Card(
          elevation: 5,
          color: Colors.blue.shade50,
          child: TextFormField(
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreens(),));

            },
            decoration: InputDecoration(
              hintText: "Search Mans,Women,Electronic ect..",
              hintStyle: const TextStyle(color: Colors.blueGrey),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),

              ),
              prefixIcon: const Icon(
                Icons.search_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10)),
        child: InkWell(
            onTap: () {

            },
            child: const Icon(Icons.filter_alt_outlined, color: Colors.black)),
      )
    ],
  ),
  const SizedBox(
    height: 20,
  ),
  Padding(
    padding:   const EdgeInsets.symmetric(
      horizontal: 20.0,
    ),
    child: Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: PageView(
        controller: pageController,
        children: _demo,
        onPageChanged: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    ),
  ),
  const SizedBox(
    height: 10,
  ),
  CarouselIndicator(
    height: 4,
    color: Colors.orange,
    activeColor: Colors.indigoAccent,
    count: _demo.length,
    index: pageIndex,
  ),
  const SizedBox(
    height: 10,
  ),
  const ListTile(
    title: Text("All Products",
        style: TextStyle(color: Colors.black, fontSize: 20)),
    trailing: Icon(Icons.arrow_forward),
  ),
  Consumer<AllProductProvider>(builder: (context, value, child) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        itemCount: value.allproduct.length,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width / 1.8,
            decoration: BoxDecoration(
              // color: Colors.blue.withOpacity(0.1),
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(
                  child: ClipRRect(
                    borderRadius:   BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(products_data: value.allproduct[index]),));
                      },
                      child: Image.network(
                        "${value.allproduct[index].image}",
                        height: 150,
                        width: MediaQuery.of(context).size.width/2.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                  Padding(
                  padding: const EdgeInsets.only(top: 5, left: 5),
                  child:
                  Text("${value.allproduct[index].title}",
                      style: const TextStyle(
                        color: Colors.black,
                      )),
                ),
                  Padding(
                  padding: const EdgeInsets.only( left: 5,bottom: 3),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${value.allproduct[index].category}",
                          style: const TextStyle(
                            color: Colors.black,
                          )),
                      Padding(
                        padding:
                        const EdgeInsets.only(right: 3),
                        child: Text(
                          " ${value.allproduct[index].price} \$",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 18),
                        ),
                      ),

                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text("${value.allproduct[index].rating?.rate}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            )),
                        const Icon(Icons.star,color: Colors.amber,),
                        const SizedBox(width: 10,)
                      ],),
                    Padding(
                      padding:   const EdgeInsets.only(right: 5),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle,
                            color:Colors.blue),
                        child:  Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GestureDetector(
                              onTap: () async {
                                if(value.favProducts.contains(index)){
                                  value.removeValue(index);
                                }else{
                                  value.addValue(index);
                                }
                              },
                              child: value.favProducts.contains(index) ?
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                                  :
                              const Icon(
                                Icons.favorite,
                                color: Colors.white,)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:   const EdgeInsets.only(right: 5),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle,
                            color:Colors.teal),
                        child:  Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GestureDetector(
                              onTap: () async {
                                if(value.addtoCarts.contains(index)){
                                  value.removeCartValue(index);
                                }else{
                                  value.addCartValue(index);
                                }
                              },
                              child:value.addtoCarts.contains(index)
                                  ?
                              const Icon(
                                Icons.shopping_cart,
                                color: Colors.orangeAccent,)
                                  :
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          );
        },

      ),
    );
  },),

  const ListTile(
    title: Text("Popular Products",
        style: TextStyle(color: Colors.black, fontSize: 20)),
    trailing: Icon(Icons.arrow_forward),
  ),
  Consumer<AllElectroniProductProvider>(builder: (context, value, child) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        itemCount: value.allproduct.length,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width / 1.8,
            decoration: BoxDecoration(
              // color: Colors.blue.withOpacity(0.1),
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(
                  child: ClipRRect(
                    borderRadius:   BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(products_data: value.allproduct[index]),));
                      },
                      child: Image.network(
                        "${value.allproduct[index].image}",
                        height: 150,
                        width: MediaQuery.of(context).size.width/2.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 5),
                  child:
                  Text("${value.allproduct[index].title}",
                      style: const TextStyle(
                        color: Colors.black,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only( left: 5,bottom: 3),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${value.allproduct[index].category}",
                          style: const TextStyle(
                            color: Colors.black,
                          )),
                      Padding(
                        padding:
                        const EdgeInsets.only(right: 3),
                        child: Text(
                          " ${value.allproduct[index].price} \$",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 18),
                        ),
                      ),

                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text("${value.allproduct[index].rating?.rate}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            )),
                        const Icon(Icons.star,color: Colors.amber,),
                        const SizedBox(width: 10,)
                      ],),
                    Padding(
                      padding:   const EdgeInsets.only(right: 5),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle,
                            color:Colors.blue),
                        child:  Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GestureDetector(
                              onTap: () async {
                                if(value.favProducts.contains(index)){
                                  value.removeValue(index);
                                }else{
                                  value.addValue(index);
                                }
                              },
                              child: value.favProducts.contains(index) ?
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                                  :
                              const Icon(
                                Icons.favorite,
                                color: Colors.white,)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:   const EdgeInsets.only(right: 5),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle,
                            color:Colors.teal),
                        child:  Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GestureDetector(
                              onTap: () async {
                                if(value.addtoCarts.contains(index)){
                                  value.removeCartValue(index);
                                }else{
                                  value.addCartValue(index);
                                }
                              },
                              child:value.addtoCarts.contains(index)
                                  ?
                              const Icon(
                                Icons.shopping_cart,
                                color: Colors.orangeAccent,)
                                  :
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          );
        },

      ),
    );
  },),
],
          ),
        ),
      ),
    );
  }
}
