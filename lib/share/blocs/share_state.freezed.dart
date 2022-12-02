// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShareState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failure,
    required TResult Function() emptyInitial,
    required TResult Function(ColorsUrlProvider? selectedProvider,
            FileFormat? selectedFormat, bool canSharePdf, bool canSharePng)
        formatSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? failure,
    TResult? Function()? emptyInitial,
    TResult? Function(ColorsUrlProvider? selectedProvider,
            FileFormat? selectedFormat, bool canSharePdf, bool canSharePng)?
        formatSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? emptyInitial,
    TResult Function(ColorsUrlProvider? selectedProvider,
            FileFormat? selectedFormat, bool canSharePdf, bool canSharePng)?
        formatSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShareFailure value) failure,
    required TResult Function(_ShareEmptyInitial value) emptyInitial,
    required TResult Function(_ShareFormatSelectedInitial value) formatSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShareFailure value)? failure,
    TResult? Function(_ShareEmptyInitial value)? emptyInitial,
    TResult? Function(_ShareFormatSelectedInitial value)? formatSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShareFailure value)? failure,
    TResult Function(_ShareEmptyInitial value)? emptyInitial,
    TResult Function(_ShareFormatSelectedInitial value)? formatSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareStateCopyWith<$Res> {
  factory $ShareStateCopyWith(
          ShareState value, $Res Function(ShareState) then) =
      _$ShareStateCopyWithImpl<$Res, ShareState>;
}

