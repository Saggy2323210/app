// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAIProviderConfigCollection on Isar {
  IsarCollection<AIProviderConfig> get aIProviderConfigs => this.collection();
}

const AIProviderConfigSchema = CollectionSchema(
  name: r'AIProviderConfig',
  id: -9107772762820653102,
  properties: {
    r'activeModel': PropertySchema(
      id: 0,
      name: r'activeModel',
      type: IsarType.string,
    ),
    r'activeProvider': PropertySchema(
      id: 1,
      name: r'activeProvider',
      type: IsarType.string,
    ),
    r'globalMode': PropertySchema(
      id: 2,
      name: r'globalMode',
      type: IsarType.byte,
      enumMap: _AIProviderConfigglobalModeEnumValueMap,
    ),
    r'perAgentConfigJson': PropertySchema(
      id: 3,
      name: r'perAgentConfigJson',
      type: IsarType.string,
    )
  },
  estimateSize: _aIProviderConfigEstimateSize,
  serialize: _aIProviderConfigSerialize,
  deserialize: _aIProviderConfigDeserialize,
  deserializeProp: _aIProviderConfigDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _aIProviderConfigGetId,
  getLinks: _aIProviderConfigGetLinks,
  attach: _aIProviderConfigAttach,
  version: '3.1.0+1',
);

int _aIProviderConfigEstimateSize(
  AIProviderConfig object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activeModel.length * 3;
  bytesCount += 3 + object.activeProvider.length * 3;
  bytesCount += 3 + object.perAgentConfigJson.length * 3;
  return bytesCount;
}

void _aIProviderConfigSerialize(
  AIProviderConfig object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activeModel);
  writer.writeString(offsets[1], object.activeProvider);
  writer.writeByte(offsets[2], object.globalMode.index);
  writer.writeString(offsets[3], object.perAgentConfigJson);
}

AIProviderConfig _aIProviderConfigDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AIProviderConfig();
  object.activeModel = reader.readString(offsets[0]);
  object.activeProvider = reader.readString(offsets[1]);
  object.globalMode = _AIProviderConfigglobalModeValueEnumMap[
          reader.readByteOrNull(offsets[2])] ??
      AIMode.auto;
  object.id = id;
  object.perAgentConfigJson = reader.readString(offsets[3]);
  return object;
}

P _aIProviderConfigDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (_AIProviderConfigglobalModeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          AIMode.auto) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AIProviderConfigglobalModeEnumValueMap = {
  'auto': 0,
  'gemini': 1,
  'nvidia': 2,
  'ollama': 3,
};
const _AIProviderConfigglobalModeValueEnumMap = {
  0: AIMode.auto,
  1: AIMode.gemini,
  2: AIMode.nvidia,
  3: AIMode.ollama,
};

Id _aIProviderConfigGetId(AIProviderConfig object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _aIProviderConfigGetLinks(AIProviderConfig object) {
  return [];
}

void _aIProviderConfigAttach(
    IsarCollection<dynamic> col, Id id, AIProviderConfig object) {
  object.id = id;
}

extension AIProviderConfigQueryWhereSort
    on QueryBuilder<AIProviderConfig, AIProviderConfig, QWhere> {
  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AIProviderConfigQueryWhere
    on QueryBuilder<AIProviderConfig, AIProviderConfig, QWhereClause> {
  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AIProviderConfigQueryFilter
    on QueryBuilder<AIProviderConfig, AIProviderConfig, QFilterCondition> {
  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeModelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeModelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activeModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeModelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activeModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeModelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activeModel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeModelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activeModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeModelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activeModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activeModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activeModel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeModel',
        value: '',
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activeModel',
        value: '',
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeProviderEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeProviderGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activeProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeProviderLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activeProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeProviderBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activeProvider',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeProviderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activeProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeProviderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activeProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeProviderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activeProvider',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeProviderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activeProvider',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeProviderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeProvider',
        value: '',
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      activeProviderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activeProvider',
        value: '',
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      globalModeEqualTo(AIMode value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'globalMode',
        value: value,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      globalModeGreaterThan(
    AIMode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'globalMode',
        value: value,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      globalModeLessThan(
    AIMode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'globalMode',
        value: value,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      globalModeBetween(
    AIMode lower,
    AIMode upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'globalMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      perAgentConfigJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'perAgentConfigJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      perAgentConfigJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'perAgentConfigJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      perAgentConfigJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'perAgentConfigJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      perAgentConfigJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'perAgentConfigJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      perAgentConfigJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'perAgentConfigJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      perAgentConfigJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'perAgentConfigJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      perAgentConfigJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'perAgentConfigJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      perAgentConfigJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'perAgentConfigJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      perAgentConfigJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'perAgentConfigJson',
        value: '',
      ));
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterFilterCondition>
      perAgentConfigJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'perAgentConfigJson',
        value: '',
      ));
    });
  }
}

