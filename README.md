# SQL

- Модель данный (model.sql)

- Необходимые ресурсы:
  
  - PostgreSQL
  
  - PgAdmin4

<details><summary><strong>SQL1</strong></summary>


- Изучим, как работает реляционная модель и как получить необходимые данные на основе базовых конструкций SQL.

## Задания:

### EX00 

- Реализовать запрос, который возвращает все имена и возраст людей из города «Казань».

### EX01

- Реализовать запрос, который возвращает имена и возраст всех женщин из города «Казань», отсортировать результаты по имени.

### EX02

- Реализовать два запроса, которые возвращают список пиццерий (название и рейтинг пиццерии) с рейтингом от 3,5 до 5 баллов (включая предельные баллы), упорядоченных по рейтингу пиццерии.

  - первый оператор выбора должен содержать знаки сравнения (<=, >=);

  - второй оператор выбора должен содержать ключевое слово BETWEEN.

### EX03

- Реализовать запрос, который возвращает идентификаторы лиц (без дубликатов), которые посетили пиццерии в период с 6 января 2022 г. по 9 января 2022 г. (включая все дни) или посетили пиццерии с идентификатором 2, отсортировать по убыванию идетификатора.

### EX04

- Реализовать запрос,который возвращает одно вычисляемое поле с именем `person_information` в одной строке, как описано в следующем примере:

`Anna (age:16,gender:'female',address:'Moscow')`

Отсортировать по вычисляемому столбцу в порядке возрастания.

### EX05

- Реализовать запрос, который возвращает имена людей (на основе внутреннего запроса в предложении SELECT), которые разместили заказы на меню с идентификаторами 13, 14 и 18, а дата заказов должна быть 7 января 2022 г.

### EX06

