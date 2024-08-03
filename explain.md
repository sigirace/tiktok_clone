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
- 콜백이 인덱스를 매개변수로 받는 함수여야 함

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

📌 \*\*클릭에 대한 효cd android
./gradlew signinReport ThemeData
splashColor: Colors.transparent,
highlightColor: Colors.transparent,

````

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
   - Animation class 사용
     - .animate(animationController)를 사용해서 모든 애니메이션이 수행되게 함

### 10.5 SlideTransition

- widget이 다른 widget 위에 보이는 것은 stack
- Offset
  - dx: x축으로부터 떨어진 거리 (비율)
  - dy: y축으로 부터 떨어진 거리 (비율)
    - -1이면 완전히 숨김
- SlideTransition
  - Animation<Offset> 필요

### 10.6 AnimatedModalBarrier

- overlay
  - 사용자가 보고싶어하는 것 뒤에 배치함
- animatemodalbarrier
  - overlay를 위한 widget
  - modal 뒤의 이벤트를 무시하게 함
  - color: Animation<Color>
  - dismissible: bool
  - onDissmiss: 패널 클릭시 수행할 function
- modal barrier를 시각적으로 숨기는것 외에 위젯 트리상에서 컨트롤하게 해야함
  - 상태값을 지정할 수 있는 변수를 만들어 toggle 시에 반전
  - widget tree에서 if 문을 통해 상태값에 따라 추가하는 방식

### 11.1 Direct Message

- Listtile
  - traling은 가운데에 배치됨
  - 만약 trailing에 대한 배치를 좀 더 세밀하게 하고싶으면 Row 안에다 아래 코드 적용

```dart
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.end,
````

### 11.2 AnimatedList

- AnimatedList
  - 리스트의 아이템을 animate 해줌
  - 아이템이 리스트에 추가되거나 리스트에서 제거될 때 animate하도록 함
  - children이 아닌 itembuilder 사용
  - initialItemCount
    - 리스트가 몇개의 아이템을 가지고 시작할 것인가
  - GlobalKey
    - AnimatedListState에 접근할 수 있도록 함
    - GloablKey의 상태를 확인해서 AddItem을 할 수 있도록 함
  - ListTile에 모두 동일하게 적용되는것을 방지하기위해 unique key 추가
- FadeTransition
  - 서서히 나타남
  - opacity: Animation<double> 사용해야함
    - AnimatedList에서 기본적으로 제공함
- SizeTransition
  - 아래로 밀면서 생김
  - sizeFactor: Animation<double> 사용해야함
    - AnimatedList에서 기본적으로 제공함

### 11.3 AnimatedList part Two

- ListTile
  - onLongPress
    - ListTile을 길게 눌렀을때 나타나게함
- removeItem
  - animation을 받기 때문에 widget을 감싸서 animation 활용 가능
  - 아이템을 만들때 동일한 것을 사용하면 자연스러운 효과 가능

### 11.4 Chat Detail

- 앞서 배운 내용들에 대한 응용

### 12.0 Introduction

- Custom scroll view를 사용하는 방법을 배움
  - 지금까지는 easy

### 12.1 CustomScrollView

- CustomScrollView
  - slivers
    - CustomScrollView에 들어갈 elements
    - type이 List<Widget>이어도 아무거나 넣을 순 없음
  - SliverAppBar
    - 일반적인 app bar 처럼 app bar가 줄 수 있는 것들을 제공함
    - expand 가능
      - collapseHeight: appbar가 줄어들 수 있는 지점
      - expandedHeight: appbar의 길이를 조절
    - flexibleSpace: FlexibleSpaceBar
      - image.asset이라는 배경을 가짐
      - 이 위젯 자체로도 title을 가짐 (defualt: Colors.white)
    - stretchModes
      - 늘이거나 줄였을때 어떤 액션을 수행할 수 있게 함
      - SliverAppBar의 floating:true, stretch:true 필요

👀 **sliver**

> 스크롤 가능한 구역

- slivers 안에는 widget을 그냥 갖다 넣을 수 없음, 오직 sliver만 가능
- custom scroll view는 스크롤 가능한 구역을 가져다가 다 같이 넣어서 한번에 scroll 가능하게 함

⛔️ **slivers에 잘못된 widget이 들어갈 경우 에러**

```
FlutterError (A RenderViewport expected a child of type RenderSliver but received a child of type RenderLimitedBox.
RenderObjects expect specific types of children because they coordinate with their children during layout and paint. For example, a RenderSliver cannot be the child of a RenderBox because a RenderSliver does not understand the RenderBox layout protocol. ...)
```

### 12.2 SliverAppBar

- SliverFixedExtentList
  - 여러 item들의 리스트를 만들어 냄
  - itemExtent
    - item들은 100 unit 만큼의 크기가 됨
    - 키가 얼마인지 나타냄
  - delegate
    - SliverChildBuilderDelegate
      - childcount로 개수 지정가능/ 지정 안하면 스크롤 하는만큼 아이템을 만들어냄

📍 **SliverAppBar Scrolling Mode**

- floating
  - true: 스크롤이 많이 되어 appbar가 숨김 상태여도, 조금만 올리면 다시 appbar가 나타나게 됨
- pinned
  - ture: 스크롤을 내리면 appbar가 사라지지 않고, 배경 색깔과 flexible space bar의 title을 보여줌
- snap
  - floating과 함께 사용하면 아주 조금만 위로 올려도 모든 appbar가 나타나게 됨
- stretch
  - FlexibleSpaceBar의 stretchModes와 함께 app bar가 여러 효과로 아래로 스트레칭 가능

### 12.3 SliverGrid

- SliverGrid
  - gridDelegate
    - SliverGridDelegateWithMaxCrossAxisExtent
      - maxCrossAxisExtent
      - mainAxisSpacing: 그리드의 각 아이템이 차지할 수 있는 최대 교차 축 크기입니다. 이 값은 각 아이템의 최대 너비(가로 모드) 또는 최대 높이(세로 모드)를 결정합니다.
      - crossAxisSpacing: 그리드의 주 축 방향(세로 스크롤에서는 수직, 가로 스크롤에서는 수평)에 있는 아이템들 사이의 공간입니다.
      - childAspectRatio: 그리드의 각 아이템의 가로 세로 비율입니다. 예를 들어, 값이 2이면 아이템의 너비가 높이의 두 배가 됩니다.
    - delegate
      - item을 만들어줄 function
      - SliverChildBuilderDelegate

### 12.4 SliverPersistentHeader

- list의 section 안에 title 혹은 header를 만들어줌
- 현재까지의 list는 vertical list와 grid view를 가지고 있음
- 각각을 분리하도록 title을 만듦
- SliverPersistentHeader
  - SliverPersistentHeaderDelegate 클래스에서 extend 된 delegate를 직접 만들어 줘야 함 > custom class 생성필요
  - pinned: true
    - 스크롤해도 상단 appbar에 붙어있음

📍 **SliverPersistentHeaderDelegate**

- shouldRebuild
  - flutter에게 persistent header가 보여져야 되는지 알려줌
  - maxExtent와 minExtent의 값을 변경하고 싶다면 return true
  - darkmode 강의에서 다시 알려줌
- maxExtent, minExtent
  - 최대 높이, 최저 높이
  - getter이기 때문에 double을 return해줘야 함
  - min은 스크롤시에 줄어드는 크기
  - max는 기본 크기
- build
  - user들이 보게 될 widget

📍 **FractionallySizedBox**

- 부모로부터 최대한 많은 공간을 차지
- SliverPersistentHeaderDelegate에서 부모의 크기는 maxExtent
- heightFactor: 1 > 모든 부분을 차지

📍 **SliverToBoxAdapter**

- 일반적인 flutter widget을 렌더할 때 쓰는 것
- 하나의 box widget을 포함하는 sliver를 만듦

### 12.5 VerticalDivider

- verticaldivider
  - 수직 구분선을 만듦
  - verticaldivider는 특정 높이를 가진 father를 필요로 함
  - 따라서 sizedbox로 감싸서 사용 > 클론코딩에선 row 전체를 감쌈
  - width: 양 옆 widget과의 거리
  - thickness: 선 두께
  - color: 색상
  - indent: 부모에서부터 구분선 시작까지 떨어진 거리
  - endIndent: 부모에서부터 구분선 끝까지 떨어진 거리

### 12.6 TabBar

- TabBar는 Controller가 필요함
  - 명시적으로 controller를 생성하거나
  - DefaultTabController를 사용
    - tab을 몇개 둘건지 Length 지정 필요
  - tabs: widget의 List
  - labelColor: widget의 Main color
  - labelPadding: widget을 감싸고 있는 패딩
  - indicatorColor: 밑줄의 색
  - indicatorSize
    - label: widget의 크기 만큼 > widget을 Padding으로 감싸서 길이를 조절 가능
    - tab: 하나의 tab 길이만큼

⛔️ **TabBarView error**

1. Scaffold에서 사용하는 경우

> discover_screen.dart

- Scaffold의 body에 TabBarView를 직접 사용하는 경우, TabBarView는 Scaffold의 가용 공간을 모두 차지
- TabBarView는 부모 위젯(Scaffold)로부터 명확한 크기 제약을 받기 때문에 문제 없이 동작
- 즉, 전체 화면은 그대로고 안에 내용만 스크롤 되는 느낌임

2. CustomScrollView에서 사용하는 경우

- CustomScrollView는 스크롤 가능한 영역을 제공하는 위젯
- 자식 위젯들에게 크기 제약을 명확하게 제공하지 않기 때문에 문제가 발생
- 특히, CustomScrollView 내에 TabBarView를 넣으면 TabBarView는 무한한 높이를 가지게 되어 에러 발생

```dart
FlutterError (Horizontal viewport was given unbounded height.
Viewports expand in the cross axis to fill their container and constrain their children to match their extent in the cross axis. In this case, a horizontal viewport was given an unlimited amount of vertical space in which to expand.)
```

📍 **Scaffold 제약**

1. Scaffold의 크기: Scaffold는 화면 전체를 차지합니다. 따라서 Scaffold의 body에 직접 들어가는 TabBarView는 기본적으로 화면 전체의 크기를 차지하게 됩니다.
2. AppBar와 Bottom Navigation Bar의 존재: AppBar와 Bottom Navigation Bar가 있는 경우, Scaffold의 body는 이들 위젯을 제외한 나머지 공간을 차지하게 됩니다. 즉, TabBarView는 AppBar와 Bottom Navigation Bar의 높이를 뺀 나머지 영역의 크기 제약을 받습니다.

### 12.7 PersistentTabBar

- NestedScrollView
  - 여러개의 스크롤 가능한 View들을 넣을 수 있게 함
  - 같은 Scrollview 안에서, 하나 옆에 하나 이런 식
  - 안의 모든 scroll position을 연결함
  - 가장 흔하게 쓰이는 경우
    - SliverAppBar와 TabBar를 같이 사용하는 경우
  - slivers가 없음
  - headerSliverBuilder
    - sliver들로 이뤄진 List 반환
  - body
    - TabBarView의 내용 (gridview, listview ..)
- TabBar 고정
  - SliverPersistentHeader로 감쌈
    - delegate를 위해 SliverPersistentHeaderDelegate를 따로 생성함
    - maxExtent, minExtent를 몰라서 에러가날텐데 에러를 기반으로 수정하면 됨
  - 단, 이상태로 적용하면 tabbar가 상단바 위(시계 등이 있는 곳)로 올라감
    - SafeArea를 감싸서 해결

### 13.0 ListWheelScrollView

- Loading
  - ios style: CupertinoActivityIndicator()
  - Android style: CircularProgressIndicator()

### 14.1 OrientationBuilder

- OrientationBuilder
  - child를 가지지 않는 대신 builder 함수 실행
  - orientation은 핸드폰의 방향을 알려줌

📌 **Collection if, for**

- Collection if, for 는 하나의 widget에만 작동함
- 여러개를 사용하려면 리스트 안에 넣고 ... 를 사용함

```dart
if (orientation == Orientation.portrait) ...
  [
    const AuthButton(
      icon: FaIcon(FontAwesomeIcons.user),
      text: "Use email & password",
      link: UsernameScreen(),
    ),
    Gaps.v16,
    const AuthButton(
      icon: FaIcon(FontAwesomeIcons.apple),
      text: "Continue with Apple",
    ),
  ]
