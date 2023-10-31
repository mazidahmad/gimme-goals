import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gimme_goals/features/main/home/data/datasources/home_remote_datasource.dart';
import 'package:gimme_goals/features/main/home/data/models/body_mass_request_model.dart';
import 'package:gimme_goals/features/main/home/data/repositories/home_repository_impl.dart';
import 'package:gimme_goals/features/main/home/domain/repositories/home_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/test_injection.dart';

class MockHomeRemoteDatasource extends Mock implements HomeRemoteDatasource {}

void main() {
  late HomeRepository repository;
  late HomeRemoteDatasource mockDatasource;

  setUpAll(
    () {
      mockDatasource = MockHomeRemoteDatasource();
      registerTestFactory<HomeRemoteDatasource>(mockDatasource);
      repository = HomeRepositoryImpl();
    },
  );

  group(
    'Add Body Mass',
    () {
      var model = BodyMassRequestModel(
        weight: 60,
        height: 160,
        date: TemporalDate.fromString('2020-01-01'),
      );

      test(
        'should return Right void when success',
        () async {
          when(() => mockDatasource.createTodayBodyMass(model)).thenAnswer(
            (_) async => model,
          );

          var result = await repository.addBodyMass(model);

          verify(() => mockDatasource.createTodayBodyMass(model));

          expect(result, equals(Right(model)));
        },
      );
    },
  );
}