- Использовать запрос из [EX 05](#ex05) и добавим новый вычисляемый столбец (используйте имя столбца `check_name`) с оператором проверки, в предложении «SELECT»

    `if (person_name == 'Denis') then return true
        else return false`

### EX07

- Реализовать запрос, который возвращает идентификаторы человека, его имена и интервал возраста человека (задайте имя нового вычисляемого столбца как `interval_info`) на основе приведенного ниже псевдокода.

`
    if (age >= 10 and age <= 20) then return 'interval #1'
    else if (age > 20 and age < 24) then return 'interval #2'
    else return 'interval #3'
`

Отсортировать результат по столбцу `interval_info` в порядке возрастания.

### EX08

- Реализовать запрос, который возвращает все столбцы из таблицы person_order со строками, идентификатор которых представляет собой четное число. Результат должен быть упорядочен по возвращаемому идентификатору.

### EX09

- Реализовать запрос,  который возвращает имена людей и названия пиццерий на основе таблицы `person_visits` с датой посещения в период с 7 по 9 января 2022 г. (включая все дни) (на основе внутреннего запроса в таблице FROM).

    SELECT (...) AS person_name ,  -- this is an internal query in a main SELECT clause
            (...) AS pizzeria_name  -- this is an internal query in a main SELECT clause
    FROM (SELECT … FROM person_visits WHERE …) AS pv -- this is an internal query in a main FROM clause
    ORDER BY ...

Отсортировать по имени человека в порядке возрастания и по названию пиццерии в порядке убывания.
</details>

<details><summary><strong>SQL2</strong></summary>

- Изучим, как получить необходимые данные на основе конструкций множеств и простых соединений JOIN.

## Задания:

### EX00_2

- Реализовать запрос, который возвращает идентификатор меню и названия пиццы из таблицы «menu», а также идентификатор человека и имя человека из таблицы `person` в одном глобальном списке (с именами столбцов, как показано в примере ниже), упорядоченном по `object_id`. а затем по столбцам имя_объекта.

### EX01

- Измените запрос из [EX 00](#ex00_2), удалив столбец `object_id`. Затем измените порядок по имени объекта для части данных из таблицы `person`, а затем из таблицы `menu`. Сохранить дубликаты!

### EX02

- Реализовать запрос, который возвращает уникальные названия пиццы из таблицы «menu» и сортирует их по столбцу `pizza_name` в порядке убывания. 

### EX03_2

- Реализовать запрос, который возвращает общие строки для атрибутов `order_date`, `person_id` из таблицы `person_orders` с одной стороны и `visit_date`, `person_id` из таблицы `person_visits` с другой стороны. Другими словами, найдем идентификаторы людей, которые посетили и заказали пиццу в тот же день. Отсортировать по `action_date` по возрастанию и `person_id` по убыванию.   

### EX04

- Реализовать запрос, который возвращает разницу (минус) значений столбца `person_id`, сохраняя при этом дубликаты между таблицами person_order и `person_visits` для `order_date` и `visit_date`, относящихся к 7 января 2022 года.

### EX05

- Реализовать запрос, который возвращает все возможные комбинации между таблицами `person` и `pizzeria`, и установите порядок столбцов идентификатора человека, а затем столбцов идентификатора пиццерии

### EX06

- Изменить запрос [EX 03](#ex03_2), чтобы он возвращал имена людей вместо идентификаторов людей, и изменим порядок по `action_date` в возрастанию, а затем по `person_name` по убыванию

### EX07_2

- Реализовать запрос, который возвращает дату заказа из таблицы `person_order` и соответствующее имя человека, который сделал заказ из таблицы `person`. Добавьте сортировку по обоим столбцам в порядке возрастания.

### EX08

- Переписать запрос [EX 07](#ex07_2), используя конструкцию NATURAL JOIN. Результат должен быть таким же, как в упражнении [EX 07](#ex07_2).

### EX09

- Реализовать два запроса, которые возвращают список пиццерий, которые не посещали люди, используя `IN` для первого и `EXISTS` для второго.

### EX10

- Реализовать запрос, который возвращает список имен людей, заказавших пиццу в 
соответствующей пиццерии. Отсортировать по `person_name`, `pizza_name`,
`pizzeria_name` в порядке возрастания.
</details>

<details><summary><strong>SQL3</strong></summary>

- Изучим, как получить необходимые данные на основе различных структур JOIN.

## Задания:

### EX00

- Реализовать запрос, который возвращает список пиццерий с соответствующим значением рейтинга, которые еще не посещали люди.

### EX01_3

- Реализовать запрос, который возвращает пропущенные дни с 1 по 10 января 2022 г. (включая все дни) для посещений людьми с идентификаторами 1 или 2 (т. е. дни, пропущенные обоими). Отсортировать по дням посещения в порядке возрастания. 

### EX02

- Реализовать запрос, который будет возвращать весь список имен людей, которые посещали (или не посещали) пиццерии в период с 1 по 3 января 2022 года с одной стороны и весь список названий посещенных пиццерий ( или не посетил) на другой стороне. Обратите внимание на заменяющее значение '-' для значений `NULL` в столбцах `person_name` и `pizzeria_name`. Отсортировать по всем трем столбцам.

### EX03

- Изменить [EX 01](#ex01_3), используя шаблон CTE (Common Table Expression). Результат должен выглядеть аналогично упражнению [EX 01](#ex01_3).

### EX04

- Реализовать запрос, который найдет полную информацию обо всех возможных названиях и ценах пиццерий, чтобы получить пиццу с грибами или пепперони. Затем отсортируйте результат по названию пиццы и названию пиццерии. 

### EX05

- Реализовать запрос, который найдет имена всех женщин старше 25 лет и отсортируйте результат по имени. 

### EX06

- Реализовать запрос, который найдет все названия пицц (и соответствующие названия пиццерий с помощью таблицы «меню»), заказанные Денисом или Анной. Отсортируйте результат по обоим столбцам.  

### EX07

- Реализовать запрос, который найдет название пиццерии, которую Дмитрий посетил 8 января 2022 года и где мог съесть пиццу менее чем за 800 рублей.

### EX08

- Реализовать запрос, который найдет имена всех мужчин из Москвы или Самары, которые заказывают либо пепперони, либо пиццу с грибами (или и то, и другое). Отсортировать результат по именам людей в порядке убывания. 

### EX09

- Реализовать запрос, который найдет имена всех женщин, которые заказывали и пепперони, и сырную пиццу (в любое время и в любых пиццериях). Отсортировать по имени человека.

### EX10

- Реализовать запрос, который найдет имена людей, живущих по тому же адресу. Отсортировать по имени 1-го человека, имени 2-го человека и общему адресу. 

</details>

<details><summary><strong>SQL4</strong></summary>

- Изучим, как изменять данные на основе языка DML.

## Задания:

### EX00

- Реализовать запрос, который возвращает список названий пицц, цен на пиццу, названий пиццерий и дат посещения Кейт и для цен от 800 до 1000 рублей. Отсортировать по пицце, цене и названию пиццерии. 

### EX01_4

- Реализовать запрос, который найдет все идентификаторы меню, которые никем не заказаны. Результат должен быть отсортирован по идентификатору

### EX02

Дополнить запрос из [EX01](#ex01_4) и вывести названия пицц из пиццерии, которые никто не заказывал, включая соответствующие цены. Результат должен быть отсортирован по названию и цене пиццы.

### EX03

- Реализовать запрос, который найдет пиццерии, которые чаще посещают женщины или мужчины. Сохраняйте дубликаты для любых операторов SQL с наборами (конструкции `UNION ALL`, `EXCEPT ALL`, `INTERSECT ALL`). Отсортировать результат по названию пиццерии. 

### EX04

- Найти объединение пиццерий, которые заказывают как женщины, так и мужчины. Другими словами, вам необходимо найти набор названий пиццерий, которые заказывали только женщины, и провести операцию «UNION» с набором названий пиццерий, которые заказывали только мужчины. Отсортировать результат по названию пиццерии.

### EX05

- Реализовать запрос, который возвращает список пиццерий, которые `Andrey` посетил, но не сделал заказ. Отсортировать по названию пиццерии. 

### EX06

- Реализовать запрос, который найдет одинаковые названия пицц по одинаковой цене, но из разных пиццерий. Отсортировать по названию пиццы.

### EX07

- Необходимо добавить новую пиццу с названием `greek pizza` (используйте id=19) по цене 800 рублей в ресторане `Dominos` (pizzeria_id=2).

### EX08

- Необходимо добавить новую пиццу с названием `sicilian pizza` (идентификатор которой должен рассчитываться по формуле «максимальное значение id + 1») по цене 900 рублей в ресторане «Доминос» (для получения идентификатора используйте внутренний запрос пиццерии).

### EX09

- Необходимо добавить новые посещения ресторана Domino's `Denis` и `Irina` 24 февраля 2022 года.

### EX10

- Необходимо добавить новые аказы от `Denis` и `Irina` 24 февраля 2022 года на новое меню `sicilian pizza` .

### EX11

- Изменить цену `greek pizza` на -10% от текущей стоимости.

### EX12_4

- Необходимо добавить новые заказы всех лиц на «Греческую пиццу» 25 февраля 2022 года.

### EX13

- Реализовать два запроса, которые удаляют все новые заказы из упражнения [EX12](#ex12_4 )на основе даты заказа и `greek pizza` и `menu`.

</details>

<details><summary><strong>SQL5</strong></summary>

- Изучим, как использовать виртуальное представление и физический снимок данных.

## Задания:

### EX00_5

- Создать 2 представления базы данных (с атрибутами, аналогичными исходной таблице) на основе простой фильтрации по полу людей. Задайте соответствующие имена для представлений базы данных: `v_persons_female` и `v_persons_male`.

### EX01

- Используя два предсьавдения из [EX00](#ex00_5), написать запрос для того, чтобы получить имена женщин и мужчин в одном списке. Отсортировать по именам.

### EX02

- Создать представление базы данных (с именем `v_generated_dates`), которое должно «хранить» сгенерированные даты с 1 по 31 января 2022 года в типе DATE. Отсортировать по дате.

### EX03

- Реализовать запрос, который возвращает пропущенные дни для посещений людей в январе 2022 года. Использовать для этой задачи представление `v_generated_dates` и отсортировать результат по столбцу `missing_date`. 

### EX04

- Реализовать запрос, который будет уловдетворять формуле `(R - S)∪(S - R)`. Где R — это таблица `person_visits` с фильтром до 2 января 2022 г., S — это также таблица `person_visits`, но с другим фильтром до 6 января 2022 г. Пожалуйста, проведите расчеты с наборами в столбце `person_id`, и это В результате столбец будет один. Отсортировать результат по столбцу `person_id` и представьте окончательный SQL в представлении базы данных `v_symmetric_union`

### EX05

- Создать представление базы данных `v_price_with_discount`, которое возвращает заказы человека с именем человека, названием пиццы, реальной ценой и рассчитанным столбцом `discount_price` (с примененной скидкой 10 % и удовлетворяющей формуле `price - price*0,1`). Отсортировать результат по именам людей и названиям пицц и преобразуйте столбец `discount_price` в целочисленный тип.

### EX06-5

- Создать материализованное представление `mv_dmitriy_visits_and_eats` (с включенными данными) на основе запроса, который находит название пиццерии, которую Дмитрий посетил 8 января 2022 года и мог есть пиццу менее чем за 800 рублей (этот запрос [EX07](#ex07_2)).

### EX07

- Необходимо обновить данные в нашем материализованном представлении `mv_dmitriy_visits_and_eats` из [EX06](#ex06_5). Перед этим действием создайте еще одно посещение Дмитрия, которое удовлетворяет предложению SQL материализованного представления, за исключением пиццерии, которую мы видим в результате [EX06](#ex06_5) .
После добавления нового посещения обновите состояние данных для `mv_dmitriy_visits_and_eats`.

### EX08

- Удалить все представления

</details>

<details><summary><strong>SQL6</strong></summary>

- Изучим, как и когда создавать индексы базы данных.

## EX00

- Создать индекс для каждого внешнего ключа

## EX01

- Как увидеть, что индекс работает? Примером доказательства является вывод команды EXPLAIN ANALYZE.
- Реализовать запрос, который возвращает пиццу и соответствующие названия пиццерий. 

## EX02

- Реализовать функциональный индекс с именем `idx_person_name` для имени столбца таблицы `person`. Индекс должен содержать имена людей в верхнем регистре.
Написать и предоставить любой SQL-код с доказательством («EXPLAIN ANALYZE»), что индекс idx_person_name работает.

## EX03

- Реализовать лучший индекс с несколькими столбцами с именем `idx_person_order_multi` для приведенного ниже запроса. 

```
  SELECT person_id, menu_id,order_date
  FROM person_order
  WHERE person_id = 8 AND menu_id = 19;
```

Команда EXPLAIN ANALYZE должна вернуть следующий шаблон.

```
 Index Only Scan using idx_person_order_multi on person_order ...
```

## EX04

- Разработать уникальный индекс с именем `idx_menu_unique` в таблице `menu` для столбцов `pizzeria_id` и `pizza_name`. Написать и предоставить любой SQL-код с доказательством («EXPLAIN ANALYZE»), что индекс «idx_menu_unique» работает.

## EX05

- Рахработать частично уникальный индекс с именем `idx_person_order_order_date` в таблице `person_order` для атрибутов `person_id` и `menu_id` с частичной уникальностью для столбца `order_date` для даты `01.01.2022`. Команда EXPLAIN ANALYZE должна вернуть следующий шаблон. 

```
  Index Only Scan using idx_person_order_order_date on person_order …
```

## EX06

- РАзработать новый индекс с именем `idx_1`, который должен улучшить показатель «Время выполнения» этого запроса. Предоставьте доказательства («EXPLAIN ANALYZE») того, что запрос был улучшен.
</details>

<details><summary><strong>SQL7</strong></summary>

- Изучим, как добавить новую бизнес-функцию в нашу модель данных.

## EX00

- Необходимо создать новую реляционную таблицу (задайте имя «person_discounts») со следующими правилами.
  - Установите атрибут id как первичный ключ (пожалуйста, посмотрите столбец id в существующих таблицах и выберите тот же тип данных).
  - Установите атрибуты person_id и pizzeria_id как внешние ключи для соответствующих таблиц (типы данных должны быть такими же, как для столбцов id в соответствующих родительских таблицах).
  - Задайте явные имена для ограничений внешнего ключа, используя шаблон fk_{table_name}_{column_name}, например `fk_person_discounts_person_id`.
  - Добавьте атрибут скидки, чтобы сохранить значение скидки в процентах. Помните, что значение скидки может быть числом с плавающей запятой (просто используйте числовой тип данных). Поэтому, пожалуйста, выберите соответствующий тип данных, чтобы учесть эту возможность.

## EX01

- Реализовать оператор DML («INSERT INTO ... SELECT ...»), который вставляет новые записи в таблицу «person_discounts» на основе следующих правил. 
  - Возьмите агрегированное состояние из столбцов person_id и pizzeria_id.
  - Рассчитайте величину персональной скидки по следующему псевдокоду:
    `if “amount of orders” = 1 then
      “discount” = 10.5 
    else if “amount of orders” = 2 then 
      “discount” = 22
    else 
      “discount” = 30`

## EX02

- Реализовать запрос, который возвращает заказы с фактической ценой и ценой со скидкой, применяемой для каждого человека в соответствующей пиццерии, отсортированные по имени человека и названию пиццы. 

## EX03

- Реализовать уникальный индекс с несколькими столбцами (с именем `idx_person_discounts_unique`), который предотвратит дублирование пар идентификаторов человека и пиццерии.
После создания нового индекса предоставьте любой простой запрос, подтверждающий использование индекса (используя EXPLAIN ANALYZE).

## EX04

- Добавьте следующие правила ограничений для существующих столбцов таблицы person_discounts.
  - Столбец person_id не должен иметь значение NULL (используйте имя ограничения `ch_nn_person_id`);
  - столбец pizzeria_id не должен иметь значение NULL (используйте имя ограничения `ch_nn_pizzeria_id`);
  - столбец скидки не должен быть NULL (используйте имя ограничения `ch_nn_discount`);
  - в столбце скидки по умолчанию должно быть 0 процентов;
  - Столбец скидки должен находиться в диапазоне значений от 0 до 100 (используйте имя ограничения `ch_range_discount`).

## EX05

- Чтобы соответствовать политике управления данными, вам необходимо добавить комментарии к таблице и ее столбцам. Давайте применим эту политику к таблице `person_discounts`. Пожалуйста, добавьте комментарии на английском или русском языке (на ваше усмотрение), объясняющие, какова бизнес-цель таблицы и всех ее атрибутов.

## EX06

- Реализовать последовательность базы данных с именем seq_person_discounts (начиная со значения 1) и установим значение по умолчанию для атрибута id таблицы person_discounts, чтобы каждый раз автоматически брать значение из seq_person_discounts.
</details>

<details><summary><strong>SQL8</strong></summary>

- Изучим, как использовать определенные конструкции OLAP для получения «значения» из данных.

## EX00_8

- Провести агрегацию данный и реализовать запрос, который возвращает идентификаторы людей и соответствующее количество посещений в любых пиццериях, сортирует по количеству посещений в режиме убывания и сортирует по `person_id` в режиме возрастания.

## EX01

- Измените запрос из [EX00](#ex00_8) и верните имя человека (а не идентификатор). Дополнительный пункт: нам нужно видеть только 4 лучших человека с максимальным количеством посещений в каждой пиццерии, отсортированных по имени человека.

## EX02_8

- Реализовать запрос, чтобы просмотреть 3 любимых ресторана по посещениям и заказам в списке (добавьте столбец action_type со значениями «заказ» или «посещение», это зависит от данных из соответствующей таблицы). Результат должен быть отсортирован по возрастанию по столбцу action_type и по убыванию по столбцу count.

## EX03

- Реализовать запрос SQL, чтобы увидеть, как рестораны группируются по посещениям и заказам и объединяются по названию ресторана.
Можно использовать внутренний запрос из упражнения [EX02](#ex02_8) (Рестораны по посещениям и по заказам) без каких-либо ограничений на количество строк.
Кроме того, добавьте следующие правила.
  - Посчитать сумму заказов и посещений соответствующей пиццерии (обратите внимание, что не все ключи пиццерий представлены в обеих таблицах).
  - Отсортируйте результаты по столбцу total_count в порядке убывания и по столбцу name в порядке возрастания.

## EX04

- Реализовать запром, который возвращает имя человека и соответствующее количество посещений любой пиццерии, если человек посетил более 3 раз (> 3).

## EX05

- Реализовать запрос, который возвращает список уникальных имен людей, разместивших заказы в любых пиццериях.

## EX06

- Реализовать запрос, который возвращает количество заказов, среднюю цену, максимальную цену и минимальную цену пиццы, продаваемой каждой пиццерией.

## EX07

- Реализовать запрос, который возвращает общий средний рейтинг (имя выходного атрибута — global_rating) для всех ресторанов. Округлите свой средний рейтинг до 4 чисел с плавающей запятой.

## EX08

- Реализовать запрос, который возвращает адрес, название пиццерии и сумму заказов человека. Результат следует отсортировать по адресу, а затем по названию ресторана.

## EX09

- Реализовать запрос, который возвращает агрегированную информацию по адресу человека, результат `Максимальный возраст - (Минимальный возраст / Максимальный возраст)`, представленный в виде столбца формулы, затем средний возраст по адресу и результат сравнения между столбцами формулы и среднего значения. (другими словами, если формула больше среднего, то значение True, в противном случае — значение False).
Результат должен быть отсортирован по столбцу адреса.
</details>

<details><summary><strong>SQL9</strong></summary>

- Изучим, как база данных работает с транзакциями и уровнями изоляции.

## EX00

**Сеанс №1**
- Обновление рейтинга "Pizza Hut" до 5 баллов в режиме транзакции.
- Убедитесь, что вы видите изменения в сеансе №1.
**Сеанс №2**
- Убедитесь, что вы не видите изменений в сеансе №2.
**Сеанс №1**
- Публикуйте изменения для всех параллельных сеансов.
**Сеанс №2**
- Убедитесь, что вы видите изменения в сеансе №2.

## EX01

- Проверить рейтинг «Pizza Hut» в режиме транзакции для обоих сеансов, а затем выполните `UPDATE` рейтинга до значения 4 в сеансе № 1 и выполните `UPDATE` рейтинга до значения 3,6 в Сеанс №2 (в том же порядке, что и на картинке).

![](/SQL9/images/D08_06.png)

## EX02

- Проверить  рейтинг «Pizza Hut» в режиме транзакции для обоих сеансов, а затем выполните `UPDATE` рейтинга до значения 4 в сеансе № 1 и выполните `UPDATE` рейтинга до значения 3,6 в Сеанс №2 (в том же порядке, что и на картинке).

![](/SQL9/images/D08_07.png)

## EX03

- Проверить  рейтинг «Pizza Hut» в режиме транзакции для сеанса № 1, а затем выполните `UPDATE` рейтинга до значения 3,6 в сеансе № 2 (в том же порядке, как на рисунке).

![](/SQL9/images/D08_08.png)

## EX04

- Проверить рейтинг «Pizza Hut» в режиме транзакции для сеанса № 1, а затем обновите рейтинг до значения 3,0 в сеансе № 2 (в том же порядке, как на рисунке).

![](/SQL9/images/D08_09.png)

## EX05

- Просуммировать все рейтинги для всех пиццерий в одном режиме транзакции для Сессии №1, а затем сделайте `INSERT` нового ресторана `Kazan Pizza` с рейтингом 5 и ID=10 в Сессии №2 (в том же порядке, что и на рисунке). .

![](/SQL9/images/D08_10.png)

## EX06

- Просуммировать все рейтинги для всех пиццерий в одном режиме транзакции для Сессии №1, а затем сделайте `INSERT` нового ресторана `Kazan Pizza 2` с рейтингом 4 и ID=11 в Сессии №2 (в том же порядке, что и на рисунке).

![](/SQL9/images/D08_11.png)

## EX07

![](/SQL9/images/D08_12.png)

- Реализовать любой запрос с любым уровнем изоляции (вы можете использовать настройку по умолчанию) для таблицы `pizzeria`, чтобы воспроизвести эту ситуацию тупика.
</details>

<details><summary><strong>SQL10</strong></summary>

- Изучим, как создавать и использовать функциональные блоки в базах данных

## EX00

- Создать таблицу person_audit с той же структурой, что и таблица person, но добавьте некоторые дополнительные изменения. Создать триггерную функцию базы данных с именем fnc_trg_person_insert_audit, которая должна обрабатывать DML-трафик INSERT и делать копию новой строки в таблице person_audit.
Когда вы закончите работу с объектами триггера, введите оператор INSERT в таблицу person.

```
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
```

## EX01

- Создать триггер trg_person_update_audit и соответствующую функцию триггера fnc_trg_person_update_audit для обработки всего трафика UPDATE в таблице person. Нам следует сохранить СТАРЫЕ состояния всех значений атрибутов. Когда вы будете готовы, примените приведенные ниже инструкции UPDATE.

```
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
```

## EX02

- Создайте триггер trg_person_delete_audit и соответствующую функцию триггера fnc_trg_person_delete_audit. Когда вы будете готовы, примените приведенные ниже инструкции DELETE.

```
DELETE FROM person WHERE id = 10;
```

## EX03

- Объединить всю нашу логику в один основной триггер под названием trg_person_audit и новую соответствующую триггерную функцию fnc_trg_person_audit. Другими словами, весь трафик DML («INSERT», «UPDATE», «DELETE») должен обрабатываться одним функциональным блоком. Кроме того, выполните следующие действия.

```
INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
```

## EX04_10

- Определите две функции с именами: `fnc_persons_female` (должен возвращать лиц женского пола), `fnc_persons_male` (должен возвращать лиц мужского пола). 
Чтобы проверить себя и вызвать функцию, вы можете сделать так:

```
SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();
```

## EX05

- две функции из упражнения [EX04](#ex04_10) требуют более общего подхода. Прежде чем продолжить, удалите эти функции из базы данных.
Напишите общую функцию под названием `fnc_persons`. Эта функция должна иметь параметр pgender `IN` со значением по умолчанию = `female`. Чтобы проверить себя и вызвать функцию, вы можете сделать так:

```
select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
```

## EX06

- Создать  функцию pl/pgsql `fnc_person_visits_and_eats_on_date` на основе оператора, которая будет находить названия пиццерий, которые посещал человек (параметр `IN` pperson со значением по умолчанию "Dmitriy") и где он мог купить пиццу дешевле заданной. сумму в рублях (параметр `IN` pprice со значением по умолчанию 500) на заданную дату (параметр `IN` pdate со значением по умолчанию 8 января 2022 года). Чтобы проверить себя и вызвать функцию, вы можете сделать так:

```
select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
```

## EX07

- Создать функцию func_minimum на SQL или pl/pgsql (на ваше усмотрение), которая имеет входной параметр, представляющий собой массив чисел, и функция должна возвращать минимальное значение. Чтобы проверить себя и вызвать функцию, вы можете сделать так:

```
SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
```

## EX08

- Создать функцию `fnc_fibonacci` на SQL или pl/pgsql (на ваше усмотрение), которая имеет входной параметр pstop целочисленного типа (по умолчанию — 10), а выходные данные функции представляют собой таблицу всех чисел Фибоначчи, меньших, чем pstop. Чтобы проверить себя и вызвать функцию, вы можете сделать так:

```
select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
```