/// @nodoc
class _$ShareStateCopyWithImpl<$Res, $Val extends ShareState>
    implements $ShareStateCopyWith<$Res> {
  _$ShareStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ShareFailureCopyWith<$Res> {
  factory _$$_ShareFailureCopyWith(
          _$_ShareFailure value, $Res Function(_$_ShareFailure) then) =
      __$$_ShareFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ShareFailureCopyWithImpl<$Res>
    extends _$ShareStateCopyWithImpl<$Res, _$_ShareFailure>
    implements _$$_ShareFailureCopyWith<$Res> {
  __$$_ShareFailureCopyWithImpl(
      _$_ShareFailure _value, $Res Function(_$_ShareFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ShareFailure implements _ShareFailure {
  const _$_ShareFailure();

  @override
  String toString() {
    return 'ShareState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ShareFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failure,
    required TResult Function() emptyInitial,
    required TResult Function(ColorsUrlProvider? selectedProvider,
            FileFormat? selectedFormat, bool canSharePdf, bool canSharePng)
        formatSelected,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? failure,
    TResult? Function()? emptyInitial,
    TResult? Function(ColorsUrlProvider? selectedProvider,
            FileFormat? selectedFormat, bool canSharePdf, bool canSharePng)?
        formatSelected,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? emptyInitial,
    TResult Function(ColorsUrlProvider? selectedProvider,
            FileFormat? selectedFormat, bool canSharePdf, bool canSharePng)?
        formatSelected,
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
    required TResult Function(_ShareFailure value) failure,
    required TResult Function(_ShareEmptyInitial value) emptyInitial,
    required TResult Function(_ShareFormatSelectedInitial value) formatSelected,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShareFailure value)? failure,
    TResult? Function(_ShareEmptyInitial value)? emptyInitial,
    TResult? Function(_ShareFormatSelectedInitial value)? formatSelected,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShareFailure value)? failure,
    TResult Function(_ShareEmptyInitial value)? emptyInitial,
    TResult Function(_ShareFormatSelectedInitial value)? formatSelected,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _ShareFailure implements ShareState {
  const factory _ShareFailure() = _$_ShareFailure;
}

/// @nodoc
abstract class _$$_ShareEmptyInitialCopyWith<$Res> {
  factory _$$_ShareEmptyInitialCopyWith(_$_ShareEmptyInitial value,
          $Res Function(_$_ShareEmptyInitial) then) =
      __$$_ShareEmptyInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ShareEmptyInitialCopyWithImpl<$Res>
    extends _$ShareStateCopyWithImpl<$Res, _$_ShareEmptyInitial>
    implements _$$_ShareEmptyInitialCopyWith<$Res> {
  __$$_ShareEmptyInitialCopyWithImpl(
      _$_ShareEmptyInitial _value, $Res Function(_$_ShareEmptyInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ShareEmptyInitial implements _ShareEmptyInitial {
  const _$_ShareEmptyInitial();

  @override
  String toString() {
    return 'ShareState.emptyInitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ShareEmptyInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failure,
    required TResult Function() emptyInitial,
    required TResult Function(ColorsUrlProvider? selectedProvider,
            FileFormat? selectedFormat, bool canSharePdf, bool canSharePng)
        formatSelected,
  }) {
    return emptyInitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? failure,
    TResult? Function()? emptyInitial,
    TResult? Function(ColorsUrlProvider? selectedProvider,
            FileFormat? selectedFormat, bool canSharePdf, bool canSharePng)?
        formatSelected,
  }) {
    return emptyInitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? emptyInitial,
    TResult Function(ColorsUrlProvider? selectedProvider,
            FileFormat? selectedFormat, bool canSharePdf, bool canSharePng)?
        formatSelected,
    required TResult orElse(),
  }) {
    if (emptyInitial != null) {
      return emptyInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShareFailure value) failure,
    required TResult Function(_ShareEmptyInitial value) emptyInitial,
    required TResult Function(_ShareFormatSelectedInitial value) formatSelected,
  }) {
    return emptyInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShareFailure value)? failure,
    TResult? Function(_ShareEmptyInitial value)? emptyInitial,
    TResult? Function(_ShareFormatSelectedInitial value)? formatSelected,
  }) {
    return emptyInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShareFailure value)? failure,
    TResult Function(_ShareEmptyInitial value)? emptyInitial,
    TResult Function(_ShareFormatSelectedInitial value)? formatSelected,
    required TResult orElse(),
  }) {
    if (emptyInitial != null) {
      return emptyInitial(this);
    }
    return orElse();
  }
}

abstract class _ShareEmptyInitial implements ShareState {
  const factory _ShareEmptyInitial() = _$_ShareEmptyInitial;
}

/// @nodoc
abstract class _$$_ShareFormatSelectedInitialCopyWith<$Res> {
  factory _$$_ShareFormatSelectedInitialCopyWith(
          _$_ShareFormatSelectedInitial value,
          $Res Function(_$_ShareFormatSelectedInitial) then) =
      __$$_ShareFormatSelectedInitialCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ColorsUrlProvider? selectedProvider,
      FileFormat? selectedFormat,
      bool canSharePdf,
      bool canSharePng});
}

