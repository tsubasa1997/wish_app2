// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_info_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemInfoState {
  String get uid => throw _privateConstructorUsedError;
  String get itemId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemInfoStateCopyWith<ItemInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemInfoStateCopyWith<$Res> {
  factory $ItemInfoStateCopyWith(
          ItemInfoState value, $Res Function(ItemInfoState) then) =
      _$ItemInfoStateCopyWithImpl<$Res, ItemInfoState>;
  @useResult
  $Res call({String uid, String itemId});
}

/// @nodoc
class _$ItemInfoStateCopyWithImpl<$Res, $Val extends ItemInfoState>
    implements $ItemInfoStateCopyWith<$Res> {
  _$ItemInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? itemId = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemInfoStateCopyWith<$Res>
    implements $ItemInfoStateCopyWith<$Res> {
  factory _$$_ItemInfoStateCopyWith(
          _$_ItemInfoState value, $Res Function(_$_ItemInfoState) then) =
      __$$_ItemInfoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String itemId});
}

/// @nodoc
class __$$_ItemInfoStateCopyWithImpl<$Res>
    extends _$ItemInfoStateCopyWithImpl<$Res, _$_ItemInfoState>
    implements _$$_ItemInfoStateCopyWith<$Res> {
  __$$_ItemInfoStateCopyWithImpl(
      _$_ItemInfoState _value, $Res Function(_$_ItemInfoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? itemId = null,
  }) {
    return _then(_$_ItemInfoState(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ItemInfoState with DiagnosticableTreeMixin implements _ItemInfoState {
  const _$_ItemInfoState({required this.uid, required this.itemId});

  @override
  final String uid;
  @override
  final String itemId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemInfoState(uid: $uid, itemId: $itemId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemInfoState'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('itemId', itemId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemInfoState &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, itemId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemInfoStateCopyWith<_$_ItemInfoState> get copyWith =>
      __$$_ItemInfoStateCopyWithImpl<_$_ItemInfoState>(this, _$identity);
}

abstract class _ItemInfoState implements ItemInfoState {
  const factory _ItemInfoState(
      {required final String uid,
      required final String itemId}) = _$_ItemInfoState;

  @override
  String get uid;
  @override
  String get itemId;
  @override
  @JsonKey(ignore: true)
  _$$_ItemInfoStateCopyWith<_$_ItemInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
