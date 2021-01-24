import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/colors_generated/colors_bloc.dart';
import '../../../blocs/colors_generated/colors_event.dart';
import '../../../blocs/colors_generated/colors_state.dart';
import '../../widgets/animated/no_network.dart';
import '../../widgets/colors_list.dart';

class ColorsGenerator extends StatelessWidget {
  const ColorsGenerator();

  @override
  Widget build(BuildContext context) => BlocBuilder<ColorsBloc, ColorsState>(builder: (context, state) {
        if (state is ColorsInitial || state is ColorsFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Flexible(child: NoNetwork()),
                const SizedBox(height: 16),
                const Text(
                  'OH NO!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text('No internet connection with a server.'),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  icon: const Icon(Icons.refresh_outlined, size: 20),
                  label: const Text('TRY AGAIN'),
                  autofocus: true,
                  onPressed: () => BlocProvider.of<ColorsBloc>(context).add(const ColorsStarted()),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        } else if (state is ColorsLoadInProgress) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ColorsLoadSuccess) {
          return ColorsList(state.colorsAI);
        }
        return const Center(child: CircularProgressIndicator(backgroundColor: Colors.red));
      });
}
