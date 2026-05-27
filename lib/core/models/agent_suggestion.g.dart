// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_suggestion.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAgentSuggestionCollection on Isar {
  IsarCollection<AgentSuggestion> get agentSuggestions => this.collection();
}

const AgentSuggestionSchema = CollectionSchema(
  name: r'AgentSuggestion',
  id: -7409658065229429097,
  properties: {
    r'data': PropertySchema(
      id: 0,
      name: r'data',
      type: IsarType.string,
    )
  },
  estimateSize: _agentSuggestionEstimateSize,
  serialize: _agentSuggestionSerialize,
  deserialize: _agentSuggestionDeserialize,
  deserializeProp: _agentSuggestionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _agentSuggestionGetId,
  getLinks: _agentSuggestionGetLinks,
  attach: _agentSuggestionAttach,
  version: '3.1.0+1',
);

int _agentSuggestionEstimateSize(
  AgentSuggestion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.data.length * 3;
  return bytesCount;
}

void _agentSuggestionSerialize(
  AgentSuggestion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.data);
}

AgentSuggestion _agentSuggestionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AgentSuggestion();
  object.data = reader.readString(offsets[0]);
  object.id = id;
  return object;
}

P _agentSuggestionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _agentSuggestionGetId(AgentSuggestion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _agentSuggestionGetLinks(AgentSuggestion object) {
  return [];
}

void _agentSuggestionAttach(
    IsarCollection<dynamic> col, Id id, AgentSuggestion object) {
  object.id = id;
}

extension AgentSuggestionQueryWhereSort
    on QueryBuilder<AgentSuggestion, AgentSuggestion, QWhere> {
  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AgentSuggestionQueryWhere
    on QueryBuilder<AgentSuggestion, AgentSuggestion, QWhereClause> {
  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterWhereClause>
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

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterWhereClause> idBetween(
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

extension AgentSuggestionQueryFilter
    on QueryBuilder<AgentSuggestion, AgentSuggestion, QFilterCondition> {
  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterFilterCondition>
      dataEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterFilterCondition>
      dataGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterFilterCondition>
      dataLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterFilterCondition>
      dataBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'data',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterFilterCondition>
      dataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterFilterCondition>
      dataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterFilterCondition>
      dataContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterFilterCondition>
      dataMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'data',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterFilterCondition>
      dataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data',
        value: '',
      ));
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterFilterCondition>
      dataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'data',
        value: '',
      ));
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterFilterCondition>
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

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterFilterCondition>
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

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterFilterCondition>
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
}

extension AgentSuggestionQueryObject
    on QueryBuilder<AgentSuggestion, AgentSuggestion, QFilterCondition> {}

extension AgentSuggestionQueryLinks
    on QueryBuilder<AgentSuggestion, AgentSuggestion, QFilterCondition> {}

extension AgentSuggestionQuerySortBy
    on QueryBuilder<AgentSuggestion, AgentSuggestion, QSortBy> {
  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterSortBy> sortByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterSortBy>
      sortByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }
}

extension AgentSuggestionQuerySortThenBy
    on QueryBuilder<AgentSuggestion, AgentSuggestion, QSortThenBy> {
  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterSortBy> thenByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterSortBy>
      thenByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AgentSuggestion, AgentSuggestion, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension AgentSuggestionQueryWhereDistinct
    on QueryBuilder<AgentSuggestion, AgentSuggestion, QDistinct> {
  QueryBuilder<AgentSuggestion, AgentSuggestion, QDistinct> distinctByData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'data', caseSensitive: caseSensitive);
    });
  }
}

extension AgentSuggestionQueryProperty
    on QueryBuilder<AgentSuggestion, AgentSuggestion, QQueryProperty> {
  QueryBuilder<AgentSuggestion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AgentSuggestion, String, QQueryOperations> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'data');
    });
  }
}
