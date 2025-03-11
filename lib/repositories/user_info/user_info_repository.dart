import 'package:axeta/data_sources/user_info/i_user_info_api.dart';
import 'package:axeta/entities/experience_entity.dart';
import 'package:axeta/entities/user_info_entity.dart';
import 'package:axeta/repositories/user_info/i_user_info_repository.dart';

class UserInfoRepository implements IUserInfoRepository {
  UserInfoRepository({required this.userInfoApi});

  final IUserInfoApi userInfoApi;

  @override
  Future<UserInfoEntity> fetchUserInfo() async {
    UserInfoEntity result = await userInfoApi.fetchUserInfo();

    final sortedItems = result.experienceEntity.items?.toList()
      ?..sort((a, b) => b.years.compareTo(a.years));

    result = result.copyWith(
      experienceEntity: result.experienceEntity.copyWith(
        items: sortedItems,
      ),
    );

    return result;
  }

  @override
  Future<void> updateUserInfo(UserInfoEntity info) async {
    return await userInfoApi.updateUserInfo(info);
  }
}
