import 'package:axeta/entities/user_info_entity.dart';

abstract class EditScreenState {}

class EditScreenLoadingState extends EditScreenState {}

class EditScreenLoadedState extends EditScreenState {
  EditScreenLoadedState({required this.userInfo});

  final UserInfoEntity userInfo;
}

class EditScreenEmptyState extends EditScreenState {}

class EditScreenNavigateState extends EditScreenState {}

class EditScreenErrorState extends EditScreenState {
  EditScreenErrorState({required this.message});

  final String message;
}
