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

/** This is an auto generated class representing the BodyMassModel type in your schema. */
class BodyMassModel extends amplify_core.Model {
  static const classType = const _BodyMassModelModelType();
  final String id;
  final String? _user_id;
  final double? _height;
  final amplify_core.TemporalDate? _date;
  final double? _weight;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  BodyMassModelModelIdentifier get modelIdentifier {
    return BodyMassModelModelIdentifier(id: id);
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

  amplify_core.TemporalDate get date {
    try {
      return _date!;
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

  const BodyMassModel._internal(
      {required this.id,
      required user_id,
      required height,
      required date,
      required weight,
      createdAt,
      updatedAt})
      : _user_id = user_id,
        _height = height,
        _date = date,
        _weight = weight,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory BodyMassModel(
      {String? id,
      required String user_id,
      required double height,
      required amplify_core.TemporalDate date,
      required double weight}) {
    return BodyMassModel._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        user_id: user_id,
        height: height,
        date: date,
        weight: weight);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BodyMassModel &&
        id == other.id &&
        _user_id == other._user_id &&
        _height == other._height &&
        _date == other._date &&
        _weight == other._weight;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("BodyMassModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("user_id=" + "$_user_id" + ", ");
    buffer.write(
        "height=" + (_height != null ? _height!.toString() : "null") + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
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

  BodyMassModel copyWith(
      {String? user_id,
      double? height,
      amplify_core.TemporalDate? date,
      double? weight}) {
    return BodyMassModel._internal(
        id: id,
        user_id: user_id ?? this.user_id,
        height: height ?? this.height,
        date: date ?? this.date,
        weight: weight ?? this.weight);
  }

  BodyMassModel copyWithModelFieldValues(
      {ModelFieldValue<String>? user_id,
      ModelFieldValue<double>? height,
      ModelFieldValue<amplify_core.TemporalDate>? date,
      ModelFieldValue<double>? weight}) {
    return BodyMassModel._internal(
        id: id,
        user_id: user_id == null ? this.user_id : user_id.value,
        height: height == null ? this.height : height.value,
        date: date == null ? this.date : date.value,
        weight: weight == null ? this.weight : weight.value);
  }

  BodyMassModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _user_id = json['user_id'],
        _height = (json['height'] as num?)?.toDouble(),
        _date = json['date'] != null
            ? amplify_core.TemporalDate.fromString(json['date'])
            : null,
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
        'date': _date?.format(),
        'weight': _weight,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'user_id': _user_id,
        'height': _height,
        'date': _date,
        'weight': _weight,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<BodyMassModelModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<BodyMassModelModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USER_ID = amplify_core.QueryField(fieldName: "user_id");
  static final HEIGHT = amplify_core.QueryField(fieldName: "height");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final WEIGHT = amplify_core.QueryField(fieldName: "weight");
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "BodyMassModel";
    modelSchemaDefinition.pluralName = "BodyMassModels";

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
        key: BodyMassModel.USER_ID,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: BodyMassModel.HEIGHT,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: BodyMassModel.DATE,
        isRequired: true,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: BodyMassModel.WEIGHT,
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

class _BodyMassModelModelType extends amplify_core.ModelType<BodyMassModel> {
  const _BodyMassModelModelType();

  @override
  BodyMassModel fromJson(Map<String, dynamic> jsonData) {
    return BodyMassModel.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'BodyMassModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [BodyMassModel] in your schema.
 */
class BodyMassModelModelIdentifier
    implements amplify_core.ModelIdentifier<BodyMassModel> {
  final String id;

  /** Create an instance of BodyMassModelModelIdentifier using [id] the primary key. */
  const BodyMassModelModelIdentifier({required this.id});

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
  String toString() => 'BodyMassModelModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is BodyMassModelModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
