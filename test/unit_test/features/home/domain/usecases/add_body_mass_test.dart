import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gimme_goals/features/main/home/domain/entity/body_mass_request.dart';
import 'package:gimme_goals/features/main/home/domain/repositories/home_repository.dart';
import 'package:gimme_goals/features/main/home/domain/usecases/add_body_mass.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/test_injection.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late AddBodyMass usecase;
  late HomeRepository mockDatasource;

  setUpAll(
    () {
      mockDatasource = MockHomeRepository();
      registerTestFactory<HomeRepository>(mockDatasource);
      usecase = AddBodyMass();
    },
  );

  group(
    'Add Body Mass',
    () {
      var entity = BodyMassRequest(
          height: 160, weight: 60, date: TemporalDate.fromString('2020-01-01'));

      test(
        'should return Right void when success',
        () async {
          when(() => mockDatasource.addBodyMass(entity)).thenAnswer(
            (_) async => const Right(null),
          );

          var result = await usecase.execute(entity);

          verify(() => mockDatasource.addBodyMass(entity));

          expect(result, equals(const Right(null)));
        },
      );
    },
  );
}
