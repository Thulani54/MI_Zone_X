import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/constants.dart';

class CustomInput extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  TextEditingController? controller;
  final TextInputAction textInputAction;
  final bool isPasswordField;
  CustomInput(
      {required this.hintText,
      required this.onChanged,
      required this.onSubmitted,
      required this.focusNode,
      required this.textInputAction,
      required this.isPasswordField,
      this.controller});

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = widget.isPasswordField;

    return Container(
        decoration: MediaQuery.of(context).size.width < 500
            ? BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36)),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.75),
                ),
              )
            : MediaQuery.of(context).size.width < 1100 &&
                    MediaQuery.of(context).size.width < 1100
                ? BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.35),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    color: Color(0xffFFFFFF),
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    color: Color(0xffFFFFFF),
                  ),
        padding: EdgeInsets.only(
            left: 2,
            right: 2,
            top: _isPasswordField == true ? 2 : 0,
            bottom: _isPasswordField == true ? 10 : 0),
        width: MediaQuery.of(context).size.width,
        height: 45,
        child: TextField(
          obscureText: (_isPasswordField == true && _isPasswordHidden == true)
              ? true
              : false,
          onChanged: widget.onChanged,
          controller: widget.controller,
          focusNode: widget.focusNode,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: GoogleFonts.nunito(
              textStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
              ),
            ),
            contentPadding: EdgeInsets.only(left: 16.0, bottom: 9.0),
            suffixIcon: _isPasswordField == true
                ? IconButton(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Icon(
                        _isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Constants.ctaColorLight,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                        print("_isPasswordHidden ${_isPasswordHidden}");
                      });
                    },
                  )
                : null,
          ),
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 13.5,
                color: Colors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.w500),
          ),
        ));
  }
}

class CustomInputTransparent extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  TextEditingController? controller;
  final TextInputAction textInputAction;
  final bool isPasswordField;
  final Widget? prefix;
  final Widget? suffix;
  CustomInputTransparent(
      {required this.hintText,
      required this.onChanged,
      required this.onSubmitted,
      required this.focusNode,
      required this.textInputAction,
      required this.isPasswordField,
      this.controller,
      this.prefix,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = isPasswordField;
    return Container(
      padding: EdgeInsets.only(left: 2, right: 2, top: 8, bottom: 0),
      width: MediaQuery.of(context).size.width,
      height: 45,
      child: TextField(
        obscureText: _isPasswordField,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        controller: controller,
        textInputAction: textInputAction,
/*        validator: (val) {
            return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(val!)
                ? null
                : "Please Enter Correct Email";
          },*/
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: prefix,
          suffixIcon: suffix,
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
          hintStyle: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 13.5,
                color: Colors.grey,
                letterSpacing: 0,
                fontWeight: FontWeight.w500),
          ),
          contentPadding: EdgeInsets.only(top: 16),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.0)),
            borderRadius: BorderRadius.circular(36),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffED7D32)),
            borderRadius: BorderRadius.circular(360),
          ),
        ),
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13.5),
      ),
    );
  }
}

class CustomInputLine extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  TextEditingController? controller;
  final TextInputAction textInputAction;
  final bool isPasswordField;
  CustomInputLine(
      {required this.hintText,
      required this.onChanged,
      required this.onSubmitted,
      required this.focusNode,
      required this.textInputAction,
      required this.isPasswordField,
      this.controller});

  @override
  State<CustomInputLine> createState() => _CustomInputLineState();
}

class _CustomInputLineState extends State<CustomInputLine> {
  bool _isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = widget.isPasswordField;

    return Container(
        decoration: MediaQuery.of(context).size.width < 500
            ? BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36)),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.55),
                ),
              )
            : MediaQuery.of(context).size.width < 1100 &&
                    MediaQuery.of(context).size.width < 1100
                ? BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36)),
                    color: Color(0xffFFFFFF),
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    color: Color(0xffFFFFFF),
                  ),
        padding: EdgeInsets.only(left: 2, right: 2, top: 0, bottom: 0),
        width: MediaQuery.of(context).size.width,
        height: 45,
        child: TextField(
          obscureText: (_isPasswordField == true && _isPasswordHidden == true)
              ? true
              : false,
          onChanged: widget.onChanged,
          controller: widget.controller,
          focusNode: widget.focusNode,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.white), // Set initial border color
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Constants
                      .ctaColorLight), // Set border color when selected
            ),
            hintText: widget.hintText,
            hintStyle: GoogleFonts.nunito(
              textStyle: TextStyle(
                fontSize: 15,
                color: Colors.white70,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
              ),
            ),
            contentPadding: EdgeInsets.only(left: 16.0, top: 6.0),
            suffixIcon: _isPasswordField == true
                ? IconButton(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        _isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Color(0xffED7D32),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                        print("_isPasswordHidden ${_isPasswordHidden}");
                      });
                    },
                  )
                : null,
          ),
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 13.5,
                color: Colors.white,
                letterSpacing: 0,
                fontWeight: FontWeight.w500),
          ),
        ));
  }
}

class CustomInputSquare extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  TextEditingController? controller;
  final TextInputAction textInputAction;
  final bool isPasswordField;
  CustomInputSquare(
      {required this.hintText,
      required this.onChanged,
      required this.onSubmitted,
      required this.focusNode,
      required this.textInputAction,
      required this.isPasswordField,
      this.controller});

  @override
  State<CustomInputSquare> createState() => _CustomInputSquareState();
}

class _CustomInputSquareState extends State<CustomInputSquare> {
  bool _isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = widget.isPasswordField;

    return Container(
        decoration: MediaQuery.of(context).size.width < 500
            ? BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.75),
                ),
              )
            : MediaQuery.of(context).size.width < 1100 &&
                    MediaQuery.of(context).size.width < 1100
                ? BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.35),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    color: Color(0xffFFFFFF),
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    color: Color(0xffFFFFFF),
                  ),
        padding: EdgeInsets.only(
            left: 2,
            right: 2,
            top: _isPasswordField == true ? 2 : 0,
            bottom: _isPasswordField == true ? 10 : 0),
        width: MediaQuery.of(context).size.width,
        height: 45,
        child: TextField(
          obscureText: (_isPasswordField == true && _isPasswordHidden == true)
              ? true
              : false,
          onChanged: widget.onChanged,
          controller: widget.controller,
          focusNode: widget.focusNode,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: GoogleFonts.nunito(
              textStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
              ),
            ),
            contentPadding: EdgeInsets.only(left: 16.0, bottom: 9.0),
            suffixIcon: _isPasswordField == true
                ? IconButton(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Icon(
                        _isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Constants.ctaColorLight,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                        print("_isPasswordHidden ${_isPasswordHidden}");
                      });
                    },
                  )
                : null,
          ),
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 13.5,
                color: Colors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.w500),
          ),
        ));
  }
}
