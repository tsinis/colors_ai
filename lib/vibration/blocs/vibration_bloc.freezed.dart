// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vibration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VibrationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int durationInMs) vibrated,
    required TResult Function(bool isEnabled) settingsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int durationInMs)? vibrated,
    TResult? Function(bool isEnabled)? settingsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int durationInMs)? vibrated,
    TResult Function(bool isEnabled)? settingsChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Vibrated value) vibrated,
    required TResult Function(_SettingsChanged value) settingsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Vibrated value)? vibrated,
    TResult? Function(_SettingsChanged value)? settingsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Vibrated value)? vibrated,
    TResult Function(_SettingsChanged value)? settingsChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VibrationEventCopyWith<$Res> {
  factory $VibrationEventCopyWith(
          VibrationEvent value, $Res Function(VibrationEvent) then) =
      _$VibrationEventCopyWithImpl<$Res, VibrationEvent>;
}

/// @nodoc
class _$VibrationEventCopyWithImpl<$Res, $Val extends VibrationEvent>
    implements $VibrationEventCopyWith<$Res> {
  _$VibrationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$VibrationEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'VibrationEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int durationInMs) vibrated,
    required TResult Function(bool isEnabled) settingsChanged,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int durationInMs)? vibrated,
    TResult? Function(bool isEnabled)? settingsChanged,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int durationInMs)? vibrated,
    TResult Function(bool isEnabled)? settingsChanged,
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
    required TResult Function(_Started value) started,
    required TResult Function(_Vibrated value) vibrated,
    required TResult Function(_SettingsChanged value) settingsChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Vibrated value)? vibrated,
    TResult? Function(_SettingsChanged value)? settingsChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Vibrated value)? vibrated,
    TResult Function(_SettingsChanged value)? settingsChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements VibrationEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_VibratedCopyWith<$Res> {
  factory _$$_VibratedCopyWith(
          _$_Vibrated value, $Res Function(_$_Vibrated) then) =
      __$$_VibratedCopyWithImpl<$Res>;
  @useResult
  $Res call({int durationInMs});
}

/// @nodoc
class __$$_VibratedCopyWithImpl<$Res>
    extends _$VibrationEventCopyWithImpl<$Res, _$_Vibrated>
    implements _$$_VibratedCopyWith<$Res> {
  __$$_VibratedCopyWithImpl(
      _$_Vibrated _value, $Res Function(_$_Vibrated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? durationInMs = null,
  }) {
    return _then(_$_Vibrated(
      null == durationInMs
          ? _value.durationInMs
          : durationInMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Vibrated implements _Vibrated {
  const _$_Vibrated([this.durationInMs = 150]);

  @override
  @JsonKey()
  final int durationInMs;

  @override
  String toString() {
    return 'VibrationEvent.vibrated(durationInMs: $durationInMs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Vibrated &&
            (identical(other.durationInMs, durationInMs) ||
                other.durationInMs == durationInMs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, durationInMs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VibratedCopyWith<_$_Vibrated> get copyWith =>
      __$$_VibratedCopyWithImpl<_$_Vibrated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int durationInMs) vibrated,
    required TResult Function(bool isEnabled) settingsChanged,
  }) {
    return vibrated(durationInMs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int durationInMs)? vibrated,
    TResult? Function(bool isEnabled)? settingsChanged,
  }) {
    return vibrated?.call(durationInMs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int durationInMs)? vibrated,
    TResult Function(bool isEnabled)? settingsChanged,
    required TResult orElse(),
  }) {
    if (vibrated != null) {
      return vibrated(durationInMs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Vibrated value) vibrated,
    required TResult Function(_SettingsChanged value) settingsChanged,
  }) {
    return vibrated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Vibrated value)? vibrated,
    TResult? Function(_SettingsChanged value)? settingsChanged,
  }) {
    return vibrated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Vibrated value)? vibrated,
    TResult Function(_SettingsChanged value)? settingsChanged,
    required TResult orElse(),
  }) {
    if (vibrated != null) {
      return vibrated(this);
    }
    return orElse();
  }
}

abstract class _Vibrated implements VibrationEvent {
  const factory _Vibrated([final int durationInMs]) = _$_Vibrated;

  int get durationInMs;
  @JsonKey(ignore: true)
  _$$_VibratedCopyWith<_$_Vibrated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SettingsChangedCopyWith<$Res> {
  factory _$$_SettingsChangedCopyWith(
          _$_SettingsChanged value, $Res Function(_$_SettingsChanged) then) =
      __$$_SettingsChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isEnabled});
}

/// @nodoc
class __$$_SettingsChangedCopyWithImpl<$Res>
    extends _$VibrationEventCopyWithImpl<$Res, _$_SettingsChanged>
    implements _$$_SettingsChangedCopyWith<$Res> {
  __$$_SettingsChangedCopyWithImpl(
      _$_SettingsChanged _value, $Res Function(_$_SettingsChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEnabled = null,
  }) {
    return _then(_$_SettingsChanged(
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SettingsChanged implements _SettingsChanged {
  const _$_SettingsChanged({required this.isEnabled});

  @override
  final bool isEnabled;

  @override
  String toString() {
    return 'VibrationEvent.settingsChanged(isEnabled: $isEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsChanged &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsChangedCopyWith<_$_SettingsChanged> get copyWith =>
      __$$_SettingsChangedCopyWithImpl<_$_SettingsChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int durationInMs) vibrated,
    required TResult Function(bool isEnabled) settingsChanged,
  }) {
    return settingsChanged(isEnabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int durationInMs)? vibrated,
    TResult? Function(bool isEnabled)? settingsChanged,
  }) {
    return settingsChanged?.call(isEnabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int durationInMs)? vibrated,
    TResult Function(bool isEnabled)? settingsChanged,
    required TResult orElse(),
  }) {
    if (settingsChanged != null) {
      return settingsChanged(isEnabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Vibrated value) vibrated,
    required TResult Function(_SettingsChanged value) settingsChanged,
  }) {
    return settingsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Vibrated value)? vibrated,
    TResult? Function(_SettingsChanged value)? settingsChanged,
  }) {
    return settingsChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Vibrated value)? vibrated,
    TResult Function(_SettingsChanged value)? settingsChanged,
    required TResult orElse(),
  }) {
    if (settingsChanged != null) {
      return settingsChanged(this);
    }
    return orElse();
  }
}

