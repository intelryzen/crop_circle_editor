import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Image;
import '/core/mixins/standalone_editor.dart';
import '/core/platform/io/io_helper.dart';
import '/crop_circle_editor.dart';
export '../crop_rotate_editor/widgets/crop_aspect_ratio_options.dart';

/// The `CropRotateEditor` widget allows users to editing images with crop, flip
/// and rotate tools.
///
/// You can create a `CropRotateEditor` using one of the factory methods
/// provided:
/// - `CropRotateEditor.file`: Loads an image from a file.
/// - `CropRotateEditor.asset`: Loads an image from an asset.
/// - `CropRotateEditor.network`: Loads an image from a network URL.
/// - `CropRotateEditor.memory`: Loads an image from memory as a `Uint8List`.
/// - `CropRotateEditor.autoSource`: Automatically selects the source based on
/// provided parameters.
class CustomCropCircleEditor extends StatefulWidget
    with StandaloneEditor<CropRotateEditorInitConfigs> {
  /// Constructs a `CropRotateEditor` widget.
  ///
  /// The [key] parameter is used to provide a key for the widget.
  /// The [editorImage] parameter specifies the image to be edited.
  /// The [initConfigs] parameter specifies the initialization configurations
  /// for the editor.
  const CustomCropCircleEditor._({
    super.key,
    required this.editorImage,
    required this.initConfigs,
  });

  /// Constructs a `CropRotateEditor` widget with image data loaded from memory.
  factory CustomCropCircleEditor.memory(
    Uint8List byteArray, {
    Key? key,
    required CropRotateEditorInitConfigs initConfigs,
  }) {
    return CustomCropCircleEditor._(
      key: key,
      editorImage: EditorImage(byteArray: byteArray),
      initConfigs: initConfigs,
    );
  }

  /// Constructs a `CropRotateEditor` widget with an image loaded from a file.
  factory CustomCropCircleEditor.file(
    File file, {
    Key? key,
    required CropRotateEditorInitConfigs initConfigs,
  }) {
    return CustomCropCircleEditor._(
      key: key,
      editorImage: EditorImage(file: file),
      initConfigs: initConfigs,
    );
  }

  /// Constructs a `CropRotateEditor` widget with an image loaded from an asset.
  factory CustomCropCircleEditor.asset(
    String assetPath, {
    Key? key,
    required CropRotateEditorInitConfigs initConfigs,
  }) {
    return CustomCropCircleEditor._(
      key: key,
      editorImage: EditorImage(assetPath: assetPath),
      initConfigs: initConfigs,
    );
  }

  /// Constructs a `CropRotateEditor` widget with an image loaded from a
  /// network URL.
  factory CustomCropCircleEditor.network(
    String networkUrl, {
    Key? key,
    required CropRotateEditorInitConfigs initConfigs,
  }) {
    return CustomCropCircleEditor._(
      key: key,
      editorImage: EditorImage(networkUrl: networkUrl),
      initConfigs: initConfigs,
    );
  }

  /// Constructs a `CropRotateEditor` widget with an image loaded automatically
  /// based on the provided source.
  ///
  /// Either [byteArray], [file], [networkUrl], or [assetPath] must be provided.
  factory CustomCropCircleEditor.autoSource({
    Key? key,
    Uint8List? byteArray,
    File? file,
    String? assetPath,
    String? networkUrl,
    EditorImage? editorImage,
    required CropRotateEditorInitConfigs initConfigs,
  }) {
    if (byteArray != null || editorImage?.byteArray != null) {
      return CustomCropCircleEditor.memory(
        byteArray ?? editorImage!.byteArray!,
        key: key,
        initConfigs: initConfigs,
      );
    } else if (file != null || editorImage?.file != null) {
      return CustomCropCircleEditor.file(
        file ?? editorImage!.file!,
        key: key,
        initConfigs: initConfigs,
      );
    } else if (networkUrl != null || editorImage?.networkUrl != null) {
      return CustomCropCircleEditor.network(
        networkUrl ?? editorImage!.networkUrl!,
        key: key,
        initConfigs: initConfigs,
      );
    } else if (assetPath != null || editorImage?.assetPath != null) {
      return CustomCropCircleEditor.asset(
        assetPath ?? editorImage!.assetPath!,
        key: key,
        initConfigs: initConfigs,
      );
    } else {
      throw ArgumentError(
          "Either 'byteArray', 'file', 'networkUrl' or 'assetPath' "
          'must be provided.');
    }
  }

  @override
  final CropRotateEditorInitConfigs initConfigs;
  @override
  final EditorImage editorImage;

  @override
  State<CropCircleEditor> createState() => CropCircleEditorState();
}
