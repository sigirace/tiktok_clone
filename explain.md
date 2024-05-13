## 0. Common

- final은 지정한 후에 변경 불가능
  - 변수를 먼저 지정하고 뒤에 기능을 할당하면 final로 먼저 지정되어 오류가 발생하는 경우 발생

## 4. Autentication

### 4.0 Sign Up Screen

- SafeArea: 그 안에 있는 모든 것은 특정 공간에 있음, 뭔가에 가려지지 않음 like 상태창

### 4.1 Login Screen

- Navigatior 화면 이동
- auth_button
- FractionallySizedBox: 크기를 픽셀로 정하는 것이 아니라 부모의 크기에 비례해서 정함, Factor로 비율 설정

### 4.2 AuthButton

- Fontawesome
- Stack은 컬럼 내에서의 정렬을 하게 함, 위젯 하나만 정렬을 바꿀 수 있게 함

### 4.3 Sing Up Form

- 생명주기에 관련이 없는 것들은 \_를 붙여서 함수 생성
- dart는 private, protected, public 개념이 없음
- 대신 만약에 메서드나 프로퍼티 이름 앞에 \_가 있다면 다른 파일에서 보기는 private가 됨
- 같은 파일 내에서는 동일하게 접근 가능함
- main.dart의 Theme에 모든 scaffold의 배경을 지정할 수 있음

### 4.4 Username Screen

- Controller는 widget을 컨트롤 할 수 있게 함
- controller 생성을 위해 statefulwidget으로 변경
- state 클래스 안에 controller 선언
- AnimatedContainer 위젯은 컨테이너 장식에 대한 모든 변화를 애니메이션화 함

### 4.5 FormButton

- AnimateDefaultTextStyle
  - duration과 style을 가짐
- Button을 widget function으로 뺐을때
  - 생성자는 \_로 시작하는 변수명을 가질 수 없음
  - 따라서 이상한 구조의 생성자가 나옴
  - 상태 값만 받는 클래스로 수정

```dart
// Before
  const FormButton({
    super.key,
    required String username,
  }) : _username = username;

  final String _username;

// After
  const FormButton({
    super.key,
    required this.disabled,
  });

  final bool disabled;

//생성자의 매개변수 이름과 멤버 변수의 이름이 같을 때 this 키워드를 사용하여 멤버 변수를 가리킬 수 있습니다.
```

- Controller의 삭제
  - widget이 사라질 때, 컨트롤러를 메모리에서 지움
- StatefulWidget 안의 State 안에 있다면 어디서든 context를 사용할 수 있음
- onTap 함수

```dart
GestureDetector(
    onTap: () => _onLoginTap(context),
    child: Text( 'Log in', ...))

GestureDetector( onTap: _onNextTap,
                child: FormButton( disabled: _username.isEmpty, ), ),
```

- () =>를 사용하는 것은 함수를 호출할 때 추가적인 매개변수를 전달하거나, 함수 호출을 지연시키는 등의 특별한 동작이 필요할 때 사용됩니다.
- () =>가 없는 경우에는 함수를 직접 참조하여 호출합니다.

### 4.6 Email Screens

- 힌트: hintText
- 유효성검사: errorText
- enabledBorder: 입력 필드가 활성화되어 있지만 현재 포커스를 받지 않은 상태일 때의 테두리 스타일을 정의
  - UnderlineInputBorder를 사용하여 밑줄 스타일의 테두리
  - BorderSide를 사용하여 테두리의 색상
- focusedBorder: 입력 필드가 현재 포커스를 받고 있는 상태일 때의 테두리 스타일을 정의
  - UnderlineInputBorder, BorderSide를 사용하여 테두리의 스타일과 색상을 동일하게 설정

### 4.7 Password

- 비밀번호 관련 아이콘들 추가
- InputDecoration에 suffix, suffixIcon, prefix, prefixIcon을 이용
- 비밀번호 스럽게 하려면 TextFiled에서 obsecureText를 ture로 설정
