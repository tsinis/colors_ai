// Mocks generated by Mockito 5.1.0 from annotations
// in colors_ai/test/data/mocks/generated.dart.
// Do not manually edit this file.

import 'dart:async' as _i9;
import 'dart:convert' as _i8;
import 'dart:typed_data' as _i7;
import 'dart:ui' as _i6;

import 'package:colors_ai/core/services/url_launcher.dart' as _i11;
import 'package:colors_ai/sound/services/sounds_player.dart' as _i10;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:hive/hive.dart' as _i3;
import 'package:hive/src/object/hive_object.dart' as _i1;
import 'package:mockito/mockito.dart' as _i2;
import 'package:window_size/src/platform_window.dart' as _i5;
import 'package:window_size/src/screen.dart' as _i13;
import 'package:window_size/src/window_size_channel.dart' as _i12;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeHiveList_0<E extends _i1.HiveObjectMixin> extends _i2.Fake
    implements _i3.HiveList<E> {}

class _FakeIOSOptions_1 extends _i2.Fake implements _i4.IOSOptions {}

class _FakeAndroidOptions_2 extends _i2.Fake implements _i4.AndroidOptions {}

class _FakeLinuxOptions_3 extends _i2.Fake implements _i4.LinuxOptions {}

class _FakeWindowsOptions_4 extends _i2.Fake implements _i4.WindowsOptions {}

class _FakeWebOptions_5 extends _i2.Fake implements _i4.WebOptions {}

class _FakeMacOsOptions_6 extends _i2.Fake implements _i4.MacOsOptions {}

class _FakePlatformWindow_7 extends _i2.Fake implements _i5.PlatformWindow {}

class _FakeSize_8 extends _i2.Fake implements _i6.Size {}

/// A class which mocks [BinaryReader].
///
/// See the documentation for Mockito's code generation for more information.
class MockBinaryReader extends _i2.Mock implements _i3.BinaryReader {
  MockBinaryReader() {
    _i2.throwOnMissingStub(this);
  }