```

📌 **화면을 세로로 고정하기**

- WidgetsFlutterBinding
  - flutter engine과 framework를 묶는 접착제 역할

```dart
// main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const TikTokApp());
}
```

### 14.2 kIsWeb

- Web일 경우 첫 화면에 들어갔을때 음성이 포함된 영상은 재생 불가능
  - 그냥 영상은 가능
- k를 입력하면 framework가 가지고 있는 모든 constant들을 확인할 수 있음
- kIsWeb
  - 앱이 웹에서 작동하도록 compile 되었는지를 나타내는 constant

### 14.3 MediaQuery

- MediaQuery에 변화가 있을 때마다 build
  - 변화를 감지할 수 있고 이에 따라 이벤트 수행 가능
  - 변화가 있을 때마다 build하니 build 내에서 final로 지정

### 14.4 LayoutBuilder

- MediaQuery는 사용하고 있는 기기에 대한 정보를 줌
- Layout builder는 화면 크기가 아닌 box의 최대 크기를 알기 위해 사용
  - builder: (context, constraints)
    - constraints: box가 커질 수 있는 최대치를 알려줌

📌 **MediaQuery vs Layoutbuilder**

- 화면의 크기가 변함에 따라 박스의 크기가 변할 수 있음
- LayoutBuilder를 통해 박스의 크기에 따라서 위젯을 컨트롤 하는 것도 가능

### 14.5 ConstrainedBox

- widget에 따라 화면크기가 변할시 constrain 하는 것과 아닌 것이 있음
- constrain하기 위해서는 box 크기만 제한하면 됨
- container widget or constrainedBox widget을 사용

### 15.1 ThemeMode

- themeMode: ThemeMode.system
  - 사용자의 시스템 모드에 맞춰서 설정
  - 당장은 적용되지 않음
  - 다크모드를 만들어야함
- utils에 \_isDarkMode 함수 생성

```dart
themeMode: ThemeMode.light
```

- 밝은색 유지

📌 **모드에 따른 상태바 변화**

```dart
// main builder

if (isDarkMode(context)) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light,
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark,
      );
    }
```

⛔️ **Meterial3에 따른 bottomappbar widget 변경**

- 15.8 3분대에 나오는 강의(추후업뎃)
- BottomAppBar -> Container
  - 패딩 지정 다시해줘야함

### 15.2 TextTheme

- https://m2.material.io/design/typography/the-type-system.html#type-scale
- https://pub.dev/packages/google_fonts/install
- Material 2에서 generate 해도 자동으로 3으로 변경함
- Theme의 TextTheme은 그대로 사용하되 커스텀하는 방법
  - copyWidth 사용
  - copyWidth는 null에 대한 처리가 반드시 필요하기에 ? 나 !를 사용하여 처리함
    - !일 경우 반드시 null 이아니기에 상관 없음
    - ?일 경우 null이 올 수 있기에 if else 처리

### 15.3 Google Fonts

- https://fonts.google.com/

### 15.4 Typography

- Typograph를 통해 size와 weight가 없는, 글씨체와 색만 지정된 폰트를 사용할 수 있음
  - textTheme: Typography.~

### 15.5 Dark Mode part One

📌 **TabBar 밑줄 적용**

```dart
TabBarTheme(
  // other code
  indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
)
```

### 15.9 Flex Color Scheme

- https://pub.dev/packages/flex_color_scheme

### 16.1 Localizations

- widget 들에 대한 번역 파일을 임포트

```yaml
flutter_localizations:
  sdk: flutter

