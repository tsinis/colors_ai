import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../favorites/blocs/add_favorites/fab_bloc.dart';
import '../../blocs/colors_generated/colors_bloc.dart';
import '../widgets/animated/no_network.dart';
import '../widgets/lists/colors_list.dart';

class GenColorsTab extends StatelessWidget {
  const GenColorsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ColorsBloc, ColorsState>(
        builder: (_, ColorsState state) {
          if (state is ColorsLoadInProgress || state is ColorsInitial) {
            BlocProvider.of<FabBloc>(context).add(const FabHided());

            return const Center(child: CircularProgressIndicator());
          }
          if (state is! ColorsFailure) {
            state as ColorsChangeSuccess;
            BlocProvider.of<FabBloc>(context).add(const FabShowed());

            return ColorsList(state.palette);
          }
          BlocProvider.of<FabBloc>(context).add(const FabHided());

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Flexible(child: FractionallySizedBox(widthFactor: 0.8, heightFactor: 0.8, child: NoNetwork())),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(context).noConnectionTitle,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n${AppLocalizations.of(context).noConnectionDescription}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            height: 3,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 56, bottom: 24),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.refresh_outlined, size: 20),
                    label: Text(AppLocalizations.of(context).returnButtonLabel),
                    onPressed: () => BlocProvider.of<ColorsBloc>(context).add(const ColorsStarted()),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
