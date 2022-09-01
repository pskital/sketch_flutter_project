import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_bloc.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_event.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';
import 'package:sketch_flutter_project/ui/scenes/login_user_scene/login_user_button_widget.dart';

class MockLoginUserBloc extends MockBloc<UserLoginEvent, UserLoginState>
    implements LoginUserBloc {}

void main() {
  Widget createWidget({required Widget child, required LoginUserBloc bloc}) {
    return BlocProvider<Bloc<dynamic, dynamic>>(
      create: (_) => bloc,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  late MockLoginUserBloc mockBloc;

  setUp(() {
    mockBloc = MockLoginUserBloc();
  });

  testWidgets('test login button check is visible when idle state',
      (WidgetTester tester) async {
    whenListen<UserLoginState>(
      mockBloc,
      Stream<UserLoginState>.fromIterable(
        <UserLoginState>[],
      ),
      initialState: const UserLoginIdleState(),
    );

    await tester.pumpWidget(
      createWidget(child: LoginUserButtonWidget(), bloc: mockBloc),
    );

    await tester.ensureVisible(find.byType(ElevatedButton));
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('test login button check is visible when error state',
      (WidgetTester tester) async {
    whenListen<UserLoginState>(
      mockBloc,
      Stream<UserLoginState>.fromIterable(
        <UserLoginState>[],
      ),
      initialState: const UserLoginErrorState('error'),
    );

    await tester.pumpWidget(
      createWidget(child: LoginUserButtonWidget(), bloc: mockBloc),
    );

    await tester.ensureVisible(find.byType(ElevatedButton));
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('test check progress is visible when login in progress',
      (WidgetTester tester) async {
    whenListen<UserLoginState>(
      mockBloc,
      Stream<UserLoginState>.fromIterable(
        <UserLoginState>[
          UserLoginInProgressState(),
        ],
      ),
      initialState: const UserLoginIdleState(),
    );

    await tester.pumpWidget(
      createWidget(child: LoginUserButtonWidget(), bloc: mockBloc),
    );
    await tester.pump(const Duration(seconds: 1));

    await tester.ensureVisible(find.byType(CircularProgressIndicator));
    expect(find.byType(ElevatedButton), findsNothing);
  });

  testWidgets('test login button is disabled when login success',
      (WidgetTester tester) async {
    whenListen<UserLoginState>(
      mockBloc,
      Stream<UserLoginState>.fromIterable(
        <UserLoginState>[
          const UserLoginSuccessState(),
        ],
      ),
      initialState: const UserLoginIdleState(),
    );

    await tester.pumpWidget(
      createWidget(child: LoginUserButtonWidget(), bloc: mockBloc),
    );
    await tester.pump(const Duration(seconds: 1));

    expect(
      tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled,
      isFalse,
    );
  });
}
