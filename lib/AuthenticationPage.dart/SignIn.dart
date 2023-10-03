import 'package:expense_tracker/AuthenticationPage.dart/SignUp.dart';
import 'package:expense_tracker/AuthenticationPage.dart/validation.dart';
import 'package:expense_tracker/project_constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controllers.dart/SignInController.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static const String pageName='/SignInPage';
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
 final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
late  TextEditingController emailController,passwordController;
  double radius=27;
  @override
  void initState() {
    super.initState();
    
    passwordController=TextEditingController();
    emailController=TextEditingController();
  }
  @override
  void dispose() {
 passwordController.dispose();
 emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color:Colors.black,
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                   color: Colors.black,
                   child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(onPressed: () {
                           Navigator.pushReplacementNamed(context, SignUPPage.pageName);
                        },icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Forgate your password?',
                        style: TextStyle(color: Colors.white),),
                      )
                    ],
                   )  ),
                  ),
                Expanded(flex: 9,
                child:Container(
                  decoration: const BoxDecoration(
                  color: Colors.white,
                 borderRadius: 
                    BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))
                  ),
                  child: Column(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Spacer(flex: 1,),
                            Expanded(flex: 6,
                            child:Padding(
                              padding: EdgeInsets.only(left: 18,top: 14),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Let`s get something',
                                style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.w800),),
                              ),
                            )),
                            Expanded(flex: 3,
                            child:Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 18),
                                child: Text('Good to see you back',
                                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),),
                              ),
                            )),
                          ],
                        )),
                        // first completed.......
                        Expanded(flex: 8,
                          child: Column(
                            children: [
     
     
                          //             child: ClipRRect(
                          //               borderRadius: BorderRadius.circular(35),
                          //                child: Container(
                          //                 decoration: BoxDecoration(
                          //                   image: DecorationImage(
                          //                     image: AssetImage('assets/images/facebook.png'),
                          //                     fit: BoxFit.fill
                          //                  ) ),
                          //                ),
                          //              ),
                          //           )
                          //         ),
                          //       ),
                          //       Expanded(
                          //         flex: 1,
                          //         child: Padding(
                          //           padding: const EdgeInsets.only(left: 8),
                          //           child: ClipRRect(
                          //             borderRadius: BorderRadius.circular(35),
                          //              child: Container(
                          //               decoration: BoxDecoration(
                          //                 image: DecorationImage(
                          //                   image: AssetImage('assets/images/twitter.png'),
                          //                   fit: BoxFit.fill
                          //                ) ),
                          //              ),
                          //            )
                          //         ),
                          //       ),
                          //       Spacer(flex: 2,)
                          //     ],  
                          //     ) ),
                              Spacer(flex: 1,),
                              // text field started
                              Expanded(flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: emailController,
                                    validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Email Address';
                                    } else if(!isValidEmail(value)){
                                      return 'Email is inValid';
                                    }
                                    else{
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    hintText: "Enter e-mail",
                                    border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)
                              
                                    )
                                  ),
                                ),
                              )),
                            
                            
                              Expanded(flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: passwordController,
                                  validator:  (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter password';
                                    } else if(!isValidPassword(value)){
                                      return 'inValid Password';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock_open,color: Colors.black,),
                                    hintText: "Enter password",
          
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color:Color.fromARGB(255, 206, 176, 8),
                                      strokeAlign: 2 ),
                                borderRadius: BorderRadius.circular(25)
                              
                                    )
                                  ),
                                ),
                              )),
                              Spacer(flex: 1,),
                              // text field completed.....
                              Expanded(flex: 2,child: Padding(
                                padding: const EdgeInsets.only(left: 28,right: 28,bottom: 13,top: 10),
                                child: InkWell(
                                  onTap: () async {
                                    if (_formkey.currentState!.validate())  {
                                      SharedPreferences prefernce= await SharedPreferences.getInstance();
    prefernce.setString('email', emailController.text);
                                      signInWithEmailPassword(context,emailController.text.trim(),passwordController.text.trim());
                                      
                                      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('SignIn Successfully')));
                                      
                                    } else {
                                      
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                    color: Color.fromARGB(231, 30, 30, 25),
                                                              
                                      borderRadius: BorderRadius.circular(55)
                                    ),
                                    child: Center(
                                      child: Text('SIGN In',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),),
                                    ),
                                  ),
                                ),
                              )),
                              //  sign up button....
                              Expanded(flex: 1,child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Already have an account?',
                                      style: TextStyle(color: Colors.black,fontSize: 15),
                                    ),
                                    TextSpan(
                                      onEnter: (event) {
                                        
                                      },
                                      text: 'Sign Up',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 47, 21, 2),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                   
                                   
                                  ],
                                ),
                              ),
                              )
          )
                            ],
                          )
                        ),
                                Spacer(flex: 1,),

                    ],
                  ),
                ) )
              ],
            ),
          ),
        ),
      ),
    );
  }
} 
  
 


