import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/allprovider.dart';
import 'details_screen.dart';
class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favourite"),centerTitle: true),
      body:   SingleChildScrollView(
        child: Column(
          children: [
            buildFavouriteConsumer1(),
            buildFavouriteConsumer2(),
          ],
        ),
      ),
    );
  }

  Consumer<AllElectroniProductProvider> buildFavouriteConsumer2() {
    return Consumer<AllElectroniProductProvider>(builder: (context, value, child) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: value.favProducts.length,
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
                      subtitle: Row(children: [
                        Text("${value.allproduct[index].price} \$ ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 18)),
                        Text("  ${value.allproduct[index].rating?.rate}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),Icon(Icons.star,color: Colors.orange,)
                      ],),
                      trailing: Container(
                        height: 35,width: 35,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.teal
                        ),
                        child: Center(child: InkWell(
                            onTap: () {

                              if(value.favProducts.contains(index)){
                                value.removeValue(index);
                              }else{
                                value.addValue(index);
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

  Consumer<AllProductProvider> buildFavouriteConsumer1() {
    return Consumer<AllProductProvider>(builder: (context, value, child) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: value.favProducts.length,
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
                      subtitle: Row(children: [
                        Text("${value.allproduct[index].price} \$ ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 18)),
                        Text("  ${value.allproduct[index].rating?.rate}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),Icon(Icons.star,color: Colors.orange,)
                      ],),
                      trailing: Container(
                        height: 35,width: 35,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.teal
                        ),
                        child: Center(child: InkWell(
                            onTap: () {

                              if(value.favProducts.contains(index)){
                                value.removeValue(index);
                              }else{
                                value.addValue(index);
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
