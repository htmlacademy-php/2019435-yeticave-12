-- Заполняем таблицу с категориями
INSERT INTO category (name, symbol_code)
  VALUES ('Доски и лыжи', 'boards');
INSERT INTO category (name, symbol_code)
  VALUES ('Крепления', 'attachment');
INSERT INTO category (name, symbol_code)
  VALUES ('Ботинки', 'boots');
INSERT INTO category (name, symbol_code)
  VALUES ('Одежда', 'clothing');
INSERT INTO category (name, symbol_code)
  VALUES ('Инструменты', 'tools');
INSERT INTO category (name, symbol_code)
  VALUES ('Разное', 'other');

-- Заполняем таблицу с пользователями
INSERT INTO user (registration_date, email, name, password, contacts)
  VALUES ('2022-03-19 17:12:11', 'ress@mail.ru', 'Lusia', 'rejrhejreh1221', 'Khrustaleva street 165');
INSERT INTO user (registration_date, email, name, password, contacts)
  VALUES ('2022-03-20 09:00:55', 'rurr@mail.ru', 'Pavel', 'oeoeoekekk87', 'Revolution prospect 56');

-- Заполняем таблицу с объявлениями
INSERT INTO lot (creation_date, name, description, img_source, price, end_date, bid_step,
                 author_id, winner_id, category_id)
  VALUES ('2022-01-10 18:12:11', '2014 Rossignol District Snowboard', 'Красивый борд, надо брать', 'img/lot-1.jpg',
        '10999', '2022-02-03 18:12:11', '10', '1', '', '1');
INSERT INTO lot (creation_date, name, description, img_source, price, end_date, bid_step,
                 author_id, winner_id, category_id)
  VALUES ('2022-01-15 16:01:21', 'DC Ply Mens 2016/2017 Snowboard', 'Мрачный борд', 'img/lot-2.jpg',
        '159999', '2022-03-03 08:55:10', '100', '1', '1', '1');
INSERT INTO lot (creation_date, name, description, img_source, price, end_date, bid_step,
                 author_id, winner_id, category_id)
  VALUES ('2022-01-20 09:01:22', 'Крепления Union Contact Pro 2015 года размер L/XL', 'Хорошие крепления',
        'img/lot-3.jpg', '8000', '2022-03-04 22:50:10', '5', '2', '', '2');
INSERT INTO lot (creation_date, name, description, img_source, price, end_date, bid_step,
                 author_id, winner_id, category_id)
  VALUES ('2022-01-25 09:01:22', 'Ботинки для сноуборда DC Mutiny Charocal', 'Добротные боты',
        'img/lot-4.jpg', '10999', '2022-03-05 04:30:01', '10', '2', '', '3');
INSERT INTO lot (creation_date, name, description, img_source, price, end_date, bid_step,
                 author_id, winner_id, category_id)
  VALUES ('2022-01-30 19:33:22', 'Куртка для сноуборда DC Mutiny Charocal', 'Куртка всем нужна',
          'img/lot-5.jpg', '7500', '2022-03-06 14:35:36', '10', '1', '', '4');
INSERT INTO lot (creation_date, name, description, img_source, price, end_date, bid_step,
                 author_id, winner_id, category_id)
VALUES ('2022-02-05 09:22:22', 'Маска Oakley Canopy', 'Маска для всех',
        'img/lot-6.jpg', '5400', '2022-03-08 14:35:36', '5', '2', '1', '6');

-- Заполняем таблицу со ставками
INSERT INTO bid (date, price, user_id, lot_id)
  VALUES ('2022-01-03 14:55:56', '11009', '2', '1');
INSERT INTO bid (date, price, user_id, lot_id)
  VALUES ('2022-01-03 17:02:03', '11019', '2', '1');

-- Показываем список категорий
SELECT name FROM category;

-- Показываем открытые лоты, при этом берем текущую цену из таблицы ставок,название категории из таблицы категории
SELECT l.name AS lot_name, l.price AS atart_price, img_source, b.price AS bid_price, c.name AS category_name FROM lot l
  JOIN bid b ON l.id = b.lot_id
  JOIN category c on c.id = l.category_id
  WHERE winner_id IS NULL;

-- Показываем лот по его ID (к примеру, 2), а также название категории из таблицы категорий, к которой принадлежит лот
SELECT l.name AS lot_name, c.name AS category_name FROM lot l
  JOIN category c on c.id = l.category_id
  WHERE l.id = 2;

-- Обновляем название лота по его ID
UPDATE lot SET name = 'Abracadabra' WHERE id = 3;

-- Получаем список ставок для лота по его ID с сортировкой по дате
SELECT price FROM bid WHERE lot_id = 3 ORDER BY date;
