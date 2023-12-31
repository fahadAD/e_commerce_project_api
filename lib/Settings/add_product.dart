import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wemax_project/Repo/add_repo.dart';

import '../bottom_nav_bar.dart';
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  Future<void> getImage() async {
    image=await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  Future<void> getCamera() async {
    image=await _picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

TextEditingController name_controller=TextEditingController();
TextEditingController price_controller=TextEditingController();
TextEditingController description_controller=TextEditingController();
TextEditingController catagory_controller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Product Screen"),
      ),
  bottomNavigationBar: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 13.0),
    child: InkWell(
      onTap: () async {
        await addProduct(
          image: File(image!.path),
            title: name_controller.text,
            price: int.parse(price_controller.text),
            description: description_controller.text,
            category: catagory_controller.text,
        );

        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen(),));
        
      },
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
              color: Colors.teal,
        ),
        child: Center(child: Text("Upload",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
      ),
    ),
  ),
  body: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
       children: [

         Center(
           child: Stack(
             alignment: Alignment.bottomRight,
             children: [

               image==null?const CircleAvatar(
                 radius: 70,
                 backgroundColor: Colors.white,
                 backgroundImage:
                 NetworkImage("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80"),

               )
                   :
               CircleAvatar(
                 radius: 70,
                 backgroundColor: Colors.white,
                 backgroundImage:
                  FileImage(File(image!.path),),

               ),
               InkWell(
                 onTap: () {
                 setState(() {
                   showDialog(context: context, builder: (context) {
                     return AlertDialog(
                       title: Text("Choose One Image"),
                       content: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           InkWell(
                               onTap:(){
                                 setState(() {
                                   getCamera();
                                 });
                               }, child: Icon(Icons.camera_alt,size: 40,)),
                           InkWell(
                               onTap:() async {
                                    getImage();
                               }, child: Icon(Icons.image,size: 40,)),
                         ],
                       ),
                       actions: [

                       ],
                     );

                   },);
                 });
                 },
                 child: Container(
                   height: 40,
                   width: 40,
                   decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.black,
                       border: Border.all(color: Colors.yellow,width: 2)
                   ),
                   child: Icon(Icons.edit,color: Colors.white),
                 ),
               )
             ],
           ),
         ),
         const SizedBox(height: 10,),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 15.0),
           child: TextFormField(
             controller: name_controller,
             decoration: InputDecoration(
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
               hintText: "Name",
             ),
           ),
         ),
         const SizedBox(height: 10,),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 15.0),
           child: TextFormField(
             controller: price_controller,
             decoration: InputDecoration(
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
               hintText: "Price",
             ),
           ),
         ),
         const SizedBox(height: 10,),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 15.0),
           child: TextFormField(
             controller: description_controller,
             decoration: InputDecoration(
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
               hintText: "Description",
             ),
           ),
         ),
         const SizedBox(height: 10,),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 15.0),
           child: TextFormField(
             controller: catagory_controller,
             decoration: InputDecoration(
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
               hintText: "Category",
             ),
           ),
         ),

      ],
    ),
  ),
    );
  }
}
