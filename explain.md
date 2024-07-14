## 0. Common

- final은 지정한 후에 변경 불가능
  - 변수를 먼저 지정하고 뒤에 기능을 할당하면 final로 먼저 지정되어 오류가 발생하는 경우 발생

📍 **render**

- 위젯이나 UI 요소를 화면에 그리는 과정

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

### 4.8 Birthday Screen

- Textfield에서 enabled: false 시 보지만 비활성화 (입력 x)
- Text vs TextField
  - Text: 단순히 텍스트를 화면에 표시하는 데 사용되며 수정 불가능
  - TextFiled: 텍스트를 입력하고 편집할 수 있는 텍스트 필드를 생성하는 데 사용
- TextEditingController
  - TextEditingController의 value 속성을 사용하면 텍스트 필드의 현재 텍스트와 선택된 텍스트를 가져오거나 변경할 수 있음
  - 텍스트 필드(TextField)의 현재 텍스트와 선택된 텍스트를 제어하는 데 사용
  - TextEditingController의 value 속성은 TextEditingValue 타입
  - 텍스트 필드의 현재 텍스트와 선택된 텍스트의 정보를 포함
- TextEditingValue 주요 속성
  - text: 텍스트 필드의 현재 텍스트
  - selection: 텍스트 필드에서 현재 선택된 텍스트의 범위를 나타내는 TextSelection 객체
  - composing: IME(입력 메소드 에디터)에 의해 현재 구성 중인 텍스트의 범위를 나타내는 TextRange 객체
- CupetinoDatePicker
  - (\*) onDateTimeChanged: 유저가 날짜나 시간을 바꿀 때 출력됨
- 함수 내에서의 final
  - 함수 호출시 새로운 공간이 할당되기에 final 변수를 내부에 사용

### 4.9 LoginForm Screen

- stateless widget의 function에는 context를 전달해줘야 함
  - context에 접근할 수 없음
- Form에는 global key가 필요함
  - global key
    - 고유 식별자 역할 수행
    - form의 state에도 접근 가능
    - form의 Method 실행 가능
- \_formKey.currentState
  - 있을수도 있고 없을수도 있기에 ?를 사용해서 없다면 아무것도 수행하지 않도록 함
  - \_formKey.currentState가 null이 아니면 bool을 반환
  - save함수는 모든 text입력에 onSaved 콜백 함수 실행
  - state를 추적하지 않아도 되는 장점이 있음

📍 **Super**

- super 키워드 사용: 부모 클래스의 메서드를 재정의한 경우, 자식 클래스에서 부모 클래스의 원래 메서드를 호출하기 위해 사용합니다. 이는 부모 클래스의 초기화 작업이나 기본 동작을 유지하면서 추가 작업을 수행하기 위해 필요합니다.
- super 키워드 사용하지 않음: 재정의되지 않은 기본 메서드를 호출할 때는 super 키워드를 사용할 필요가 없습니다. 이 경우 자식 클래스에서 해당 메서드를 직접 호출하면 됩니다.

### 5.1 Interests Screen

- Wrap
  - 가로로 배치하는데 한줄안에 다 안들어가면 다음줄로 넘어감
  - runSpacing으로 세로 간격 조정
  - spacing으로 가로 간격 조정
- rendering은 사용자가 보는 화면만 하는 것이 좋음
  - collection for 보다는 Listview 사용
- BottomAppBar
  - elevation은 떠있는듯한 효과를 줌

📌 **Ui tip**

- Singlechildscrollview > paddig > column > wrap 의 구조가 좋아보임

### 5.2 Scroll Animations

- controller를 만드려면 stateful로 변경해야함
- scroll controller 사용시 Singlechildscrollview를 scrollbar로 감쌈

### 5.3 Tutorial Screen

💥 AnimatedCrossFade로 기능 대체

- Scafold body appbar
  - no appbar ☞ SafeArea > Padding > Column > children
  - appbar ☞ Padding > Column > childern
- TabBarView
  - TabController 필요
    - controller를 따로 명시하거나
    - DefaultTabController를 사용
      - contents 개수를 지정해야함
      - scafold를 감싸서 사용
