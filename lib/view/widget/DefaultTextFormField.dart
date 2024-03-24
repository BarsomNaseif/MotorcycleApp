import 'package:flutter/material.dart';

class defaultTextFoemField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final int maxLines;
  final Function(String)? onChange;
  final String? Function(String?)? onValidate;
  final Function(String)? onFieldSubmitted;
  final bool isPassword;
  final String? labelText;
  final IconData? suffix;
  final IconData? prefix;
  final Function()? suffixPress;
  final Function(String?)? onSaved;
  final Color color;
  defaultTextFoemField(
      {this.color = Colors.black,
      this.prefix,
      this.controller,
      this.isPassword = false,
      this.labelText,
      this.maxLines = 1,
      this.onChange,
      this.onFieldSubmitted,
      this.onTap,
      this.onValidate,
      this.onSaved,
      this.suffix,
      this.suffixPress,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      style: TextStyle(color: color),
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      obscureText: isPassword,
      onChanged: onChange,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      validator: onValidate,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.black, fontSize: 14),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.grey)),
        floatingLabelStyle: TextStyle(color: Colors.black, fontSize: 17),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.only(left: 15),
        filled: true,
        labelText: labelText,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPress, icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(
          gapPadding: 5,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
