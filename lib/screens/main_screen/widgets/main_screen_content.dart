import 'package:axeta/res/colors.dart';
import 'package:axeta/res/strings/strings.dart';
import 'package:axeta/res/typography.dart';
import 'package:axeta/screens/main_screen/bloc/main_screen_bloc.dart';
import 'package:axeta/screens/main_screen/bloc/main_screen_events.dart';
import 'package:axeta/screens/main_screen/bloc/main_screen_states.dart';
import 'package:axeta/screens/main_screen/widgets/experience_section.dart';
import 'package:axeta/screens/main_screen/widgets/header_row.dart';
import 'package:axeta/screens/main_screen/widgets/map_widget.dart';
import 'package:axeta/screens/main_screen/widgets/personal_block.dart';
import 'package:axeta/widgets/portfolio_section.dart';
import 'package:axeta/widgets/info_section.dart';
import 'package:axeta/widgets/quote_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenContent extends StatelessWidget {
  const MainScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
        if (state is! MainScreenLoadedState) return const SizedBox();
        final user = state.userInfo;
        final location = state.location;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderRow(
                      avatarPath: user.avatarPath,
                    ),
                    const SizedBox(height: 24.0),
                    PersonalBlock(
                      name: user.fullname,
                      location: user.location,
                      language: user.language,
                    ),
                    const SizedBox(height: 24.0),
                  ],
                ),
              ),
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
                            child: ExperienceSection(
                              items: user.experienceEntity,
                            ),
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
                          ),
                          Center(
                            child: SizedBox.square(
                              dimension: 358,
                              child: MapWidget(
                                latitude: location['lat']!,
                                longitude: location['lon']!,
                              ),
                            ),
                          ),
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
