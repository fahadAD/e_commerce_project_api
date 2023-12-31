import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wemax_project/Bottom_nav_Screen/details_screen.dart';
import 'package:wemax_project/Model/all_model.dart';
import 'package:wemax_project/Repo/all_repo.dart';
class SearchScreens extends StatefulWidget {
  const SearchScreens({super.key});

  @override
  State<SearchScreens> createState() => _SearchScreensState();
}

class _SearchScreensState extends State<SearchScreens> {
  TextEditingController search_controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    SerachRepo search_repo=SerachRepo();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle:true,title: Text("Search",style: TextStyle(color: Colors.white)),),
      body: SingleChildScrollView(
        child: Column(
          children: [

            buildTextFormCenter(context),
            SizedBox(height: 30,),
            // FutureBuilder(future: search_repo.searchAllProductRepo(),
            //   builder: (context, snapshot) {
            //   if(snapshot.hasData){
            //       return ListView.builder(
            //       itemCount: snapshot.data!.length,
            //       shrinkWrap: true,
            //       primary: false,
            //       itemBuilder: (BuildContext context, int index) {
            //          String? name=snapshot.data![index].title;
            //         if(search_controller.text.isEmpty){
            //           return Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 9.0),
            //             child: InkWell(
            //               onTap: () {
            //                 Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(products_data: snapshot.data![index]),));
            //               },
            //               child: Card(
            //                 color: Colors.teal.shade50,
            //                 child: Padding(
            //                   padding: const EdgeInsets.symmetric(vertical: 1.0),
            //                   child: ListTile(
            //                     isThreeLine: true,
            //                     leading: ClipRRect(
            //                       borderRadius: BorderRadius.circular(10),
            //
            //                       child: Image(
            //                           width: 70,
            //                           height: 70,
            //                           image: NetworkImage("${snapshot.data![index].image}"),fit: BoxFit.fill),
            //                     ),
            //
            //                     title: Text("${snapshot.data![index].title}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
            //                     subtitle: Text("${snapshot.data![index].category}\$",style: TextStyle( color: Colors.black)),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           );
            //         }else if(name!.toLowerCase().contains(search_controller.text.toLowerCase())){
            //           return Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 9.0),
            //             child: InkWell(
            //               onTap: () {
            //                 Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(products_data: snapshot.data![index]),));
            //               },
            //               child: Card(
            //                 color: Colors.teal.shade50,
            //                 child: Padding(
            //                   padding: const EdgeInsets.symmetric(vertical: 1.0),
            //                   child: ListTile(
            //                     isThreeLine: true,
            //                     leading: ClipRRect(
            //                       borderRadius: BorderRadius.circular(10),
            //
            //                       child: Image(
            //                           width: 70,
            //                           height: 70,
            //                           image: NetworkImage("${snapshot.data![index].image}"),fit: BoxFit.fill),
            //                     ),
            //
            //                     title: Text("${snapshot.data![index].title}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
            //                     subtitle: Text("${snapshot.data![index].category}\$",style: TextStyle( color: Colors.black)),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           );
            //         }else{
            //           return Container();
            //         }
            //       },
            //
            //     );
            //   }else{
            //     return ListView.builder(
            //       primary: false,
            //       shrinkWrap: true,
            //       itemCount: 21,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Shimmer.fromColors(
            //           baseColor: Colors.grey.shade700,
            //           highlightColor: Colors.grey.shade100,
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 1.0),
            //             child: ListTile(
            //               leading: Container(
            //                   height: 50,width: 70,color: Colors.white
            //               ),
            //
            //               title: Container(height: 15,width: 90,color: Colors.white) ,
            //               subtitle: Container(height: 10,width: 90,color: Colors.white) ,
            //             ),
            //           ),
            //         );
            //
            //       },
            //
            //     );
            //   }
            // },)
            buildSearchFutureBuilder(search_repo),

          ],
        ),
      ),
    );
  }

  Center buildTextFormCenter(BuildContext context) {
    return Center(
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.1,
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {

                    });
                  },
                  controller: search_controller,
                  decoration: InputDecoration(
                    hintText: "Search Mans,Women,Electronic ect..",
                    hintStyle: const TextStyle(color: Colors.blueGrey),
                    enabledBorder: InputBorder.none,
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
          );
  }

  FutureBuilder<List<AllModel>> buildSearchFutureBuilder(SerachRepo search_repo) {
    return FutureBuilder(future: search_repo.searchAllProductRepo(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (BuildContext context, int index) {
                    String? name=snapshot.data![index].title;
                    if(search_controller.text.isEmpty){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(products_data: snapshot.data![index]),));
                          },
                          child: Card(
                            color: Colors.teal.shade50,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 1.0),
                              child: ListTile(
                                isThreeLine: true,
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),

                                  child: Image(
                                      width: 70,
                                      height: 70,
                                      image: NetworkImage("${snapshot.data![index].image}"),fit: BoxFit.fill),
                                ),

                                title: Text("${snapshot.data![index].title}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                                subtitle: Text("${snapshot.data![index].category}\$",style: TextStyle( color: Colors.black)),
                              ),
                            ),
                          ),
                        ),
                      );
                    }else if(name!.toLowerCase().contains(search_controller.text.toLowerCase())){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(products_data: snapshot.data![index]),));
                          },
                          child: Card(
                            color: Colors.teal.shade50,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 1.0),
                              child: ListTile(
                                isThreeLine: true,
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),

                                  child: Image(
                                      width: 70,
                                      height: 70,
                                      image: NetworkImage("${snapshot.data![index].image}"),fit: BoxFit.fill),
                                ),

                                title: Text("${snapshot.data![index].title}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                                subtitle: Text("${snapshot.data![index].category}\$",style: TextStyle( color: Colors.black)),
                              ),
                            ),
                          ),
                        ),
                      );
                    }else{
                      return Container();
                    }
                  },

                );
              }else{
                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 21,
                  itemBuilder: (BuildContext context, int index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0),
                        child: ListTile(
                          leading: Container(
                              height: 50,width: 70,color: Colors.white
                          ),

                          title: Container(height: 15,width: 90,color: Colors.white) ,
                          subtitle: Container(height: 10,width: 90,color: Colors.white) ,
                        ),
                      ),
                    );

                  },

                );
              }
            },);
  }
}
