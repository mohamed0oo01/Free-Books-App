import 'package:flutter/material.dart';

class CoustomSearchTextField extends StatelessWidget {
  CoustomSearchTextField({
    super.key,
    required this.controller,
    this.onChange,
  });
  final TextEditingController controller;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SafeArea(
        child: TextField(
          controller: controller,
          onChanged: onChange,
          maxLines: 2,
          minLines: 1,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: const Opacity(
              opacity: 0.8,
              child: Icon(Icons.search_rounded),
            ),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
