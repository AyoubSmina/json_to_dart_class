library index;

import 'dart:io';


part 'create_folder.dart';
part 'generate_buffer.dart';
part 'generate_constructor_params.dart';
part 'generate_fields.dart';
part 'generate_from_json.dart';
part 'generate_from_origin_json.dart';
part 'generate_index_file.dart';
part 'generate_to_map.dart';
part 'utils.dart';



Set<String> generatedClassNames = {}; // Track generated class names