- TabPageSelector를 bottom에 추가하여 위치 표현 가능
  - TabBarView를 TabPageSelector로 감싸는 형식

### 5.4 AnimatedCrossFade

- 화면을 넘기는 swipe를 pand이라고 함 in GestureDetector
  - onPanUpdate는 DragUpdateDetails를 인자로 받음
    - DragUpdateDetails는 터치 포인트에 대한 Offset 제공
      - 왼쪽으로 가면 -
      - 오른쪽으로 가면 +
    - DragEndDetails는 drag가 끝났을때 하는 callback 함수
- cupertino button의 oppacity를 조절해서 보였다 안보였다 할 수 있음

💥 AnimatedCrossFade는 2개의 화면에 대상함
💥 AnimatedSwitcher를 통해 여러개로 변경

```dart
AnimatedSwitcher(
  duration: const Duration(seconds: 1),
  child: _myWidget, // 여기서 _myWidget은 현재 화면에 표시할 위젯 변수입니다.
  transitionBuilder: (Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },
)
```

### 6.1 pushAndRemoveUntil

- Navigator.of(context).push는 기존 화면 위에 새로운 화면을 올려놓는 개념
- pushAndRemoveUntil은 이전 내역을 지울 수 있음
  - 개수 선택 가능
  - stack 후 이전을 지우는 개념

### 6.2 BottomNavigationBar

- BottomNavigationBar는 최소 2개의 아이템을 가져야함
- meterial2를 따름

📍 **static, const, final**

- static: 인스턴스 생성하지 않고도 접근 간으
- const: 컴파일시 생성 > 변경 불가
- final: 1회 할당 후 변경 불가

### 6.3 NavigationBar

- BottomNavigationBar의 item이 destiantion이 됨
- meterial3를 따름

### 6.5 Custom NavigationBar

- Column은 기본적으로 세로 공간을 최대한 차지하려고 함
  - children의 공간만 차지하라고 선언
  - mainAxisSize: MainAxisSize.min,
- Expanded는 가능한만큼 확장시킴

### 6.6 Stateful Navigation part 1

- Globalkey: 위젯 생성시 고유한 키를 할당하여 식별할 수 있게 함
  - 다른 위젯의 상태에 접근
  - 위젯 간 데이터 전달
  - 위젯의 고유성 보장
  - 위젯의 위치 추적
  - stateful widget은 상태를 가지고 있고 이는 변경될 수 있기에 사용
  - stateless는 정적이라 상관없음
- scafold의 body를 변경하는 과정
- globalkey로 고유한 instance들을 생성하였으나 setstate함수로 인해 빌드될 때마다 다시 생성됨
- 다시 생성되는 과정에서 이전의 widget은 삭제함 (dispose)

### 6.7 Stateful Navigation part 2

- offstage는 화면이 사라지지 않고 계속 유지되게 함
- offstage child가 많으면 모두 동시에 활성화되어 rendering되기에 매우느려짐

### 6.8 Post Video Button

- Positionsed widget
  - stack 된 widget들을 control 하기 위해서 사용
  - positioned들은 stack 안에서 정해진 크기가 있어야함 > 기준점(어디서부터~) 필요
- Navigator의 fullscreenDialog를 설정하면 화면이 아래에서 위로 올라감

### 7.1 Infinite Scrolling

- PageView
  - 여러 widget을 스크롤하면서 보여주게함
  - 많아질수록 성능저하
  - Listview의 builder와 같이 pageview의 builder가 있음 > itembuilder
  - itembuilder는 context와 현재 render할 항목의 index를 argument로 받음
  - onPageChaged는 pageview에서 스크롤로 이동한 곳의 정보
  - itemcount는 초기에 지정되어 생성되나 setstate를 사용하여 늘려가며 사용 가능

### 7.2 PageController

- Controller의 animateToPage 강제로 사용자를 지정된 페이지로 보냄

### 7.3 Video Player

- assets 폴더를 pubspec.yaml에서 명시해줘야함
- positionedwidiget은 stack 속에 들어가는 widget
  - stack 위에 위젯들을 조정함
