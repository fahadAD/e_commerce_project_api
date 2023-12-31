import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:wemax_project/Authentication/auth_repo.dart';
import 'package:wemax_project/Authentication/signup.dart';

import '../Bottom_nav_Screen/home.dart';
import '../bottom_nav_bar.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;
  final  GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  TextEditingController signin_emailController=TextEditingController();
  TextEditingController signin_passwordController=TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    signin_emailController.dispose();
    signin_passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:    Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Don't have an Account then ? "),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
                },
                child: const Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue))),

          ],
        ),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Lottie.asset("assets/signinani.json",
                  height: 300,
                  fit: BoxFit.fitWidth
              ),

              Padding(
                padding: const EdgeInsets.only(right: 15.0,left: 15.0,top: 10,),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Card(
                    color: Colors.white70,
                    child: Center(
                      child: TextFormField(
                        controller: signin_emailController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Required A Email";
                          }else{
                            return null;
                          }
                        },
                        decoration:   InputDecoration(
                            hintText: "Email Address",
                            hintStyle: const TextStyle(color: Colors.blueGrey),
                            enabledBorder: InputBorder.none,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                            prefixIcon: const Icon(Icons.alternate_email,color: Colors.black,)
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0,left: 15.0,top: 10,),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Card(
                    color: Colors.white70,
                    child: Center(
                      child: TextFormField(
                        obscureText: _obscureText,
                        controller: signin_passwordController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Required A Password";
                          }else{
                            return null;
                          }
                        },
                        decoration:   InputDecoration(
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.blueGrey),
                          enabledBorder: InputBorder.none,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                          prefixIcon: const Icon(Icons.lock,color: Colors.black,),
                          suffixIcon: _obscureText == false
                              ? IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = true;
                                });
                              },
                              icon: const Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                              ))
                              : IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = false;
                                });
                              },
                              icon: const Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () async {
                  if(_formkey.currentState!.validate()){
                    if(signin_emailController.text.contains("@")&&signin_emailController.text.contains(".com")){
                      bool isSignInDone =await SignInRepo(
                          passwords: signin_passwordController.text,
                          emails: signin_emailController.text);
                      if(isSignInDone){
                        EasyLoading.showSuccess("Sign In Done");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen(),));
                      }else{
                        return EasyLoading.showError("Error");
                      }
                    }else{
                      EasyLoading.showError("Enter a valid email ( @, .com)");
                    }
                  }
                  signin_passwordController.clear();
                  signin_passwordController.clear();
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Center(child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 20))),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