intl: any
```

```dart
// main.dart
  GlobalMaterialLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,

  supportedLocales: const [
        Locale("en"),
        Locale("ko"),
      ],
```

### 16.2 l10n

```yaml
flutter:
  generate: true
```

```yaml
# 번역 파일 위치
arb-dir: lib/intl
# 마스터 위치
# 마스터는 [filename]_[language].arb 형식
template-arb-file: intl_en.arb
# 번역 완료된 내용
output-locaization-file: intl_ko.dart
```

- 각 파일 생성 및 내용 작성 후

> flutter gen-l10n

- .dart_toll > flutter_gen > gen_l10n
- 위 경로로 파일 생성됨
- main.dart에 생성된 파일 임포트

```dart
import "package:flutter_gen/gen_l10n/app_localizations.dart";
```

### 16.3 AppLocalizations

```dart
//main.dart
localizationsDelegates: AppLocalizations.localizationsDelegates,
supportedLocales: AppLocalizations.supportedLocales,
```

```dart
// package import at screen.dart
AppLocalizations.of(context)!.signUpTitle,
```

- intl 파일에 function을 심고 그에 대한 Description도 달아줄 수 있음
- 단, 변경후 flutter gen-l10n 수행

```dart
{
  "@@locale": "en",
  "signUpTitle": "Sign up for {nameOfTheApp}",
  "@signUpTitle": {
    "description": "The title people see when they open the app for the first time.",
    "placeholders": {
      "nameOfTheApp": {
        "type": "String"
      }
    }
  }
}
```

### 16.4 Flutter Intl

- flutter intl (extention)설치
- 프로젝트를 원상태로 돌림
- cmd + shift + p > flutter intl initailize
- generated, l10n 폴더 생성
- l10n > intl_en.arb에 작성시 자동으로 messages_en.dart에 추가됨
- cmd + shift + p > flutter intl Add locale > ko
- intl_ko.arb 파일 만들어주고 안에 내용 채움

```dart
//main.dart
import 'package:tictok_clone/generated/l10n.dart';

localizationsDelegates: const [
  S.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
],
supportedLocales: const [
  Locale('en'),
  Locale('ko'),
],
```

- 이후 텍스트들에 대해 codeaction으로 intl_en.arb로 extract 가능
- S는 extention 설치해서 생긴 것

### 16.5 Pluralize and Select

```dart
//main.dart
Widget build(BuildContext context) {
  S.load(const Locale("en"));
}
```

- 이런식으로 빠르게 언어 설정 가능

```yaml
{videoCount, plural, =0 {no videos} =1 {video} other{videos}}
```

- plural 적용으로 복수형 표현
- other는 필수

### 16.6 Numbers l10n

```dart
"likeCount": "{value}",
  "@likeCount": {
    "description": "The number of likes a video has",
    "placeholders": {
      "value": {
        "type": "int",
        "format": "compact"
      }
    }
  }
```

- 이런 식으로 compact하게 숫자 표기 가능

### 16.7 Date l10n

```dart
"value": {
  "type": "DateTime",
  "format": "y"
}
```

- 이런 식으로 날짜 표기 가능

### 17.1 await push

📌 **다른 화면으로 push를 사용하여 넘어갔을 때**

- push는 future임
- await를 통해 Pop되는 시점에 값을 return 받을 수 있음

### 17.2 PageRouteBuilder

📍 **PageRouteBuilder**

- MaterialPageRoute 말고 화면 전환에 쓰이는 위젯
- pageBuilder
  - 이동할 화면을 return
  - transitionsBuilder
    - child: 이동할 화면
  - transitionDuration
    - 이동할때의 애니메이션 지속 시간
  - reverseTransitionDuration
    - 돌아갈때의 애니메이션 지속 시간

### 17.3 pushNamed

- url 처럼 화면을 이동
- 각 screen에 static routeName를 설정하고 해당 string으로 왔다 갔다함

```dart
//main.dart
initialRoute:
routes:
```

```dart
//screen.dart
Navigator.pushNamed(context, Screen.routeName,);
```

### 17.4 pushNamed Args

📌 **pushName을 사용해서 argument를 전달하고 싶을 때**

```dart
//target screen
class ScreenArgs{
  final T arg;

  ScreenArgs({required this.arg});
}

//source screen
Navigator.pushNamed(context, Screen.routeName,arguments: ScreenArgs(arg: _arg,),);
```

📌 **pushName을 사용해서 전달받은 argument를 사용할 때**

```dart
//target screen
Widget build(~~){
  final args = ModalRoute.of(context)!.settings.arguments as ScreenArgs;
}
```

- as를 붙이지 않으면 args는 일반적인 object임
- as를 써주지 않으면 args에 property로 접근 불가능

### 18.0 Introduction

- flutter 공식문서
  - Don`t recommend using named routes for most applications.
    - Navigator ver1은 web에서 호환성이 좋지 못함
    - using named은 브라우저의 앞으로가기를 지원하지 않음
    - Material은 url 기반으로 움직이지 않음
  - go_router를 사용한 Migration 방식 사용

### 18.1 GoRouter

- install go_router

```yaml
dependencies:
  go_router: 6.0.2
```

- router.dart 파일 생성
- router 생성

🌈 **exmaple**

```dart
final router = GoRouter(
  routes: [
    GoRoute(
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
  ],
);
```

- routeName인 string 단위로 페이지 이동함

📍 **화면 이동**

- push, pop
  - stack 구조로 사용
  - 쌓였기 때문에 뒤로가기가 있는 것
- go
  - stack을 사용하지 않음
  - 브라우저는 뒤로가기가 있어서 가능하지만 app은 back이 없음
  - 사용자를 다른 곳으로 이동시키는 개념

### 18.2 Parameters

- url로 진입시 parameter를 전달하는 방법

🌈 **exmaple**

```dart
GoRoute(
      path: "/users/:username",
      builder: (context, state) {
        final username = state.params['username'];
        return UserProfileScreen(username: username);
      },
    ),
```

📌 **회원가입 시 url로 다른 페이지 진입을 막으려면**

- 화면을 바꾸나 url을 바꾸지 않는 경우 Navigator 1.0을 사용
- 같은 url이나 다른 화면 표현 가능

### 18.3 queryParams

- post 방식의 query로 extra를 사용할 수 있음
- get 방식은 url 과 유사하게 사용
- 둘 다 router에서 state를 통해 접근함

```dart
// Source Screen
context.go(
  "${EmailScreen.routeName}?get_test=$_username",
  extra: EmailScreenArgs(userName: _username),
);

// Target arg class
class EmailScreenArgs {
  final String username;

  EmailScreenArgs({required this.username});
}

// Target Generator
class EmailScreen extends StatefulWidget {
  static const routeName = "/email";

  final String userName;
  final String? getTest;

  const EmailScreen({
    super.key,
    required this.userName,
    this.getTest,
  });

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

// Router
GoRoute(
  path: EmailScreen.routeName,
  builder: (context, state) {
    final args = state.extra as EmailScreenArgs;
    final getTest = state.queryParams['get_test'];
    return EmailScreen(
      userName: args.userName,
      getTest: getTest,
    );
  },
),
```

