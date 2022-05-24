# a9 DB 생성
DROP DATABASE IF EXISTS a9;
CREATE DATABASE a9;
USE a9;

# todo 테이블 생성
CREATE TABLE todo (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    reg_date DATETIME NOT NULL,
    perform_date DATETIME NOT NULL,
    is_completed TINYINT UNSIGNED NOT NULL DEFAULT 0,
    content VARCHAR(200) NOT NULL
);

# 할일 3개 추가
# 할일 추가, 07시에 기상
INSERT INTO todo
SET reg_date = NOW(),
perform_date = '2022-05-18 07:00:00',
is_completed = 0,
content = '기상';

# 할일 추가, 07시 30분에 조깅
INSERT INTO todo
SET reg_date = NOW(),
perform_date = '2022-05-18 07:30:00',
is_completed = 0,
content = '조깅';

# 할일 추가, 08시에 아침식사
INSERT INTO todo
SET reg_date = NOW(),
perform_date = '2022-05-18 08:00:00',
is_completed = 0,
content = '아침식사';