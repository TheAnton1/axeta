import 'package:axeta/entities/user_info_entity.dart';

abstract class MainScreenState {}

class MainScreenLoadingState extends MainScreenState {}

class MainScreenLoadedState extends MainScreenState {
  MainScreenLoadedState({
    required this.userInfo,
    required this.location,
  });

  final UserInfoEntity userInfo;
  final Map<String, double> location;
}

class MainScreenEmptyState extends MainScreenState {}

class MainScreenErrorState extends MainScreenState {
  MainScreenErrorState({required this.message});

  final String message;
}
