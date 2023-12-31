import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:wemax_project/Authentication/signin.dart';
import 'package:wemax_project/Authentication/auth_repo.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>{
  bool _obscureText = true;
  final  GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  TextEditingController signup_emailController=TextEditingController();
  TextEditingController signup_phoneController=TextEditingController();
  TextEditingController signup_nameController=TextEditingController();
  TextEditingController signup_passwordController=TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    signup_phoneController.dispose();
    signup_emailController.dispose();
    signup_passwordController.dispose();
    signup_nameController.dispose();
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
       const Text("Have an Account then ? "),
       InkWell(
           onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
           },
           child: const Text("Sign In",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue))),

     ],
   ),
 ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Lottie.asset("assets/signupani.json",
              height: 300,
                fit: BoxFit.fitWidth
              ),
             Text("Welcome to Wemax",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),

              Padding(
                padding: const EdgeInsets.only(right: 15.0,left: 15.0,top: 10,),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Card(
                    color: Colors.white70,
                    child: Center(
                      child: TextFormField(
                        controller: signup_nameController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Required A Name";
                          }else{
                            return null;
                          }
                        },
                        keyboardType: TextInputType.name,
                        decoration:   InputDecoration(
                            hintText: "Full Name",
                            hintStyle: const TextStyle(color: Colors.blueGrey),
                            enabledBorder: InputBorder.none,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                            prefixIcon: const Icon(Icons.person,color: Colors.black,)
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
                        controller: signup_phoneController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Required A Number";
                          }else{
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration:   InputDecoration(
                            hintText: "Number(0++)",
                            hintStyle: const TextStyle(color: Colors.blueGrey),
                            enabledBorder: InputBorder.none,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                            prefixIcon: const Icon(Icons.call,color: Colors.black,)
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
                        controller: signup_emailController,
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
                        keyboardType: TextInputType.number,
                        obscureText: _obscureText,
                        controller: signup_passwordController,
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
                   if(signup_emailController.text.contains("@")&&signup_emailController.text.contains(".com")){
                     bool isSignUpDone =await  SignUpRepo(
                       names: signup_nameController.text,
                       passwords: signup_passwordController.text,
                       emails: signup_emailController.text,
                       phone: signup_phoneController.text,
                     );
                     if(isSignUpDone){
                       EasyLoading.showSuccess("Signup Done");
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => SignInScreen(),
                           ));
                     }else{
                       return EasyLoading.showError("Error");
                     }
                   }else{
                     EasyLoading.showError("Enter a valid email ( @, .com)");
                   }
                }
                signup_phoneController.clear();
                signup_emailController.clear();
                signup_passwordController.clear();
                signup_nameController.clear();
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Center(child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 20))),
                ),
              ),
SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
