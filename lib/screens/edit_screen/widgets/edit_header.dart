import 'package:axeta/res/colors.dart';
import 'package:axeta/res/images.dart';
import 'package:axeta/res/strings/strings.dart';
import 'package:axeta/res/typography.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_bloc.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_events.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_state.dart';
import 'package:axeta/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditHeader extends StatelessWidget {
  const EditHeader({
    required this.avatarPath,
    required this.formKey,
    super.key,
  });

  final String? avatarPath;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditScreenBloc>();
    return BlocListener<EditScreenBloc, EditScreenState>(
      listener: (context, state) {
        if (state is EditScreenNavigateState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen()),
            (route) => false,
          );
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => bloc.add(ChangeAvatarEvent()),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                avatarPath == null
                    ? SizedBox.square(
                        dimension: 72.0,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.bgAvatar,
                          ),
                          child: SvgPicture.asset(
                            height: 36,
                            width: 36,
                            fit: BoxFit.scaleDown,
                            AppImages.person,
                          ),
                        ),
                      )
                    : const SizedBox(),
                const Positioned(
                  right: -14,
                  child: SizedBox.square(
                    dimension: 32,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.edit,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                bloc.add(PressSaveButtonEvent());
              }
            },
            child: Text(
              Strings.done,
              style: AppTypography.link,
            ),
          )
        ],
      ),
    );
  }
}
