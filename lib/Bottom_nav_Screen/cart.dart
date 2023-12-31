import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../Provider/allprovider.dart';
import 'details_screen.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    final allpro=Provider.of<AllProductProvider>(context,listen: false);
    final allelepro=Provider.of<AllElectroniProductProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Add To Cart"),centerTitle: true),
      bottomNavigationBar: InkWell(
        onTap: () {

          setState(() {
            allpro.addtoCarts.clear();
            allelepro.addtoCarts.clear();
            EasyLoading.showSuccess("Product Purse Successful Done");
          });

        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0,left: 30,right: 30),
          child: Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(child: Text("Check Out",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20))),
          ),
        ),
      ),
      body:   SingleChildScrollView(
        child: Column(
          children: [
            buildCartProduct1Consumer(),
            buildCartProduct2Consumer(),

          ],
        ),
      ),
    );
  }

  Consumer<AllElectroniProductProvider> buildCartProduct2Consumer() {
    return Consumer<AllElectroniProductProvider>(builder: (context, value, child) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: value.addtoCarts.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:   const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6),
                  child:   Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black)
                    ),
                    child:  ListTile(
                      isThreeLine: true,
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(products_data: value.allproduct[index],),));

                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          backgroundImage: NetworkImage("${value.allproduct[index].image}"),

                        ),
                      ),
                      title: Text("${value.allproduct[index].title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                      subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("${value.allproduct[index].price} \$ ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 18)),

                  const Row(children: [
                    Icon(Icons.add_box,color: Colors.black),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("100",style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Icon(Icons.remove_circle_outlined,color: Colors.black),
                  ],)
                      ],),
                      trailing: Container(
                        height: 35,width: 35,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.teal
                        ),
                        child: Center(child: InkWell(
                            onTap: () {

                              if(value.addtoCarts.contains(index)){
                                value.removeCartValue(index);
                              }else{
                                value.addCartValue(index);
                              }
                            },
                            child: const Icon(Icons.delete,color: Colors.white))),
                      ),
                    ),
                  ),
                );
              },

            );
          },);
  }

  Consumer<AllProductProvider> buildCartProduct1Consumer() {
    return Consumer<AllProductProvider>(builder: (context, value, child) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: value.addtoCarts.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:   const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6),
                  child:   Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black)
                    ),
                    child:  ListTile(
                      isThreeLine: true,
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(products_data: value.allproduct[index],),));

                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          backgroundImage: NetworkImage("${value.allproduct[index].image}"),

                        ),
                      ),
                      title: Text("${value.allproduct[index].title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                      subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("${value.allproduct[index].price} \$ ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 18)),

                  const Row(children: [
                    Icon(Icons.add_box,color: Colors.black),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("100",style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Icon(Icons.remove_circle_outlined,color: Colors.black),
                  ],)
                      ],),
                      trailing: Container(
                        height: 35,width: 35,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.teal
                        ),
                        child: Center(child: InkWell(
                            onTap: () {

                              if(value.addtoCarts.contains(index)){
                                value.removeCartValue(index);
                              }else{
                                value.addCartValue(index);
                              }
                            },
                            child: const Icon(Icons.delete,color: Colors.white))),
                      ),
                    ),
                  ),
                );
              },

            );
          },);
  }
}