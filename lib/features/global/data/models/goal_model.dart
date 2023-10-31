/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'model_provider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;

/** This is an auto generated class representing the GoalModel type in your schema. */
class GoalModel extends amplify_core.Model {
  static const classType = const _GoalModelModelType();
  final String id;
  final String? _user_id;
  final double? _height;
  final double? _weight;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  GoalModelModelIdentifier get modelIdentifier {
    return GoalModelModelIdentifier(id: id);
  }

  String get user_id {
    try {
      return _user_id!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  double get height {
    try {
      return _height!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  double get weight {
    try {
      return _weight!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const GoalModel._internal(
      {required this.id,
      required user_id,
      required height,
      required weight,
      createdAt,
      updatedAt})
      : _user_id = user_id,
        _height = height,
        _weight = weight,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory GoalModel(
      {String? id,
      required String user_id,
      required double height,
      required double weight}) {
    return GoalModel._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        user_id: user_id,
        height: height,
        weight: weight);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GoalModel &&
        id == other.id &&
        _user_id == other._user_id &&
        _height == other._height &&
        _weight == other._weight;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("GoalModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("user_id=" + "$_user_id" + ", ");
    buffer.write(
        "height=" + (_height != null ? _height!.toString() : "null") + ", ");
    buffer.write(
        "weight=" + (_weight != null ? _weight!.toString() : "null") + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  GoalModel copyWith({String? user_id, double? height, double? weight}) {
    return GoalModel._internal(
        id: id,
        user_id: user_id ?? this.user_id,
        height: height ?? this.height,
        weight: weight ?? this.weight);
  }

  GoalModel copyWithModelFieldValues(
      {ModelFieldValue<String>? user_id,
      ModelFieldValue<double>? height,
      ModelFieldValue<double>? weight}) {
    return GoalModel._internal(
        id: id,
        user_id: user_id == null ? this.user_id : user_id.value,
        height: height == null ? this.height : height.value,
        weight: weight == null ? this.weight : weight.value);
  }

  GoalModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _user_id = json['user_id'],
        _height = (json['height'] as num?)?.toDouble(),
        _weight = (json['weight'] as num?)?.toDouble(),
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': _user_id,
        'height': _height,
        'weight': _weight,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'user_id': _user_id,
        'height': _height,
        'weight': _weight,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<GoalModelModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<GoalModelModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USER_ID = amplify_core.QueryField(fieldName: "user_id");
  static final HEIGHT = amplify_core.QueryField(fieldName: "height");
  static final WEIGHT = amplify_core.QueryField(fieldName: "weight");
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "GoalModel";
    modelSchemaDefinition.pluralName = "GoalModels";

    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
          authStrategy: amplify_core.AuthStrategy.OWNER,
          ownerField: "owner",
          identityClaim: "cognito:username",
          provider: amplify_core.AuthRuleProvider.USERPOOLS,
          operations: const [
            amplify_core.ModelOperation.CREATE,
            amplify_core.ModelOperation.UPDATE,
            amplify_core.ModelOperation.DELETE,
            amplify_core.ModelOperation.READ
          ])
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: GoalModel.USER_ID,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: GoalModel.HEIGHT,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: GoalModel.WEIGHT,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'createdAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'updatedAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));
  });
}

class _GoalModelModelType extends amplify_core.ModelType<GoalModel> {
  const _GoalModelModelType();

  @override
  GoalModel fromJson(Map<String, dynamic> jsonData) {
    return GoalModel.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'GoalModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [GoalModel] in your schema.
 */
class GoalModelModelIdentifier
    implements amplify_core.ModelIdentifier<GoalModel> {
  final String id;

  /** Create an instance of GoalModelModelIdentifier using [id] the primary key. */
  const GoalModelModelIdentifier({required this.id});

  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{'id': id});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() => 'GoalModelModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is GoalModelModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
