import 'package:axeta/entities/user_info_entity.dart';

abstract class IUserInfoApi {
  Future<UserInfoEntity> fetchUserInfo();
  Future<void> updateUserInfo(UserInfoEntity info);
}