### 18.4 CustomTransitionPage

- 애니메이션을 사용하려면 Router에 PageBuilder 사용
  - CustomTransitionPage
    - child: 이동하고 싶은 곳
    - transitionBuilder
      - return으로 animation widget 지정

🌈 **exmaple**

```dart
GoRoute(
  name: "username_screen",
  path: UsernameScreen.routeName,
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      child: const UsernameScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
    );
  },
),
```

👀 **Nested routes**

> Nested Routing은 URL의 중첩된 표현을 단계별로 정의해서 관리 포인트를 줄임

- 좀 더 고급스럽게..
  - URL의 세그먼트들을 컴포넌트의 계층과 데이터에 연결해주는 보편적인 방식

🌈 **exmaple**

```dart
// 상위
class SignUpScreen extends StatelessWidget {
  static const routeUrl = "/";
  static const routeName = "signUp";
}

// 하위
class UsernameScreen extends StatefulWidget {
  static String routeUrl = "username";
  static String routeName = "username";
}

// router
GoRoute(
  path: SignUpScreen.routeUrl,
  name: SignUpScreen.routeName,
  builder: (context, state) => const SignUpScreen(),
  routes: [
    GoRoute(
      path: UsernameScreen.routeUrl,
      name: UsernameScreen.routeName,
      builder: (context, state) => const UsernameScreen(),
    ),
  ],
)
```

- 결과: host/#/username

### 19.1 Installation

📌 **Android Settings**

- android>app>build.gradle
- defaultConfig
  - minSdkVersion 21

```
defaultConfig {
    // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
    applicationId "com.example.tictok_clone"
    // You can update the following values to match your application needs.
    // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-gradle-build-configuration.
    minSdkVersion 21
    targetSdkVersion flutter.targetSdkVersion
    versionCode flutterVersionCode.toInteger()
    versionName flutterVersionName
}
```

📌 **IOS Settings**

```yaml
#pod_yaml
post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)


    # Start of the permission_handler configuration
    target.build_configurations.each do |config|

      # You can enable the permissions needed here. For example to enable camera
      # permission, just remove the `#` character in front so it looks like this:
      #
      # ## dart: PermissionGroup.camera
      # 'PERMISSION_CAMERA=1'
      #
      #  Preprocessor definitions can be found in: https://github.com/Baseflow/flutter-permission-handler/blob/master/permission_handler_apple/ios/Classes/PermissionHandlerEnums.h
      config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
        '$(inherited)',

        ## dart: PermissionGroup.calendar
        # 'PERMISSION_EVENTS=1',

        ## dart: PermissionGroup.reminders
        # 'PERMISSION_REMINDERS=1',

        ## dart: PermissionGroup.contacts
        # 'PERMISSION_CONTACTS=1',

        ## dart: PermissionGroup.camera
        'PERMISSION_CAMERA=1',

        ## dart: PermissionGroup.microphone
        'PERMISSION_MICROPHONE=1',

        ## dart: PermissionGroup.speech
        # 'PERMISSION_SPEECH_RECOGNIZER=1',

        ## dart: PermissionGroup.photos
        # 'PERMISSION_PHOTOS=1',

        ## dart: [PermissionGroup.location, PermissionGroup.locationAlways, PermissionGroup.locationWhenInUse]
        # 'PERMISSION_LOCATION=1',

        ## dart: PermissionGroup.notification
        # 'PERMISSION_NOTIFICATIONS=1',

        ## dart: PermissionGroup.mediaLibrary
        # 'PERMISSION_MEDIA_LIBRARY=1',

        ## dart: PermissionGroup.sensors
        # 'PERMISSION_SENSORS=1',

        ## dart: PermissionGroup.bluetooth
        # 'PERMISSION_BLUETOOTH=1',

        ## dart: PermissionGroup.appTrackingTransparency
        # 'PERMISSION_APP_TRACKING_TRANSPARENCY=1',

        ## dart: PermissionGroup.criticalAlerts
        # 'PERMISSION_CRITICAL_ALERTS=1'
      ]

    end
    # End of the permission_handler configuration
  end
end
```

- cd ios
- pod install

```
# inpo.plist

<key>NSCameraUsageDescription</key>
<string>your usage description here</string>
<key>NSMicrophoneUsageDescription</key>
<string>your usage description here</string>
```

📌 **pubspec**

```yaml
permission_handler: ^10.2.0
camera: ^0.10.3
```

### 19.3 Selfie Mode

```dart
Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }
```

### 19.4 Flash Mode

```dart
Future<void> _setFlashMode(FlashMode flashMode) async {
    await _cameraController.setFlashMode(flashMode);
    _isFlashMode = !_isFlashMode;
    setState(() {});
  }
```

### 19.5 Recording Animation

- GestureDetector
  - onToaDown, onTapUp
    - 두 함수는 detail을 argument로 줘야함
- CircularProgressIndicator
  - 값을 명시하지 않으면 로딩처럼 무한 뺑뻉이
  - 값을 명시하면 해당 지점까지 고정
- TickerProviderStateMixin
  - 컨트롤러가 여러개일 경우 사용
  - 애니메이션들이 모두 유사하게 진행될 경우 하나의 컨트롤러 > SingleProviderMixin
- addStatusListener
  - Listener는 value가 바뀐 것을 알려줌
  - statuslistener는 animation이 끝난 것을 알려줌

📍 **익명 함수(람다, 클로저)**

- 이름이 없는 함수로 콜백이나 이벤트 핸들러로 사용
- 람다 또는 클로저로도 말함

```dart
// 구조 1
(parameters) {
  // 함수 본문
};

// 구조 2
(parameters) => expression;
```

🌈 **exmaple**

- GestureDetector parameters
  - onTapDwon: {void Function(TapDownDetails)? onTapDown}
  - onTapUp: {void Function(TapUpDetails)? onTapUp}
  - 두 parameter의 argument가 null일 수 있음
  - null이 아니라면 detail을 parameter로 갖는 void type function을 argument로 사용해야함

```dart

void _onTapDown(TapDownDetails details) {
  _buttonAnimationController.forward();
  _progressAnimationController.forward();
}

void _stopRecording() {
  _buttonAnimationController.reverse();
  _progressAnimationController.reset();
}

//GestureDetector
onTapDown: _onTapDown,
onTapUp: (detail) => _stopRecording(),
```

- onTapDown: \_onTapDown,
  - Dart가 자동으로 이벤트의 상세 정보(TapDownDetails)를 \_onTapDown 함수에 전달한다는 것
  - \_onTapDown 함수는 이 정보를 매개변수로 받음
- onTapUp: (detail) => \_stopRecording()
  - 이 방식은 익명 함수(람다)를 사용하여 \_stopRecording 함수를 호출
  - onTapUp 이벤트가 발생하면, Dart는 이벤트의 상세 정보(TapUpDetails)를 익명 함수의 detail 매개변수로 전달
  - \_stopRecording 함수는 이 상세 정보를 사용하지 않고, 매개변수 없이 호출됨

### 19.6 startVideoRecording

- prepareForvideoRecording
  - ios를 위한 video recording
  - ios에서 영상과 오디오 싱크가 맞지 않는 경우 해결
  - android에서는 아무것도 하지 않음

```dart
// initCamera

