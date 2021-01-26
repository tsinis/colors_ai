import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/colors_generated/colors_bloc.dart';
import '../../../blocs/colors_generated/colors_event.dart';
import '../../../blocs/colors_generated/colors_state.dart';
import '../../../blocs/floating_action_button/fab_bloc.dart';
import '../../../blocs/floating_action_button/fab_event.dart';
import '../../widgets/animated/no_network.dart';
import '../../widgets/lists/colors_list.dart';

class ColorsGenerator extends StatelessWidget {
  const ColorsGenerator();

  @override
  Widget build(BuildContext context) => BlocBuilder<ColorsBloc, ColorsState>(builder: (context, state) {
        if (state is ColorsLoadInProgress) {
          BlocProvider.of<FabBloc>(context).add(const FabHided());
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ColorsLoadSuccess) {
          BlocProvider.of<FabBloc>(context).add(const FabShowed());
          return ColorsList(state.colorsAI);
        }
        BlocProvider.of<FabBloc>(context).add(const FabHided());
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Flexible(child: FractionallySizedBox(widthFactor: 0.6, heightFactor: 0.6, child: NoNetwork())),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'OH NO!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nUnable to connect to AI server.',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black, height: 2),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.refresh_outlined, size: 20),
                  label: const Text('TRY AGAIN'),
                  autofocus: true,
                  onPressed: () => BlocProvider.of<ColorsBloc>(context).add(const ColorsStarted()),
                ),
              ),
            ],
          ),
        );
      });
}
