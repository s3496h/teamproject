DROP DATABASE IF EXISTS `tails_route`;
CREATE DATABASE `tails_route`;
USE `tails_route`;

## 회원정보 테이블
CREATE TABLE `member`(
                         id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '식별번호',
                         regDate DATETIME NOT NULL COMMENT '가입 날짜',
                         updateDate DATETIME NOT NULL COMMENT '수정 날짜',
                         loginId CHAR(30) NOT NULL COMMENT '아이디',
                         loginPw CHAR(100) NOT NULL COMMENT '비밀번호',
                         authLevel SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반, 7=관리자)',
                         `name` CHAR(20) NOT NULL COMMENT '오프라인 이름',
                         nickname CHAR(20) NOT NULL COMMENT '온라인 이름',
                         gender TINYINT(1) UNSIGNED NOT NULL COMMENT '성별 (0=여자, 1=남자)',
                         cellphoneNum CHAR(20) NOT NULL COMMENT '전화번호',
                         delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
                         delDate DATETIME COMMENT '탈퇴 날짜'
);

## 회원정보 테이블 테스트 데이터

INSERT INTO `member` SET
                         regDate = '2024-02-05 14:15:00',
                         updateDate = '2024-03-10 16:30:00',
                         loginId = 'admin',
                         loginPw = 'pw_hash2',
                         authLevel = 7,
                         `name` = '관리자',
                         nickname = '강아지왕',
                         gender = 1,
                         cellphoneNum = '010-8765-4321',
                         delStatus = 0;

INSERT INTO `member` SET
                         regDate = '2024-01-10 10:30:00',
                         updateDate = '2024-02-10 12:00:00',
                         loginId = 'user01',
                         loginPw = 'pw_hash1',
                         authLevel = 3,
                         `name` = '김서준',
                         nickname = '콩이의대장',
                         gender = 1,
                         cellphoneNum = '010-1234-5678',
                         delStatus = 0;


INSERT INTO `member` SET
                         regDate = '2024-03-20 09:45:00',
                         updateDate = '2024-04-25 14:15:00',
                         loginId = 'user02',
                         loginPw = 'pw_hash3',
                         authLevel = 3,
                         `name` = '이지아',
                         nickname = '바둑이의수호자',
                         gender = 0,
                         cellphoneNum = '010-1111-2222',
                         delStatus = 1,
                         delDate = '2024-05-01 10:30:00';

INSERT INTO `member` SET
                         regDate = '2024-04-18 16:00:00',
                         updateDate = '2024-05-20 09:00:00',
                         loginId = 'user03',
                         loginPw = 'pw_hash4',
                         authLevel = 3,
                         `name` = '박도윤',
                         nickname = '두부의행복전도사',
                         gender = 1,
                         cellphoneNum = '010-3333-4444',
                         delStatus = 0;

INSERT INTO `member` SET
                         regDate = '2024-05-22 11:30:00',
                         updateDate = '2024-06-10 15:45:00',
                         loginId = 'user04',
                         loginPw = 'pw_hash5',
                         authLevel = 3,
                         `name` = '최하은',
                         nickname = '뭉치의천사',
                         gender = 0,
                         cellphoneNum = '010-5555-6666',
                         delStatus = 0;

INSERT INTO `member` SET
                         regDate = '2024-07-22 12:20:00',
                         updateDate = '2024-08-01 12:40:00',
                         loginId = 'asd',
                         loginPw = 'asd',
                         authLevel = 3,
                         `name` = '유은희',
                         nickname = '꾸미엄마',
                         gender = 0,
                         cellphoneNum = '010-7698-1532',
                         delStatus = 0;


## 반려견 테이블
CREATE TABLE `dog`(
                      id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '식별번호',
                      regDate DATETIME NOT NULL COMMENT '생성 날짜',
                      updateDate DATETIME NOT NULL COMMENT '수정 날짜',
                      memberId INT(10) UNSIGNED NOT NULL COMMENT '주인 식별번호',
                      `name` CHAR(20) DEFAULT '이름 없음' COMMENT '이름',
                      weight INT(10) DEFAULT -1 COMMENT '체중 (-1=모름)',
                      photo CHAR(50) NOT NULL COMMENT '사진',
                      `type` CHAR(20) NOT NULL COMMENT '소형, 중형, 대형'

);

