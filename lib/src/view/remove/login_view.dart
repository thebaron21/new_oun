import 'package:flutter/material.dart';
import '../widgets/m_button.dart';
import '../../view_models/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (
        BuildContext context,
        LoginViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.all(16),
            color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MTextField(
                  controller: model.phoneNumberController,
                  length: 10,
                  label: 'phone',
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 8,
                ),
                MButton(
                  onPress: () {
                    model.login(context);
                  },
                  label: 'Login',
                )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}

class MTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final int length;
  final String label;
  const MTextField({
    Key key,
    this.controller,
    this.inputType,
    this.length,
    this.label,
  }) : super(key: key);

  InputDecoration getMTextFieldinputDecoration({String label}) {
    return InputDecoration(
      hintText: label,
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(25.0),
      ),
      border: new OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(48)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      maxLength: length > 0 ? length : null,
      decoration: getMTextFieldinputDecoration(label: label),
    );
  }
}
