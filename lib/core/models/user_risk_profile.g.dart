// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_risk_profile.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserRiskProfileCollection on Isar {
  IsarCollection<UserRiskProfile> get userRiskProfiles => this.collection();
}

const UserRiskProfileSchema = CollectionSchema(
  name: r'UserRiskProfile',
  id: 8586866055617485928,
  properties: {
    r'availableCapital': PropertySchema(
      id: 0,
      name: r'availableCapital',
      type: IsarType.double,
    ),
    r'profile': PropertySchema(
      id: 1,
      name: r'profile',
      type: IsarType.string,
    )
  },
  estimateSize: _userRiskProfileEstimateSize,
  serialize: _userRiskProfileSerialize,
  deserialize: _userRiskProfileDeserialize,
  deserializeProp: _userRiskProfileDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userRiskProfileGetId,
  getLinks: _userRiskProfileGetLinks,
  attach: _userRiskProfileAttach,
  version: '3.1.0+1',
);

int _userRiskProfileEstimateSize(
  UserRiskProfile object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.profile.length * 3;
  return bytesCount;
}

void _userRiskProfileSerialize(
  UserRiskProfile object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.availableCapital);
  writer.writeString(offsets[1], object.profile);
}

UserRiskProfile _userRiskProfileDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserRiskProfile();
  object.availableCapital = reader.readDouble(offsets[0]);
  object.id = id;
  object.profile = reader.readString(offsets[1]);
  return object;
}

P _userRiskProfileDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userRiskProfileGetId(UserRiskProfile object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userRiskProfileGetLinks(UserRiskProfile object) {
  return [];
}

void _userRiskProfileAttach(
    IsarCollection<dynamic> col, Id id, UserRiskProfile object) {
  object.id = id;
}

extension UserRiskProfileQueryWhereSort
    on QueryBuilder<UserRiskProfile, UserRiskProfile, QWhere> {
  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserRiskProfileQueryWhere
    on QueryBuilder<UserRiskProfile, UserRiskProfile, QWhereClause> {
  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterWhereClause>
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

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterWhereClause> idBetween(
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

extension UserRiskProfileQueryFilter
    on QueryBuilder<UserRiskProfile, UserRiskProfile, QFilterCondition> {
  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
      availableCapitalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'availableCapital',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
      availableCapitalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'availableCapital',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
      availableCapitalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'availableCapital',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
      availableCapitalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'availableCapital',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
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

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
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

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
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

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
      profileEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
      profileGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'profile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
      profileLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'profile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
      profileBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'profile',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
      profileStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'profile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
      profileEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'profile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
      profileContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'profile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
      profileMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'profile',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
      profileIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profile',
        value: '',
      ));
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterFilterCondition>
      profileIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'profile',
        value: '',
      ));
    });
  }
}

extension UserRiskProfileQueryObject
    on QueryBuilder<UserRiskProfile, UserRiskProfile, QFilterCondition> {}

extension UserRiskProfileQueryLinks
    on QueryBuilder<UserRiskProfile, UserRiskProfile, QFilterCondition> {}

extension UserRiskProfileQuerySortBy
    on QueryBuilder<UserRiskProfile, UserRiskProfile, QSortBy> {
  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterSortBy>
      sortByAvailableCapital() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableCapital', Sort.asc);
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterSortBy>
      sortByAvailableCapitalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableCapital', Sort.desc);
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterSortBy> sortByProfile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profile', Sort.asc);
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterSortBy>
      sortByProfileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profile', Sort.desc);
    });
  }
}

extension UserRiskProfileQuerySortThenBy
    on QueryBuilder<UserRiskProfile, UserRiskProfile, QSortThenBy> {
  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterSortBy>
      thenByAvailableCapital() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableCapital', Sort.asc);
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterSortBy>
      thenByAvailableCapitalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableCapital', Sort.desc);
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterSortBy> thenByProfile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profile', Sort.asc);
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QAfterSortBy>
      thenByProfileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profile', Sort.desc);
    });
  }
}

extension UserRiskProfileQueryWhereDistinct
    on QueryBuilder<UserRiskProfile, UserRiskProfile, QDistinct> {
  QueryBuilder<UserRiskProfile, UserRiskProfile, QDistinct>
      distinctByAvailableCapital() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'availableCapital');
    });
  }

  QueryBuilder<UserRiskProfile, UserRiskProfile, QDistinct> distinctByProfile(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'profile', caseSensitive: caseSensitive);
    });
  }
}

extension UserRiskProfileQueryProperty
    on QueryBuilder<UserRiskProfile, UserRiskProfile, QQueryProperty> {
  QueryBuilder<UserRiskProfile, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserRiskProfile, double, QQueryOperations>
      availableCapitalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'availableCapital');
    });
  }

  QueryBuilder<UserRiskProfile, String, QQueryOperations> profileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profile');
    });
  }
}
