part of 'dropdown_bloc.dart';

@immutable
abstract class DropdownState {}

abstract class DropdownActiontate extends DropdownState {}

class DropdownInitial extends DropdownState {}

class DropdownILoadingState extends DropdownState {}

class DropdownLoadedSuccessState extends DropdownState {
  List<String> data = [];
  List<String> subCategorydata = [];
  DropdownLoadedSuccessState({required this.data, required this.subCategorydata} );
}

class DropdownSubCategoryState extends DropdownState {
  List<String> subCategorydata = [];
  DropdownSubCategoryState({required this.subCategorydata});
}

class DropdownErrorState extends DropdownState {}
