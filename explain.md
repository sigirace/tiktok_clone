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
- 비밀번호 스럽게 하려면 textfield에서 obsecureText를 ture로 설정

### 4.8 Birthday Screen

- Textfield에서 enabled: false 시 보지만 비활성화 (입력 x)
- Text vs TextField
  - Text: 단순히 텍스트를 화면에 표시하는 데 사용되며 수정 불가능
  - textfield: 텍스트를 입력하고 편집할 수 있는 텍스트 필드를 생성하는 데 사용
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

📍 **BottomAppbar**

- bottomappbar는 일반적으로 화면 전체 너비를 차지하는 특성을 가짐

📌 **Ui tip**

- Singlechildscrollview > paddig > column > wrap 의 구조가 좋아보임

📍 **Wrap, Expanded**

- wrap은 자식 위젯들의 배열이 부모의 길이를 넘어갈 때, 자동으로 다음 줄로 내려가게 하는 레이아웃
  - 여러개의 버튼, 칩, 태그 등 유연하게 배치할때 사용
- Text 위젯 내의 글이 넘칠 경우 Expanded, Flexible 등으로 감싸서 해결

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

- static: 인스턴스 생성하지 않고도 접근 가능
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

📍 **OffStage**

- 이 위젯을 사용하여 특정 조건에 따라 자식 위젯을 화면에서 보이거나 보이지 않게 할 수 있습니다.
- Offstage 위젯의 offstage 속성은 이 기능을 제어합니다.

- offstage: true
  - Offstage 위젯의 자식(child)은 레이아웃에서 제외되며 화면에 보이지 않습니다.
  - 하지만, 자식 위젯은 여전히 상태를 유지하고, 백그라운드에서 작업을 수행할 수 있습니다(예: 애니메이션).
- offstage: false
  - 자식 위접은 정상적으로 화면에 표시되고 레이아웃에 포함됩니다.

```dart
  Offstage(
    offstage: _selectedIndex != 4,
    child: const StfScreen(),
  ),
```

- 여기서 제공된 코드에서는 \_selectedIndex != 4 조건을 사용하여 offstage 속성을 설정하고 있습니다.
- 이는 \_selectedIndex 변수의 값이 4가 아닐 때 StfScreen() 위젯을 화면에서 숨기는 데 사용됩니다.
- 즉, \_selectedIndex가 4일 경우에만 StfScreen() 위젯이 화면에 표시됩니다.

- onTap
  - main_navigation_screen에 정의된 함수를 NavTab widget에 넘겨 생성함
  - 각 widget이 클릭되면 main_navigation_screen의 함수를 수행
  - 수행된 함수는 main_navigation_screen에서 index를 변경

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

📍 **PageView vs PageView.builder**

1. PageView

- PageView는 모든 페이지를 미리 생성합니다.
- 이는 페이지의 수가 적고, 모든 페이지를 미리 로드해두어야 할 때 유용합니다.
- PageView를 사용하면 children 속성을 통해 페이지들을 직접 정의할 수 있습니다.

```dart
PageView(
  children: <Widget>[
    Page1(),
    Page2(),
    Page3(),
  ],
)
```

2. PageView.builder

- PageView.builder는 필요할 때 페이지를 동적으로 생성합니다.
- 이는 페이지의 수가 많거나, 사용자가 스크롤할 때 페이지를 생성해야 할 때 메모리 사용량을 줄이는 데 유용합니다.
- PageView.builder는 itemBuilder 콜백을 사용하여 페이지를 생성합니다. 이 콜백은 현재 인덱스를 기반으로 해당 위치에 표시할 위젯을 반환합니다.
- return되는 page는 callback에 따라 동적으로 생성됨

```dart
PageView.builder(
  itemCount: 10, // 페이지 수
  itemBuilder: (context, index) {
    return Page(index); // 인덱스에 해당하는 페이지 반환
  },
)
```

📍 **onPageChanged**

- PageView.builder 위젯의 onPageChanged 콜백은 페이지 뷰가 스크롤되어 새 페이지가 중앙에 위치할 때마다 호출됩니다.
- page 매개변수는 현재 중앙에 위치한 페이지의 인덱스를 나타냅니다.

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

