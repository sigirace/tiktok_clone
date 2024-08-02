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

## state

📌 **state의 값 변경**

- 구독하고 있는 Widget들이 다시 빌드되도록 함

# Cloud Function

## firestore

📌 **필드 값을 1 증가**

> admin.firestore.FieldValue.increment(1)

- 감소는 -1
