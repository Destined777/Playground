use goods;
Create Table goods(
goods_id int not null auto_increment PRIMARY KEY ,
goods_name nvarchar(10) NOT NULL,
price float not null,
remaining int not null
);

create table users(
u_id int not null auto_increment primary key unique,
user_id int not null ,
balance int not null
);
create table shopping(
s_id int not null auto_increment primary key,
s_amount int not null,
u_id int not null,
goods_id int NOT NULL
) ;
ALTER TABLE shopping ADD INDEX shopping_u_id_index(u_id);
ALTER TABLE shopping ADD INDEX shopping_goods_id_index(goods_id);
/*INSERT INTO goods.users VALUES('1','101','22');
INSERT INTO goods.goods VALUES('1','a','10','100');
INSERT INTO goods.shopping VALUES('1','1','101','a');*/
alter table shopping Add constraint FK_Shopping_u_id foreign key (u_id) references users(u_id);
alter table shopping Add constraint FK_Shopping_goods_id foreign key (goods_id) references goods(goods_id);
create table recharge(
r_id int not null auto_increment primary key,
r_amount float not null ,
u_id int not null 
);
ALTER TABLE recharge ADD INDEX recharge_u_id_index(u_id);
alter table recharge Add constraint FK_Recharge_u_id foreign key (u_id) references users(u_id);
create table owning(
o_id int not null auto_increment primary key,
o_amount int not null ,
u_id int not null ,
goods_id int NOT NULL
) ;
ALTER TABLE owning ADD INDEX owning_u_id_index(u_id);
ALTER TABLE owning ADD INDEX owning_goods_id_index(goods_id);
alter table owning Add constraint FK_Owning_u_id foreign key (u_id) references users(u_id);
alter table owning Add constraint FK_Owning_goods__id foreign key (goods_id) references goods(goods_id);