import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.validator,
    required this.onSaved,
    this.controller,
    this.isObscure = false,
    required this.fontSize,
    required this.fontColor,
    this.hintText = '',
    this.hintTextSize = 12.0,
    this.fillColor = Colors.white10,
    required this.height,
    required this.width,
    this.keyboardType = TextInputType.text,
    this.maxLength = 200,
    this.prefixIcon,
  });

  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool isObscure;
  final double fontSize;
  final Color fontColor;
  final double height, width;
  final String hintText;
  final double hintTextSize;
  final Color fillColor;
  final TextInputType keyboardType;
  final int maxLength;
  final Icon? prefixIcon;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController _controller;
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isObscure;
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
        validator: widget.validator,
        onSaved: widget.onSaved,
        controller: _controller,
        obscureText: _isObscured,
        keyboardType: widget.keyboardType,
        inputFormatters: [LengthLimitingTextInputFormatter(widget.maxLength)],
        style: TextStyle(
          fontSize: widget.fontSize,
          color: widget.fontColor,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
          labelText: widget.hintText, // Floating label
          labelStyle: TextStyle(
            color: Colors.black54,
            fontSize: widget.hintTextSize,
            fontFamily: 'Poppins',
          ),
          prefixIcon: widget.prefixIcon != null
              ? IconTheme(
                  data: const IconThemeData(color: Colors.black54),
                  child: widget.prefixIcon!,
                )
              : null,
          suffixIcon: widget.isObscure
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black54,
                  ),
                  onPressed: _toggleVisibility,
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
