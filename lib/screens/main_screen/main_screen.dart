import 'package:axeta/di.dart';
import 'package:axeta/res/colors.dart';
import 'package:axeta/res/strings/strings.dart';
import 'package:axeta/screens/main_screen/bloc/main_screen_bloc.dart';
import 'package:axeta/screens/main_screen/bloc/main_screen_events.dart';
import 'package:axeta/screens/main_screen/bloc/main_screen_states.dart';
import 'package:axeta/screens/main_screen/widgets/main_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  static const route = '/main';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = sl<MainScreenBloc>();
        bloc.add(LoadUserInfoEvent());
        return bloc;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.bgSurface,
          body: BlocBuilder<MainScreenBloc, MainScreenState>(
            builder: (context, state) {
              if (state is MainScreenLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MainScreenErrorState) {
                return const Center(
                  child: Text(Strings.errorFetchingData),
                );
              } else if (state is MainScreenLoadedState) {
                return const MainScreenContent();
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