INSERT INTO dog SET
                    regDate = '2024-01-01 10:00:00',
                    updateDate = '2024-01-01 10:00:00',
                    memberId = 1,
                    weight = 5,
                    photo = '/resource/photo/dog1.png',
                    `type` = '소형';

INSERT INTO dog SET
                    regDate = '2024-02-15 14:30:00',
                    updateDate = '2024-02-15 14:30:00',
                    memberId = 3,
                    `name` = '바둑이',
                    photo = '/resource/photo/dog2.png',
                    `type` = '중형';

INSERT INTO dog SET
                    regDate = '2024-03-20 09:15:00',
                    updateDate = '2024-03-20 09:15:00',
                    memberId = 5,
                    `name` = '뭉치',
                    weight = 15,
                    photo = '/resource/photo/dog3.png',
                    `type` = '대형';

INSERT INTO dog SET
                    regDate = '2024-04-25 16:45:00',
                    updateDate = '2024-04-25 16:45:00',
                    memberId = 6,
                    `name` = '꾸미',
                    weight = 4,
                    photo = '/resource/photo/dog4.png',
                    `type` = '소형';

## 게시글 테이블
CREATE TABLE article(
                        id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '식별번호',
                        regDate DATETIME NOT NULL COMMENT '작성 날짜',
                        updateDate DATETIME NOT NULL COMMENT '수정 날짜',
                        memberId INT(10) UNSIGNED NOT NULL COMMENT '작성자 식별번호',
                        boardId INT(10) UNSIGNED NOT NULL COMMENT '게시판 식별번호',
                        title CHAR(100) NOT NULL COMMENT '제목',
                        `body` TEXT NOT NULL COMMENT '내용',
                        hitCount INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '조회수'
);

## 게시판 테이블
CREATE TABLE board(
                      id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '식별번호',
                      `code` CHAR(100) NOT NULL UNIQUE COMMENT 'notice(공지사항) free(자유) Q&A(질의응답)',
                      `name` CHAR(20) NOT NULL UNIQUE COMMENT '이름'
);

## 리액션(좋아요, 싫어요) 테이블
CREATE TABLE reactionPoint(
                              id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '식별번호',
                              regDate DATETIME NOT NULL COMMENT '추천 날짜',
                              updateDate DATETIME NOT NULL COMMENT '수정 날짜',
                              memberId INT(10) UNSIGNED NOT NULL COMMENT '추천자 식별번호',
                              relTypeCode CHAR(20) NOT NULL COMMENT '추천대상 식별코드',
                              relId INT(10) UNSIGNED NOT NULL COMMENT '추천대상 식별번호',
                              `point` INT(10) COMMENT '좋아요, 싫어요 여부'
);

## 댓글 테이블
CREATE TABLE reply (
                       id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '식별번호',
                       regDate DATETIME NOT NULL COMMENT '작성 날짜',
                       updateDate DATETIME NOT NULL COMMENT '수정 날짜',
                       memberId INT(10) UNSIGNED NOT NULL COMMENT '작성자 식별번호',
                       relTypeCode CHAR(50) NOT NULL COMMENT '작성대상 식별코드',
                       relId INT(10) UNSIGNED NOT NULL COMMENT '작성대상 식별번호',
                       `body` TEXT NOT NULL COMMENT '내용'
);

## 알람 테이블
CREATE TABLE alarm (
                       id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '식별번호',
                       regDate DATETIME NOT NULL COMMENT '생성 날짜',
                       updateDate DATETIME NOT NULL COMMENT '수정 날짜',
                       memberId INT(10) UNSIGNED NOT NULL COMMENT '생성자 식별번호',
                       alarmDate DATE COMMENT '알람이 울릴 날짜',
                       alarmDay ENUM('월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일') COMMENT '알람이 울릴 요일',
                       alarmTime TIME NOT NULL COMMENT '알람이 울릴 시간',
                       CHECK ((alarmDate IS NOT NULL) OR (alarmDay IS NOT NULL))  -- 최소 하나는 NOT NULL
);

