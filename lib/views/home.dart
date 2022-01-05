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
  List<String> _cities = ["Choose ..."];
  String _selectedState = "Choose a state";
  String _selectedLGA = "Choose ...";
  String _selectedCity = "Choose ...";

  @override
  void initState() {
    _states = List.from(_states)..addAll(locationRepo.getStates());
    super.initState();
  }

  void _onSelectedState(String? value) {
    setState(() {
      _selectedLGA = "Choose an LGA...";
      _lgas = ["Choose a City ..."];
      _selectedState = value!;
      _lgas = List.from(_lgas)..addAll(locationRepo.getLocalByState(value));
      _cities = List.from(_cities)
        ..addAll(locationRepo.getCitiesByState(value));
    });
  }

  void _onSelectedLGA(String? value) {
    setState(() {
      _selectedLGA = value!;
    });
  }

  void _onSelectedCity(String? value) {
    setState(() {
      _selectedCity = value!;
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
              Card(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('State and Cities',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
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
              const SizedBox(height: 50),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('State and Cities',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
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
                        onChanged: (value) => _onSelectedCity(value),
                        value: _selectedCity,
                        items: _cities
                            .map((dropDownStringItem) => DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem)))
                            .toList(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
