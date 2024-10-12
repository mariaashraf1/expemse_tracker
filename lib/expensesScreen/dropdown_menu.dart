import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  final List<String> options;
   final String  intial_value;
  final void Function(String) onChanged;

  const CustomDropdownMenu({
    Key? key,
    required this.options,
     required this.intial_value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownMenuState createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
   late String selected;

  @override
  void initState() {
    super.initState();
    selected = widget.intial_value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: 400,
      height: 55,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(70),
        border: Border.all(
          color: Colors.black,
        )// Adjust as desired
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        borderRadius: BorderRadius.circular(70.0),
        dropdownColor: Colors.white,
         hint: Text("choose category",style: TextStyle(color: Colors.black),),
         value:selected ,
        onChanged: (newValue) {
          setState(() {
            selected = newValue!;
             widget.onChanged(newValue!);
             print(newValue);
          });
        },
        underline: Container(),
        items: widget.options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value,style: TextStyle(color: Colors.black),),
            ),
          );
        }).toList(),
      ),
    );
  }
}

