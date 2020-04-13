import 'package:flutter/material.dart';

class MyDropDownMenu extends StatefulWidget {
  final List<String> menuItemList;


  const MyDropDownMenu({@required this.menuItemList,});

  @override
  _MyDropDownMenuState createState() => _MyDropDownMenuState();
}

class _MyDropDownMenuState extends State<MyDropDownMenu> {
  String _selectedItem = '';
  String hintText;
  @override
  void initState() {
    hintText = widget.menuItemList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        items: widget.menuItemList.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        hint: Text(hintText ?? ''),
        value: _selectedItem.isEmpty ? null : _selectedItem,
        iconSize: 0.0,
        onChanged: selectedItem,
      ),
    );
  }

  void selectedItem(newValue) {
    setState(() {
      _selectedItem = newValue;
      print('Select dropdown item: $_selectedItem');
    });
  }
}

//class DropDown extends StatefulWidget {
//  DropDown() : super();
//
//  final String title = "DropDown Demo";
//
//  @override
//  DropDownState createState() => DropDownState();
//}
//
//class Company {
//  int id;
//  String name;
//
//  Company(this.id, this.name);

//  static List<Company> getCompanies() {
//    return <Company>[
//      Company(1, 'Apple'),
//      Company(2, 'Google'),
//      Company(3, 'Samsung'),
//      Company(4, 'Sony'),
//      Company(5, 'LG'),
//    ];
//  }
//}
//
//class DropDownState extends State<DropDown> {
//  //
//  List<Company> _companies = Company.getCompanies();
//  List<DropdownMenuItem<Company>> _dropdownMenuItems;
//  Company _selectedCompany;
//
//  @override
//  void initState() {
//    _dropdownMenuItems = buildDropdownMenuItems(_companies);
//    _selectedCompany = _dropdownMenuItems[0].value;
//    super.initState();
//  }
//
//  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
//    List<DropdownMenuItem<Company>> items = List();
//    for (Company company in companies) {
//      items.add(
//        DropdownMenuItem(
//          value: company,
//          child: Text(company.name),
//        ),
//      );
//    }
//    return items;
//  }
//
//  onChangeDropdownItem(Company selectedCompany) {
//    setState(() {
//      _selectedCompany = selectedCompany;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text("DropDown Button Example"),
//        ),
//        body: new Container(
//          child: Center(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text("Select a company"),
//                SizedBox(
//                  height: 20.0,
//                ),
//                DropdownButton(
//                  value: _selectedCompany,
//                  items: _dropdownMenuItems,
//                  onChanged: onChangeDropdownItem,
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//                Text('Selected: ${_selectedCompany.name}'),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
