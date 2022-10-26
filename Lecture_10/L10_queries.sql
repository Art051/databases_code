create table purchases(
    purchase_no serial primary key,
    purchase_value integer
);

insert into purchases (purchase_value)
VALUES (400), (200), (100), (300), (250), (150), (100), (50), (50);

SELECT  sum(purchase_value) from purchases;