import 'package:uuid/uuid.dart';
import 'package:path/path.dart';

getFileName({required String path}) {
  return '${Uuid().v4()}${extension(path)}';
}
