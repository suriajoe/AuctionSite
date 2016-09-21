DROP DATABASE IF EXISTS auction_site;
CREATE DATABASE auction_site;
USE auction_site;

----DROP TABLE accounts;
CREATE TABLE accounts(
    email varchar(50),
--    account_id integer NOT NULL UNIQUE AUTO_INCREMENT,
    first_name varchar(30) NOT NULL,
    last_name varchar(30),
    password varchar(30),
    PRIMARY KEY(email)
) engine = innoDB;

--DROP TABLE admins;
CREATE TABLE admins(
    email varchar(50),
    PRIMARY KEY(email),
    FOREIGN KEY(email) references accounts(email)
) engine = innoDB;

--DROP TABLE customer_reps;
CREATE TABLE customer_reps(
    email varchar(50),
    PRIMARY KEY(email),
    FOREIGN KEY(email) references accounts(email)
) engine = innoDB;

--DROP TABLE questions;
CREATE TABLE questions(
    email varchar(50), 
    ticket_id integer NOT NULL UNIQUE AUTO_INCREMENT,
    title varchar(50),
    question varchar(2000),
    PRIMARY KEY(email, ticket_id),
    FOREIGN KEY(email) references accounts(email)
);

--DROP TABLE answer;
CREATE TABLE answer(
    email varchar(50),
    ticket_id integer,
    answer varchar(2000),
    PRIMARY KEY(email, ticket_id),
    FOREIGN KEY(email) references customer_reps(email),
    FOREIGN KEY(ticket_id) references questions(ticket_id)
);

--DROP TABLE items;
CREATE TABLE items(
    item_id integer NOT NULL UNIQUE AUTO_INCREMENT,
    email varchar(50),
    PRIMARY KEY(item_id, email),
    FOREIGN KEY(email) references accounts(email)
);

--DROP TABLE ps_games;
CREATE TABLE ps_games(
    item_id integer,
    title varchar(50),
    description varchar(2000),
    item_condition varchar(10),
    ps_version varchar(20),
    PRIMARY KEY(item_id),
    FOREIGN KEY(item_id) references items(item_id)
);

--DROP TABLE xb_games;
CREATE TABLE xb_games(
    item_id integer,
    title varchar(50),
    description varchar(2000),
    item_condition varchar(10),
    xb_version varchar(20),
    PRIMARY KEY(item_id),
    FOREIGN KEY(item_id) references items(item_id)
);

----DROP TABLE pc_games;
CREATE TABLE pc_games(
    item_id integer,
    title varchar(50),
    description varchar(2000),
    item_condition varchar(10),
    cpu_req integer,
    ram_req integer,
    rom_req integer,
    gfx_req varchar(50),
    os varchar(15),
    PRIMARY KEY(item_id),
    FOREIGN KEY(item_id) references items(item_id)
);

--DROP TABLE auctions;
CREATE TABLE auctions(
    auction_id integer NOT NULL UNIQUE AUTO_INCREMENT,
    email varchar(50),
    item_id integer,
    reserve integer,
    autowin integer,
    winner_email varchar(50),
    open_timestamp timestamp,
    close_timestamp timestamp,
    PRIMARY KEY(auction_id, email, item_id),
    FOREIGN KEY(email) references accounts(email),
    FOREIGN KEY(item_id) references items(item_id)
);

--DROP TABLE bids;
CREATE TABLE bids(
    bid_id integer NOT NULL UNIQUE AUTO_INCREMENT,
    email varchar(50),
    auction_id integer,
    amount integer,
    secret_limit integer,
    bid_timestamp TIMESTAMP,
    PRIMARY KEY(bid_id, email, auction_id),
    FOREIGN KEY(email) references accounts(email),
    FOREIGN KEY(auction_id) references auctions(auction_id)    
);

--DROP TABLE sales_reports;
CREATE TABLE sales_reports(
    sales_year integer,
    quarter integer,
    auction_id integer,
    winning_bid integer UNIQUE,
    FOREIGN KEY(winning_bid) references bids(bid_id)
);

--test data--
insert into accounts values ('001@google.com','John','Doe','abc');

insert into accounts values ('002@google.com','apple','berry','def');

insert into accounts values ('003@google.com','Cloud','strife','abc');

insert into accounts values ('004@google.com','Tony','Martini','185Gtd');
insert into accounts values ('005@yahoo.com','Donald','Trump','Wall');

insert into admins (email) values ('003@google.com'); 
insert into customer_reps(email) values ('005@yahoo.com');

insert into questions(email,title,question) values ('001@google.com','john ques', 'hi');

insert into questions(email,title,question) values ('002@google.com','apple ques', 'hows the weather');

insert into answer(email,ticket_id,answer) values ('005@yahoo.com','1','bye');

insert into items(email) values ('001@google.com');
insert into items(email) values ('002@google.com');
insert into items(email) values ('002@google.com');
insert into items(email) values ('003@google.com');
insert into items(email) values ('005@yahoo.com');

insert into ps_games(item_id,title,description,item_condition,ps_version) values('1', 'FF7','old classic game',
		    'Brand new','Playstation 1');
insert into xb_games(item_id,title,description,item_condition,xb_version) values('2', 'Halo 5','new modern game',
		    'Brand new','Xbox One');
insert into pc_games(item_id,title,description,item_condition,cpu_req,ram_req,rom_req,gfx_req,os) 
		     values('3', 'Overwatch','Most popular game in 2016','Used','4000','8','25','Gtx 1080','windows');
insert into pc_games(item_id,title,description,item_condition,cpu_req,ram_req,rom_req,gfx_req,os) 
		     values('4', 'No Mans Sky','Travel around to different planets and meet some sick aliens','Like New','3500','16','50','Gtx 1080','linux');
insert into pc_games(item_id,title,description,item_condition,cpu_req,ram_req,rom_req,gfx_req,os) 
		     values('5', 'Rocket League','Fast-paced soccer game with rocket powered cars','Brand new','2200','4','4','Gtx 750 ti or Amd R9 370','windows');

insert into auctions(email,item_id,reserve,autowin,winner_email,open_timestamp,close_timestamp) values
		    ('001@google.com','1','5','10','003@google.com','2016-08-11 14:32:10','2016-08-17 14:32:10');

insert into auctions(email,item_id,reserve,autowin,winner_email,open_timestamp,close_timestamp) values
		    ('002@google.com','2','0','60','001@google.com','2016-08-11 12:32:10','2016-08-17 12:32:10');

insert into auctions(email,item_id,reserve,autowin,winner_email,open_timestamp,close_timestamp) values
		    ('005@yahoo.com','3','20','50',null,'2016-08-11 12:32:10','2016-08-12 12:00:00');

insert into bids(email,auction_id,amount,secret_limit,bid_timestamp) values('003@google.com','1','15','20',
									    '2016-08-17 14:30:00');

insert into bids(email,auction_id,amount,secret_limit,bid_timestamp) values('005@yahoo.com','2','5','10',
									    '2016-08-17 12:30:00');
--test if amount can be higher than secret_limit
insert into bids(email,auction_id,amount,secret_limit,bid_timestamp) values('001@google.com','2','60','30',
									    '2016-08-17 12:32:10');
insert into bids(email,auction_id,amount,secret_limit,bid_timestamp) values('002@google.com','3','2','5',
									    '2016-08-11 16:32:10');
insert into bids(email,auction_id,amount,secret_limit,bid_timestamp) values('001@google.com','3','3','6',
									    '2016-08-12 9:32:10');
