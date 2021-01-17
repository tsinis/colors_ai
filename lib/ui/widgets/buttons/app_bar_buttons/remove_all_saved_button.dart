import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';

import '../../../../blocs/colors_saved/saved_bloc.dart';
import '../../../../blocs/colors_saved/saved_event.dart';

class RemoveAllSavedButton extends StatelessWidget {
  const RemoveAllSavedButton();
  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Mdi.bookmarkRemoveOutline, size: 25),
        onPressed: () => BlocProvider.of<SavedBloc>(context).add(
          const SavedRemoveAllEvent(),
        ),
      );
}
