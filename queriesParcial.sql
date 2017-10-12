/*CREATE TABLES*/
CREATE TABLE CATEGORIES(id int primary key, name varchar2(255), season varchar2(255));
CREATE TABLE PRODUCTS(id int primary key, name varchar2(255), reference varchar2(255), price decimal(10,3), category_id int);
CREATE TABLE ANSWERS(id int, number_of_question varchar2(255), answer varchar2(255));


--alter table categories modify season varchar2(255) default 'Desconocido' not null, 
    
/*FOREIGN KEYS*/
ALTER TABLE PRODUCTS ADD CONSTRAINT FK_CATEGORIES
      FOREIGN KEY (category_id) REFERENCES CATEGORIES (id);

/*queries*/
select count(ID) from products where category_id in (select id from CATEGORIES where CATEGORIES.SEASON = 'winter');

select price from products where CATEGORY_ID in (
  select id from CATEGORIES 
  where CATEGORIES.SEASON = 'summer' 
  and CATEGORIES.NAME = 'fitness gear')
  ORDER BY price asc;
  
select reference from PRODUCTS where CATEGORY_ID in (select id from CATEGORIES where NAME = 'golf')
order by price asc;

select name from PRODUCTS where REFERENCE = '523C9788-FFA5-715C-1F2B-7AA8BC33C107';

select a.name from CATEGORIES a
inner join products b on b.id = a.id 
where b.name = 'ligula consectetuer rhoncus.';


/*answers*/
insert into ANSWERS (ID,NUMBER_OF_QUESTION,ANSWER) values (1,'QUESTION 1','118');
insert into ANSWERS (ID,NUMBER_OF_QUESTION,ANSWER) values (2,'QUESTION 2','3');
insert into ANSWERS (ID,NUMBER_OF_QUESTION,ANSWER) values (3,'QUESTION 3','071120EC-471E-26CB-A756-68BFD4268A9A');
insert into answers (ID,NUMBER_OF_QUESTION,ANSWER) values (4,'QUESTION 4','congue turpis. In');
insert into ANSWERS (ID,NUMBER_OF_QUESTION,ANSWER) values (5,'QUESTION 5','N/A');