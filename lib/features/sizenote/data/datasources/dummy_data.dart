class DummyData {
  static const List<Map<String, dynamic>> category = [
    {},
    {'title': '아우터', 'count': 50},
    {'title': '상의', 'count': 40},
    {'title': '하의', 'count': 50},
    {'title': '신발', 'count': 30},
  ];

  static const List<Map<String, dynamic>> brand = [
    {},
    {'title': '무신사', 'count': 2},
    {'title': '육육걸즈', 'count': 3},
    {'title': '에잇세컨즈', 'count': 4},
    {'title': '미쏘', 'count': 5},
  ];

  static const List<Map<String, dynamic>> colors = [
    {},
    {'title': '블랙', 'count': 2},
    {'title': '블루', 'count': 1},
    {'title': '와인', 'count': 3},
    {'title': '오렌지', 'count': 4},
  ];

  static const List<Map<String, dynamic>> itemList = [
    {'title': '아우터명', 'category': '아우터', 'brand': '브랜드명', 'size': '사이즈 후기', 'date': '2025.02.01', 'img': '', 'check': true, 'color': '블랙', 'type': '상의', 'dressInfo': {'total': 112, 'shoulderWidth': 113, 'chest': 35, 'sleeve':10}, 'unit': 'cm'},
    {'title': '싱글코트', 'category': '아우터', 'brand': '무신사', 'size': '정사이즈', 'date': '2025.02.01', 'img': 'assets/images/test_img_three.png', 'check': false, 'color': '블랙', 'type': '상의', 'dressInfo': {'total': 112, 'shoulderWidth': 113, 'chest': 35, 'sleeve':10}, 'unit': 'cm'},
    {'title': '만일 아우터명이 길다면 어떻게보이나요', 'category': '상의', 'brand': '브랜드명이 길다면 길다면 길다면', 'size': '사이즈 후기', 'date': '2025.02.01', 'img': 'assets/images/test_img_four.png', 'check': true, 'color': '오렌지', 'type': '상의', 'dressInfo': {'total': 112, 'shoulderWidth': 113, 'chest': 35, 'sleeve':10}, 'unit': 'inch'},
  ];

  static const List<Map<String, dynamic>> colorList = [
    {'color': '#FFFFFF','name':'화이트'},
    {'color': '#808080','name':'그레이'},
    {'color': '#000000','name':'블랙'},
    {'color': '#FFC0CB','name':'핑크'},
    {'color': '#FF0000','name':'레드'},
    {'color': '#722F37','name':'와인'},
    {'color': '#964B00','name':'브라운'},
    {'color': '#FFA500','name':'오렌지'},
    {'color': '#FFFF00','name':'옐로우'},
    {'color': '#008000','name':'그린'},
    {'color': '#6B8E23','name':'카키'},
    {'color': '#87CEEB','name':'스카이블루'},
    {'color': '#0000FF','name':'블루'},
    {'color': '#000080','name':'네이비'},
    {'color': '#800080','name':'퍼플'},
    {'color': '#E6E6FA','name':'라벤더'},
  ];
}