// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() finished,
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? finished,
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? finished,
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnboardingFinished value) finished,
    required TResult Function(_OnboardingStarted value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnboardingFinished value)? finished,
    TResult? Function(_OnboardingStarted value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnboardingFinished value)? finished,
    TResult Function(_OnboardingStarted value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingEventCopyWith<$Res> {
  factory $OnboardingEventCopyWith(
          OnboardingEvent value, $Res Function(OnboardingEvent) then) =
      _$OnboardingEventCopyWithImpl<$Res, OnboardingEvent>;
}

/// @nodoc
class _$OnboardingEventCopyWithImpl<$Res, $Val extends OnboardingEvent>
    implements $OnboardingEventCopyWith<$Res> {
  _$OnboardingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnboardingFinishedImplCopyWith<$Res> {
  factory _$$OnboardingFinishedImplCopyWith(_$OnboardingFinishedImpl value,
          $Res Function(_$OnboardingFinishedImpl) then) =
      __$$OnboardingFinishedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnboardingFinishedImplCopyWithImpl<$Res>
    extends _$OnboardingEventCopyWithImpl<$Res, _$OnboardingFinishedImpl>
    implements _$$OnboardingFinishedImplCopyWith<$Res> {
  __$$OnboardingFinishedImplCopyWithImpl(_$OnboardingFinishedImpl _value,
      $Res Function(_$OnboardingFinishedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnboardingFinishedImpl implements _OnboardingFinished {
  const _$OnboardingFinishedImpl();

  @override
  String toString() {
    return 'OnboardingEvent.finished()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnboardingFinishedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() finished,
    required TResult Function() started,
  }) {
    return finished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? finished,
    TResult? Function()? started,
  }) {
    return finished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? finished,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnboardingFinished value) finished,
    required TResult Function(_OnboardingStarted value) started,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnboardingFinished value)? finished,
    TResult? Function(_OnboardingStarted value)? started,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnboardingFinished value)? finished,
    TResult Function(_OnboardingStarted value)? started,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class _OnboardingFinished implements OnboardingEvent {
  const factory _OnboardingFinished() = _$OnboardingFinishedImpl;
}

/// @nodoc
abstract class _$$OnboardingStartedImplCopyWith<$Res> {
  factory _$$OnboardingStartedImplCopyWith(_$OnboardingStartedImpl value,
          $Res Function(_$OnboardingStartedImpl) then) =
      __$$OnboardingStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnboardingStartedImplCopyWithImpl<$Res>
    extends _$OnboardingEventCopyWithImpl<$Res, _$OnboardingStartedImpl>
    implements _$$OnboardingStartedImplCopyWith<$Res> {
  __$$OnboardingStartedImplCopyWithImpl(_$OnboardingStartedImpl _value,
      $Res Function(_$OnboardingStartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnboardingStartedImpl implements _OnboardingStarted {
  const _$OnboardingStartedImpl();

  @override
  String toString() {
    return 'OnboardingEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnboardingStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() finished,
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? finished,
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? finished,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnboardingFinished value) finished,
    required TResult Function(_OnboardingStarted value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnboardingFinished value)? finished,
    TResult? Function(_OnboardingStarted value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnboardingFinished value)? finished,
    TResult Function(_OnboardingStarted value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _OnboardingStarted implements OnboardingEvent {
  const factory _OnboardingStarted() = _$OnboardingStartedImpl;
}
