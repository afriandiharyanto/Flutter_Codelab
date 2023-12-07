// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'idea_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IdeaState {
  String get activity => throw _privateConstructorUsedError;
  int get participant => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IdeaStateCopyWith<IdeaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaStateCopyWith<$Res> {
  factory $IdeaStateCopyWith(IdeaState value, $Res Function(IdeaState) then) =
      _$IdeaStateCopyWithImpl<$Res, IdeaState>;
  @useResult
  $Res call({String activity, int participant, double price});
}

/// @nodoc
class _$IdeaStateCopyWithImpl<$Res, $Val extends IdeaState>
    implements $IdeaStateCopyWith<$Res> {
  _$IdeaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? participant = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      participant: null == participant
          ? _value.participant
          : participant // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdeaStateImplCopyWith<$Res>
    implements $IdeaStateCopyWith<$Res> {
  factory _$$IdeaStateImplCopyWith(
          _$IdeaStateImpl value, $Res Function(_$IdeaStateImpl) then) =
      __$$IdeaStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String activity, int participant, double price});
}

/// @nodoc
class __$$IdeaStateImplCopyWithImpl<$Res>
    extends _$IdeaStateCopyWithImpl<$Res, _$IdeaStateImpl>
    implements _$$IdeaStateImplCopyWith<$Res> {
  __$$IdeaStateImplCopyWithImpl(
      _$IdeaStateImpl _value, $Res Function(_$IdeaStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? participant = null,
    Object? price = null,
  }) {
    return _then(_$IdeaStateImpl(
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      participant: null == participant
          ? _value.participant
          : participant // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$IdeaStateImpl implements _IdeaState {
  const _$IdeaStateImpl(
      {required this.activity, required this.participant, required this.price});

  @override
  final String activity;
  @override
  final int participant;
  @override
  final double price;

  @override
  String toString() {
    return 'IdeaState(activity: $activity, participant: $participant, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaStateImpl &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.participant, participant) ||
                other.participant == participant) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activity, participant, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdeaStateImplCopyWith<_$IdeaStateImpl> get copyWith =>
      __$$IdeaStateImplCopyWithImpl<_$IdeaStateImpl>(this, _$identity);
}

abstract class _IdeaState implements IdeaState {
  const factory _IdeaState(
      {required final String activity,
      required final int participant,
      required final double price}) = _$IdeaStateImpl;

  @override
  String get activity;
  @override
  int get participant;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$IdeaStateImplCopyWith<_$IdeaStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
