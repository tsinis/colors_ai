// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() notFinished,
    required TResult Function() doneSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? notFinished,
    TResult? Function()? doneSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? notFinished,
    TResult Function()? doneSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnboardingInitial value) initial,
    required TResult Function(_OnboardingLoading value) loading,
    required TResult Function(_OnboardingNotFinished value) notFinished,
    required TResult Function(_OnboardingDoneSuccess value) doneSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnboardingInitial value)? initial,
    TResult? Function(_OnboardingLoading value)? loading,
    TResult? Function(_OnboardingNotFinished value)? notFinished,
    TResult? Function(_OnboardingDoneSuccess value)? doneSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnboardingInitial value)? initial,
    TResult Function(_OnboardingLoading value)? loading,
    TResult Function(_OnboardingNotFinished value)? notFinished,
    TResult Function(_OnboardingDoneSuccess value)? doneSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnboardingInitialImplCopyWith<$Res> {
  factory _$$OnboardingInitialImplCopyWith(_$OnboardingInitialImpl value,
          $Res Function(_$OnboardingInitialImpl) then) =
      __$$OnboardingInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnboardingInitialImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingInitialImpl>
    implements _$$OnboardingInitialImplCopyWith<$Res> {
  __$$OnboardingInitialImplCopyWithImpl(_$OnboardingInitialImpl _value,
      $Res Function(_$OnboardingInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnboardingInitialImpl implements _OnboardingInitial {
  const _$OnboardingInitialImpl();

  @override
  String toString() {
    return 'OnboardingState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnboardingInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() notFinished,
    required TResult Function() doneSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? notFinished,
    TResult? Function()? doneSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? notFinished,
    TResult Function()? doneSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnboardingInitial value) initial,
    required TResult Function(_OnboardingLoading value) loading,
    required TResult Function(_OnboardingNotFinished value) notFinished,
    required TResult Function(_OnboardingDoneSuccess value) doneSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnboardingInitial value)? initial,
    TResult? Function(_OnboardingLoading value)? loading,
    TResult? Function(_OnboardingNotFinished value)? notFinished,
    TResult? Function(_OnboardingDoneSuccess value)? doneSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnboardingInitial value)? initial,
    TResult Function(_OnboardingLoading value)? loading,
    TResult Function(_OnboardingNotFinished value)? notFinished,
    TResult Function(_OnboardingDoneSuccess value)? doneSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _OnboardingInitial implements OnboardingState {
  const factory _OnboardingInitial() = _$OnboardingInitialImpl;
}

/// @nodoc
abstract class _$$OnboardingLoadingImplCopyWith<$Res> {
  factory _$$OnboardingLoadingImplCopyWith(_$OnboardingLoadingImpl value,
          $Res Function(_$OnboardingLoadingImpl) then) =
      __$$OnboardingLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnboardingLoadingImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingLoadingImpl>
    implements _$$OnboardingLoadingImplCopyWith<$Res> {
  __$$OnboardingLoadingImplCopyWithImpl(_$OnboardingLoadingImpl _value,
      $Res Function(_$OnboardingLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnboardingLoadingImpl implements _OnboardingLoading {
  const _$OnboardingLoadingImpl();

  @override
  String toString() {
    return 'OnboardingState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnboardingLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() notFinished,
    required TResult Function() doneSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? notFinished,
    TResult? Function()? doneSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? notFinished,
    TResult Function()? doneSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnboardingInitial value) initial,
    required TResult Function(_OnboardingLoading value) loading,
    required TResult Function(_OnboardingNotFinished value) notFinished,
    required TResult Function(_OnboardingDoneSuccess value) doneSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnboardingInitial value)? initial,
    TResult? Function(_OnboardingLoading value)? loading,
    TResult? Function(_OnboardingNotFinished value)? notFinished,
    TResult? Function(_OnboardingDoneSuccess value)? doneSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnboardingInitial value)? initial,
    TResult Function(_OnboardingLoading value)? loading,
    TResult Function(_OnboardingNotFinished value)? notFinished,
    TResult Function(_OnboardingDoneSuccess value)? doneSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _OnboardingLoading implements OnboardingState {
  const factory _OnboardingLoading() = _$OnboardingLoadingImpl;
}

/// @nodoc
abstract class _$$OnboardingNotFinishedImplCopyWith<$Res> {
  factory _$$OnboardingNotFinishedImplCopyWith(
          _$OnboardingNotFinishedImpl value,
          $Res Function(_$OnboardingNotFinishedImpl) then) =
      __$$OnboardingNotFinishedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnboardingNotFinishedImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingNotFinishedImpl>
    implements _$$OnboardingNotFinishedImplCopyWith<$Res> {
  __$$OnboardingNotFinishedImplCopyWithImpl(_$OnboardingNotFinishedImpl _value,
      $Res Function(_$OnboardingNotFinishedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnboardingNotFinishedImpl implements _OnboardingNotFinished {
  const _$OnboardingNotFinishedImpl();

  @override
  String toString() {
    return 'OnboardingState.notFinished()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingNotFinishedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() notFinished,
    required TResult Function() doneSuccess,
  }) {
    return notFinished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? notFinished,
    TResult? Function()? doneSuccess,
  }) {
    return notFinished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? notFinished,
    TResult Function()? doneSuccess,
    required TResult orElse(),
  }) {
    if (notFinished != null) {
      return notFinished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnboardingInitial value) initial,
    required TResult Function(_OnboardingLoading value) loading,
    required TResult Function(_OnboardingNotFinished value) notFinished,
    required TResult Function(_OnboardingDoneSuccess value) doneSuccess,
  }) {
    return notFinished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnboardingInitial value)? initial,
    TResult? Function(_OnboardingLoading value)? loading,
    TResult? Function(_OnboardingNotFinished value)? notFinished,
    TResult? Function(_OnboardingDoneSuccess value)? doneSuccess,
  }) {
    return notFinished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnboardingInitial value)? initial,
    TResult Function(_OnboardingLoading value)? loading,
    TResult Function(_OnboardingNotFinished value)? notFinished,
    TResult Function(_OnboardingDoneSuccess value)? doneSuccess,
    required TResult orElse(),
  }) {
    if (notFinished != null) {
      return notFinished(this);
    }
    return orElse();
  }
}

abstract class _OnboardingNotFinished implements OnboardingState {
  const factory _OnboardingNotFinished() = _$OnboardingNotFinishedImpl;
}

/// @nodoc
abstract class _$$OnboardingDoneSuccessImplCopyWith<$Res> {
  factory _$$OnboardingDoneSuccessImplCopyWith(
          _$OnboardingDoneSuccessImpl value,
          $Res Function(_$OnboardingDoneSuccessImpl) then) =
      __$$OnboardingDoneSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnboardingDoneSuccessImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingDoneSuccessImpl>
    implements _$$OnboardingDoneSuccessImplCopyWith<$Res> {
  __$$OnboardingDoneSuccessImplCopyWithImpl(_$OnboardingDoneSuccessImpl _value,
      $Res Function(_$OnboardingDoneSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnboardingDoneSuccessImpl implements _OnboardingDoneSuccess {
  const _$OnboardingDoneSuccessImpl();

  @override
  String toString() {
    return 'OnboardingState.doneSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingDoneSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() notFinished,
    required TResult Function() doneSuccess,
  }) {
    return doneSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? notFinished,
    TResult? Function()? doneSuccess,
  }) {
    return doneSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? notFinished,
    TResult Function()? doneSuccess,
    required TResult orElse(),
  }) {
    if (doneSuccess != null) {
      return doneSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnboardingInitial value) initial,
    required TResult Function(_OnboardingLoading value) loading,
    required TResult Function(_OnboardingNotFinished value) notFinished,
    required TResult Function(_OnboardingDoneSuccess value) doneSuccess,
  }) {
    return doneSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnboardingInitial value)? initial,
    TResult? Function(_OnboardingLoading value)? loading,
    TResult? Function(_OnboardingNotFinished value)? notFinished,
    TResult? Function(_OnboardingDoneSuccess value)? doneSuccess,
  }) {
    return doneSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnboardingInitial value)? initial,
    TResult Function(_OnboardingLoading value)? loading,
    TResult Function(_OnboardingNotFinished value)? notFinished,
    TResult Function(_OnboardingDoneSuccess value)? doneSuccess,
    required TResult orElse(),
  }) {
    if (doneSuccess != null) {
      return doneSuccess(this);
    }
    return orElse();
  }
}

abstract class _OnboardingDoneSuccess implements OnboardingState {
  const factory _OnboardingDoneSuccess() = _$OnboardingDoneSuccessImpl;
}
