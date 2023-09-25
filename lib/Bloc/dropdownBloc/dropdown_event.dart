part of 'dropdown_bloc.dart';

@immutable
abstract class DropdownEvent {}

class DropDownInitialEvent extends DropdownEvent {}

class CategoryClickEvent extends DropdownEvent {
  String ? categoryclick;
  CategoryClickEvent({required this.categoryclick});
}
