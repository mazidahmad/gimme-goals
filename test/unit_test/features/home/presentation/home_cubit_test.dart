import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gimme_goals/features/global/data/models/model_provider.dart';
import 'package:gimme_goals/features/main/home/domain/usecases/get_body_goal.dart';
import 'package:gimme_goals/features/main/home/domain/usecases/get_today_body_mass.dart';
import 'package:gimme_goals/features/main/home/presentation/cubit/home_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/test_injection.dart';

class MockGetTodayBodyMass extends Mock implements GetTodayBodyMass {}

class MockGetBodyGoal extends Mock implements GetBodyGoal {}

void main() {
  late GetTodayBodyMass mockGetTodayBodyMass;
  late HomeCubit cubit;
  late GetBodyGoal mockGetBodyGoal;

  setUp(() {
    mockGetTodayBodyMass = MockGetTodayBodyMass();
    mockGetBodyGoal = MockGetBodyGoal();
    registerTestFactory<GetTodayBodyMass>(mockGetTodayBodyMass);
    registerTestFactory<GetBodyGoal>(mockGetBodyGoal);
    cubit = HomeCubit();
  });

  tearDown(() {
    cubit.close();
  });

  test('initial HomeCubit state should be initial', () {
    expect(cubit.state, const HomeState(status: HomeStateStatus.initial));
  });

  group(
    'Get Today Body Mass',
    () {
      var goal =
          GoalModel(height: 160, user_id: 'userId', weight: 60, id: '232424');
      var bodyMass = BodyMassModel(
          user_id: 'userId',
          height: 160,
          date: TemporalDate.fromString('2020-01-01'),
          weight: 60);

      blocTest<HomeCubit, HomeState>(
        'emits [loading, success] when success.',
        build: () {
          when(
            () => mockGetTodayBodyMass.execute(),
          ).thenAnswer((_) async => Right(bodyMass));
          when(
            () => mockGetBodyGoal.execute(),
          ).thenAnswer((_) async => Right(goal));
          return cubit;
        },
        wait: const Duration(milliseconds: 100),
        act: (cubit) => cubit.getTodayBodyMass(),
        expect: () => <HomeState>[
          const HomeState(status: HomeStateStatus.loading),
          HomeState(
              status: HomeStateStatus.loaded,
              goal: goal,
              todayBodyMass: bodyMass),
        ],
        verify: (bloc) {
          verify(
            () => mockGetTodayBodyMass.execute(),
          );
          verify(
            () => mockGetBodyGoal.execute(),
          );
        },
      );
    },
  );
}
