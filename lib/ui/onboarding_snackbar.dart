import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/data_saving/datasaving_bloc.dart';

class OnboardingSnackBar extends SnackBar {
  const OnboardingSnackBar(this._text, this._action) : super(content: _text, action: _action);

  final Text _text;
  final SnackBarAction _action;

  Widget build(BuildContext context) => BlocBuilder<DataStorageBloc, DataStorageState>(
        builder: (context, state) {
          print(state);
          print('up');
          return (state is DataStorageFavsBoardingLoadSuccess && state is DataStorageOnboardingLoadSuccess)
              ? const SizedBox.shrink()
              : SnackBar(
                  backgroundColor: Theme.of(context).dividerColor,
                  duration: const Duration(seconds: 5),
                  content: _text,
                  action: _action,
                );
        },
      );
}
