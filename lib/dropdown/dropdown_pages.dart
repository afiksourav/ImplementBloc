import 'package:damo/Bloc/dropdownBloc/dropdown_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  List<String> _dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

  // Create a variable to store the selected option
  String? _selectedOption;
  String? _selectedOption2;

  final DropdownBloc dropdownBloc = DropdownBloc();
  @override
  void initState() {
    dropdownBloc.add(DropDownInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("drop down"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            BlocConsumer<DropdownBloc, DropdownState>(
              bloc: dropdownBloc,
              listenWhen: (previous, current) => current is DropdownActiontate,
              buildWhen: (previous, current) => current is! DropdownActiontate,
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is DropdownILoadingState) {
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is DropdownLoadedSuccessState) {
                  print("afikkkkkkkkkkkkkk");
                  print(state.subCategorydata);
                  return Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: _selectedOption,
                        items: state.data.map((String option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // setState(() {
                          _selectedOption = newValue!;
                          _selectedOption2 = null;
                          dropdownBloc.add(CategoryClickEvent(categoryclick: _selectedOption));
                          // });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Select an option',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<String>(
                        hint: _selectedOption2 == null ? Text("Select Sub") : Text(_selectedOption2!),
                        value: _selectedOption2,
                        items: state.subCategorydata.map((String option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // setState(() {
                          _selectedOption2 = newValue!;
                          dropdownBloc.add(CategoryClickEvent(categoryclick: _selectedOption));
                          // });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Select an option',
                          border: OutlineInputBorder(),
                        ),
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
            const SizedBox(
              height: 10,
            ),

            // BlocConsumer<DropdownBloc, DropdownState>(
            //   bloc: dropdownBloc,
            //   listenWhen: (previous, current) => current is DropdownActiontate,
            //   buildWhen: (previous, current) => current is! DropdownActiontate,
            //   listener: (context, state) {
            //     // TODO: implement listener
            //   },
            // builder: (context, state) {
            //   if (state is DropdownSubCategoryState) {
            //     print("afkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
            //     print(state.subCategorydata);
            //  return DropdownButtonFormField<String>(
            //   value: _selectedOption,
            //   items: state.subCategorydata.map((String option) {
            //     return DropdownMenuItem<String>(
            //       value: option,
            //       child: Text(option),
            //     );
            //   }).toList(),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       _selectedOption = newValue ?? '';
            //       dropdownBloc.add(CategoryClickEvent(categoryclick: _selectedOption));
            //     });
            //   },
            //   decoration: InputDecoration(
            //     labelText: 'Select an option',
            //     border: OutlineInputBorder(),
            //   ),
            // );
            //     }
            //     return Container();
            //   },
            // ),

            // DropdownButtonFormField<String>(
            //   value: _selectedOption,
            //   items: _dropdownOptions.map((String option) {
            //     return DropdownMenuItem<String>(
            //       value: option,
            //       child: Text(option),
            //     );
            //   }).toList(),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       _selectedOption = newValue ?? '';
            //     });
            //   },
            //   decoration: InputDecoration(
            //     labelText: 'Select an option',
            //     border: OutlineInputBorder(),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
