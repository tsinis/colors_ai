// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
abstract class _$$_NavigationGeneratorTabStartedCopyWith<$Res> {
  factory _$$_NavigationGeneratorTabStartedCopyWith(
          _$_NavigationGeneratorTabStarted value,
          $Res Function(_$_NavigationGeneratorTabStarted) then) =
      __$$_NavigationGeneratorTabStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NavigationGeneratorTabStartedCopyWithImpl<$Res>
    extends _$NavigationEventCopyWithImpl<$Res,
        _$_NavigationGeneratorTabStarted>
    implements _$$_NavigationGeneratorTabStartedCopyWith<$Res> {
  __$$_NavigationGeneratorTabStartedCopyWithImpl(
      _$_NavigationGeneratorTabStarted _value,
      $Res Function(_$_NavigationGeneratorTabStarted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NavigationGeneratorTabStarted
    implements _NavigationGeneratorTabStarted {
  const _$_NavigationGeneratorTabStarted();

  @override
  String toString() {
    return 'NavigationEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavigationGeneratorTabStarted);
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
      _$_NavigationGeneratorTabStarted;
}

/// @nodoc
abstract class _$$_NavigationTabChangedCopyWith<$Res> {
  factory _$$_NavigationTabChangedCopyWith(_$_NavigationTabChanged value,
          $Res Function(_$_NavigationTabChanged) then) =
      __$$_NavigationTabChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({int newTabIndex});
}

/// @nodoc
class __$$_NavigationTabChangedCopyWithImpl<$Res>
    extends _$NavigationEventCopyWithImpl<$Res, _$_NavigationTabChanged>
    implements _$$_NavigationTabChangedCopyWith<$Res> {
  __$$_NavigationTabChangedCopyWithImpl(_$_NavigationTabChanged _value,
      $Res Function(_$_NavigationTabChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newTabIndex = null,
  }) {
    return _then(_$_NavigationTabChanged(
      null == newTabIndex
          ? _value.newTabIndex
          : newTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NavigationTabChanged implements _NavigationTabChanged {
  const _$_NavigationTabChanged(this.newTabIndex);

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
            other is _$_NavigationTabChanged &&
            (identical(other.newTabIndex, newTabIndex) ||
                other.newTabIndex == newTabIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newTabIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NavigationTabChangedCopyWith<_$_NavigationTabChanged> get copyWith =>
      __$$_NavigationTabChangedCopyWithImpl<_$_NavigationTabChanged>(
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
      _$_NavigationTabChanged;

  int get newTabIndex;
  @JsonKey(ignore: true)
  _$$_NavigationTabChangedCopyWith<_$_NavigationTabChanged> get copyWith =>
      throw _privateConstructorUsedError;
}
