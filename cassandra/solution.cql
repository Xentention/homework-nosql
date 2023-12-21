create table posts (
    post_id     int,
    user_id     int,
    username    text,
    created_at  timestamp,
    content     text,
    topic_id    int,
    primary key ( post_id, user_id, created_at )
);

create table topics (
    topic_id    int primary key,
    name        text
);


-- Запрос, который бы доставал посты заданного пользователя
-- упорядоченные по времени создания поста - сначала новые.
-- Запрос должен возвращать post_id, content, дату создания поста.
select post_id, content, created_at
from posts
where user_id = 1
order by created_at desc;

-- Запрос, который бы доставал последний пост
-- заданного пользователя. Запрос должен возвращать post_id,
-- content, дату создания поста, username.
select post_id, content, created_at, username
from posts
where user_id = 1
order by created_at desc
limit 1;

-- Запрос, который бы доставал посты заданного пользователя,
-- опубликованные после заданной даты. Запрос должен возвращать
-- post_id, content, дату создания поста.
select post_id, content, created_at
from posts
where created_at > '2023-12-19 15:02:56';

-- Запрос, который бы доставал пользователей,
-- которые сделали пост в заданный день по заданной теме,
-- упорядоченные по времени - сначала новые. Запрос должен
-- возвращать user_id, username, post_id, время создания поста.
select user_id, username, post_id, created_at
from posts
where topic_id = 1
  and created_at >= '2023-12-19'
  and created_at < '2023-12-20'
order by created_at desc