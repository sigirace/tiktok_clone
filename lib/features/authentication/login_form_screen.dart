import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/authentication/view_models/login_view_model.dart';
import 'package:tictok_clone/features/authentication/widgets/form_button.dart';

class LoginFormScreen extends ConsumerStatefulWidget {
  static String routeName = "/login";
  const LoginFormScreen({super.key});

  @override
  LoginFormScreenState createState() => LoginFormScreenState();
}

class LoginFormScreenState extends ConsumerState<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        ref.read(loginProvider.notifier).login(
              formData["email"]!,
              formData["password"]!,
              context,
            );

        // context.goNamed(InterestsScreen.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Gaps.v28,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData["email"] = newValue;
                      }
                    },
                  ),
                  Gaps.v16,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return '비밀번호를 입력해주세요.';
                    //   } else if (!RegExp(
                    //           r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                    //       .hasMatch(value)) {
                    //     return '비밀번호는 최소 8자 이상이며, 하나 이상의 대문자, 소문자, 숫자, 특수문자를 포함해야 합니다.';
                    //   }
                    //   return null;
                    // },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData["password"] = newValue;
                      }
                    },
                  ),
                  Gaps.v28,
                  GestureDetector(
                    onTap: _onSubmitTap,
                    child: FormButton(
                      disabled: ref.watch(loginProvider).isLoading,
                      text: "Log in",
                    ),
                  ),
                ],
              )),
        ));
  }
}
