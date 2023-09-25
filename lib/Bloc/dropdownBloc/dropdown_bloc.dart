import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:damo/data/dowpdowndata/dropdowndata.dart';
import 'package:meta/meta.dart';

part 'dropdown_event.dart';
part 'dropdown_state.dart';

class DropdownBloc extends Bloc<DropdownEvent, DropdownState> {
  DropdownBloc() : super(DropdownInitial()) {
    on<DropDownInitialEvent>(dropDownInitialEvent);
    on<CategoryClickEvent>(categoryClickEvent);
  }

  FutureOr<void> dropDownInitialEvent(DropDownInitialEvent event, Emitter<DropdownState> emit) async {
    emit(DropdownILoadingState());
    await Future.delayed(Duration(seconds: 1));
    List<String> category = data.keys.toList();

    emit(DropdownLoadedSuccessState(data: category, subCategorydata: []));
  }

  FutureOr<void> categoryClickEvent(CategoryClickEvent event, Emitter<DropdownState> emit) {
    List<String> category22 = data.keys.toList();
    String categoryclick = '';
    List<String> subcategoriesItmes = [];
    categoryclick = event.categoryclick!;
    print("aaaaccccccccaaaa");
    emit(DropdownSubCategoryState(subCategorydata: []));
    for (var category in ["Electronics", "Clothing"]) {
      if (data.containsKey(category)) {
        if (category == categoryclick) {
          print(category);
          List<Map<String, dynamic>>? subcategories = data[category];
          print("sub");
          //   print(subcategories);
          for (var subcategoryData in subcategories!) {
            subcategoryData.forEach((subcategoryName, p) {
              subcategoriesItmes.add(subcategoryName);
              print(subcategoriesItmes);
              emit(DropdownLoadedSuccessState(data: category22, subCategorydata: subcategoriesItmes));
            });
          }
        }

        // for (var subcategoryData in subcategories!) {
        //   subcategoryData.forEach((subcategoryName, products) {
        //     print("  $subcategoryName:");
        //     List<Map<String, dynamic>> productList = products;
        //     for (var product in productList) {
        //       print("    Product Name: ${product['name']}");
        //       print("    Price: ${product['price']}");
        //       print("    Description: ${product['description']}");
        //     }
        //   });
        // }
        // print("\n");
      }
    }
  }
}
