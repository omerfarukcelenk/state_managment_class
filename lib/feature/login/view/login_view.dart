import 'package:flutter/material.dart';
import 'package:state_managments/feature/login/viewmodel/login_view_model.dart';
import 'package:state_managments/product/constant/image_enum.dart';
import 'package:kartal/kartal.dart';
import 'package:state_managments/product/padding/page_padding.dart';
import 'package:state_managments/product/utility/input_decorations.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final login = 'Login';
  final rememberText = "Remember Me";
  late final LoginViewModel _loginViewModel;

  @override
  void initState() {
    super.initState();
    _loginViewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loginViewModel,
      builder: (context, child) {
        return _bodyView(context);
      },
    );
  }

  Scaffold _bodyView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _progressIndicator(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const PagePadding.allow(),
          child: Column(
            children: [
              AnimatedContainer(
                duration: context.durationLow,
                height: context.isKeyBoardOpen
                    ? context.dynamicHeight(0.1)
                    : context.dynamicHeight(0.2),
                width: context.isKeyBoardOpen
                    ? context.dynamicWidth(0.2)
                    : context.dynamicWidth(0.3),
                child: ImageEnums.door.toImage,
              ),
              Text(
                login,
                style: context.textTheme.headlineLarge,
              ),
              const TextField(decoration: ProjectInput("Put your username")),
              ElevatedButton(
                  onPressed: context.watch<LoginViewModel>().isLoading
                      ? null
                      : () {
                          _loginViewModel.controlTextValue();
                        },
                  child: const Center(child: Text("Login"))),
              Center(
                child: CheckboxListTile(
                  value: _loginViewModel.isCheckBoxOkey,
                  title: Text(rememberText),
                  onChanged: (value) {
                    _loginViewModel.checkBoxChanges(value ?? false);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _progressIndicator() {
    return Consumer<LoginViewModel>(
      builder: (context, value, child) {
        return value.isLoading
            ? const Center(child: CircularProgressIndicator())
            : const SizedBox();
      },
    );
  }
}
