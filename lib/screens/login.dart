import 'package:facebook/bloc/common/bloc.dart';
import 'package:facebook/bloc/common/events.dart';
import 'package:facebook/bloc/common/states.dart';
import 'package:facebook/routes/index.dart';
import 'package:facebook/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _bloc = CommonBloc();
  final _usernameCtr = TextEditingController();
  final _passwordCtr = TextEditingController();
  void _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _bloc.add(CommonLogin(_usernameCtr.text, _passwordCtr.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MultiBlocListener(
        listeners: [
          BlocListener<CommonBloc, CommonState>(
              bloc: _bloc,
              listener: (context, state) {
                if (state is CommonLoading) {
                  Utils.startLoader();
                }
                if (state is CommonFailure) {
                  Utils.canceltLoader();
                }
                if (state is CommonSuccess) {
                  Utils.canceltLoader();
                  Navigator.pushNamed(context, RouteNames.home);
                }
              })
        ],
        child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset("assets/cover.jpeg"),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _usernameCtr,
                              validator: Utils.validateEmpty,
                              decoration: InputDecoration(
                                label: Text("Phone number or email"),
                              ),
                            ),
                            TextFormField(
                              controller: _passwordCtr,
                              validator: Utils.validateEmpty,
                              decoration: InputDecoration(
                                label: Text("Password"),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: _onSubmit,
                                      child: Text("Log in")),
                                ),
                              ],
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text("Forget Password?")),
                            TextButton(onPressed: () {}, child: Text("Back")),
                          ],
                        )),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: width / 3,
                        color: Colors.black26,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Or"),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 1,
                        width: width / 3,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
                    child: Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text("Create New Account"))),
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
        ));
  }
}
