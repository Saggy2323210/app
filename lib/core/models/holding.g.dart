// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holding.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHoldingCollection on Isar {
  IsarCollection<Holding> get holdings => this.collection();
}

const HoldingSchema = CollectionSchema(
  name: r'Holding',
  id: 5149792246537423500,
  properties: {
    r'buyPrice': PropertySchema(
      id: 0,
      name: r'buyPrice',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'exchange': PropertySchema(
      id: 2,
      name: r'exchange',
      type: IsarType.string,
    ),
    r'instrumentType': PropertySchema(
      id: 3,
      name: r'instrumentType',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 4,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'symbol': PropertySchema(
      id: 5,
      name: r'symbol',
      type: IsarType.string,
    )
  },
  estimateSize: _holdingEstimateSize,
  serialize: _holdingSerialize,
  deserialize: _holdingDeserialize,
  deserializeProp: _holdingDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _holdingGetId,
  getLinks: _holdingGetLinks,
  attach: _holdingAttach,
  version: '3.1.0+1',
);

int _holdingEstimateSize(
  Holding object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.exchange.length * 3;
  bytesCount += 3 + object.instrumentType.length * 3;
  bytesCount += 3 + object.symbol.length * 3;
  return bytesCount;
}

void _holdingSerialize(
  Holding object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.buyPrice);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeString(offsets[2], object.exchange);
  writer.writeString(offsets[3], object.instrumentType);
  writer.writeDouble(offsets[4], object.quantity);
  writer.writeString(offsets[5], object.symbol);
}

Holding _holdingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Holding();
  object.buyPrice = reader.readDouble(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.exchange = reader.readString(offsets[2]);
  object.id = id;
  object.instrumentType = reader.readString(offsets[3]);
  object.quantity = reader.readDouble(offsets[4]);
  object.symbol = reader.readString(offsets[5]);
  return object;
}

P _holdingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _holdingGetId(Holding object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _holdingGetLinks(Holding object) {
  return [];
}

void _holdingAttach(IsarCollection<dynamic> col, Id id, Holding object) {
  object.id = id;
}

extension HoldingQueryWhereSort on QueryBuilder<Holding, Holding, QWhere> {
  QueryBuilder<Holding, Holding, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HoldingQueryWhere on QueryBuilder<Holding, Holding, QWhereClause> {
  QueryBuilder<Holding, Holding, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Holding, Holding, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Holding, Holding, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Holding, Holding, QAfterWhereClause> idBetween(
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

extension HoldingQueryFilter
    on QueryBuilder<Holding, Holding, QFilterCondition> {
  QueryBuilder<Holding, Holding, QAfterFilterCondition> buyPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> buyPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> buyPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> buyPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buyPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> exchangeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exchange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> exchangeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exchange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> exchangeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exchange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> exchangeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exchange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> exchangeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exchange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> exchangeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exchange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> exchangeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exchange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> exchangeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exchange',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> exchangeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exchange',
        value: '',
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> exchangeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exchange',
        value: '',
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Holding, Holding, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Holding, Holding, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Holding, Holding, QAfterFilterCondition> instrumentTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instrumentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition>
      instrumentTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instrumentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> instrumentTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instrumentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> instrumentTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instrumentType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition>
      instrumentTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'instrumentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> instrumentTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'instrumentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> instrumentTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'instrumentType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> instrumentTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'instrumentType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition>
      instrumentTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instrumentType',
        value: '',
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition>
      instrumentTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'instrumentType',
        value: '',
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> quantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> quantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> quantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> quantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> symbolEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> symbolGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> symbolLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> symbolBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'symbol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> symbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> symbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> symbolContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> symbolMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'symbol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> symbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<Holding, Holding, QAfterFilterCondition> symbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'symbol',
        value: '',
      ));
    });
  }
}

extension HoldingQueryObject
    on QueryBuilder<Holding, Holding, QFilterCondition> {}

extension HoldingQueryLinks
    on QueryBuilder<Holding, Holding, QFilterCondition> {}

extension HoldingQuerySortBy on QueryBuilder<Holding, Holding, QSortBy> {
  QueryBuilder<Holding, Holding, QAfterSortBy> sortByBuyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPrice', Sort.asc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> sortByBuyPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPrice', Sort.desc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> sortByExchange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exchange', Sort.asc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> sortByExchangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exchange', Sort.desc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> sortByInstrumentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instrumentType', Sort.asc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> sortByInstrumentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instrumentType', Sort.desc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> sortBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> sortBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }
}

extension HoldingQuerySortThenBy
    on QueryBuilder<Holding, Holding, QSortThenBy> {
  QueryBuilder<Holding, Holding, QAfterSortBy> thenByBuyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPrice', Sort.asc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> thenByBuyPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyPrice', Sort.desc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> thenByExchange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exchange', Sort.asc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> thenByExchangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exchange', Sort.desc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> thenByInstrumentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instrumentType', Sort.asc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> thenByInstrumentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instrumentType', Sort.desc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> thenBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<Holding, Holding, QAfterSortBy> thenBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }
}

extension HoldingQueryWhereDistinct
    on QueryBuilder<Holding, Holding, QDistinct> {
  QueryBuilder<Holding, Holding, QDistinct> distinctByBuyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buyPrice');
    });
  }

  QueryBuilder<Holding, Holding, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Holding, Holding, QDistinct> distinctByExchange(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exchange', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Holding, Holding, QDistinct> distinctByInstrumentType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'instrumentType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Holding, Holding, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<Holding, Holding, QDistinct> distinctBySymbol(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'symbol', caseSensitive: caseSensitive);
    });
  }
}

extension HoldingQueryProperty
    on QueryBuilder<Holding, Holding, QQueryProperty> {
  QueryBuilder<Holding, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Holding, double, QQueryOperations> buyPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buyPrice');
    });
  }

  QueryBuilder<Holding, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Holding, String, QQueryOperations> exchangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exchange');
    });
  }

  QueryBuilder<Holding, String, QQueryOperations> instrumentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instrumentType');
    });
  }

  QueryBuilder<Holding, double, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<Holding, String, QQueryOperations> symbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'symbol');
    });
  }
}
