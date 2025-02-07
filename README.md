# crop_circle_editor

원본 소스:  
[https://github.com/hm21/pro_image_editor](https://github.com/hm21/pro_image_editor)

프로필 이미지에 맞게 크롭될 수 있도록 모양은 원형이지만,  
이미지는 정사각형으로 크롭될수록 커스터마이징함.  
네이버 카페의 프로필 이미지 UI와 유사하게 구현함.

## 적용 이미지

[https://something.png](https://something.png)

## 사용법

```dart
import 'dart:io';
import 'package:crop_circle_editor/crop_circle_editor.dart';
import 'package:flutter/material.dart';
import 'package:resona/theme/constants/palette.dart';

class CircularCropImageEditor extends StatefulWidget {
  final File file;

  const CircularCropImageEditor({super.key, required this.file});

  @override
  State<CircularCropImageEditor> createState() =>
      _CircularCropImageEditorState();
}

class _CircularCropImageEditorState extends State<CircularCropImageEditor> {
  final ProImageEditorConfigs _editorConfigs = ProImageEditorConfigs(
    designMode: platformDesignMode,
    i18n: const I18n(
      doneLoadingMsg: "변경사항을 적용중입니다.",
    ),
    cropRotateEditor: const CropRotateEditorConfigs(
      initAspectRatio: 1,
      provideImageInfos: true,
      canChangeAspectRatio: false,
      style: CropRotateEditorStyle(
        helperLineColor: Palette.white,
        cropCornerColor: Palette.white,
      ),
    ),
  );

  final _cropEditorKey = GlobalKey<CropCircleEditorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CropCircleEditor.file(
      widget.file,
      key: _cropEditorKey,
      initConfigs: CropRotateEditorInitConfigs(
        theme: Theme.of(context).copyWith(brightness: Brightness.dark),
        configs: _editorConfigs,
        enablePopWhenDone: true,
        convertToUint8List: true,
      ),
    );
  }
}