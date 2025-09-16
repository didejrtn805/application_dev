# Annyeong - 익명 소개팅 앱

## 📱 프로젝트 개요

Annyeong은 익명성을 보장하는 소개팅 앱입니다. 익명 게시판을 통한 자연스러운 만남과 데일리 매칭 시스템으로 운명적 만남을 제공합니다.

### 🎯 핵심 컨셉
- **익명성 보장**: 완전 익명 게시판을 통한 자연스러운 만남
- **데일리 매칭**: 매일 3-5명의 추천 상대 제공
- **프라이버시 중심**: 개인정보 보호를 최우선으로 하는 설계

### 👥 타겟 사용자
- 연령: 20-35세
- 진지한 만남을 원하는 사용자
- 프라이버시를 중요하게 생각하는 사용자

## 🛠 기술 스택

- **Frontend**: Flutter (Dart)
- **Backend**: Firebase
  - Authentication (전화번호 인증)
  - Firestore (데이터베이스)
  - Storage (이미지 저장)
  - Cloud Functions (매칭 알고리즘)
  - Analytics & Crashlytics

## 📁 프로젝트 구조

```
lib/
├── main.dart
├── app/
│   ├── app.dart
│   └── routes.dart
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   └── utils/
├── features/
│   ├── auth/           # 인증 관련
│   ├── profile/        # 프로필 관리
│   ├── anonymous_board/ # 익명 게시판
│   ├── matching/       # 매칭 시스템
│   └── chat/          # 채팅 기능
├── shared/
│   ├── widgets/        # 공통 위젯
│   ├── services/       # 공통 서비스
│   └── models/         # 데이터 모델
└── firebase_options.dart
```

## 🚀 개발 단계별 로드맵

### Phase 1: 기반 설정 (1-2주)
- [x] Flutter 프로젝트 초기화
- [x] Firebase 프로젝트 생성 및 연동
- [x] 기본 프로젝트 구조 설정
- [ ] 전화번호 인증 시스템 구현
- [ ] 사용자 등록/로그인 플로우

### Phase 2: 사용자 관리 (2-3주)
- [ ] 사용자 프로필 데이터 모델 설계
- [ ] 프로필 사진 업로드 기능
- [ ] 프로필 편집 및 관리 기능
- [ ] 관리자 승인 시스템 (Cloud Functions)
- [ ] 선호도 설정 기능

### Phase 3: 익명 게시판 (3-4주)
- [ ] 게시글 CRUD 기능
- [ ] 카테고리별 분류 시스템
- [ ] 익명 ID 생성 및 관리
- [ ] 개인정보 자동 차단 시스템
- [ ] 콘텐츠 필터링 (욕설, 부적절한 내용)
- [ ] 댓글 및 좋아요 기능
- [ ] 신고 시스템

### Phase 4: 매칭 시스템 (4-5주)
- [ ] 매칭 알고리즘 설계 및 구현
- [ ] 관심 표현 기능
- [ ] 데일리 매칭 시스템
- [ ] 실시간 채팅 기능
- [ ] 이미지 전송 기능
- [ ] 매칭 히스토리 관리

### Phase 5: 고급 기능 (2-3주)
- [ ] 보안 강화 (데이터 암호화, API 보안)
- [ ] 성능 최적화 (이미지 압축, 캐싱)
- [ ] 푸시 알림 시스템
- [ ] 사용자 행동 분석
- [ ] A/B 테스트 기능

### Phase 6: 배포 및 운영 (1-2주)
- [ ] 앱 스토어 배포 준비
- [ ] 모니터링 시스템 구축
- [ ] 사용자 피드백 시스템
- [ ] 버그 수정 및 성능 개선

## 🔧 주요 기능

### 1. 회원가입 및 인증
- 전화번호 인증 (필수)
- 프로필 등록 후 관리자 승인
- 본인 인증 강화로 신뢰도 확보

### 2. 익명 게시판
- 완전 익명 게시글 작성
- 카테고리별 분류 (연애고민, 일상, 취미 등)
- 댓글/좋아요 기능
- 개인정보 자동 차단 시스템

### 3. 소개 매커니즘
- 게시글을 통한 관심 있는 상대 발견
- "관심 표현" 기능으로 매칭 시작
- 서로 관심을 표현하면 채팅방 개설

### 4. 데일리 매칭 시스템
- 매일 3-5명의 추천 상대 제공
- 알고리즘 기반 매칭 (나이, 지역, 취미 등)
- 좋아요/패스 선택으로 매칭 결정

## 📊 데이터베이스 설계

### Firestore 컬렉션
- `users/` - 사용자 정보
- `posts/` - 익명 게시글
- `matches/` - 매칭 정보
- `chats/` - 채팅 데이터
- `reports/` - 신고 정보
- `admin_settings/` - 관리자 설정

## 🔒 보안 및 개인정보 보호

- Firestore 보안 규칙 설정
- 사용자 데이터 암호화
- 익명 ID 생성 알고리즘
- 개인정보 자동 필터링
- 사용자 추적 방지

## 📱 설치 및 실행

### 필요 조건
- Flutter SDK 3.0.0 이상
- Dart SDK 3.0.0 이상
- Android Studio / VS Code
- Firebase 프로젝트 설정

### 설치 방법
```bash
# 저장소 클론
git clone https://github.com/didejrtn805/application_dev.git

# 의존성 설치
flutter pub get

# Firebase 설정 파일 추가
# android/app/google-services.json
# ios/Runner/GoogleService-Info.plist

# 앱 실행
flutter run
```

## 🤝 기여 방법

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다. 자세한 내용은 `LICENSE` 파일을 참조하세요.

## 📞 연락처

프로젝트 링크: [https://github.com/didejrtn805/application_dev](https://github.com/didejrtn805/application_dev)

## 🙏 감사의 말

이 프로젝트는 Flutter와 Firebase의 강력한 기능을 활용하여 개발되었습니다.

---

**개발 진행 상황**: Phase 1 진행 중 (기반 설정 단계)