## 생필품 테이블
CREATE TABLE essentials (
                            id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '식별번호',
                            regDate DATETIME NOT NULL COMMENT '생성 날짜',
                            updateDate DATETIME NOT NULL COMMENT '수정 날짜',
                            memberId INT(10) UNSIGNED NOT NULL COMMENT '생성자 식별번호',
                            itemType CHAR(20) NOT NULL COMMENT '생필품 종류',
                            purchaseDate DATE NOT NULL COMMENT '구매 날짜',
                            usageCycle INT(10) NOT NULL COMMENT '사용주기',
                            timing INT(10) NOT NULL COMMENT '알림 시기',
                            purchaseStatus TINYINT(1) UNSIGNED NOT NULL COMMENT '구매여부'
);

## 약 체크 테이블
CREATE TABLE medicationLog (
                               id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '식별번호',
                               regDate DATETIME NOT NULL COMMENT '생성 날짜',
                               memberId INT(10) UNSIGNED NOT NULL COMMENT '사용자 식별번호',
                               medicationDate DATE NOT NULL COMMENT '복용 날짜'
);

## 실종 테이블
CREATE TABLE missing(
                        id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '식별번호',
                        memberId INT(10) UNSIGNED NOT NULL COMMENT '신고자 식별번호',
                        `name` CHAR(30) NOT NULL COMMENT '강아지 이름',
                        reportDate DATETIME NOT NULL COMMENT '실종 날짜',
                        missingLocation VARCHAR(100) NOT NULL COMMENT '실종 장소',
                        breed CHAR(30) NOT NULL COMMENT '품종',
                        color CHAR(30) NOT NULL COMMENT '색상',
                        gender CHAR(30) NOT NULL COMMENT '성별',
                        age CHAR(30) DEFAULT '불명' COMMENT '나이',
                        photo TEXT NOT NULL COMMENT '사진',
                        RFID CHAR(30) DEFAULT '없음' COMMENT '마이크로칩 번호',
                        trait TEXT NOT NULL COMMENT '특징'
);

SELECT S.*, M.name extra__ownerName, M.cellphoneNum extra__ownerCellphoneNum
FROM missing S
         LEFT JOIN `member` M
                   ON m.id = S.memberId
LIMIT 0, 25;

## 실종 테스트 데이터
INSERT INTO `missing` SET
                          memberId = 1,
                          `name` = '바둑이',
                          reportDate = '2024-10-05 09',
                          missingLocation  = '경기도 포천시 창수면 옥수로 320-64',
                          breed = '믹스견',
                          color = 'BLACK TAN&WHITE',
                          gender = '암컷',
                          age = '108',
                          photo = '/resource/photo/missing1.png',
                          trait = '흰 바탕에 표범같은 작은 점들이 많이 있고 귀 엉덩이 허리부분에 진갈색 과 검정색이 섞인 큰 얼룩이 있어요';

INSERT INTO `missing` SET
                          memberId = 2,
                          `name` = '몽이',
                          reportDate = '2024-10-10 08',
                          missingLocation  = '서울특별시 강서구 강서로45길 113 (내발산동)올라가는길',
                          breed = '포메라니안',
                          color = '흰색',
                          gender = '암컷',
                          age = '192',
                          photo = '/resource/photo/missing2.png',
                          trait = '포메스피츠 믹스견';

INSERT INTO `missing` SET
                          memberId = 3,
                          `name` = '콩이',
                          reportDate = '2024-10-10 09',
                          missingLocation  = '강원특별자치도 강릉시 주문진읍 신리천로 4-1 (해안연립)19동201호',
                          breed = '말티즈',
                          color = '흰색',
                          gender = '수컷',
                          age = '7',
                          photo = '/resource/photo/missing3.png',
                          RFID = '410100012908279',
                          trait = '흰색 미니 칩심어져있음 사람에게 호의적';

INSERT INTO `missing` SET
                          memberId = 4,
                          `name` = '로또',
                          reportDate = '2024-10-06 20',
                          missingLocation  = '전북특별자치도 김제시 부량면 벽골제로 320-13벽골제 지평선축제장',
                          breed = '시바',
                          color = '흑갈색',
                          gender = '수컷',
                          age = '34',
                          photo = '/resource/photo/missing4.png',
                          RFID = '410160010746866',
                          trait = '전체적으로 갈색검정털에 입주위 가슴 등쪽 날개모양 흰털 검은코 동그랗게 말린 꼬리';

