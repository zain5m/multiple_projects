import 'package:abd/layout/shop_app/cubit/cubit.dart';
import 'package:abd/layout/shop_app/cubit/states.dart';
import 'package:abd/layout/shop_app/shop_layout.dart';
import 'package:abd/modules/shop_app/register/cubit/cubit.dart';
import 'package:abd/modules/shop_app/register/cubit/staes.dart';
import 'package:abd/shared/components/components.dart';
import 'package:abd/shared/components/constants.dart';
import 'package:abd/shared/network/local/cache_helper.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopRegisterScreen extends StatelessWidget {
  ShopRegisterScreen({Key? key}) : super(key: key);
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
            listener: (context, state) {
              if (state is ShopRegisterSccessState) {
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
                      text: '${state.loginModel!.message}',
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
                              'REGISTER',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            Text(
                              'Register now to browse our hot offers',
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
                              controller: nameController,
                              type: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'pless enter your name';
                                }
                              },
                              label: "User Name",
                              prefix: Icons.person,
                            ),
                            SizedBox(
                              height: 15,
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
                              suffix: ShopRegisterCubit.get(context).suffix,
                              isbasswors:
                                  ShopRegisterCubit.get(context).ispassword,
                              suffixPressed: () {
                                ShopRegisterCubit.get(context)
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
                              height: 15,
                            ),
                            defaultFormField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'pless enter your phone';
                                }
                              },
                              label: "Phone",
                              prefix: Icons.phone,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ConditionalBuilder(
                              condition: state is! ShopRegisterLoadingState,
                              builder: (context) => defaultButton(
                                text: 'register',
                                function: () {
                                  if (formkey.currentState!.validate()) {
                                    ShopRegisterCubit.get(context).userRegister(
                                        name: nameController.text,
                                        phone: phoneController.text,
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
