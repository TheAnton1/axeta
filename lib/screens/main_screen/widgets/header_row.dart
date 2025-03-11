import 'package:axeta/res/colors.dart';
import 'package:axeta/res/images.dart';
import 'package:axeta/res/strings/strings.dart';
import 'package:axeta/res/typography.dart';
import 'package:axeta/screens/edit_screen/edit_screen.dart';
import 'package:axeta/screens/main_screen/bloc/main_screen_bloc.dart';
import 'package:axeta/screens/main_screen/bloc/main_screen_events.dart';
import 'package:axeta/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    required this.avatarPath,
    super.key,
  });

  final String? avatarPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        GestureDetector(
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const EditScreen(),
              ),
            );
          },
          child: SizedBox.square(
              dimension: 24.0, child: SvgPicture.asset(AppImages.pencil)),
        ),
      ],
    );
  }
}