extension AIProviderConfigQueryObject
    on QueryBuilder<AIProviderConfig, AIProviderConfig, QFilterCondition> {}

extension AIProviderConfigQueryLinks
    on QueryBuilder<AIProviderConfig, AIProviderConfig, QFilterCondition> {}

extension AIProviderConfigQuerySortBy
    on QueryBuilder<AIProviderConfig, AIProviderConfig, QSortBy> {
  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      sortByActiveModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeModel', Sort.asc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      sortByActiveModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeModel', Sort.desc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      sortByActiveProvider() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeProvider', Sort.asc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      sortByActiveProviderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeProvider', Sort.desc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      sortByGlobalMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalMode', Sort.asc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      sortByGlobalModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalMode', Sort.desc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      sortByPerAgentConfigJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perAgentConfigJson', Sort.asc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      sortByPerAgentConfigJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perAgentConfigJson', Sort.desc);
    });
  }
}

extension AIProviderConfigQuerySortThenBy
    on QueryBuilder<AIProviderConfig, AIProviderConfig, QSortThenBy> {
  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      thenByActiveModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeModel', Sort.asc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      thenByActiveModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeModel', Sort.desc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      thenByActiveProvider() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeProvider', Sort.asc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      thenByActiveProviderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeProvider', Sort.desc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      thenByGlobalMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalMode', Sort.asc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      thenByGlobalModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalMode', Sort.desc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      thenByPerAgentConfigJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perAgentConfigJson', Sort.asc);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QAfterSortBy>
      thenByPerAgentConfigJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perAgentConfigJson', Sort.desc);
    });
  }
}

extension AIProviderConfigQueryWhereDistinct
    on QueryBuilder<AIProviderConfig, AIProviderConfig, QDistinct> {
  QueryBuilder<AIProviderConfig, AIProviderConfig, QDistinct>
      distinctByActiveModel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeModel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QDistinct>
      distinctByActiveProvider({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeProvider',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QDistinct>
      distinctByGlobalMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'globalMode');
    });
  }

  QueryBuilder<AIProviderConfig, AIProviderConfig, QDistinct>
      distinctByPerAgentConfigJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'perAgentConfigJson',
          caseSensitive: caseSensitive);
    });
  }
}

extension AIProviderConfigQueryProperty
    on QueryBuilder<AIProviderConfig, AIProviderConfig, QQueryProperty> {
  QueryBuilder<AIProviderConfig, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AIProviderConfig, String, QQueryOperations>
      activeModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeModel');
    });
  }

  QueryBuilder<AIProviderConfig, String, QQueryOperations>
      activeProviderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeProvider');
    });
  }

  QueryBuilder<AIProviderConfig, AIMode, QQueryOperations>
      globalModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'globalMode');
    });
  }

  QueryBuilder<AIProviderConfig, String, QQueryOperations>
      perAgentConfigJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'perAgentConfigJson');
    });
  }
}
