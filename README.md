# crop_circle_editor

`crop_circle_editor`는 프로필 이미지를 간편하게 크롭할 수 있도록 도와주는 Flutter 패키지입니다.  

원본 소스는 [pro_image_editor](https://github.com/hm21/pro_image_editor)을 기반으로 하며, 사용자에게 보여지는 UI는 원형 크롭 영역을 제공하지만 실제 이미지는 정사각형으로 크롭되도록 커스터마이징했습니다.

네이버 카페의 프로필 이미지 적용 UI를 참고하여 디자인되었습니다.

---

## 원본 소스

- [pro_image_editor on GitHub](https://github.com/hm21/pro_image_editor)

---

## 적용 이미지

<p align="center">
  <img src="https://github.com/user-attachments/assets/f5b52536-73a3-4c72-901b-77febcd994a8" alt="demo" width="250"/>
</p>

---

## 사용법

아래의 코드를 참고하여 프로젝트에 `crop_circle_editor`를 적용해보세요:

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
        applyText: "적용",
      ),
    );
  }
}
