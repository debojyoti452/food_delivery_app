abstract class StateStatus {
  const StateStatus();
}

class InitialState extends StateStatus {}

class IdleState extends StateStatus {}

class LoadingState extends StateStatus {}

class SuccessState extends StateStatus {}

class FailedState extends StateStatus {}
