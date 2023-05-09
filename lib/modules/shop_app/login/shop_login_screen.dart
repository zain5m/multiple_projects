import 'package:abd/layout/shop_app/cubit/cubit.dart';
import 'package:abd/layout/shop_app/cubit/states.dart';
import 'package:abd/layout/shop_app/shop_layout.dart';
import 'package:abd/modules/shop_app/login/cubit/cubit.dart';
import 'package:abd/modules/shop_app/login/cubit/staes.dart';
import 'package:abd/modules/shop_app/register/shop_register_screen.dart';
import 'package:abd/shared/components/components.dart';
import 'package:abd/shared/components/constants.dart';
import 'package:abd/shared/network/local/cache_helper.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
            listener: (context, state) {
              if (state is ShopLoginSccessState) {
                if (state.loginModel!.status == true) {
                  CacheHelper.saveData(
                    key: 'tokenshop',
                    value: state.loginModel!.data!.token,
                  ).then((value) {
                    token = state.loginModel!.data!.token;
                    ShopCubit.get(context).getUserData();
                    ShopCubit.get(context).getHomeData();
                    ShopCubit.get(context).getCategories();
                    ShopCubit.get(context).getFavorites();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShopLayout(),
                      ),
                      (route) => false,
                    );
                  });
                } else {
                  showToast(
                      text: '//${state.loginModel!.message}',
                      state: ToastState.ERROR);
                }
              }
            },
            builder: (context, state) {
              return Scaffold(
                // resizeToAvoidBottomInset: false,
                appBar: AppBar(),
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LOGIN',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            Text(
                              'login now to browse our hot offers',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            defaultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'pless enter your email address';
                                }
                              },
                              label: "Email Address",
                              prefix: Icons.email_outlined,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              suffix: ShopLoginCubit.get(context).suffix,
                              isbasswors:
                                  ShopLoginCubit.get(context).ispassword,
                              suffixPressed: () {
                                ShopLoginCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'password is too short';
                                }
                              },
                              label: "Password",
                              prefix: Icons.lock_outline,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ConditionalBuilder(
                              condition: state is! ShopLoginLoadingState,
                              builder: (context) => defaultButton(
                                text: 'login',
                                function: () {
                                  if (formkey.currentState!.validate()) {
                                    ShopLoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                isUpperCase: true,
                              ),
                              fallback: (context) => Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ShopRegisterScreen(),
                                        ),
                                      );
                                    },
                                    child: Text('Register'.toUpperCase()))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