INSERT INTO `missing` SET
                          memberId = 5,
                          `name` = '하루',
                          reportDate = '2024-10-05 16',
                          missingLocation  = '경상남도 남해군 설천면 설천로775번길 256-17남해양떼목장양모리학교',
                          breed = '보더 콜리',
                          color = '검정&흰색',
                          gender = '수컷',
                          photo = '/resource/photo/missing5.png',
                          trait = '오른쪽뒷다리를다쳐서 절음';

INSERT INTO `missing` SET
                          memberId = 6,
                          `name` = '멍이',
                          reportDate = '2024-10-05 22',
                          missingLocation  = '울산광역시 동구 등대로 95 (일산동)대왕암공원 주차장 일대',
                          breed = '비글',
                          color = '세가지색',
                          gender = '수컷',
                          age = '10',
                          photo = '/resource/photo/missing6.png',
                          trait = '목뒤 M자 무늬가 있음';

INSERT INTO `missing` SET
                          memberId = 1,
                          `name` = '구름이',
                          reportDate = '2024-10-05 07',
                          missingLocation  = '대전광역시 중구 보문로 341 (선화동, 현대아파트)101동',
                          breed = '기타',
                          color = '흑색&회색',
                          gender = '암컷',
                          age = '46',
                          photo = '/resource/photo/missing7.png',
                          trait = '사람을 엄청나게 경계함 지금은 사진보다 털이 많이 자란상태임';

INSERT INTO `missing` SET
                          memberId = 2,
                          `name` = '누비',
                          reportDate = '2024-10-03 10',
                          missingLocation  = '경기도 김포시 하성면 원통로28번길 37',
                          breed = '기타',
                          color = '흰색',
                          gender = '수컷',
                          age = '52',
                          photo = '/resource/photo/missing8.png',
                          trait = '폼피츠 이고 특별한 특징은 없읍니다';

INSERT INTO `missing` SET
                          memberId = 3,
                          `name` = '모카',
                          reportDate = '2024-09-28 15',
                          missingLocation  = '경상북도 문경시 굴모리길 14 (불정동)초록울타리집',
                          breed = '진도견',
                          color = '황색',
                          gender = '암컷',
                          age = '148',
                          photo = '/resource/photo/missing9.png',
                          trait = '귀 속에 진도견인증도장찍혀있음 ㆍ선꼬리';

INSERT INTO `missing` SET
                          memberId = 4,
                          `name` = '초코',
                          reportDate = '2024-09-25 06',
                          missingLocation  = '전라남도 강진군 강진읍 사의재길 31-23동성리 전 침례교회 아래집',
                          breed = '믹스견',
                          color = '황갈색',
                          gender = '수컷',
                          age = '96',
                          photo = '/resource/photo/missing10.png',
                          trait = '이름 만득이 진도 믹스 파랑빨강 목줄 꼬리 말아 올려져 있음 다리 길고 귀 쫑긋 털이 지저분함';

INSERT INTO `missing` SET
                          memberId = 5,
                          `name` = '복실이',
                          reportDate = '2024-09-20 06',
                          missingLocation  = '충청북도 청주시 흥덕구 풍년로198번길 45-6 (가경동)3층',
                          breed = '말티즈',
                          color = '흰색',
                          gender = '수컷',
                          age = '122',
                          photo = '/resource/photo/missing11.png',
                          trait = '심장이 안좋아 자꾸 켁켁 거려요';

##건강기록 테이블
CREATE TABLE doghealth(
                          memberId INT(10) UNSIGNED NOT NULL COMMENT 'member번호',
                          dogWeight FLOAT NOT NULL COMMENT '강아지 체중',
                          vaccinationDate DATETIME NOT NULL COMMENT '예방 접종 날짜',
                          checkupDate DATETIME NOT NULL COMMENT '건강 검진 날짜',
                          activityLevel FLOAT NOT NULL COMMENT '활동량(평균걸음수)'
);