👀 **Definition**

> SingleTickerProviderStateMixin은 TickerProvider를 구현하는 mixin입니다. 이 mixin은 단일 Ticker 객체를 제공하며, 애니메이션 컨트롤러가 필요로 하는 동기화를 제공합니다. Ticker는 애니메이션의 각 프레임을 생성하는 역할을 합니다.

- 화면이 동작중일때만 ticker를 줌
- 기능1: ticker는 모든 애니메이션 프레임에서 callback function을 호출하는 시계 같은 것
- 기능2: widget이 widget tree에 없을 때, resource를 낭비하지 않게 함
- vsync:this에서 this에는 현재 클래스에 mixin된 SingleTickerProviderStateMixin가 있고, 여기에 ticker를 가져오는 개념
- 즉, 위젯이 위젯 트리에 있을때만 Ticker를 유지

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

  - vsync: this는 controller가 현재 상태 객체(\_[screen_name]State)를 동기화 대상으로 사용하도록 설정
  - 이를 통해 애니메이션이 디바이스의 디스플레이 주사율에 맞춰 부드럽게 실행될 수 있음
  - offscreen animation의 불필요한 리소스 사용을 막음
  - 위젯이 안보일때는 작동하지 않도록함
  - SingleTickerProviderStateMixin와 같이써야함

- TickerProviderStateMixin
  - 여러개의 controller가 있을 경우 여러개의 ticker를 생성함

📍 **widget on widget tree**

- 위젯이 위젯 트리에 있다는 것은, Flutter 애플리케이션에서 해당 위젯이 현재 활성화되어 화면에 표시되기 위해 구성된 위젯의 계층 구조에 포함되어 있다는 의미입니다.
- Flutter의 UI는 위젯으로 구성되며, 이러한 위젯들은 부모-자식 관계를 통해 트리 구조를 형성합니다. 이 트리 구조를 '위젯 트리'라고 합니다.

### 7.8 Video UI

- video controller에 set Lopping 기능을 사용하면 반복재생 가능

📍 **Position vs Positioned.fill**

- Positioned.fill과 Positioned 위젯은 Flutter에서 Stack 위젯 내에서 자식 위젯의 위치를 조정할 때 사용됩니다.
- 두 위젯의 주요 차이점은 위치와 크기를 지정하는 방식에 있습니다.

1. Positioned 위젯

- Positioned 위젯을 사용하면, 자식 위젯의 정확한 위치(top, right, bottom, left)와 크기(width, height)를 수동으로 지정할 수 있습니다.
- 이를 통해 Stack 내에서 위젯의 정확한 위치와 크기를 제어할 수 있습니다.

```dart
Positioned(
  top: 10, // 상단에서 10픽셀 떨어진 위치
  left: 20, // 왼쪽에서 20픽셀 떨어진 위치
  child: SomeWidget(), // 위치를 지정할 자식 위젯
)
```

2. Positioned.fill 위젯

- Positioned.fill은 Positioned의 특수한 경우로, Stack의 가능한 전체 영역을 채우도록 자식 위젯을 확장합니다.
- top, right, bottom, left 속성을 모두 0으로 설정하는 것과 동일한 효과를 가지며, 이를 통해 자식 위젯이 부모 Stack의 모든 공간을 차지하도록 할 수 있습니다.
- Positioned.fill은 주로 배경, 블러 효과, 클릭 이벤트 영역 확장 등에 사용됩니다.

```dart
Positioned.fill(
  child: SomeWidget(), // `Stack`의 전체 영역을 채울 자식 위젯
)
```

3. 요약

- Positioned는 자식 위젯의 위치와 크기를 상세하게 지정할 수 있게 해줍니다.
- Positioned.fill은 자식 위젯이 Stack의 전체 영역을 채우도록 확장합니다. 위치를 별도로 지정할 필요 없이, Stack의 모든 공간을 차지하게 합니다.

- circleAvatar는 이미지가 있는 원을 제공
- background는 배경 foreground는 글씨색
- foreground Image > NetworkImage로 이미지 넣을 수 있음
- FaIcon의 데이터타입은 IconData

