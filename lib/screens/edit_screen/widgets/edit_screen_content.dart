import 'package:axeta/res/strings/strings.dart';
import 'package:axeta/res/typography.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_bloc.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_events.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_state.dart';
import 'package:axeta/screens/edit_screen/widgets/edit_experience_section.dart';
import 'package:axeta/screens/edit_screen/widgets/edit_header.dart';
import 'package:axeta/screens/edit_screen/widgets/edit_personal_block.dart';
import 'package:axeta/widgets/info_section.dart';
import 'package:axeta/widgets/portfolio_section.dart';
import 'package:axeta/widgets/quote_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditScreenContent extends StatelessWidget {
  EditScreenContent({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<EditScreenBloc>(),
      builder: (context, state) {
        if (state is! EditScreenLoadedState) return const SizedBox();
        final user = state.userInfo;
        final bloc = context.read<EditScreenBloc>();

        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditHeader(
                      avatarPath: user.avatarPath,
                      formKey: _formKey,
                    ),
                    const SizedBox(height: 24.0),
                    EditPersonalBlock(
                      formKey: _formKey,
                      name: user.fullname,
                      location: user.location,
                      language: user.language,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              DecoratedBox(
                decoration: const BoxDecoration(color: Colors.white),
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...[
                          InfoSection(
                            title: Strings.portfolio,
                            child:
                                PortfolioSection(items: user.portfolioEntity),
                          ),
                          InfoSection(
                            title: Strings.experience,
                            child: EditExperienceSection(
                              items: user.experienceEntity,
                            ),
                            onTap: () {
                              bloc.add(AddExperienceEvent());
                            },
                          ),
                          InfoSection(
                            title: Strings.availability,
                            child: Text(
                              user.availability,
                              style: AppTypography.body,
                            ),
                          ),
                          InfoSection(
                            title: Strings.environment,
                            child: Text(
                              user.environment,
                              style: AppTypography.body,
                            ),
                          ),
                          QuoteSection(
                            title: Strings.quote1,
                            quote: user.quote1,
                          ),
                          QuoteSection(
                            title: Strings.quote2,
                            quote: user.quote2,
                          )
                        ]
                            .expand((widget) =>
                                [widget, const SizedBox(height: 16)])
                            .toList()
                          ..removeLast(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
