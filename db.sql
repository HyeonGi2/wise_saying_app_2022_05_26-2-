DROP DATABASE IF EXISTS wise_saying_app_2022_05_27;
CREATE DATABASE wise_saying_app_2022_05_27;
USE wise_saying_app_2022_05_27;

CREATE TABLE wise_saying (
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    reg_date DATETIME NOT NULL,
    content VARCHAR(200) NOT NULL,
    author VARCHAR(50) NOT NULL,
    hitCount INT UNSIGNED NOT NULL DEFAULT 0,
    goodLikeCount INT UNSIGNED NOT NULL DEFAULT 0,
    badLikeCount INT UNSIGNED NOT NULL DEFAULT 0
);

INSERT INTO wise_saying
SET reg_date = NOW(),
`content` = '나는 산적이다.',
author = '임꺽정';

INSERT INTO wise_saying
SET reg_date = NOW(),
`content` = '나는 의적이다.',
author = '홍길동';

INSERT INTO wise_saying
SET reg_date = NOW(),
`content` = '나는 조선의 국모다.',
author = '명성황후';