📍 **extend State vs Constructor**

- extend state 안의 변수들은 반드시 초기화가 되어야함
  - 초기화 되지 않는 경우 late를 넣어 setSta시에 initialize 됨
- 일반적인 class의 변수들은 final, const를 통해 정의

### 7.9 RefreshIndicator

- 유저가 당겨서 타임라인을 새로고침
- onRefresh callback이 필요함
  - 화면을 당길 때 실행되는 callback
  - 반드시 Future를 반환해야함
  - 즉, async 혹은 future를 반환
  - displacement는 화면을 당긴 뒤 indicator의 위치를 정함
    - 뱅글뱅글이 도는 위치
  - edgeOffset: 화면을 당겼을때 이제 리프레시 될거야를 나타내는 위치
  -

### 8.0 showModalBottomSheet

- sheet는 navigation bar까지 덮음
- showModalBottomSheet
  - Future를 반환 > await 사용 가능
  - barriorColor는 bottom sheet 뒷 배경을 바꿈
  - bottom sheet와 builder로 생성된 widget은 부모-자식 개념
    - background color를 Colors.transparent로 설정한다면 부모가 투명해지게 설정
- Scafold의 automaticallyImplyLeading는 뒤로가기 버튼을 지움
- action을 통해서 버튼을 달고 함수를 지정할 수 있음

📍 **함수 호출 방식**

- 추가적인 인자가 (ex, context) 필요한 경우
  - () => Function(context)
- 그렇지 않은경우
  - Function

📍 **Future resolve**

- Future가 Resolve된다는 것은 Future 객체가 비동기 연산의 완료를 나타냄
  - 성공적 완료: Future.then() method로 접근 가능
  - 에러: Future.catchError() 메소드로 처리
- Future는 await와 async 키워드를 사용함
  - await를 사용하면 dart 코드의 실행을 일시적으로 중지하고 Future가 resolve 될 때 까지 대기

📍 **Clip behavior**

- 자식이 부모영역을 침범하는 것을 제어함
- Container를 둥글게 하였으나 자식인 widget이 이를 넘어서 표시된다면 잘라주는 역할

### 8.1 Comments

- 댓글창을 만드는 과정 > 이전 강의 내용 활용

### 8.2 Add Comment

- Textfield는 제한되지 않은 가로 크기를 가지기에 Expanded 혹은 flexible로 감싸줘야함
  - 이전 예제에선 Padding을 통해 전체 길이를 제한했었음
- keyboard가 나타나면 main에서 body를 조절함
  - resizeToAvoidBottomInset: false 로 해결
- bottomnavigationbar는 키보드가 나타났을때 숨겨지기 때문에 입력에 좋지 못함
- Positioned widget은 자식의 크기가 명확히 지정되어있으면 width나 height를 쓰지 않아도 무방
  - width: MediaQuery.of(context).size.width,
- positioned에 width를 주는 이유
  - bottomappbar는 일반적으로 화면 전체의 너비를 차지하는 특성을 가짐
  - 그런데 부모가 poisitioned이고 명시적으로 너비를 설정하지 않으면 bottomappbar는 유한한 너비 제약을 받지 못함
  - 이에 따라 row의 expanded가 터지게 됨
- bottomsheet의 크기를 늘리려면 showModalBottomSheet의 isscrolled를 true로 변경
  - listview를 사용할 경우

📍 **Iphone 스타일의 입력폼(채팅)**

```dart
TextField(
    cursorColor: Theme.of(context).primaryColor,
    decoration: InputDecoration(
      hintText: "Add a comment...",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          Sizes.size12,
        ),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.grey.shade200,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Sizes.size10,
        horizontal: Sizes.size10,
      ),
    ),
  ),
```

### 8.3 Text Input Action

- TextField의 높이를 키우려면 SizedBox로 감싸야함
- TextField에서 enter 키를 통해 줄바꿈 선언
  - sizedbox 필요
  - minLines, maxLines 지정
  - expands: true
  - 해당세팅 후 bottomsheet 를 클릭해도 반응이 없음
    - GestureDetector를 통해 함수 새로 구성하여 해결
