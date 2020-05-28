import 'dart:math';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SearchField extends StatelessWidget {
  final TextEditingController searchController;

  SearchField({@required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),
        cursorColor: Colors.white,
        keyboardType: TextInputType.text,
        controller: searchController,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: 'Search a location here',
          hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w400),
          fillColor: Color(0xffe7f2e6).withOpacity(0.5),
          filled: true,
          suffixIcon: searchController.text.isEmpty
              ? Transform.rotate(
            angle: pi/ 0.67,
                child: Icon(
                    LineIcons.search,
                    color: Colors.white,
                    size: 20,
                  ),
              )
              : GestureDetector(
                  onTap: () {
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => searchController.clear());
                  },
                  child: Icon(
                    Icons.clear,
                    color: Color(0xffEFF2FF),
                    size: 20,
                  )),
          prefixIcon: Icon(LineIcons.map_marker, color: Colors.white,
            size: 20,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