- video_player는 flutter에서 만든 비디오 재생 패키지
- state에서 property에 접근하기 위해 widget.~를 사용함

### 7.4 Visibility Detector

- visibility detector는 한번에 영상이 1개만 재생됨을 구현할 수 있음
  - 화면이 완전히 화면에 나올때만 재생시킴
- onVisibilityChanged는 visibility가 바뀔 때 호출할 callback
  - info를 parameter로 받음
- Stack으로 positioned.fill을 쌓을 시 이벤트는 가장 늦게 추가된 곳부터 하위로 전파
  - 아이콘은 이벤트 전파를 차단함
  - 따라서 아이콘은 ignorePointer로 감싸줌
  - 단, stack의 child는 모두 positioned.fill이어야 하기 때문에 positioned.fill의 child를 감쌈

### 7.5 AnimationController

- animation widget
  - opacity나 container 같은걸 사용함
  - 애니메이션 위젯에 대해서 커스텀을 하고싶으면 controller 필요
- lowerbound, upeprbound, value
  - value는 default
  - default to lowerbound, upperbound

### 7.6 AnimationBuilder

- 값을 animate하는 방법
  - animation controller를 만듦
  - lower, upper bound 설정
  - forward, reverse 사용
  - 값이 변경되었을 때 build method에 전달하는 방식을 다양하게 사용 가능
    - controller에 eventlistner를 추가하고 setstate로 build 재실행
      - listner가 없다면 setstate가 이루어지지 않아 뚝 뚝 끊김
    - transform sclae을 animationbuilder로 감쌈
      - builder는 함수인데, controller의 값이 변할때 마다 수행됨

### 7.7 SingleTickerProviderStateMixin

1. extends

   - extends는 클래스가 다른 클래스로부터 상속을 받을 때 사용됩니다.
   - 상속을 통해 하위 클래스는 상위 클래스의 메서드와 속성을 재사용할 수 있습니다.
   - Dart에서는 단일 상속만 지원되므로, 하나의 클래스는 오직 하나의 다른 클래스만 상속받을 수 있습니다.

2. with:
   - with 키워드는 믹스인(mixin)을 클래스에 적용할 때 사용됩니다.
   - 믹스인은 클래스의 코드를 여러 클래스에 재사용하기 위한 방법으로, 메서드와 속성을 다른 클래스에 "혼합"할 수 있게 해줍니다.
   - 하나의 클래스는 여러 믹스인을 사용할 수 있으며, with 키워드 뒤에 여러 믹스인을 나열할 수 있습니다.

☞ 믹스인은 특정 메서드만 담긴 클래스로 다른 클래스와는 달리 그 자체로 쓰이는 경우는 없으며 다른 클래스에 상속되어 쓰일 목적으로 만들어진 상속 전용 클래스라고 생각하면 쉽다.

- [설명](https://code-anthropoid.tistory.com/265)

- vsync

  - offscreen animation의 불필요한 리소스 사용을 막음
  - 위젯이 안보일때는 작동하지 않도록함
  - SingleTickerProviderStateMixin와 같이써야함

- SingleTickerProviderStateMixin

  - 화면이 동작중일때만 ticker를 줌
  - 애니메이션에 callback을 제공하는 것이 ticker
  - vsync:this에서 this에는 현재 클래스에 mixin된 SingleTickerProviderStateMixin가 있고, 여기에 ticker를 가져오는 개념
  - 즉, 위젯이 위젯 트리에 있을때만 Ticker를 유지

- TickerProviderStateMixin
  - 여러개의 controller가 있을 경우 여러개의 ticker를 생성함

📍 **widget on widget tree**

- 위젯이 위젯 트리에 있다는 것은, Flutter 애플리케이션에서 해당 위젯이 현재 활성화되어 화면에 표시되기 위해 구성된 위젯의 계층 구조에 포함되어 있다는 의미입니다.
- Flutter의 UI는 위젯으로 구성되며, 이러한 위젯들은 부모-자식 관계를 통해 트리 구조를 형성합니다. 이 트리 구조를 '위젯 트리'라고 합니다.
