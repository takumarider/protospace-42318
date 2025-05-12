## usersテーブル

| Column              | Type    | Options                     |
|--------------------|---------|-----------------------------|
| email              | string  | NOT NULL, unique            |
| encrypted_password | string  | NOT NULL                    |
| name               | string  | NOT NULL                    |
| profile            | text    | NOT NULL                    |
| occupation         | text    | NOT NULL                    |
| position           | text    | NOT NULL                    |
| timestamps         |         |                             |

## prototypesテーブル

| Column      | Type       | Options                        |
|------------|------------|--------------------------------|
| title      | string     | NOT NULL                       |
| catch_copy | text       | NOT NULL                       |
| concept    | text       | NOT NULL                       |
| user       | references | NOT NULL, foreign_key: true    |
| occupation | text       | （必要であれば NOT NULL）        |
| position   | text       | （必要であれば NOT NULL）        |
| timestamps |            |                                |

## commentsテーブル

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| content    | text       | NOT NULL                       |
| prototype  | references | NOT NULL, foreign_key: true    |
| user       | references | NOT NULL, foreign_key: true    |
| timestamps |            |                                |
