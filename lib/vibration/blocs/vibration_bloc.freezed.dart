// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$VibrationEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'VibrationEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
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
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$VibratedImplCopyWith<$Res> {
  factory _$$VibratedImplCopyWith(
          _$VibratedImpl value, $Res Function(_$VibratedImpl) then) =
      __$$VibratedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int durationInMs});
}

/// @nodoc
class __$$VibratedImplCopyWithImpl<$Res>
    extends _$VibrationEventCopyWithImpl<$Res, _$VibratedImpl>
    implements _$$VibratedImplCopyWith<$Res> {
  __$$VibratedImplCopyWithImpl(
      _$VibratedImpl _value, $Res Function(_$VibratedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? durationInMs = null,
  }) {
    return _then(_$VibratedImpl(
      null == durationInMs
          ? _value.durationInMs
          : durationInMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$VibratedImpl implements _Vibrated {
  const _$VibratedImpl([this.durationInMs = 150]);

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
            other is _$VibratedImpl &&
            (identical(other.durationInMs, durationInMs) ||
                other.durationInMs == durationInMs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, durationInMs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VibratedImplCopyWith<_$VibratedImpl> get copyWith =>
      __$$VibratedImplCopyWithImpl<_$VibratedImpl>(this, _$identity);

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
  const factory _Vibrated([final int durationInMs]) = _$VibratedImpl;

  int get durationInMs;
  @JsonKey(ignore: true)
  _$$VibratedImplCopyWith<_$VibratedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SettingsChangedImplCopyWith<$Res> {
  factory _$$SettingsChangedImplCopyWith(_$SettingsChangedImpl value,
          $Res Function(_$SettingsChangedImpl) then) =
      __$$SettingsChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isEnabled});
}

/// @nodoc
class __$$SettingsChangedImplCopyWithImpl<$Res>
    extends _$VibrationEventCopyWithImpl<$Res, _$SettingsChangedImpl>
    implements _$$SettingsChangedImplCopyWith<$Res> {
  __$$SettingsChangedImplCopyWithImpl(
      _$SettingsChangedImpl _value, $Res Function(_$SettingsChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEnabled = null,
  }) {
    return _then(_$SettingsChangedImpl(
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SettingsChangedImpl implements _SettingsChanged {
  const _$SettingsChangedImpl({required this.isEnabled});

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
            other is _$SettingsChangedImpl &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsChangedImplCopyWith<_$SettingsChangedImpl> get copyWith =>
      __$$SettingsChangedImplCopyWithImpl<_$SettingsChangedImpl>(
          this, _$identity);

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
      _$SettingsChangedImpl;

  bool get isEnabled;
  @JsonKey(ignore: true)
  _$$SettingsChangedImplCopyWith<_$SettingsChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VibrationState {
  bool get isVibrationEnabled => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isVibrationEnabled) loadInProgress,
    required TResult Function(bool? canVibrate, bool isVibrationEnabled)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isVibrationEnabled)? loadInProgress,
    TResult? Function(bool? canVibrate, bool isVibrationEnabled)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isVibrationEnabled)? loadInProgress,
    TResult Function(bool? canVibrate, bool isVibrationEnabled)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Initial value)? initial,
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
abstract class _$$LoadInProgressImplCopyWith<$Res>
    implements $VibrationStateCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isVibrationEnabled});
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$VibrationStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVibrationEnabled = null,
  }) {
    return _then(_$LoadInProgressImpl(
      isVibrationEnabled: null == isVibrationEnabled
          ? _value.isVibrationEnabled
          : isVibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadInProgressImpl implements _LoadInProgress {
  const _$LoadInProgressImpl({this.isVibrationEnabled = true});

  @override
  @JsonKey()
  final bool isVibrationEnabled;

  @override
  String toString() {
    return 'VibrationState.loadInProgress(isVibrationEnabled: $isVibrationEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadInProgressImpl &&
            (identical(other.isVibrationEnabled, isVibrationEnabled) ||
                other.isVibrationEnabled == isVibrationEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isVibrationEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadInProgressImplCopyWith<_$LoadInProgressImpl> get copyWith =>
      __$$LoadInProgressImplCopyWithImpl<_$LoadInProgressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isVibrationEnabled) loadInProgress,
    required TResult Function(bool? canVibrate, bool isVibrationEnabled)
        initial,
  }) {
    return loadInProgress(isVibrationEnabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isVibrationEnabled)? loadInProgress,
    TResult? Function(bool? canVibrate, bool isVibrationEnabled)? initial,
  }) {
    return loadInProgress?.call(isVibrationEnabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isVibrationEnabled)? loadInProgress,
    TResult Function(bool? canVibrate, bool isVibrationEnabled)? initial,
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
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_Initial value) initial,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_Initial value)? initial,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements VibrationState {
  const factory _LoadInProgress({final bool isVibrationEnabled}) =
      _$LoadInProgressImpl;

  @override
  bool get isVibrationEnabled;
  @override
  @JsonKey(ignore: true)
  _$$LoadInProgressImplCopyWith<_$LoadInProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $VibrationStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? canVibrate, bool isVibrationEnabled});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$VibrationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canVibrate = freezed,
    Object? isVibrationEnabled = null,
  }) {
    return _then(_$InitialImpl(
      canVibrate: freezed == canVibrate
          ? _value.canVibrate
          : canVibrate // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVibrationEnabled: null == isVibrationEnabled
          ? _value.isVibrationEnabled
          : isVibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.canVibrate = false, this.isVibrationEnabled = true});

  @override
  @JsonKey()
  final bool? canVibrate;
  @override
  @JsonKey()
  final bool isVibrationEnabled;

  @override
  String toString() {
    return 'VibrationState.initial(canVibrate: $canVibrate, isVibrationEnabled: $isVibrationEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
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
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isVibrationEnabled) loadInProgress,
    required TResult Function(bool? canVibrate, bool isVibrationEnabled)
        initial,
  }) {
    return initial(canVibrate, isVibrationEnabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isVibrationEnabled)? loadInProgress,
    TResult? Function(bool? canVibrate, bool isVibrationEnabled)? initial,
  }) {
    return initial?.call(canVibrate, isVibrationEnabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isVibrationEnabled)? loadInProgress,
    TResult Function(bool? canVibrate, bool isVibrationEnabled)? initial,
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
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Initial value)? initial,
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
      {final bool? canVibrate, final bool isVibrationEnabled}) = _$InitialImpl;

  bool? get canVibrate;
  @override
  bool get isVibrationEnabled;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
