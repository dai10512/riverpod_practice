// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'color_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ColorState _$ColorStateFromJson(Map<String, dynamic> json) {
  return _ColorState.fromJson(json);
}

/// @nodoc
class _$ColorStateTearOff {
  const _$ColorStateTearOff();

  _ColorState call({int colorNumber = 5}) {
    return _ColorState(
      colorNumber: colorNumber,
    );
  }

  ColorState fromJson(Map<String, Object?> json) {
    return ColorState.fromJson(json);
  }
}

/// @nodoc
const $ColorState = _$ColorStateTearOff();

/// @nodoc
mixin _$ColorState {
  int get colorNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ColorStateCopyWith<ColorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorStateCopyWith<$Res> {
  factory $ColorStateCopyWith(
          ColorState value, $Res Function(ColorState) then) =
      _$ColorStateCopyWithImpl<$Res>;
  $Res call({int colorNumber});
}

/// @nodoc
class _$ColorStateCopyWithImpl<$Res> implements $ColorStateCopyWith<$Res> {
  _$ColorStateCopyWithImpl(this._value, this._then);

  final ColorState _value;
  // ignore: unused_field
  final $Res Function(ColorState) _then;

  @override
  $Res call({
    Object? colorNumber = freezed,
  }) {
    return _then(_value.copyWith(
      colorNumber: colorNumber == freezed
          ? _value.colorNumber
          : colorNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ColorStateCopyWith<$Res> implements $ColorStateCopyWith<$Res> {
  factory _$ColorStateCopyWith(
          _ColorState value, $Res Function(_ColorState) then) =
      __$ColorStateCopyWithImpl<$Res>;
  @override
  $Res call({int colorNumber});
}

/// @nodoc
class __$ColorStateCopyWithImpl<$Res> extends _$ColorStateCopyWithImpl<$Res>
    implements _$ColorStateCopyWith<$Res> {
  __$ColorStateCopyWithImpl(
      _ColorState _value, $Res Function(_ColorState) _then)
      : super(_value, (v) => _then(v as _ColorState));

  @override
  _ColorState get _value => super._value as _ColorState;

  @override
  $Res call({
    Object? colorNumber = freezed,
  }) {
    return _then(_ColorState(
      colorNumber: colorNumber == freezed
          ? _value.colorNumber
          : colorNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ColorState implements _ColorState {
  const _$_ColorState({this.colorNumber = 5});

  factory _$_ColorState.fromJson(Map<String, dynamic> json) =>
      _$$_ColorStateFromJson(json);

  @JsonKey()
  @override
  final int colorNumber;

  @override
  String toString() {
    return 'ColorState(colorNumber: $colorNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ColorState &&
            const DeepCollectionEquality()
                .equals(other.colorNumber, colorNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(colorNumber));

  @JsonKey(ignore: true)
  @override
  _$ColorStateCopyWith<_ColorState> get copyWith =>
      __$ColorStateCopyWithImpl<_ColorState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ColorStateToJson(this);
  }
}

abstract class _ColorState implements ColorState {
  const factory _ColorState({int colorNumber}) = _$_ColorState;

  factory _ColorState.fromJson(Map<String, dynamic> json) =
      _$_ColorState.fromJson;

  @override
  int get colorNumber;
  @override
  @JsonKey(ignore: true)
  _$ColorStateCopyWith<_ColorState> get copyWith =>
      throw _privateConstructorUsedError;
}
