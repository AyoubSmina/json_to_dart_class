import 'package:json_to_dart_class_class/json_to_dart_class.dart';
void main() {
  var json = {
    "image_versions2": {
      "candidates": [
        {
          "width": 1440,
          "height": 1800,
          "url":
              "https://instagram.frba2-2.fna.fbcdn.net/v/t51.29350-15/434254295_947398920296718_7301113326399732656_n.jpg?stp=dst-jpegr_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE4MDAuaGRyIn0&_nc_ht=instagram.frba2-2.fna.fbcdn.net&_nc_cat=1&_nc_ohc=wJzPIIK8iS8AX_uVtfT&edm=AI8qBrIBAAAA&ccb=7-5&ig_cache_key=MzMzMTQ2NTE5MzQ3NjI0ODU2Nw%3D%3D.2-ccb7-5&oh=00_AfD_9N3d_IFbt_ufjWSnd-X6VKm5eH_rki-1bR6m2-N30g&oe=6612F331&_nc_sid=469e9a"
        },
        {
          "width": 1080,
          "height": 1350,
          "url":
              "https://instagram.frba2-2.fna.fbcdn.net/v/t51.29350-15/434254295_947398920296718_7301113326399732656_n.jpg?stp=dst-jpegr_e35_p1080x1080&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE4MDAuaGRyIn0&_nc_ht=instagram.frba2-2.fna.fbcdn.net&_nc_cat=1&_nc_ohc=wJzPIIK8iS8AX_uVtfT&edm=AI8qBrIBAAAA&ccb=7-5&ig_cache_key=MzMzMTQ2NTE5MzQ3NjI0ODU2Nw%3D%3D.2-ccb7-5&oh=00_AfBj-sxYP90dD9GMVu9_H82hm6bgPc0ewXeAGr6Vf0mh1A&oe=6612F331&_nc_sid=469e9a"
        },
      ]
    },
  };

  jsonToDart(json: json, className: 'example', folderPath: 'example');
}
