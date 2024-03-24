import 'package:flutter/material.dart';

class SearchItems extends StatelessWidget {
  //final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController? mycontroller;
  const SearchItems(
      {super.key, this.onPressedSearch, this.onChanged, this.mycontroller});

  @override
  Widget build(BuildContext context) {
   
    return  Container(
        height: 45,
        child: TextFormField(
            controller: mycontroller, //controller.search,
            onChanged: onChanged,
            // (v) {
            //   controller.checkSearch(v);
            // },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                hintText: 'Search a product',
                fillColor: Colors.white,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                prefixIcon: Visibility(
                    visible: true,
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                      ),
                      onPressed: onPressedSearch,
                      //  () {
                      //   controller.onSearchItems();
                      // },
                      color: Colors.grey.shade900,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide:
                        BorderSide(color: Colors.grey.shade200, width: 1.5)))),
      
    );
  }
}