await _cameraController.prepareForVideoRecording();
```

- recording 시작

```dart
await _cameraController.startVideoRecording();
```

- widget.video는 video_recording_screen에서 보낸 영상
- widget.videosms XFile class

  - Cross file이며 name과 path를 가지고 있음
  - cross file에서 name과 path로 File 객체 생성

👀 **Xfile**

> XFile은 image_picker 패키지에서 제공하는 클래스로, 파일의 경로, 이름, 크기 등의 정보를 포함하고 있으며, 파일을 읽거나 쓸 수 있는 다양한 메서드를 제공함

📍 **비디오 재생**

```dart
Future<void> _initVideo() async {
  _videoPlayerController = VideoPlayerController.file(
    File(
      widget.video.path,
    ),
  );

  await _videoPlayerController.initialize();
  _videoPlayerController.setLooping(true);

  await _videoPlayerController.play();
  setState(() {});
}

@override
void initState() {
  super.initState();
  _initVideo();
}

// 재생 코드
VideoPlayer(_videoPlayerController)
```

- \_videoPlayerController.setLooping(true);
  - 비디오 플레이어가 비디오 재생을 무한 반복할지 여부를 설정
  - true로 설정하면 비디오가 끝까지 재생된 후 자동으로 다시 시작하여 무한히 반복 재생

📌 **android emulator bug**

```dart
_cameraController = CameraController(
  cameras[_isSelfieMode ? 1 : 0],
  ResolutionPreset.ultraHigh,
  enableAudio: false,
);
```

- android emulator에서 소리가 들어가면 재생되지 않는 버그가 간혹 있음

### 19.7 GallerySaver

- 유저의 gallery에 무언가를 저장할 수 있게 함

```yaml
dependencies:
  gallery_saver: 2.3.2
```

🌈 **example**

```dart
await GallerySaver.saveVideo(
  widget.video.path,
  albumName: "TikTok Clone",
);
```

📍 **GallerySaver 세팅**

- IOS
  - NSPhtoLibraryUsageDescription를 <project_root>/ios/Runner/Info.plist에 추가

```
plist
<key>NSPhotoLibraryUsageDescription</key>
<string>Privacy Photo Library</string>

Podfile
## dart: PermissionGroup.photos
'PERMISSION_PHOTOS=1',
```

- Android
  - android.permission.WRITE_EXTERNAL_STARGE를 <project_root>/android/app/src/main/AndroidManifest에 추가

```
# 이 외로도 마이크 등 권한 필요
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
```

### 19.8 ImagePicker

- Spacer
  - 변형 가능한 공간을 만듦
  - 일종의 빈 공간처럼 사용
- Image Picker
  - ImageSource
    - gallery 일 경우 사진첩 연결
    - camera 일 경우 기기 카메라 연결
-

📍 **Image Picker 설치**

- user의 library에서 사진이나 비디오를 가져오게 해줌

```yaml
dependencies:
  image_picker: 0.8.6+1
```

```plist
<key>NSPhotoLibraryUsageDescription</key>
<string>Privacy Photo Library</string>
```

- 비디오에서 이미했으면 상관없음
- 안드로이드는 안해도 됨

⛔️ **context를 async 환경에서 사용하는 문제**

```dart
Future<void> loadData() async {
  final data = await fetchData(); // 비동기 함수 호출
  setState(() {
    // 데이터를 사용하여 상태 업데이트
  });
}
```

- fetchData 함수가 데이터를 가져오는 동안 사용자가 현재 화면을 벗어나면, setState를 호출할 때 context가 더 이상 유효하지 않게 됨
- 이는 setState가 호출되는 시점에 현재 위젯이 위젯 트리에 존재하지 않을 수 있기 때문

☀️ **해결**

```dart
if (mounted) {
  setState(() {
    // 데이터를 사용하여 상태 업데이트
  });
}
```

- 비동기 작업이 완료된 후, 현재 위젯이 여전히 마운트되어 있는지 확인
- Flutter에서는 mounted 속성을 사용하여 이를 확인할 수 있음

### 19.9 AppLifecycleState

- camera 문서
  - 플러그인은 lifecycle의 변화를 자동으로 handle하지 않음
  - 수동으로 해주어야 함
  - 즉, application이 background로 가는 것을 개발자가 감지해야함
    - controller등을 제거
- didChangeAppLifecycleState 라는 method를 override 해야함
  - 이 함수는 WidgetsBindingObserver class에서만 제공
  - mixin으로 사용함
  - initstate에서 instance 생성

⛔️ **권한 창이 application 앞에서 나타날 때**

- flutter는 application이 비활성화 되었다고 생각함

📍 **CameraAwesome**

- https://pub.dev/packages/camerawesome

### 20.1 \_noCamera

- debug mode이며 ios일 경우 카메라를 키지 않음

```dart
late final bool _noCamera = kDebugMode && Platform.isIOS;
```

- 세로 모드만 지원하려면 plist에서 landscape 관련 모두 지움

### 20.2-5 Router part

- route parameter
  - 파라미터를 한정적으로 지정할 수 있음
  - path: "/:tab(param1|param2|...)"

```dart
context.go("/home");
```

- initialLocation
  - 시작 지점을 정할 수 있음 like url
- routes
  - 자식의 경로를 생성
  - 자식의 url은 /로 싲가할 수 없음

📍 **push vs go**

- push
  - 데이터 등을 스택 위에 추가
  - push를 했으니 pop으로 뒤로가기 가능
- go
  - 그냥 그 경로로 감
  - 경로가 바뀌고 스택을 교체한다는 의미
  - 기존 스택은 신경 쓸 필요가 없음

### 20.6-8 InheritedWidget

- InheritedWidget
  - 위젯 트리 맨 위에 정의된 값을 가져다 쓸 수 있음
  - 부모에서 밑으로 내리는 개념이 아니라 직접 접근하는 것
  - InheritedWidget은 작은 앱에는 좋지만 크고 요구사항이 많은 앱에는 별로
  - child가 필요함
  - updateShouldNotify
    - 상속받는 위젯들을 rebuild 할지 말지 결정
  - 앱 전체에 데이터를 공유하지만 업데이트하지는 못함
  - 데이터와 데이터를 수정할 권한이 있음

✏️ **Code**

```dart
// main.dart

@override
  Widget build(BuildContext context) {
    // S.load(const Locale("en"));
    return VideoConfig(
      child: MaterialApp.router())}
```

- MaterialApp.router를 videoconfig로 감쌈
  - videoconfig는 모든 앱의 부모가 됨
- context를 사용해 videoconfig에 직접적인 링크 요청

```dart
final videoConfig = context.dependOnInheritedWidgetOfExactType<VideoConfig>();
```

- VideoConfig라는 타입의 InheritedWidget을 가져오라고 context에 명령함
- inheritedwidget 중에 정확히 VideoConfig라는 타입을 찾음
- 이러한 기능은 context에 있음
  - 찾을수도 있고 못찾을 수도 있기에 !를 붙여줌

```dart
static VideoConfig of(BuildContext context) {
  return context.dependOnInheritedWidgetOfExactType<VideoConfig>()!;
}
```

- 위 표현은 너무 기니 class 내부에 static 함수로 만듦

📍 **InheritedWidget with Statefulwidget**

- InheritedWidget는 권한은 있으나 상태를 바꿀 수 없음
- Statefulwidget이 InheritedWidget를 return하도록 하고, 인자로 공유하고 싶은 데이터, 속성들을 전달하여 해결
- 너무 장황하고 위젯을 많이 만든다는 단점이 있음
  - ChangeNotifier로 해결

### 20.9 ChangeNotifier

- 데이터를 가지고 있을 수도 있고, 위젯이 그 데이터를 listen하게 할 수 있고, 데이터가 바뀔 때 위젯한테 알려줄 수 있음
- InheritedWidget과 Statefulwidget를 합침
- 데이터를 들어냄
- 데이터 변경 사항을 듣고 있는 화면들이 있음
- notifyListeners()
  - 데이터가 변경되었다고 청취자들에게 알려줌
  - 청취자들은 변수를 사용하는 곳
- 청취자로 만드는 법 1
  - AnimateBuilder
  - 애니메이션 기능 뿐아니라 change notifier에서도 사용
  - 청취자는 해당 타일만 build 시키게 만듦
- 청취자로 만드는 법 2
  - initstate시에 Listener를 등록
- ChangeNotifier는 API 로 부터 값을 받아올때 그 데이터가 많을 경우 유용함
- 데이터가 1개밖에 없으면 다른방식 고려 (다음강)

🌈 **example**

```dart
// AnimatedBuilder
AnimatedBuilder(
  animation: videoConfig,
  builder: (context, child) => SwitchListTile.adaptive(
    value: videoConfig.value,
    onChanged: (value) {
      videoConfig.value = !videoConfig.value;
    },
    title: const Text("Auto Mute"),
    subtitle: const Text("Videos will be muted by default."),
  ),
),

