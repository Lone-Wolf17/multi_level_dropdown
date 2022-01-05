import 'package:flutter/material.dart';
import 'package:multi_level_dropdown/repositories/location_repository.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LocationRepository locationRepo = LocationRepository();
  List<String> _states = ["Choose a state"];
  List<String> _lgas = ["Choose ..."];
  String _selectedState = "Choose a state";
  String _selectedLGA = "Choose ...";

  @override
  void initState() {
    _states = List.from(_states)..addAll(locationRepo.getStates());
    super.initState();
  }

  void _onSelectedState(String? value) {
    setState(() {
      _selectedLGA = "Choose ...";
      _lgas = ["Choose ..."];
      _selectedState = value!;
      _lgas = List.from(_lgas)..addAll(locationRepo.getLocalByState(value));
    });
  }

  void _onSelectedLGA (String? value) {
    setState(() {
      _selectedLGA = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dependent Dropdowns"),
        elevation: 0.1,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            children: [
              DropdownButton<String>(
                isExpanded: true,
                onChanged: (value) => _onSelectedState(value),
                value: _selectedState,
                items: _states
                    .map((dropDownStringItem) => DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem)))
                    .toList(),
              ),
              DropdownButton<String>(
                isExpanded: true,
                onChanged: (value) => _onSelectedLGA(value),
                value: _selectedLGA,
                items: _lgas
                    .map((dropDownStringItem) => DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem)))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
