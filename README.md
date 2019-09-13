# Safe Food
> 안전 먹거리 프로젝트

![main](https://user-images.githubusercontent.com/21440957/64118284-4ec6fa00-cdd2-11e9-8e84-b0b7f172fb2f.PNG)

## 기획 배경
- 사용자의 식습관 정보에 기반한 식품 추천 
- 알러지 주의 식품 정보
- 식품 검색 결과 웹 크롤링
- 식품 섭취 통계 정보

## 차별화 전략
- 7000개의 data
- 캐시 기능을 활용한 성능 최적화
- 웹 크롤링으로 확장 기능 구현

## 핵심 구현
### LRU cache
![lru](https://user-images.githubusercontent.com/21440957/64861127-2066db80-d66a-11e9-87a2-bf08dd5243f9.png)

## 개발 환경
### BACK-END
- spring
- maven
- mabatis
- apache
- mysql

### FRONT-END
- bootstrap
- javascript
- jquery

### OPEN API
- naver openapi
- data.go.kr(공공 데이터 포털)

### 기대 효과
- 알러지 걱정 없는 안전 식품 섭취
- 다양한 식품을 추천 받을 수 있는 경험
- 섭취 통계표로 균형적인 식단에 도움

### 보완 및 개선점
- 추천 알고리즘 최적화(쿼리 의존도 낮춤)
- 하이브리드 앱으로 확장

### 후기
- DB 설계의 중요성