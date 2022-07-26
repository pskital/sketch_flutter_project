import 'package:equatable/equatable.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';

class LangState extends Equatable {
  final LangType langType;

  final String? langCode;

  const LangState(this.langType, this.langCode);

  @override
  List<Object?> get props => [langType, langCode];
}
