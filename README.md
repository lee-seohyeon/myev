# 마이브이 (MYEV)

전기차 정보 통합 플랫폼 - 전기차의 모든 정보를 한눈에!

## 주요 기능

- 전기차 정보 비교
  - 브랜드/모델별 상세 스펙 정보
  - 가격, 보조금, 실구매가 정보
  - 주행거리, 충전 시간, 배터리 용량 등 핵심 스펙
  - 차량별 지원 기능 (OTA, 자율주행 등)

- 사용자 편의 기능
  - 차량 검색 및 필터링
  - 정렬 기능 (가격, 주행거리, 출시일 기준)
  - 차량별 메모 기능
  - 즐겨찾기 기능

## 기술 스택

- Flutter 3.x
- Material Design 3
- Google Sheets API (예정)

## 시작하기

1. 요구사항
   - Flutter SDK
   - Dart SDK
   - Android Studio 또는 VS Code

2. 설치
   ```bash
   # 프로젝트 클론
   git clone https://github.com/[username]/myev.git
   cd myev

   # 의존성 설치
   flutter pub get

   # 실행
   flutter run
   ```

## 프로젝트 구조

```
lib/
├── models/          # 데이터 모델
├── screens/         # 화면 UI
├── widgets/         # 재사용 가능한 위젯
└── services/        # API 및 서비스 (예정)
```

## 디자인 가이드

- 폰트: Pretendard
- 메인 컬러: 딥 그린 (#004225)
- UI 스타일: 미니멀하고 직관적인 디자인 (Toss 스타일)
