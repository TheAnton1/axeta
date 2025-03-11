import 'dart:developer';

import 'package:axeta/entities/user_info_entity.dart';
import 'package:axeta/repositories/geo_info/i_geo_info_repository.dart';
import 'package:axeta/repositories/user_info/i_user_info_repository.dart';
import 'package:axeta/res/strings/strings.dart';
import 'package:axeta/screens/main_screen/bloc/main_screen_events.dart';
import 'package:axeta/screens/main_screen/bloc/main_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc({
    required this.userInfoRepository,
    required this.geoInfoRepository,
  }) : super(MainScreenLoadingState()) {
    on<LoadUserInfoEvent>(_onLoadInfo);
  }

  final IUserInfoRepository userInfoRepository;
  final IGeoInfoRepository geoInfoRepository;

  Future<void> _onLoadInfo(
      LoadUserInfoEvent event, Emitter<MainScreenState> emit) async {
    try {
      final info = await _loadUserInfo();
      final location = await _loadLocation(info!.location);
      emit(MainScreenLoadedState(userInfo: info, location: location!));
    } catch (e) {
      log(e.toString());
      emit(MainScreenErrorState(message: Strings.errorFetchingData));
    }
  }

  Future<Map<String, double>?> _loadLocation(String address) async {
    try {
      return await geoInfoRepository.getLocationByAddress(address);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<UserInfoEntity?> _loadUserInfo() async {
    try {
      return await userInfoRepository.fetchUserInfo();
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

}