/// @nodoc
class __$$_ShareFormatSelectedInitialCopyWithImpl<$Res>
    extends _$ShareStateCopyWithImpl<$Res, _$_ShareFormatSelectedInitial>
    implements _$$_ShareFormatSelectedInitialCopyWith<$Res> {
  __$$_ShareFormatSelectedInitialCopyWithImpl(
      _$_ShareFormatSelectedInitial _value,
      $Res Function(_$_ShareFormatSelectedInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedProvider = freezed,
    Object? selectedFormat = freezed,
    Object? canSharePdf = null,
    Object? canSharePng = null,
  }) {
    return _then(_$_ShareFormatSelectedInitial(
      selectedProvider: freezed == selectedProvider
          ? _value.selectedProvider
          : selectedProvider // ignore: cast_nullable_to_non_nullable
              as ColorsUrlProvider?,
      selectedFormat: freezed == selectedFormat
          ? _value.selectedFormat
          : selectedFormat // ignore: cast_nullable_to_non_nullable
              as FileFormat?,
      canSharePdf: null == canSharePdf
          ? _value.canSharePdf
          : canSharePdf // ignore: cast_nullable_to_non_nullable
              as bool,
      canSharePng: null == canSharePng
          ? _value.canSharePng
          : canSharePng // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ShareFormatSelectedInitial implements _ShareFormatSelectedInitial {
  const _$_ShareFormatSelectedInitial(
      {required this.selectedProvider,
      required this.selectedFormat,
      required this.canSharePdf,
      required this.canSharePng});

  @override
  final ColorsUrlProvider? selectedProvider;
  @override
  final FileFormat? selectedFormat;
  @override
  final bool canSharePdf;
  @override
  final bool canSharePng;

  @override
  String toString() {
    return 'ShareState.formatSelected(selectedProvider: $selectedProvider, selectedFormat: $selectedFormat, canSharePdf: $canSharePdf, canSharePng: $canSharePng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShareFormatSelectedInitial &&
            (identical(other.selectedProvider, selectedProvider) ||
                other.selectedProvider == selectedProvider) &&
            (identical(other.selectedFormat, selectedFormat) ||
                other.selectedFormat == selectedFormat) &&
            (identical(other.canSharePdf, canSharePdf) ||
                other.canSharePdf == canSharePdf) &&
            (identical(other.canSharePng, canSharePng) ||
                other.canSharePng == canSharePng));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, selectedProvider, selectedFormat, canSharePdf, canSharePng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShareFormatSelectedInitialCopyWith<_$_ShareFormatSelectedInitial>
      get copyWith => __$$_ShareFormatSelectedInitialCopyWithImpl<
          _$_ShareFormatSelectedInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failure,
    required TResult Function() emptyInitial,
    required TResult Function(ColorsUrlProvider? selectedProvider,
            FileFormat? selectedFormat, bool canSharePdf, bool canSharePng)
        formatSelected,
  }) {
    return formatSelected(
        selectedProvider, selectedFormat, canSharePdf, canSharePng);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? failure,
    TResult? Function()? emptyInitial,
    TResult? Function(ColorsUrlProvider? selectedProvider,
            FileFormat? selectedFormat, bool canSharePdf, bool canSharePng)?
        formatSelected,
  }) {
    return formatSelected?.call(
        selectedProvider, selectedFormat, canSharePdf, canSharePng);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? emptyInitial,
    TResult Function(ColorsUrlProvider? selectedProvider,
            FileFormat? selectedFormat, bool canSharePdf, bool canSharePng)?
        formatSelected,
    required TResult orElse(),
  }) {
    if (formatSelected != null) {
      return formatSelected(
          selectedProvider, selectedFormat, canSharePdf, canSharePng);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShareFailure value) failure,
    required TResult Function(_ShareEmptyInitial value) emptyInitial,
    required TResult Function(_ShareFormatSelectedInitial value) formatSelected,
  }) {
    return formatSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShareFailure value)? failure,
    TResult? Function(_ShareEmptyInitial value)? emptyInitial,
    TResult? Function(_ShareFormatSelectedInitial value)? formatSelected,
  }) {
    return formatSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShareFailure value)? failure,
    TResult Function(_ShareEmptyInitial value)? emptyInitial,
    TResult Function(_ShareFormatSelectedInitial value)? formatSelected,
    required TResult orElse(),
  }) {
    if (formatSelected != null) {
      return formatSelected(this);
    }
    return orElse();
  }
}

abstract class _ShareFormatSelectedInitial implements ShareState {
  const factory _ShareFormatSelectedInitial(
      {required final ColorsUrlProvider? selectedProvider,
      required final FileFormat? selectedFormat,
      required final bool canSharePdf,
      required final bool canSharePng}) = _$_ShareFormatSelectedInitial;

  ColorsUrlProvider? get selectedProvider;
  FileFormat? get selectedFormat;
  bool get canSharePdf;
  bool get canSharePng;
  @JsonKey(ignore: true)
  _$$_ShareFormatSelectedInitialCopyWith<_$_ShareFormatSelectedInitial>
      get copyWith => throw _privateConstructorUsedError;
}
