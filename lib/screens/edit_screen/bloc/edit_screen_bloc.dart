import 'dart:async';
import 'dart:developer';

import 'package:axeta/entities/experience_entity.dart';
import 'package:axeta/entities/user_info_entity.dart';
import 'package:axeta/repositories/user_info/i_user_info_repository.dart';
import 'package:axeta/res/strings/strings.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_events.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditScreenBloc extends Bloc<EditScreenEvent, EditScreenState> {
  EditScreenBloc({
    required this.userInfoRepository,
  }) : super(EditScreenLoadingState()) {
    on<LoadUserInfoEvent>(_onLoadUserInfo);
    on<PressSaveButtonEvent>(_onPressSave);
    on<AddExperienceEvent>(_onAddExperience);
    on<ChangeNameEvent>(_onChangeName);
    on<ChangeLocationEvent>(_onChangeLocation);
    on<ChangeLanguageEvent>(_onChangeLanguage);
    on<ChangeExperienceEvent>(_onChangeExperience);
    on<ChangeAvatarEvent>(_onChangeAvatar);
    on<RemoveExperienceEvent>(_onRemoveExperience);
  }

  final IUserInfoRepository userInfoRepository;

  Future<void> _onLoadUserInfo(
      LoadUserInfoEvent event, Emitter<EditScreenState> emit) async {
    try {
      final info = await userInfoRepository.fetchUserInfo();
      emit(EditScreenLoadedState(userInfo: info));
    } catch (e) {
      log(e.toString());
      emit(EditScreenErrorState(message: Strings.errorFetchingData));
    }
  }

  Future<void> _onPressSave(
      PressSaveButtonEvent event, Emitter<EditScreenState> emit) async {
    final currentState = state;
    if (currentState is EditScreenLoadedState) {
      try {
        await userInfoRepository.updateUserInfo(currentState.userInfo);
        emit(EditScreenNavigateState());
      } catch (e) {
        log(e.toString());
        emit(EditScreenErrorState(message: Strings.errorFetchingData));
      }
    }
  }

  Future<void> _onAddExperience(
      AddExperienceEvent event, Emitter<EditScreenState> emit) async {
    final currentState = state as EditScreenLoadedState;
    emit(
      EditScreenLoadedState(
        userInfo: currentState.userInfo.copyWith(
          experienceEntity: currentState.userInfo.experienceEntity.copyWith(
            items: currentState.userInfo.experienceEntity.items
              ?..add(
                ExperienceItem(title: '', years: 0),
              ),
          ),
        ),
      ),
    );
  }

  Future<void> _onChangeLocation(
      ChangeLocationEvent event, Emitter<EditScreenState> emit) async {
    final userinfo = (state as EditScreenLoadedState).userInfo;
    emit(
      EditScreenLoadedState(
        userInfo: userinfo.copyWith(
          location: event.newLocation,
        ),
      ),
    );
  }

  Future<void> _onChangeName(
      ChangeNameEvent event, Emitter<EditScreenState> emit) async {
    final userinfo = (state as EditScreenLoadedState).userInfo;
    emit(
      EditScreenLoadedState(
        userInfo: userinfo.copyWith(
          fullname: event.newName,
        ),
      ),
    );
  }

  Future<void> _onChangeLanguage(
      ChangeLanguageEvent event, Emitter<EditScreenState> emit) async {
    // Заглушка
  }

  Future<void> _onChangeExperience(
      ChangeExperienceEvent event, Emitter<EditScreenState> emit) async {
    final currentState = state as EditScreenLoadedState;
    final updatedItems = List<ExperienceItem>.from(
        currentState.userInfo.experienceEntity.items!);
    updatedItems[event.index] = event.item;

    emit(
      EditScreenLoadedState(
        userInfo: currentState.userInfo.copyWith(
          experienceEntity: currentState.userInfo.experienceEntity.copyWith(
            items: updatedItems,
          ),
        ),
      ),
    );
  }

  Future<void> _onChangeAvatar(
      ChangeAvatarEvent event, Emitter<EditScreenState> emit) async {
    // Заглушка
  }

  String? validateName(String? name) {
    final RegExp regex = RegExp(r'[^a-zA-Z0-9\s]');
    if (regex.hasMatch(name ?? '')) {
      return Strings.specialSymbols;
    }
    return null;
  }

  String? validateLocation(String? location) {
    return null;
  }

  Future<void> _onRemoveExperience(
      RemoveExperienceEvent event, Emitter<EditScreenState> emit) async {
    final currentState = state as EditScreenLoadedState;
    final updatedItems = List<ExperienceItem>.from(
        currentState.userInfo.experienceEntity.items!);
    updatedItems.removeAt(event.index);

    emit(
      EditScreenLoadedState(
        userInfo: currentState.userInfo.copyWith(
          experienceEntity: currentState.userInfo.experienceEntity.copyWith(
            items: updatedItems,
          ),
        ),
      ),
    );
  }
}
