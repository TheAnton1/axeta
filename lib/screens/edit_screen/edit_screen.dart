import 'package:axeta/di.dart';
import 'package:axeta/res/colors.dart';
import 'package:axeta/res/strings/strings.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_bloc.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_events.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_state.dart';
import 'package:axeta/screens/edit_screen/widgets/edit_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  static const route = '/edit';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = sl<EditScreenBloc>();
        bloc.add(LoadUserInfoEvent());
        return bloc;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.bgSurface,
          body: BlocBuilder<EditScreenBloc, EditScreenState>(
            builder: (context, state) {
              if (state is EditScreenLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is EditScreenErrorState) {
                return const Center(
                  child: Text(Strings.errorFetchingData),
                );
              } else if (state is EditScreenLoadedState) {
                return EditScreenContent();
              } else if (state is EditScreenNavigateState) {
                return const Center(child: CircularProgressIndicator());
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
