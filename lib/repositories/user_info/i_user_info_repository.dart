import 'package:axeta/entities/user_info_entity.dart';

abstract class IUserInfoRepository {
  Future<UserInfoEntity> fetchUserInfo();
  Future<void> updateUserInfo(UserInfoEntity info);
}