// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int newTabIndex) changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int newTabIndex)? changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int newTabIndex)? changed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NavigationGeneratorTabStarted value) started,
    required TResult Function(_NavigationTabChanged value) changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NavigationGeneratorTabStarted value)? started,
    TResult? Function(_NavigationTabChanged value)? changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NavigationGeneratorTabStarted value)? started,
    TResult Function(_NavigationTabChanged value)? changed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationEventCopyWith<$Res> {
  factory $NavigationEventCopyWith(
          NavigationEvent value, $Res Function(NavigationEvent) then) =
      _$NavigationEventCopyWithImpl<$Res, NavigationEvent>;
}

/// @nodoc
class _$NavigationEventCopyWithImpl<$Res, $Val extends NavigationEvent>
    implements $NavigationEventCopyWith<$Res> {
  _$NavigationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NavigationGeneratorTabStartedImplCopyWith<$Res> {
  factory _$$NavigationGeneratorTabStartedImplCopyWith(
          _$NavigationGeneratorTabStartedImpl value,
          $Res Function(_$NavigationGeneratorTabStartedImpl) then) =
      __$$NavigationGeneratorTabStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NavigationGeneratorTabStartedImplCopyWithImpl<$Res>
    extends _$NavigationEventCopyWithImpl<$Res,
        _$NavigationGeneratorTabStartedImpl>
    implements _$$NavigationGeneratorTabStartedImplCopyWith<$Res> {
  __$$NavigationGeneratorTabStartedImplCopyWithImpl(
      _$NavigationGeneratorTabStartedImpl _value,
      $Res Function(_$NavigationGeneratorTabStartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NavigationGeneratorTabStartedImpl
    implements _NavigationGeneratorTabStarted {
  const _$NavigationGeneratorTabStartedImpl();

  @override
  String toString() {
    return 'NavigationEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationGeneratorTabStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int newTabIndex) changed,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int newTabIndex)? changed,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int newTabIndex)? changed,
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
    required TResult Function(_NavigationGeneratorTabStarted value) started,
    required TResult Function(_NavigationTabChanged value) changed,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NavigationGeneratorTabStarted value)? started,
    TResult? Function(_NavigationTabChanged value)? changed,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NavigationGeneratorTabStarted value)? started,
    TResult Function(_NavigationTabChanged value)? changed,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _NavigationGeneratorTabStarted implements NavigationEvent {
  const factory _NavigationGeneratorTabStarted() =
      _$NavigationGeneratorTabStartedImpl;
}

/// @nodoc
abstract class _$$NavigationTabChangedImplCopyWith<$Res> {
  factory _$$NavigationTabChangedImplCopyWith(_$NavigationTabChangedImpl value,
          $Res Function(_$NavigationTabChangedImpl) then) =
      __$$NavigationTabChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int newTabIndex});
}

/// @nodoc
class __$$NavigationTabChangedImplCopyWithImpl<$Res>
    extends _$NavigationEventCopyWithImpl<$Res, _$NavigationTabChangedImpl>
    implements _$$NavigationTabChangedImplCopyWith<$Res> {
  __$$NavigationTabChangedImplCopyWithImpl(_$NavigationTabChangedImpl _value,
      $Res Function(_$NavigationTabChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newTabIndex = null,
  }) {
    return _then(_$NavigationTabChangedImpl(
      null == newTabIndex
          ? _value.newTabIndex
          : newTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NavigationTabChangedImpl implements _NavigationTabChanged {
  const _$NavigationTabChangedImpl(this.newTabIndex);

  @override
  final int newTabIndex;

  @override
  String toString() {
    return 'NavigationEvent.changed(newTabIndex: $newTabIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationTabChangedImpl &&
            (identical(other.newTabIndex, newTabIndex) ||
                other.newTabIndex == newTabIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newTabIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationTabChangedImplCopyWith<_$NavigationTabChangedImpl>
      get copyWith =>
          __$$NavigationTabChangedImplCopyWithImpl<_$NavigationTabChangedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int newTabIndex) changed,
  }) {
    return changed(newTabIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int newTabIndex)? changed,
  }) {
    return changed?.call(newTabIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int newTabIndex)? changed,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(newTabIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NavigationGeneratorTabStarted value) started,
    required TResult Function(_NavigationTabChanged value) changed,
  }) {
    return changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NavigationGeneratorTabStarted value)? started,
    TResult? Function(_NavigationTabChanged value)? changed,
  }) {
    return changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NavigationGeneratorTabStarted value)? started,
    TResult Function(_NavigationTabChanged value)? changed,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(this);
    }
    return orElse();
  }
}

abstract class _NavigationTabChanged implements NavigationEvent {
  const factory _NavigationTabChanged(final int newTabIndex) =
      _$NavigationTabChangedImpl;

  int get newTabIndex;
  @JsonKey(ignore: true)
  _$$NavigationTabChangedImplCopyWith<_$NavigationTabChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
