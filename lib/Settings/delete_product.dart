import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wemax_project/Repo/add_repo.dart';
import 'package:wemax_project/Repo/delete_repo.dart';

import '../bottom_nav_bar.dart';
class DeleteProductScreen extends StatefulWidget {
  const DeleteProductScreen({super.key});

  @override
  State<DeleteProductScreen> createState() => _DeleteProductScreenState();
}

class _DeleteProductScreenState extends State<DeleteProductScreen> {


  TextEditingController id_controller=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Product Screen"),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

         Center(child: Text("Do you want to delete product\n then give a id number\n to field and press button ",style: TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: id_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                  hintText: "ID Number",
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 13.0),
              child: InkWell(
                onTap: () async {
              await updateProduct(id: int.parse(id_controller.text));

                  // Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen(),));

                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    color: Colors.teal,
                  ),
                  child: Center(child: Text("Delete",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