  @override
  int get availableBytes =>
      (super.noSuchMethod(Invocation.getter(#availableBytes), returnValue: 0)
          as int);
  @override
  int get usedBytes =>
      (super.noSuchMethod(Invocation.getter(#usedBytes), returnValue: 0)
          as int);
  @override
  void skip(int? bytes) => super.noSuchMethod(Invocation.method(#skip, [bytes]),
      returnValueForMissingStub: null);
  @override
  int readByte() =>
      (super.noSuchMethod(Invocation.method(#readByte, []), returnValue: 0)
          as int);
  @override
  _i7.Uint8List viewBytes(int? bytes) =>
      (super.noSuchMethod(Invocation.method(#viewBytes, [bytes]),
          returnValue: _i7.Uint8List(0)) as _i7.Uint8List);
  @override
  _i7.Uint8List peekBytes(int? bytes) =>
      (super.noSuchMethod(Invocation.method(#peekBytes, [bytes]),
          returnValue: _i7.Uint8List(0)) as _i7.Uint8List);
  @override
  int readWord() =>
      (super.noSuchMethod(Invocation.method(#readWord, []), returnValue: 0)
          as int);
  @override
  int readInt32() =>
      (super.noSuchMethod(Invocation.method(#readInt32, []), returnValue: 0)
          as int);
  @override
  int readUint32() =>
      (super.noSuchMethod(Invocation.method(#readUint32, []), returnValue: 0)
          as int);
  @override
  int readInt() =>
      (super.noSuchMethod(Invocation.method(#readInt, []), returnValue: 0)
          as int);
  @override
  double readDouble() =>
      (super.noSuchMethod(Invocation.method(#readDouble, []), returnValue: 0.0)
          as double);
  @override
  bool readBool() =>
      (super.noSuchMethod(Invocation.method(#readBool, []), returnValue: false)
          as bool);
  @override
  String readString(
          [int? byteCount,
          _i8.Converter<List<int>, String>? decoder =
              const _i8.Utf8Decoder()]) =>
      (super.noSuchMethod(Invocation.method(#readString, [byteCount, decoder]),
          returnValue: '') as String);
  @override
  _i7.Uint8List readByteList([int? length]) =>
      (super.noSuchMethod(Invocation.method(#readByteList, [length]),
          returnValue: _i7.Uint8List(0)) as _i7.Uint8List);
  @override
  List<int> readIntList([int? length]) =>
      (super.noSuchMethod(Invocation.method(#readIntList, [length]),
          returnValue: <int>[]) as List<int>);
  @override
  List<double> readDoubleList([int? length]) =>
      (super.noSuchMethod(Invocation.method(#readDoubleList, [length]),
          returnValue: <double>[]) as List<double>);
  @override
  List<bool> readBoolList([int? length]) =>
      (super.noSuchMethod(Invocation.method(#readBoolList, [length]),
          returnValue: <bool>[]) as List<bool>);
  @override
  List<String> readStringList(
          [int? length,
          _i8.Converter<List<int>, String>? decoder =
              const _i8.Utf8Decoder()]) =>
      (super.noSuchMethod(Invocation.method(#readStringList, [length, decoder]),
          returnValue: <String>[]) as List<String>);
  @override
  List<dynamic> readList([int? length]) =>
      (super.noSuchMethod(Invocation.method(#readList, [length]),
          returnValue: <dynamic>[]) as List<dynamic>);
  @override
  Map<dynamic, dynamic> readMap([int? length]) =>
      (super.noSuchMethod(Invocation.method(#readMap, [length]),
          returnValue: <dynamic, dynamic>{}) as Map<dynamic, dynamic>);
  @override
  _i3.HiveList<_i1.HiveObjectMixin> readHiveList([int? length]) =>
      (super.noSuchMethod(Invocation.method(#readHiveList, [length]),
              returnValue: _FakeHiveList_0<_i1.HiveObjectMixin>())
          as _i3.HiveList<_i1.HiveObjectMixin>);
}

/// A class which mocks [BinaryWriter].
///
/// See the documentation for Mockito's code generation for more information.
class MockBinaryWriter extends _i2.Mock implements _i3.BinaryWriter {
  MockBinaryWriter() {
    _i2.throwOnMissingStub(this);
  }

  @override
  void writeByte(int? byte) =>
      super.noSuchMethod(Invocation.method(#writeByte, [byte]),
          returnValueForMissingStub: null);
  @override
  void writeWord(int? value) =>
      super.noSuchMethod(Invocation.method(#writeWord, [value]),
          returnValueForMissingStub: null);
  @override
  void writeInt32(int? value) =>
      super.noSuchMethod(Invocation.method(#writeInt32, [value]),
          returnValueForMissingStub: null);
  @override
  void writeUint32(int? value) =>
      super.noSuchMethod(Invocation.method(#writeUint32, [value]),
          returnValueForMissingStub: null);
  @override
  void writeInt(int? value) =>
      super.noSuchMethod(Invocation.method(#writeInt, [value]),
          returnValueForMissingStub: null);
  @override
  void writeDouble(double? value) =>
      super.noSuchMethod(Invocation.method(#writeDouble, [value]),
          returnValueForMissingStub: null);
  @override
  void writeBool(bool? value) =>
      super.noSuchMethod(Invocation.method(#writeBool, [value]),
          returnValueForMissingStub: null);
  @override
  void writeString(String? value,
          {bool? writeByteCount = true,
          _i8.Converter<String, List<int>>? encoder =
              const _i8.Utf8Encoder()}) =>
      super.noSuchMethod(
          Invocation.method(#writeString, [value],
              {#writeByteCount: writeByteCount, #encoder: encoder}),
          returnValueForMissingStub: null);
  @override
  void writeByteList(List<int>? bytes, {bool? writeLength = true}) =>
      super.noSuchMethod(
          Invocation.method(
              #writeByteList, [bytes], {#writeLength: writeLength}),
          returnValueForMissingStub: null);
  @override
  void writeIntList(List<int>? list, {bool? writeLength = true}) =>
      super.noSuchMethod(
          Invocation.method(#writeIntList, [list], {#writeLength: writeLength}),
          returnValueForMissingStub: null);
  @override
  void writeDoubleList(List<double>? list, {bool? writeLength = true}) =>
      super.noSuchMethod(
          Invocation.method(
              #writeDoubleList, [list], {#writeLength: writeLength}),
          returnValueForMissingStub: null);
  @override
  void writeBoolList(List<bool>? list, {bool? writeLength = true}) =>
      super.noSuchMethod(
          Invocation.method(
              #writeBoolList, [list], {#writeLength: writeLength}),
          returnValueForMissingStub: null);
  @override
  void writeStringList(List<String>? list,
          {bool? writeLength = true,
          _i8.Converter<String, List<int>>? encoder =
              const _i8.Utf8Encoder()}) =>
      super.noSuchMethod(
          Invocation.method(#writeStringList, [list],
              {#writeLength: writeLength, #encoder: encoder}),
          returnValueForMissingStub: null);
  @override
  void writeList(List<dynamic>? list, {bool? writeLength = true}) =>
      super.noSuchMethod(
          Invocation.method(#writeList, [list], {#writeLength: writeLength}),
          returnValueForMissingStub: null);
  @override
  void writeMap(Map<dynamic, dynamic>? map, {bool? writeLength = true}) =>
      super.noSuchMethod(
          Invocation.method(#writeMap, [map], {#writeLength: writeLength}),
          returnValueForMissingStub: null);
  @override
  void writeHiveList(_i3.HiveList<_i1.HiveObjectMixin>? list,
          {bool? writeLength = true}) =>
      super.noSuchMethod(
          Invocation.method(
              #writeHiveList, [list], {#writeLength: writeLength}),
          returnValueForMissingStub: null);
  @override
  void write<T>(T? value, {bool? writeTypeId = true}) => super.noSuchMethod(
      Invocation.method(#write, [value], {#writeTypeId: writeTypeId}),
      returnValueForMissingStub: null);
}

/// A class which mocks [FlutterSecureStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockFlutterSecureStorage extends _i2.Mock
    implements _i4.FlutterSecureStorage {
  MockFlutterSecureStorage() {
    _i2.throwOnMissingStub(this);
  }

  @override
  _i4.IOSOptions get iOptions =>
      (super.noSuchMethod(Invocation.getter(#iOptions),
          returnValue: _FakeIOSOptions_1()) as _i4.IOSOptions);
  @override
  _i4.AndroidOptions get aOptions =>
      (super.noSuchMethod(Invocation.getter(#aOptions),
          returnValue: _FakeAndroidOptions_2()) as _i4.AndroidOptions);
  @override
  _i4.LinuxOptions get lOptions =>
      (super.noSuchMethod(Invocation.getter(#lOptions),
          returnValue: _FakeLinuxOptions_3()) as _i4.LinuxOptions);
  @override
  _i4.WindowsOptions get wOptions =>
      (super.noSuchMethod(Invocation.getter(#wOptions),
          returnValue: _FakeWindowsOptions_4()) as _i4.WindowsOptions);
  @override
  _i4.WebOptions get webOptions =>
      (super.noSuchMethod(Invocation.getter(#webOptions),
          returnValue: _FakeWebOptions_5()) as _i4.WebOptions);
  @override
  _i4.MacOsOptions get mOptions =>
      (super.noSuchMethod(Invocation.getter(#mOptions),
          returnValue: _FakeMacOsOptions_6()) as _i4.MacOsOptions);
  @override
  _i9.Future<void> write(
          {String? key,
          String? value,
          _i4.IOSOptions? iOptions,
          _i4.AndroidOptions? aOptions,
          _i4.LinuxOptions? lOptions,
          _i4.WebOptions? webOptions,
          _i4.MacOsOptions? mOptions,
          _i4.WindowsOptions? wOptions}) =>
      (super.noSuchMethod(
          Invocation.method(#write, [], {
            #key: key,
            #value: value,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<String?> read(
          {String? key,
          _i4.IOSOptions? iOptions,
          _i4.AndroidOptions? aOptions,
          _i4.LinuxOptions? lOptions,
          _i4.WebOptions? webOptions,
          _i4.MacOsOptions? mOptions,
          _i4.WindowsOptions? wOptions}) =>
      (super.noSuchMethod(
          Invocation.method(#read, [], {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions
          }),
          returnValue: Future<String?>.value()) as _i9.Future<String?>);
  @override
  _i9.Future<bool> containsKey(
          {String? key,
          _i4.IOSOptions? iOptions,
          _i4.AndroidOptions? aOptions,
          _i4.LinuxOptions? lOptions,
          _i4.WebOptions? webOptions,
          _i4.MacOsOptions? mOptions,
          _i4.WindowsOptions? wOptions}) =>
      (super.noSuchMethod(
          Invocation.method(#containsKey, [], {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions
          }),
          returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
  @override
  _i9.Future<void> delete(
          {String? key,
          _i4.IOSOptions? iOptions,
          _i4.AndroidOptions? aOptions,
          _i4.LinuxOptions? lOptions,
          _i4.WebOptions? webOptions,
          _i4.MacOsOptions? mOptions,
          _i4.WindowsOptions? wOptions}) =>
      (super.noSuchMethod(
          Invocation.method(#delete, [], {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<Map<String, String>> readAll(
          {_i4.IOSOptions? iOptions,
          _i4.AndroidOptions? aOptions,
          _i4.LinuxOptions? lOptions,
          _i4.WebOptions? webOptions,
          _i4.MacOsOptions? mOptions,
          _i4.WindowsOptions? wOptions}) =>
      (super.noSuchMethod(
              Invocation.method(#readAll, [], {
                #iOptions: iOptions,
                #aOptions: aOptions,
                #lOptions: lOptions,
                #webOptions: webOptions,
                #mOptions: mOptions,
                #wOptions: wOptions
              }),
              returnValue:
                  Future<Map<String, String>>.value(<String, String>{}))
          as _i9.Future<Map<String, String>>);
  @override
  _i9.Future<void> deleteAll(
          {_i4.IOSOptions? iOptions,
          _i4.AndroidOptions? aOptions,
          _i4.LinuxOptions? lOptions,
          _i4.WebOptions? webOptions,
          _i4.MacOsOptions? mOptions,
          _i4.WindowsOptions? wOptions}) =>
      (super.noSuchMethod(
          Invocation.method(#deleteAll, [], {
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
}

/// A class which mocks [SoundsPlayer].
///
/// See the documentation for Mockito's code generation for more information.
class MockSoundsPlayer extends _i2.Mock implements _i10.SoundsPlayer {
  MockSoundsPlayer() {
    _i2.throwOnMissingStub(this);
  }

  @override
  _i9.Future<void> playSound(String? asset, double? volume,
          {List<String>? cachedFileNames}) =>
      (super.noSuchMethod(
          Invocation.method(
              #playSound, [asset, volume], {#cachedFileNames: cachedFileNames}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
}

/// A class which mocks [UrlLauncher].
///
/// See the documentation for Mockito's code generation for more information.
class MockUrlLauncher extends _i2.Mock implements _i11.UrlLauncher {
  MockUrlLauncher() {
    _i2.throwOnMissingStub(this);
  }

  @override
  _i9.Future<bool> openURL([String? url]) =>
      (super.noSuchMethod(Invocation.method(#openURL, [url]),
          returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
}

/// A class which mocks [WindowSizeChannel].
///
/// See the documentation for Mockito's code generation for more information.
class MockWindowSizeChannel extends _i2.Mock implements _i12.WindowSizeChannel {
  MockWindowSizeChannel() {
    _i2.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i13.Screen>> getScreenList() =>
      (super.noSuchMethod(Invocation.method(#getScreenList, []),
              returnValue: Future<List<_i13.Screen>>.value(<_i13.Screen>[]))
          as _i9.Future<List<_i13.Screen>>);
  @override
  _i9.Future<_i5.PlatformWindow> getWindowInfo() =>
      (super.noSuchMethod(Invocation.method(#getWindowInfo, []),
              returnValue:
                  Future<_i5.PlatformWindow>.value(_FakePlatformWindow_7()))
          as _i9.Future<_i5.PlatformWindow>);
  @override
  void setWindowFrame(_i6.Rect? frame) =>
      super.noSuchMethod(Invocation.method(#setWindowFrame, [frame]),
          returnValueForMissingStub: null);
  @override
  void setWindowMinSize(_i6.Size? size) =>
      super.noSuchMethod(Invocation.method(#setWindowMinSize, [size]),
          returnValueForMissingStub: null);
  @override
  void setWindowVisibility({bool? visible}) => super.noSuchMethod(
      Invocation.method(#setWindowVisibility, [], {#visible: visible}),
      returnValueForMissingStub: null);
  @override
  void setWindowMaxSize(_i6.Size? size) =>
      super.noSuchMethod(Invocation.method(#setWindowMaxSize, [size]),
          returnValueForMissingStub: null);
  @override
  void setWindowTitle(String? title) =>
      super.noSuchMethod(Invocation.method(#setWindowTitle, [title]),
          returnValueForMissingStub: null);
  @override
  void setWindowTitleRepresentedUrl(Uri? file) => super.noSuchMethod(
      Invocation.method(#setWindowTitleRepresentedUrl, [file]),
      returnValueForMissingStub: null);
  @override
  _i9.Future<_i6.Size> getWindowMinSize() =>
      (super.noSuchMethod(Invocation.method(#getWindowMinSize, []),
              returnValue: Future<_i6.Size>.value(_FakeSize_8()))
          as _i9.Future<_i6.Size>);
  @override
  _i9.Future<_i6.Size> getWindowMaxSize() =>
      (super.noSuchMethod(Invocation.method(#getWindowMaxSize, []),
              returnValue: Future<_i6.Size>.value(_FakeSize_8()))
          as _i9.Future<_i6.Size>);
}