// ValueListenableBuilder
ValueListenableBuilder(
              valueListenable: videoConfig,
              builder: (context, value, child) => SwitchListTile.adaptive(
                value: videoConfig.value,
                onChanged: (value) {
                  videoConfig.value = !videoConfig.value;
                },
                title: const Text("Auto Mute"),
                subtitle: const Text("Videos will be muted by default."),
              ),
            ),
```

### 20.10 ValueNotifier

- 간단한 값의 ChangeNotifier

```dart
//before
class VideoConfig extends ChangeNotifier {
  bool autoMute = false;

  void toggleAutoMute() {
    autoMute = !autoMute;
    notifyListeners();
  }
}

final videoConfig = VideoConfig();


//after
final videoConfig = ValueNotifier(false);
```

### 20.11 Provider

- Provider
  - inheritedwidget을 감쌈
  - 더 쉽고 빠르게 사용하기 위함
  - 앱에 많은 것을 제공하고 어디서나 열람할 수 있게 함
  - example
    - changeNotifier를 드러내는 provider
    - 변경되지 않는 데이터가 있는 단순한 클래스를 드러내는 provider

```yaml
dependencies:
  provider: 6.0.5
```

🌈 **Example**

```dart
// class
class VideoConfig extends ChangeNotifier {
  bool isMuted = false;
  bool isAutoplay = false;

  void toggleIsMuted() {
    isMuted = !isMuted;
    notifyListeners();
  }

  void toggleAutoplay() {
    isAutoplay = !isAutoplay;
    notifyListeners();
  }
}

// main -> 앱을 provider로 감쌈
return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => VideoConfig(),
      )
    ],)

// screen data -> 접근
context.watch<VideoConfig>().isMuted

// screen function -> 접근
context.read<VideoConfig>().toggleIsMuted();
```

📍 **Provider 종류**

- provider
  - basic
  - 값이 무엇이던 값을 가지고 드러냄

### 21.1 MVVM

- MVVM
  - Model View ViewModel
  - View
    - UI 표현, 사용자 입력
  - Model
    - 데이터
  - View Model
    - ChangeNotifier
    - View가 ViewModel한테 얘기하고
    - ViewModel이 Data를 수정
    - ViewModel이 View에게 데이터가 바뀌었다고 알려줌
  - Repository
    - 데이터 저장
    - 파이어베이스 통신
    - 데이터 기기 저장

✏️ **아키텍처가 왜 필요할까?**

- 코드를 패턴에 맞춰서 정리해야 함
- 그러히 않으면 스파케티 코드됨

🌈 **Example**

- view
  - 영상 타임라인
  - 무한 스크롤 기능
- viewmodel
  - API한테 데이터를 요청함
  - 영상에 대한 모델을 build
  - 영상들을 view에 넘겨줌

### 21.2 VideoPlaybackConfigRepository

- view
  - 사용자가 보는 부분
- view_model
  - changenotifier
    - 데이터를 갖고 있을 수 있고
    - 위젯이 그 데이터를 listen하게 할 수 있고
    - 데이터가 바뀔 때 알려줄 수 있음
- repo
  - 데이터를 디스크에 persist하고 디스크에서 데이터를 가져오는 것
    - 데이터 유지
    - 데이터를 읽기
    - persist: 데이터를 프로그램보다 오래 살리는 것
  - shared_preferences 패키지 설치 필요

```
flutter pub add shared_preferences
```

### 21.3 PlaybackConfigViewModel

📌 **View Model에서 하는일**

- Step1. 생성자
  - repository를 통해 viewmodel 생성
  - model은 repository가 있어야 생성됨 > late final
- Step2. 함수 공개
  - repository에 값 저장
  - model 값 변경
  - 위젯들에게 알림
- Step3. 데이터 공개
  - reopository와 model을 직접 공개하지 않음
  - view model을 통해 데이터 접근하도록 함

```dart
// main.dart > main function
final preferences = await SharedPreferences.getInstance();
final repository = PlaybackConfigRepository(preferences);
```

- viewmodel을 위한 repository를 main에서 초기화함

```dart
// main.dart > main function
runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => PlaybackConfigViewModel(repository))
      ],
      child: const TikTokApp(),
    ),
  );
```

- provider를 main에서 감쌈

### 21.4 Views

- 코드 완성

### 22.0 Introduction

- https://riverpod.dev/ko/docs/from_provider/motivation

- Riverpod
  - provider의 애너그램으로 후속작정도로 보임
  - 관심사를 분리해주는 점에서 provider와 비슷
  - view 로직과 business 로직을 각기 달느 곳에 위치하게 함
  - depoendency 들을 주입시켜서 provider를 어디에서나 읽을 수 있게 함
  - 위젯트리 밖에서 사용 가능
    - 상속받지 않는 개념
  - riverpod 사용이 더 간소화시킬 수 있음

```yaml
dependencies:
  flutter_riverpod: ^2.1.3