- TextField 안에 아이콘을 넣으려면 suffixIcon
- suffixIcon은 아이콘들을 오른쪽에 붙여넣으려고함
- prefixIcon은 아이콘들을 왼쪽 시작점에 붙여넣으려고 함

📍 **Row**

- Row 안에 조건문을 넣으면 그 다음 child에 대한 컨트롤 가능
- MainAixsSize
  - MainAxisSize.max: 부모 위젯이 허용하는 최대 넓이까지 확장 (default)
  - MainAxisSize.min: 위젯이 자식 위젯들이 필요로하는 최소한의 가로만을 차지하도록 함

### 8.4 Conclusions

- ListView.separated에서 padding은 리스트의 전체를 패딩하는 개념
  - 각각의 리스트를 떨어뜨리는것이 아님
- Listview에서 scroll을 두려면 컨드롤러가 필요
  - Scrollbar 위젯으로 감쌈
  - controller를 scrollbar와 listview 둘 다 삽입

📍 **VisibilityInfo**

- visibleFraction: 위젯의 가시적인 부분이 전체 대비 얼마나 차지하는지를 나타냅니다.
  - 이 값은 0.0(전혀 보이지 않음)에서 1.0(완전히 보임) 사이의 값을 가집니다.
- size: 위젯의 크기를 나타내는 Size 객체입니다.
- offset: 화면에서 위젯의 위치를 나타내는 Offset 객체입니다.

### 9.1 Light Navigation

- Navigation의 색을 click 상태에 따라 바꿔줌

### 9.2 TabBar

- appbar의 property 중 하나인 bottom
  - elevation은 appbar 밑의 음영을 지정
  - container 같은 위젯은 사용할 수 없음
  - preferredSizeWidget이란 특정한 크기를 가지려고 하지만 자식요소의 크기를 제한하지 않음
    - 이 위젯 자체는 특정 크기를 가지나 하위 자식에게 강요하지 않음
  - TabBar
    - 이미 preferredSizeWidget
    - TabBar는 tab이 필요
      - tab은 widget의 list
      - Tab widget으로 사용 가능
      - tab widget은 tabcontroller가 필요함

📌 **Tab controller를 만드는 간단한 방법**

- DefaultTabController 사용
- length 지정해줘야함
- 아래는 defualttabcontroller로 만드는 틀

```dart
bottom: TabBar(
            elevation: 1,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            splashFactory: NoSplash.splashFactory,
            isScrollable: true,
            labelStyle: const TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w600,
            ),
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: Colors.black,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
```

### 9.3 GridView

- Gridview
  - gridDelegate
    - controller랑은 다른 서포터
    - SliverGridDelegateWithFixedCrossAxisCount
      - crossAxisCount: 몇개의 열을 가질지 지정
      - crossAxisSpacing: 가로 간격
      - mainAxisSpacing: 세로 간격
      - childAspectRatio: 정사각형의 비율 (가로/ 세로)
  - padding
  - itemcount

### 9.4 Grid Item

- FadeInImage
  - network에서 이미지를 불러올 동안 대신 나오는 이미지
- AspectRatio
  - 특정한 비율을 따르는 위젯을 만들 수 있게 함
  - aspectRatio를 지정하고 child에서 fit 적용
- widget을 DefaultTextStyle로 감싸면 모든 text에 적용 가능

### 9.5 CupertinoSearchTextField

- TextEditingController
  - inital text
  - controller를 만들땐 dispose를 잊지마
- 쿠페티노 서치버튼의 커서색은 main.dart에서 변경 가능

```dart
// main.dart
textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFFE9435A),
          ),
```

📌 **키보드가 나올시 scafold의 body가 resize 되는 문제**

- resizeToAvoidBottominset: false

📌 **Gridview에서 스크롤시 키보드가 내려가도록**

- keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

💡 **Code challenge**

> 탭뷰를 변경시 keyboard를 내려가는 기능 개발

- 부드러운 애니메이션을 위해 현재 state 객체와 ticker 동기화
- 스와이프시 키보드가 내려가는 반응이 느린것은 완전하게 인덱스가 변하는 시점을 체크하는 것 때문인듯

📍 **Controller 생성 시점**

