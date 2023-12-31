import 'package:flutter/material.dart';

import '../Model/all_model.dart';
class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.products_data});
  final AllModel products_data;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Details",style: TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor: Colors.blue.shade100,elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
          actions: [
            IconButton(
              icon: const Icon(Icons.share,color: Colors.black),
              tooltip: 'Share',
              onPressed: () {

              },
            ),
          ],
        ),
        body: buildDeailScreen(context),
      ),
    );
  }

  SingleChildScrollView buildDeailScreen(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height:200,
                width: MediaQuery.of(context).size.width*0.8,

                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.network("${widget.products_data.image}",
                    height:280,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin:  const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                width: MediaQuery.of(context).size.width*0.2,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black)
                ),
                child:    Padding(
                  padding:   const EdgeInsets.all(8.0),
                  child:   Row(
                    children: [
                      const SizedBox(width: 5,),
                      const Text("ID :",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 17)),
                      Text("${widget.products_data.id}",style: const TextStyle(color: Colors.black,fontSize: 17)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),

            Container(
              margin:  const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)
              ),
              child:   Padding(
                padding:   EdgeInsets.all(8.0),
                child:   RichText(
                  text:   TextSpan(
                    text: '',
                    style: const TextStyle(),
                    children:   <TextSpan>[
                      const TextSpan(text: "Name :", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18)),
                      TextSpan(text: ' ${widget.products_data.title}', style: TextStyle(color: Colors.black)),


                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 6,),
            Container(
              margin:  const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              width: MediaQuery.of(context).size.width*0.8,

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)
              ),
              child:   Padding(
                padding:   const EdgeInsets.all(8.0),
                child:   Row(
                  children: [
                    const SizedBox(width: 5,),
                    const Text("Sales Price :",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 17)),
                    Text(" ${widget.products_data.price} \$",style: const TextStyle(color: Colors.black,fontSize: 17)),
                    const Text("/per pic",style: TextStyle(color: Colors.black,fontSize: 17)),

                  ],
                ),
              ),
            ),
            SizedBox(height: 6,),
            Container(
              margin:  const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              width: MediaQuery.of(context).size.width*0.7,

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)
              ),
              child:   Padding(
                padding:   const EdgeInsets.all(8.0),
                child:   Row(
                  children: [
                    const SizedBox(width: 5,),
                    const Text("Category :",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 17)),
                    Text(" ${widget.products_data.category}",style: const TextStyle(color: Colors.black,fontSize: 17)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              margin:  const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              width: MediaQuery.of(context).size.width*0.5,

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)
              ),
              child:   Padding(
                padding:   const EdgeInsets.all(8.0),
                child:   Row(
                  children: [
                    const SizedBox(width: 5,),
                    const Text("Stocks :",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 17)),
                    Text(" ${widget.products_data.rating?.count}",style: const TextStyle(color: Colors.black,fontSize: 17)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width/3.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black)
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.star,color: Colors.orangeAccent,size: 30,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${widget.products_data.rating?.rate}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.teal),),
                            const Text('Reviews',style: TextStyle(color: Colors.blueGrey),)
                          ],
                        )
                      ],
                    )
                ),
                Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width/3.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black)
                    ),
                    child:  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.add_business,color: Colors.green,size: 30,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("100%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.teal),),
                            Text('Branded',style: TextStyle(color: Colors.blueGrey),)
                          ],
                        )
                      ],
                    )
                ),


              ],
            ),

            SizedBox(height: 10,),

            Container(
              margin:  const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)
              ),
              child:   Padding(
                padding:   EdgeInsets.all(8.0),
                child:   RichText(
                  text: TextSpan(
                    text: '',
                    style: TextStyle(),
                    children:   <TextSpan>[
                      const TextSpan(text: "Description :", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18)),
                      TextSpan(text: ' ${widget.products_data.description}', style: TextStyle(color: Colors.black)),


                    ],
                  ),
                ),
              ),
            ),





            SizedBox(height: 6,),
          ],
        ),
      );
  }
}
