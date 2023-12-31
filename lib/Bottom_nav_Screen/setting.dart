import 'package:flutter/material.dart';

import '../Settings/add_product.dart';
import '../Settings/delete_product.dart';
import '../Settings/update_product.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(centerTitle:true,title: const Text("Settings")),
      body:   Column(
        children: [

          InkWell(
            onTap:(){
             Navigator.push(context, MaterialPageRoute(builder: (context) => const AddProductScreen(),)) ;
    },
            child: const ListTile(
                    leading: Icon(Icons.add_box),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text("Add new product",style: TextStyle(color: Colors.black)),

                  ),
          ),
          const SizedBox(height: 20,),
          InkWell(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateProductScreen(),)) ;
            },
            child: const ListTile(
              leading: Icon(Icons.browser_updated_rounded),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text("Update Product",style: TextStyle(color: Colors.black)),

            ),
          ),
          const SizedBox(height: 20,),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DeleteProductScreen(),)) ;

              },
              child: const ListTile(
              leading: Icon(Icons.delete),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text("Delete Product",style: TextStyle(color: Colors.black)),

                        ),
            ),
          const SizedBox(height: 20,),

        ],
      ),

    );
  }
}