- 별도의 초기화 인자가 필요 없을시에는 인스턴스화 될때 바로 수행 가능함 ☞ final
- 초기화 인자가 필요할 경우 state 객체가 트리에 추가되고 완전히 초기화 된 후 호출해야함 ☞ late final

### 10.0 ListTile

- ListTile
  - trailing: 뒷쪽의 아이콘
  - leading: 앞쪽의 아이콘
  - listview에 있는 하나의 아이템으로 활용할 수 있음

### 10.1 RichText

- Listview paddig
  - 전체 내부의 여백 설정
  - Listview의 경계와 그 안에 포함된 첫번째 및 마지막 항목 사이의 간격 정의
  - (ex) 모든 측면에서 항목들이 일정한 간격을 유지하도록
- ListTile contentPadding
  - 지정하지 않으면 기본 여백을 사용함
  - zero를 지정하면 listtile 내부의 모든 여백이 제거
    - leading, title, subtitle, trailing 위젯들이 ListTile의 경계에 바직 붙게됨
    - 즉, listtile 내부에 패딩이 없어짐
- RichText
  - main TextSpan이외에 children으로 textspan들의 리스트를 가질 수 있음

📌 **클릭에 대한 효과를 제거하고 싶을 때**

```dart
// Main > ThemeData
splashColor: Colors.transparent,
highlightColor: Colors.transparent,
```

📍 **Text vs TextSpan**

- Text

  - 단순한 텍스트 문자열을 화면에 표시하는 데 사용됨
  - 스타일링 옵션을 통해 텍스트의 폰트, 크기, 색상 등을 설정
  - 하지만, Text 위젯 내에서 다양한 스타일의 텍스트를 혼합하여 표시하는 것은 제한적

- TextSpan
  - RichText 위젯 내에서 사용됨
  - 하나의 RichText 위젯 안에서 여러 스타일의 텍스트를 혼합하여 표시할 수 있게 해줌
  - TextSpan을 사용하면, 텍스트의 일부분만 다른 스타일로 표시하는 것이 가능함
  - 각 TextSpan 객체는 자식으로 더 많은 TextSpan 객체를 가질 수 있어, 복잡한 텍스트 스타일링이 가능함

### 10.2 Dismissible

- Dismissible
  - key가 필요함
  - background(왼), secondbackground(오)로 스와이프 이벤트를 줄 수 있음

📍 **Container**

- alignment: Container 안에 있는 아이템들을 정렬 할 수 있게 해줌

### 10.3 onDismissed

- Dismissible 이후 해당 위젯이 있는 코드를 저장하면 에러 발생
  - Dismissible 위젯이 화면에서 제거되었음에도 불구하고 여전히 위젯 트리에 남아 있는 상황
  - Dismissible 위젯은 사용자가 화면에서 항목을 스와이프하여 제거할 수 있게 해주는 위젯
  - 사용자가 항목을 스와이프하여 제거한 후, 해당 위젯은 위젯 트리에서 즉시 제거되어야 함
- 동적으로 처리
  - Dismissible에 key 할당
  - onDismissed: (direction) => \_onDissmissed(notification)
    - onDismissed 파라미터에 function 지정
    - (direction)는 고정
    - return인 \_onDissmissed(notification)는 커스텀

### 10.4 RotationTransition

- animation controller를 만든 후 animation을 만들어야함
- Tween
  - 제일 이해하기 쉬운 애니메이션
  - begin, end를 받음
  - 애니메이션 효과를 넣을 값의 type이 무엇인지 명시해줘야함
- RotationTransition
  - turns에 Animation<double> 인스턴스가 필요
  - turns는 어떻게 회전 애니메이션할지에 대한 내용임
- Tween
  - begin부터 end까지 회전

📌 **animation을 보여주기 위한 방법들**

1. AnimationController
   - AnimationController의 value를 수정
   - controller에 eventListener를 추가
   - evnetListener에서 setState를 수행하면 build 실행 후 애니메이션 단계가 보임
2. Animation Builder
   - 위 작업을 Animation builder 가 수행함
3. 세번째 방법
   - RotationTransition Widget에 Animation class 사용