```

### 22.1 NotifierProvider

- main의 runapp안의 widget을 ProviderScope로 감싸면 준비 완료
- riverpod은 위젯트리에 있지 않기에 context. 같은 기능을 사용하지 않음
- ViewModel
  - view model의 로직은 view로부터 이벤트를 받아서 데이터를 수정하고, view에게 데이터가 변했다는 것을 알림
  - 이를 changenotifier를 통해서 했는데 이제는 필요하지 않음
- Notifier
  - changenotifier와 유사한 기능
    - 변화를 listen하고 있는 listener들에게 변화를 통지
  - Notifier는 notifyListener를 가지고 있지 않음
  - build method가 필요
    - build는 자동으로 호출됨
    - 사용자가 보게 되는 UI의 형태로 사용자에게 전달됨
    - build method가 반환하는 것은 사용자가 보게 될, 즉, 화면이 갖게되는 초기의 데이터
    - <> 안에 타입을 넣어 어떤 형태로 데이터를 노출시킬지 결정함
      - listen 하고 watch 하길 원하는 데이터
    - Notifier는 state를 가질 것이고, state는 사용자에게 노출시키고 싶은 데이터
      - 단, state는 update가 아닌 새로 만듦
  - 위 과정을 통해 providerconfigviewmodel을 만듦
  - 이제 이를 활용할 provider를 만들어야함
- provider
  - 데이터를 얻기 위해 사용
  - 함수들을 사용하기 위해 사용
  - viewmodel 파일 가장 아래 provider 생성
  - Notifier를 사용하였으니 NotifierProvider 객체 사용
    - 두가지 타입 필요
      1. expose하고 싶은 provider => viewmodel
      2. expose하고 싶은 data => model

📌 **Provider 상속**

- provider는 state를 받음
- provider 뒤에 붙은 것이 관리하는 상태의 타입

### 22.2 ConsumerWidget

[settings_screen]

- stateful widget
  - 상태가 없는 위젯으로 변경
  - 기존에 stateful로 해 준 이유는 business logic을 사용하고 있기 때문

```dart
bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }
```

- riverpod에서 ui를 업데이트하는 business 로직이 있다면 그것은 다른 곳에 두어야 함

📍 **WidgetRef**

- Provider를 가져오거나 읽을 수 있는 reference

📌 **CunsumerWidget 사용**

- riverpod의 provider로부터 데이터를 listen하기 위한 방법
- extend로 consumerwidget 사용
  - build method의 parameter로 widgetref 받음
  - 아래와 같이 사용

```dart
ref.watch(playbackConfigProvider).muted
```

- read하거나 watch할 수 있는 것
  - watch: 변화를 감지
  - read: 단순히 읽음
  - provider가 expose하는 데이터 뿐
    - model (=data)
  - method에 접근하려면 아래와 같이 수행

```dart
ref.read(playbackConfigProvider.notifier).setMuted(value)
```

☀️ **Tip**

- Extension 설치
  - riverpod snippets
  - start하기 쉽게 만들어줌

### 22.3 Recap

📌 **ConsumerStatefulWidget 변경**

- stateful을 아래와 같이 변경
- ref를 사용할 수 있게 함

```dart
class VideoPost extends ConsumerStatefulWidget {
  /*
  생략
  */
  @override
  VideoPostState createState() => VideoPostState();
}

class VideoPostState extends ConsumerState<VideoPost>
    with SingleTickerProviderStateMixin {}
```

### 22.4 AsyncNotifierProvider

- AsyncNotifier
  - AsyncNotifier를 extend할 땐 반드시 어떤 메서드를 구현해야함 > build method
  - FutureOr
    - async method
    - await를 통해 API로부터 데이터를 받아옴
  - provider 사용
    - asycn provider를 사용하기 위해서는 데이터를 기다려야함
    - ref.watch(provider).when();
      - loading: api를 기다리는 중에 나타날 위젯
  - asyncnotifier일 경우 state의 update는 asyncValue.data 사용

### 23.1 Firebase Installation

📌 **Firebase CLI 설치**

```bash
curl -sL https://firebase.tools | bash

firebase login

dart pub global activate flutterfire_cli

export PATH="$PATH":"$HOME/.pub-cache/bin"
echo 'export PATH="$PATH":"$HOME/.pub-cache/bin"' >> ~/.zshrc
source ~/.zshrc

```

```

flutter-proj$ flutterfire configure

flutter pub add firebase_core

flutter pub add firebase_auth

flutter pub add cloud_firestore

flutter pub add firebase_storage
```

- flutterfire_cli: flutter 프로젝트에서 firebase에 대해 얘기할 수 있게 해줌
- flutterfire configure: flutter app에 firebase 적용
  - 유일한 이름으로 설정
  - os 중 필요한 것만 체크 (체크해제는 스페이스바)
- firebase 플로그인을 추가할 때마다 flutterfire configure 실행

```dart
// main.dart
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
```

📌 **flutterfire_cli warnings**

```
Warning: Pub installs executables into $HOME/.pub-cache/bin, which is not on your path. You can fix that by adding this to your shell's config file (.bashrc, .bash_profile, etc.):

export PATH="$PATH":"$HOME/.pub-cache/bin"

Activated flutterfire_cli 1.0.0.
```

- 이 경고 메시지는 flutterfire_cli를 설치한 후 실행 파일이 $HOME/.pub-cache/bin 디렉토리에 설치되었지만, 이 디렉토리가 현재 PATH 환경 변수에 포함되어 있지 않기 때문에 발생
- 다음 명령어를 사용하여 PATH 환경 변수에 해당 디렉토리를 추가해야 함

```bash
# 파일 열기
nano ~/.bash_profile

# 파일 끝 추가
export PATH="$PATH:$HOME/.pub-cache/bin"

# 저장
# Ctrl + X, Y, Enter 순서

# 적용
source ~/.bash_profile
```

### 23.2 AuthenticationRepository

- router를 provider로 변경하여 사용
- router 내에서 provider에 접근하여 연산가능

### 24.0 createUserWithEmailAndPassword

- provider는 최초 접근시에 초기화됨
- provider의 state는 내가 원하는 형태로 지정해도 됨
  - 그러나 관리를 위해 Model로 만들어 놓는 방법을 선호
- StateProvider는 당장 data를 expose하지 않고 추후에 widget에서 받아옴

### 24.1 signOut

- stream
  - 실시간 연결
  - 유저의 인증 상태가 바뀔 때 앱을 실시간으로 새로고침

```dart
Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

final authState = StreamProvider(
  (ref) {
    final repo = ref.read(authRepo);
    return repo.authStateChanges();
  },
);
```

- repo의 authStateChange 함수를 호출하면 연결을 맺어 실시간 상태를 추적함
  - router의 watch를 통해서 변화를 감지할 수 있음
  - router는 provider이기 때문에, 이 변화를 통해 다시 빌드되고 수행됨

### 24.2 signInWithEmailAndPassword

- AsyncValue.guard
  - error시에 state에 error를 저장
- SnackBar
  - notification bar
  - material theme을 따르는 flutter app에 있음
  - 그냥 widget이고 보여줄지 말지만 정함
  - snackbar를 보여주려면 widget tree의 context에 접근할 수 있어야 함
    - 매개변수로 context를 받아야함
  - snack을 utils로 빼서 관리함

### 24.3 Social Auth Config

- github Auth: https://github.com/settings/applications/new

```
flutter pub add firebase_auth
```

[ios]

- 제휴 ID 및 소셜 가이드
  - https://firebase.google.com/docs/auth/flutter/federated-auth?hl=ko

[android]

```
cd android
./gradlew signinReport
```

```
> Task :app:signingReport
Variant: debug
Config: debug
Store: /Users/sigi/.android/debug.keystore
Alias: AndroidDebugKey
MD5: E7:99:87:60:86:CC:71:93:72:24:9C:47:47:E9:9F:AB
SHA1: 68:79:4E:CE:26:25:5A:C4:F1:46:86:60:69:38:8E:E8:F5:DB:36:0A
SHA-256: A2:99:54:D0:BB:56:1E:78:62:50:31:18:8B:D4:4D:C4:07:92:DA:42:7F:DD:1A:AB:37:32:10:E8:5D:2F:D9:4B
Valid until: 2054년 7월 17일 금요일
```

- 디지털 지문에 추가

### 24.4 Github Login

- signInWithProvider
  - 다양한 프로바이더를 사용할 수 있음

### 25.0 Introduction

- Cloud Firestore
  - region: seoul
  - test mode
- Build > storage
  - test mode

### 25.1 FireStore Intro

- Firestore는 document db 구조임

### 25.2 UserProfileModel

- repo > model > view model 순으로 작성

📌 **createProfile 만드는 순서**

- createProfile은 UserProfileModel을 저장하기 위함
- UserCredential을 Parameter로 가지는 함수 생성
  - UserCredential는 authentication_repo의 emailSingUp에서 리턴

### 25.3 createProfile

- firestore에 저장
  - model을 json으로 변환함
  - .doc() => authentication의 id
  - .set() => 데이터를 넣음

### 25.4 findProfile

- firestore에서 데이터를 get

```
A value of type 'Map<String, dynamic>?' can't be returned from the method 'findProfile' because it has a return type of 'Future<void>'
```

- return type이 Map<String, dynamic>?여야 한다는 에러
- Map<Stirng, dynamic>은 json 형태로 이를 다시 가지고있는 Model 형태로 변환 필요

### 25.5 AvatarViewModel

[user_profile_screen]

- scaffold를 retunr 하는 대신 ref.watch를 Return
  - when을 통해 상황별 화면 표시
  - data를 통해 위젯 표현

📌 **이미지 용량을 줄이는 팁**

- 갤러리에서 사진을 불러올 때
  - ImagePicker().pickImage(source: ImageSource.gallery, imageQuality:40);
  - imageQuality를 조정함
- firebase storage에 접근할때는 reference를 사용
  - .ref(): riverpod의 ref가 아닌 reference를 의미
  - .child(): reference에 대한 상대 경로의 reference를 리턴함
  - 단 이러한 기능은 repository로 가야함
  - view model의 기능은 로딩 상태를 거쳐 성공 또는 에러 상태로 변경하는 것
- file reference에 put 함수를 통해 저장 가능

📌 **Future<void> async error**

🌈 **example**

```dart
Future<void> Function() {}
```

⛔️ **error**

```
The body might complete normally, causing 'null' to be returned, but the return type, 'Future<void>', is a potentially non-nullable type. Try adding either a return or a throw statement at the end.dartbody_might_complete_normally
```

- Future<void> 타입의 메서드는 반드시 Future<void>를 반환해야 함
- 현재 코드에서는 반환문이 없어서 Dart는 메서드가 null을 반환할 수 있다고 판단

☀️ **해결방법**

```dart
//1
Future<void> Function() {
  return Future.value(); // 정상 완료를 나타내는 Future 반환
}

