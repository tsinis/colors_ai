// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'about_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AboutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failure,
    required TResult Function() initial,
    required TResult Function(String appVersion) loaded,
    required TResult Function(String currentLocale) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? initial,
    TResult Function(String appVersion)? loaded,
    TResult Function(String currentLocale)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? initial,
    TResult Function(String appVersion)? loaded,
    TResult Function(String currentLocale)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AboutFailure value) failure,
    required TResult Function(_AboutInitial value) initial,
    required TResult Function(_AboutLoaded value) loaded,
    required TResult Function(_AboutStarted value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AboutFailure value)? failure,
    TResult Function(_AboutInitial value)? initial,
    TResult Function(_AboutLoaded value)? loaded,
    TResult Function(_AboutStarted value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AboutFailure value)? failure,
    TResult Function(_AboutInitial value)? initial,
    TResult Function(_AboutLoaded value)? loaded,
    TResult Function(_AboutStarted value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutStateCopyWith<$Res> {
  factory $AboutStateCopyWith(
          AboutState value, $Res Function(AboutState) then) =
      _$AboutStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AboutStateCopyWithImpl<$Res> implements $AboutStateCopyWith<$Res> {
  _$AboutStateCopyWithImpl(this._value, this._then);

  final AboutState _value;
  // ignore: unused_field
  final $Res Function(AboutState) _then;
}

/// @nodoc
abstract class _$$_AboutFailureCopyWith<$Res> {
  factory _$$_AboutFailureCopyWith(
          _$_AboutFailure value, $Res Function(_$_AboutFailure) then) =
      __$$_AboutFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AboutFailureCopyWithImpl<$Res> extends _$AboutStateCopyWithImpl<$Res>
    implements _$$_AboutFailureCopyWith<$Res> {
  __$$_AboutFailureCopyWithImpl(
      _$_AboutFailure _value, $Res Function(_$_AboutFailure) _then)
      : super(_value, (v) => _then(v as _$_AboutFailure));

  @override
  _$_AboutFailure get _value => super._value as _$_AboutFailure;
}

/// @nodoc

class _$_AboutFailure implements _AboutFailure {
  const _$_AboutFailure();

  @override
  String toString() {
    return 'AboutState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AboutFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failure,
    required TResult Function() initial,
    required TResult Function(String appVersion) loaded,
    required TResult Function(String currentLocale) started,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? initial,
    TResult Function(String appVersion)? loaded,
    TResult Function(String currentLocale)? started,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? initial,
    TResult Function(String appVersion)? loaded,
    TResult Function(String currentLocale)? started,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AboutFailure value) failure,
    required TResult Function(_AboutInitial value) initial,
    required TResult Function(_AboutLoaded value) loaded,
    required TResult Function(_AboutStarted value) started,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AboutFailure value)? failure,
    TResult Function(_AboutInitial value)? initial,
    TResult Function(_AboutLoaded value)? loaded,
    TResult Function(_AboutStarted value)? started,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AboutFailure value)? failure,
    TResult Function(_AboutInitial value)? initial,
    TResult Function(_AboutLoaded value)? loaded,
    TResult Function(_AboutStarted value)? started,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _AboutFailure implements AboutState {
  const factory _AboutFailure() = _$_AboutFailure;
}

/// @nodoc
abstract class _$$_AboutInitialCopyWith<$Res> {
  factory _$$_AboutInitialCopyWith(
          _$_AboutInitial value, $Res Function(_$_AboutInitial) then) =
      __$$_AboutInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AboutInitialCopyWithImpl<$Res> extends _$AboutStateCopyWithImpl<$Res>
    implements _$$_AboutInitialCopyWith<$Res> {
  __$$_AboutInitialCopyWithImpl(
      _$_AboutInitial _value, $Res Function(_$_AboutInitial) _then)
      : super(_value, (v) => _then(v as _$_AboutInitial));

  @override
  _$_AboutInitial get _value => super._value as _$_AboutInitial;
}

/// @nodoc

class _$_AboutInitial implements _AboutInitial {
  const _$_AboutInitial();

  @override
  String toString() {
    return 'AboutState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AboutInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failure,
    required TResult Function() initial,
    required TResult Function(String appVersion) loaded,
    required TResult Function(String currentLocale) started,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? initial,
    TResult Function(String appVersion)? loaded,
    TResult Function(String currentLocale)? started,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? initial,
    TResult Function(String appVersion)? loaded,
    TResult Function(String currentLocale)? started,
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
    required TResult Function(_AboutFailure value) failure,
    required TResult Function(_AboutInitial value) initial,
    required TResult Function(_AboutLoaded value) loaded,
    required TResult Function(_AboutStarted value) started,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AboutFailure value)? failure,
    TResult Function(_AboutInitial value)? initial,
    TResult Function(_AboutLoaded value)? loaded,
    TResult Function(_AboutStarted value)? started,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AboutFailure value)? failure,
    TResult Function(_AboutInitial value)? initial,
    TResult Function(_AboutLoaded value)? loaded,
    TResult Function(_AboutStarted value)? started,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AboutInitial implements AboutState {
  const factory _AboutInitial() = _$_AboutInitial;
}

/// @nodoc
abstract class _$$_AboutLoadedCopyWith<$Res> {
  factory _$$_AboutLoadedCopyWith(
          _$_AboutLoaded value, $Res Function(_$_AboutLoaded) then) =
      __$$_AboutLoadedCopyWithImpl<$Res>;
  $Res call({String appVersion});
}

/// @nodoc
class __$$_AboutLoadedCopyWithImpl<$Res> extends _$AboutStateCopyWithImpl<$Res>
    implements _$$_AboutLoadedCopyWith<$Res> {
  __$$_AboutLoadedCopyWithImpl(
      _$_AboutLoaded _value, $Res Function(_$_AboutLoaded) _then)
      : super(_value, (v) => _then(v as _$_AboutLoaded));

  @override
  _$_AboutLoaded get _value => super._value as _$_AboutLoaded;

  @override
  $Res call({
    Object? appVersion = freezed,
  }) {
    return _then(_$_AboutLoaded(
      appVersion: appVersion == freezed
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AboutLoaded implements _AboutLoaded {
  const _$_AboutLoaded({required this.appVersion});

  @override
  final String appVersion;

  @override
  String toString() {
    return 'AboutState.loaded(appVersion: $appVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AboutLoaded &&
            const DeepCollectionEquality()
                .equals(other.appVersion, appVersion));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(appVersion));

  @JsonKey(ignore: true)
  @override
  _$$_AboutLoadedCopyWith<_$_AboutLoaded> get copyWith =>
      __$$_AboutLoadedCopyWithImpl<_$_AboutLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failure,
    required TResult Function() initial,
    required TResult Function(String appVersion) loaded,
    required TResult Function(String currentLocale) started,
  }) {
    return loaded(appVersion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? initial,
    TResult Function(String appVersion)? loaded,
    TResult Function(String currentLocale)? started,
  }) {
    return loaded?.call(appVersion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? initial,
    TResult Function(String appVersion)? loaded,
    TResult Function(String currentLocale)? started,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(appVersion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AboutFailure value) failure,
    required TResult Function(_AboutInitial value) initial,
    required TResult Function(_AboutLoaded value) loaded,
    required TResult Function(_AboutStarted value) started,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AboutFailure value)? failure,
    TResult Function(_AboutInitial value)? initial,
    TResult Function(_AboutLoaded value)? loaded,
    TResult Function(_AboutStarted value)? started,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AboutFailure value)? failure,
    TResult Function(_AboutInitial value)? initial,
    TResult Function(_AboutLoaded value)? loaded,
    TResult Function(_AboutStarted value)? started,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _AboutLoaded implements AboutState {
  const factory _AboutLoaded({required final String appVersion}) =
      _$_AboutLoaded;

  String get appVersion => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_AboutLoadedCopyWith<_$_AboutLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AboutStartedCopyWith<$Res> {
  factory _$$_AboutStartedCopyWith(
          _$_AboutStarted value, $Res Function(_$_AboutStarted) then) =
      __$$_AboutStartedCopyWithImpl<$Res>;
  $Res call({String currentLocale});
}

/// @nodoc
class __$$_AboutStartedCopyWithImpl<$Res> extends _$AboutStateCopyWithImpl<$Res>
    implements _$$_AboutStartedCopyWith<$Res> {
  __$$_AboutStartedCopyWithImpl(
      _$_AboutStarted _value, $Res Function(_$_AboutStarted) _then)
      : super(_value, (v) => _then(v as _$_AboutStarted));

  @override
  _$_AboutStarted get _value => super._value as _$_AboutStarted;

  @override
  $Res call({
    Object? currentLocale = freezed,
  }) {
    return _then(_$_AboutStarted(
      currentLocale: currentLocale == freezed
          ? _value.currentLocale
          : currentLocale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AboutStarted implements _AboutStarted {
  const _$_AboutStarted({required this.currentLocale});

  @override
  final String currentLocale;

  @override
  String toString() {
    return 'AboutState.started(currentLocale: $currentLocale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AboutStarted &&
            const DeepCollectionEquality()
                .equals(other.currentLocale, currentLocale));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentLocale));

  @JsonKey(ignore: true)
  @override
  _$$_AboutStartedCopyWith<_$_AboutStarted> get copyWith =>
      __$$_AboutStartedCopyWithImpl<_$_AboutStarted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failure,
    required TResult Function() initial,
    required TResult Function(String appVersion) loaded,
    required TResult Function(String currentLocale) started,
  }) {
    return started(currentLocale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? initial,
    TResult Function(String appVersion)? loaded,
    TResult Function(String currentLocale)? started,
  }) {
    return started?.call(currentLocale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? initial,
    TResult Function(String appVersion)? loaded,
    TResult Function(String currentLocale)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(currentLocale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AboutFailure value) failure,
    required TResult Function(_AboutInitial value) initial,
    required TResult Function(_AboutLoaded value) loaded,
    required TResult Function(_AboutStarted value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AboutFailure value)? failure,
    TResult Function(_AboutInitial value)? initial,
    TResult Function(_AboutLoaded value)? loaded,
    TResult Function(_AboutStarted value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AboutFailure value)? failure,
    TResult Function(_AboutInitial value)? initial,
    TResult Function(_AboutLoaded value)? loaded,
    TResult Function(_AboutStarted value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _AboutStarted implements AboutState {
  const factory _AboutStarted({required final String currentLocale}) =
      _$_AboutStarted;

  String get currentLocale => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_AboutStartedCopyWith<_$_AboutStarted> get copyWith =>
      throw _privateConstructorUsedError;
}
