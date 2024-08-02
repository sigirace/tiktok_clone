# Provider

## FamilyAsyncNotifier

📌 **외부의 데이터로부터 provider를 초기화**

- class
  - FamilyAsyncNotifier<State, Arg>
    - Notifier에게 인자를 전달할 수 있음
    - 첫번째 인자는 관리할 데이터인 State
    - 두번째 인자는 전달한 데이터인 Arg
- provider
  - AsyncNotifierProvider.family<out NotifierT extends AsyncNotifier<T>, State, Arg>

# Riverpod

📌 **state**

- state가 새로운 state로 변경되면, 이를 구독하고 있는 Widget들이 다시 빌드되도록 함
