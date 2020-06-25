import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';

void startWebFilePicker() async {
  html.InputElement uploadInput = html.FileUploadInputElement();
  uploadInput.multiple = true;
  uploadInput.draggable = true;
  uploadInput.click();
}