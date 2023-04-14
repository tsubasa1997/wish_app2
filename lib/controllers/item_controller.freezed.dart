// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemState {
  String? get sharedText => throw _privateConstructorUsedError;
  List<int> get totalPrice => throw _privateConstructorUsedError;
  List<Item> get selectedItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemStateCopyWith<ItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemStateCopyWith<$Res> {
  factory $ItemStateCopyWith(ItemState value, $Res Function(ItemState) then) =
      _$ItemStateCopyWithImpl<$Res, ItemState>;
  @useResult
  $Res call(
      {String? sharedText, List<int> totalPrice, List<Item> selectedItems});
}

/// @nodoc
class _$ItemStateCopyWithImpl<$Res, $Val extends ItemState>
    implements $ItemStateCopyWith<$Res> {
  _$ItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sharedText = freezed,
    Object? totalPrice = null,
    Object? selectedItems = null,
  }) {
    return _then(_value.copyWith(
      sharedText: freezed == sharedText
          ? _value.sharedText
          : sharedText // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectedItems: null == selectedItems
          ? _value.selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemStateCopyWith<$Res> implements $ItemStateCopyWith<$Res> {
  factory _$$_ItemStateCopyWith(
          _$_ItemState value, $Res Function(_$_ItemState) then) =
      __$$_ItemStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? sharedText, List<int> totalPrice, List<Item> selectedItems});
}

/// @nodoc
class __$$_ItemStateCopyWithImpl<$Res>
    extends _$ItemStateCopyWithImpl<$Res, _$_ItemState>
    implements _$$_ItemStateCopyWith<$Res> {
  __$$_ItemStateCopyWithImpl(
      _$_ItemState _value, $Res Function(_$_ItemState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sharedText = freezed,
    Object? totalPrice = null,
    Object? selectedItems = null,
  }) {
    return _then(_$_ItemState(
      sharedText: freezed == sharedText
          ? _value.sharedText
          : sharedText // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: null == totalPrice
          ? _value._totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectedItems: null == selectedItems
          ? _value._selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc

class _$_ItemState with DiagnosticableTreeMixin implements _ItemState {
  const _$_ItemState(
      {this.sharedText,
      final List<int> totalPrice = const <int>[],
      final List<Item> selectedItems = const <Item>[]})
      : _totalPrice = totalPrice,
        _selectedItems = selectedItems;

  @override
  final String? sharedText;
  final List<int> _totalPrice;
  @override
  @JsonKey()
  List<int> get totalPrice {
    if (_totalPrice is EqualUnmodifiableListView) return _totalPrice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalPrice);
  }

  final List<Item> _selectedItems;
  @override
  @JsonKey()
  List<Item> get selectedItems {
    if (_selectedItems is EqualUnmodifiableListView) return _selectedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedItems);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemState(sharedText: $sharedText, totalPrice: $totalPrice, selectedItems: $selectedItems)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemState'))
      ..add(DiagnosticsProperty('sharedText', sharedText))
      ..add(DiagnosticsProperty('totalPrice', totalPrice))
      ..add(DiagnosticsProperty('selectedItems', selectedItems));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemState &&
            (identical(other.sharedText, sharedText) ||
                other.sharedText == sharedText) &&
            const DeepCollectionEquality()
                .equals(other._totalPrice, _totalPrice) &&
            const DeepCollectionEquality()
                .equals(other._selectedItems, _selectedItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sharedText,
      const DeepCollectionEquality().hash(_totalPrice),
      const DeepCollectionEquality().hash(_selectedItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemStateCopyWith<_$_ItemState> get copyWith =>
      __$$_ItemStateCopyWithImpl<_$_ItemState>(this, _$identity);
}

abstract class _ItemState implements ItemState {
  const factory _ItemState(
      {final String? sharedText,
      final List<int> totalPrice,
      final List<Item> selectedItems}) = _$_ItemState;

  @override
  String? get sharedText;
  @override
  List<int> get totalPrice;
  @override
  List<Item> get selectedItems;
  @override
  @JsonKey(ignore: true)
  _$$_ItemStateCopyWith<_$_ItemState> get copyWith =>
      throw _privateConstructorUsedError;
}
