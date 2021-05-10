import 'package:flutter/material.dart';
import 'package:get/get.dart';




class CustomDropdownButton extends StatefulWidget {
  CustomDropdownButton({
    @required this.dropdownDate,
    this.onChanged,
    this.labelhint,
    this.showlabel = false,
  });

  final List<dynamic> dropdownDate;
  final String labelhint;
  final Function(dynamic) onChanged;
  final bool showlabel;

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  int selectValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 2,
                color: Color(0XFF707070),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DropdownButton(
                  hint: Text('اختيار من القائمة'),
                  value: selectValue,
                  isExpanded: true,
                  elevation: 2,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  items: new List.generate(widget.dropdownDate.length, (index) {
                    return new DropdownMenuItem(
                      value: int.parse(widget.dropdownDate.elementAt(index)['id'].toString()) ,
                      child:
                          Text(widget.dropdownDate.elementAt(index)['title']),
                    );
                  }).toList(),
                  onChanged: (value) {
                    print(value.toString());
                    selectValue = value;
                    widget.onChanged(value);
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
