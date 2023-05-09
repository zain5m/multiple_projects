import 'package:abd/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var fromkey = GlobalKey<FormState>();
  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: fromkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  // TextField(
                  //
                  //   decoration: InputDecoration(
                  //     prefixIcon: Icon(Icons.lock),
                  //     border: OutlineInputBorder(),
                  //     labelText: ',s;s',
                  //   ),
                  // ),
                  // SizedBox(
                  //   height:20.0 ,
                  // ),
                  defaultFormField(
                    controller: emailController,
                    label: 'Email',
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'email dont be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  // TextField(),
                  defaultFormField(
                    controller: passwordController,
                    label: 'Password',
                    prefix: Icons.lock,
                    suffix:
                        ispassword ? Icons.visibility : Icons.visibility_off,
                    isbasswors: ispassword,
                    suffixPressed: () {
                      setState(() {
                        ispassword = !ispassword;
                      });
                    },
                    type: TextInputType.visiblePassword,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'password dont be empty';
                      }
                      return null;
                    },
                  ),
                  // defaultFormField(
                  //   obscureText: z,
                  //   keyboardType: TextInputType.visiblePassword,
                  //   decoration: InputDecoration(
                  //     prefixIcon: Icon(Icons.lock),
                  //     suffixIcon: IconButton(
                  //       onPressed: () {
                  //         setState(() {
                  //           z = !z;
                  //         });
                  //       },
                  //       icon: Icon(
                  //           z ? Icons.remove_red_eye : Icons.visibility_off),
                  //     ),
                  //     labelText: 'Password',
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  defaultButton(
                    text: 'login',
                    function: () {
                      if (fromkey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'n have an account ?'),
                      TextButton(
                        onPressed: () {},
                        child: Text('Register Now'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
