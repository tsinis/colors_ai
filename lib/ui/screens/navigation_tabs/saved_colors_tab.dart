import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/colors_saved/saved_bloc.dart';
import '../../../blocs/colors_saved/saved_event.dart';
import '../../../blocs/colors_saved/saved_state.dart';
import '../../../repositories/colors_repository.dart';
import '../../widgets/animated/no_saved_colors.dart';
import '../../widgets/lists/saved_list.dart';

class SavedColorsList extends StatelessWidget {
  const SavedColorsList();
  @override
  Widget build(BuildContext context) => BlocBuilder<SavedBloc, SaveState>(
        builder: (BuildContext context, state) {
          if (state is SaveEmptyInitial) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(
                      child: FractionallySizedBox(widthFactor: 0.5, heightFactor: 0.6, child: NoSavedColors())),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'OOPS!',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nYour Saved Colors list is empty.',
                            style:
                                TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black, height: 2),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.add, size: 20),
                      label: const Text('ADD SOME'),
                      autofocus: true,
                      onPressed: () => BlocProvider.of<SavedBloc>(context)
                          .add(SaveAdded(colorsToSave: context.read<ColorsRepository>().listAsColors)),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is SaveLoadSuccess) {
            return SavedList(state.savedColors.list);
          }
          return Container(color: Colors.blue);
        },
      );
}