abstract class _SettingsChanged implements VibrationEvent {
  const factory _SettingsChanged({required final bool isEnabled}) =
      _$_SettingsChanged;

  bool get isEnabled;
  @JsonKey(ignore: true)
  _$$_SettingsChangedCopyWith<_$_SettingsChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VibrationState {
  bool get isVibrationEnabled => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool canVibrate, bool isVibrationEnabled) initial,
    required TResult Function(bool isVibrationEnabled) loadInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool canVibrate, bool isVibrationEnabled)? initial,
    TResult? Function(bool isVibrationEnabled)? loadInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool canVibrate, bool isVibrationEnabled)? initial,
    TResult Function(bool isVibrationEnabled)? loadInProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VibrationStateCopyWith<VibrationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VibrationStateCopyWith<$Res> {
  factory $VibrationStateCopyWith(
          VibrationState value, $Res Function(VibrationState) then) =
      _$VibrationStateCopyWithImpl<$Res, VibrationState>;
  @useResult
  $Res call({bool isVibrationEnabled});
}

/// @nodoc
class _$VibrationStateCopyWithImpl<$Res, $Val extends VibrationState>
    implements $VibrationStateCopyWith<$Res> {
  _$VibrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVibrationEnabled = null,
  }) {
    return _then(_value.copyWith(
      isVibrationEnabled: null == isVibrationEnabled
          ? _value.isVibrationEnabled
          : isVibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $VibrationStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool canVibrate, bool isVibrationEnabled});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$VibrationStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canVibrate = null,
    Object? isVibrationEnabled = null,
  }) {
    return _then(_$_Initial(
      canVibrate: null == canVibrate
          ? _value.canVibrate
          : canVibrate // ignore: cast_nullable_to_non_nullable
              as bool,
      isVibrationEnabled: null == isVibrationEnabled
          ? _value.isVibrationEnabled
          : isVibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.canVibrate, required this.isVibrationEnabled});

  @override
  final bool canVibrate;
  @override
  final bool isVibrationEnabled;

  @override
  String toString() {
    return 'VibrationState.initial(canVibrate: $canVibrate, isVibrationEnabled: $isVibrationEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.canVibrate, canVibrate) ||
                other.canVibrate == canVibrate) &&
            (identical(other.isVibrationEnabled, isVibrationEnabled) ||
                other.isVibrationEnabled == isVibrationEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, canVibrate, isVibrationEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool canVibrate, bool isVibrationEnabled) initial,
    required TResult Function(bool isVibrationEnabled) loadInProgress,
  }) {
    return initial(canVibrate, isVibrationEnabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool canVibrate, bool isVibrationEnabled)? initial,
    TResult? Function(bool isVibrationEnabled)? loadInProgress,
  }) {
    return initial?.call(canVibrate, isVibrationEnabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool canVibrate, bool isVibrationEnabled)? initial,
    TResult Function(bool isVibrationEnabled)? loadInProgress,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(canVibrate, isVibrationEnabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements VibrationState {
  const factory _Initial(
      {required final bool canVibrate,
      required final bool isVibrationEnabled}) = _$_Initial;

  bool get canVibrate;
  @override
  bool get isVibrationEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadInProgressCopyWith<$Res>
    implements $VibrationStateCopyWith<$Res> {
  factory _$$_LoadInProgressCopyWith(
          _$_LoadInProgress value, $Res Function(_$_LoadInProgress) then) =
      __$$_LoadInProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isVibrationEnabled});
}

/// @nodoc
class __$$_LoadInProgressCopyWithImpl<$Res>
    extends _$VibrationStateCopyWithImpl<$Res, _$_LoadInProgress>
    implements _$$_LoadInProgressCopyWith<$Res> {
  __$$_LoadInProgressCopyWithImpl(
      _$_LoadInProgress _value, $Res Function(_$_LoadInProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVibrationEnabled = null,
  }) {
    return _then(_$_LoadInProgress(
      isVibrationEnabled: null == isVibrationEnabled
          ? _value.isVibrationEnabled
          : isVibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress({required this.isVibrationEnabled});

  @override
  final bool isVibrationEnabled;

  @override
  String toString() {
    return 'VibrationState.loadInProgress(isVibrationEnabled: $isVibrationEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadInProgress &&
            (identical(other.isVibrationEnabled, isVibrationEnabled) ||
                other.isVibrationEnabled == isVibrationEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isVibrationEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      __$$_LoadInProgressCopyWithImpl<_$_LoadInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool canVibrate, bool isVibrationEnabled) initial,
    required TResult Function(bool isVibrationEnabled) loadInProgress,
  }) {
    return loadInProgress(isVibrationEnabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool canVibrate, bool isVibrationEnabled)? initial,
    TResult? Function(bool isVibrationEnabled)? loadInProgress,
  }) {
    return loadInProgress?.call(isVibrationEnabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool canVibrate, bool isVibrationEnabled)? initial,
    TResult Function(bool isVibrationEnabled)? loadInProgress,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(isVibrationEnabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements VibrationState {
  const factory _LoadInProgress({required final bool isVibrationEnabled}) =
      _$_LoadInProgress;

  @override
  bool get isVibrationEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}