//2
Future<void> Function() async {
}
```

### 25.6 onAvatarUpload

- firebase의 storage에 이미지를 저장 후 불러올때 alt=media 사용
  - alt=media가 없다면 이미지의 정보만을 불러옴
- %2F 뒷 부분이 ID가 됨

### 25.7 NetworkImage

- NetworkImage
  - 이미지를 얻고 캐싱하고 있음
  - fetch는 한번만함
  - url에 가짜 정보를 심어서 매번 새로운 url로 보이게함

### 26.1 VideosRepository

- upload의 결과인 UploadTask가 있으면 정상적으로 업로드 된 것
  - task.ref.getDownloadURL()

### 26.2 uploadVideoProvider

- cloud function이 영상을 다운로드받고, 이미지를 추출해서 썸네일을 등록할 것임

📌 **Xfile to File**

- File(widget.video.path)

### 26.3 Cloud Function

[installation]

firebase init functions

```
? Please select an option: Use an existing project
? Select a default Firebase project for this directory: tiktok-clone-sigirace (tiktok-clone-sigirace)
i  Using project tiktok-clone-sigirace (tiktok-clone-sigirace)

=== Functions Setup
Let's create a new codebase for your functions.
A directory corresponding to the codebase will be created in your project
with sample code pre-configured.

See https://firebase.google.com/docs/functions/organize-functions for
more information on organizing your functions using codebases.

Functions can be deployed with firebase deploy.

? What language would you like to use to write Cloud Functions? TypeScript
? Do you want to use ESLint to catch probable bugs and enforce style? No
✔  Wrote functions/package.json
✔  Wrote functions/tsconfig.json
✔  Wrote functions/src/index.ts
✔  Wrote functions/.gitignore
? Do you want to install dependencies with npm now? Yes
```

- cloud function settings
  - firebase admin import
    - package.json > admin 확인

```json
"dependencies": {
    "firebase-admin": "^12.1.0",
    "firebase-functions": "^5.0.0"
  }
```

[index.js]

```javascript
import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();
export const onVideoCreated = functions.firestore
  .document("videos/{videoId")
  .onCreate(async (snapshot, context) => {
    snapshot.ref.update({ hello: "from functions" });
  });
```

- cloud function 작성
- firebase 배포

```
firebase deploy --only functions
```

### 26.4 ffmpeg

- cloud function이 구글 서버에서 실행시
  - 서버에는 system packages inclouded in Cloud Functions가 설치되어있음
  - 이는 내 function이 실행할 서버에 설치된 패키지를 호출할 수 있음
  - 즉, 임시의 접근 권한 개념
  - 임시 폴더에도 접근 가능 (function 종료시 삭제)
- ffmpeg
  - 미디어에 대한 다양한 처리가 가능
- child-process-promise
  - 코드가 실행되는 서버에 프로세스를 실행시킬 수 있는 패키지

```
cd functions
npm i child-process-promise
```

[사용법]

```typescript
// spawn 생성
const spawn = require("chid-process-promise").spawn;
// (명령어, 파라미터)
await spawn("ffmpeg", [
  "-i", // input
  video.fileUrl, // file location
  "-ss", // move timeline
  "00:00:01.00", // start time
  "vframes", // frame
  "1", // frame count
  "vf", // video filter
  "scale=150:-1", // 가로 150, 세로 -1 영상 너비에 맞춰서 높이 설정
  `/tmp/${snapshot.id}.jpg`,
]);
```

### 26.5 publicUrl

- upload : Promise<UploadResponse>
  - type UploadResponse = [File, unknown];
- 반정규: 모든 영상에서 사용자를 찾는것 보다 사용자에 영상 인덱스를 복사해놓는게 저렴함

📌 **file.makePublic()의 역할**

1. 파일을 공개로 설정:
   - 이 메서드는 업로드된 파일의 액세스 제어 목록(ACL)을 업데이트하여, 해당 파일을 공용(public)으로 설정합니다. 이렇게 하면, 파일에 대한 읽기 권한이 누구에게나 부여됩니다.
2. 공개 URL 생성:
   - 파일을 공개로 설정하면, 파일에 접근할 수 있는 URL이 생성됩니다. 이를 통해 외부 사용자나 애플리케이션이 해당 파일에 쉽게 접근할 수 있습니다.

### 27.1 VideoPost

- get
  - Future<QuerySnapshot<Map<String, dynamic>>> get([GetOptions? options])
  - querysnapshot은 기본적으로 Map<String, dynamic> , Json 구조임
- map
  - map을 새로운 리스트로 생성

### 27.2 Infinite Firebase

- startAfter
  - orderby시에 첫번째 순서를 지정함
- Infinite scroll
  - fetchvideo와 nextpage를 구분하여 무한 스크롤 구현

### 27.3 FamilyAsyncNotifier

📌 **외부의 데이터로부터 provider를 초기화**

- class
  - FamilyAsyncNotifier<State, Arg>
    - Notifier에게 인자를 전달할 수 있음
    - 첫번째 인자는 관리할 데이터인 State
    - 두번째 인자는 전달한 데이터인 Arg
- provider
  - AsyncNotifierProvider.family<out NotifierT extends AsyncNotifier<T>, State, Arg>

### 27.4 likeVideo

- document db이기에 조회에 대한 트릭이 필요함
- 모든 것을 다 뒤지기에는 요금이 부과됨
- doc에 pk를 동적으로 생성하여 해결

### 27.5 dislikeVideo

📌 **cloud function > firestore 필드 값을 1 증가**

> admin.firestore.FieldValue.increment(1)

- 감소는 -1

### 28.1 Send Message

📌 **필드에 입력된 값을 이용하기**

- 알맞은 Controller 사용

📌 **isLoading**

> state = const AsyncValue.loading();

- state가 loading중일 떄

> final isLoading = ref.watch(messagesProvider).isLoading;

- watch로 loading중인 것을 알 수 있음
