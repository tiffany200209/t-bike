CREATE Database T_bike_database;
USE T_bike_database;

#create table
CREATE TABLE Customer(
cus_name CHAR(20) NOT NULL,
customer_id CHAR(10) NOT NULL,
phone CHAR(10),
cus_address VARCHAR(30),
birth_year CHAR(4),
birth_mouth CHAR(2),
birth_day CHAR(2),
PRIMARY KEY(customer_id)
);
CREATE TABLE Card(
card_id CHAR(12) NOT NULL,
cus_id CHAR(10) NOT NULL,
register_year CHAR(4) NOT NULL,
register_month CHAR(2) NOT NULL,
register_day CHAR(2) NOT NULL,
PRIMARY KEY(card_id,cus_id),
FOREIGN KEY(cus_id) REFERENCES Customer(customer_id)
);
CREATE TABLE Bike(
bike_id CHAR(6) NOT NULL,
card_number CHAR(12),
PRIMARY KEY(bike_id),
FOREIGN KEY(card_number) REFERENCES Card(card_id)
);
CREATE TABLE Station_Rod(
station_name VARCHAR(15) NOT NULL,
rod_number INT NOT NULL,
sta_address VARCHAR(30) NOT NULL,
bike_number CHAR(6),
PRIMARY KEY(station_name,rod_number),
FOREIGN KEY(bike_number) REFERENCES Bike(bike_id)
);
DESC Customer;
DESC Card;
DESC Bike;
DESC Station_Rod;

#insert data
INSERT INTO Customer VALUE('吳一','A111111111','0911111111','台北市文山區僅新路38號','1991','01','01');
INSERT INTO Customer(cus_name,customer_id,phone,birth_year,birth_mouth,birth_day)
VALUE('黃二','H222222222','0922222222','1992','02','02');
INSERT INTO Customer(cus_name,customer_id,cus_address,birth_year,birth_mouth,birth_day)
VALUE('張三','A333333333','新北市北新路141巷30號7樓','1993','03','03');
INSERT INTO Customer(cus_name,customer_id,phone,cus_address)
VALUE('李四','G444444444','0944444444','花蓮縣花蓮市明德街87號4樓');
INSERT INTO Customer(cus_name,customer_id,birth_year,birth_mouth,birth_day)
VALUE('王五','K555555555','1995','05','05');
SELECT * FROM Customer;

INSERT INTO Card VALUE('IP010000001','A111111111','2011','01','01');
INSERT INTO Card VALUE('IP010000002','G444444444','2012','02','02');
INSERT INTO Card VALUE('ES00000001','A111111111','2001','01','01');
INSERT INTO Card VALUE('ES00000002','H222222222','2002','02','02');
INSERT INTO Card VALUE('ES00000003','A333333333','2003','03','03');
INSERT INTO Card VALUE('ES00000004','A333333333','2004','04','04');
INSERT INTO Card VALUE('IP010000005','K555555555','2005','05','05');
SELECT * FROM Card;

INSERT INTO Bike(bike_id) VALUE('A00001');
INSERT INTO Bike(bike_id) VALUE('A00002');
INSERT INTO Bike VALUE('A00003','IP010000001');
INSERT INTO Bike VALUE('A00004','IP010000005');
INSERT INTO Bike(bike_id) VALUE('A00005');
INSERT INTO Bike VALUE('B00001','ES00000004');
INSERT INTO Bike(bike_id) VALUE('B00002');
INSERT INTO Bike(bike_id) VALUE('B00003');
INSERT INTO Bike VALUE('C00001','ES00000002');
INSERT INTO Bike(bike_id) VALUE('C00002');
SELECT * FROM Bike;

INSERT INTO Station_Rod(station_name,rod_number,sta_address)
VALUE('淡水捷運站',1,'新北市淡水區中正路1號');
INSERT INTO Station_Rod VALUE('淡水捷運站',2,'新北市淡水區中正路1號','A00001');
INSERT INTO Station_Rod(station_name,rod_number,sta_address)
VALUE('淡水捷運站',3,'新北市淡水區中正路1號');
INSERT INTO Station_Rod VALUE('淡水捷運站',4,'新北市淡水區中正路1號','A00002');
INSERT INTO Station_Rod VALUE('淡水捷運站',5,'新北市淡水區中正路1號','B00002');
INSERT INTO Station_Rod VALUE('輕軌淡江大學站',1,'淡水區水源街二段108號','C00002');
INSERT INTO Station_Rod(station_name,rod_number,sta_address)
VALUE('輕軌淡江大學站',2,'淡水區水源街二段108號');
INSERT INTO Station_Rod VALUE('輕軌淡江大學站',3,'淡水區水源街二段108號','A00005');
INSERT INTO Station_Rod(station_name,rod_number,sta_address)
VALUE('輕軌淡江大學站',4,'淡水區水源街二段108號');
INSERT INTO Station_Rod VALUE('輕軌淡江大學站',5,'淡水區水源街二段108號','B00003');
SELECT * FROM Station_Rod;

#data select
/*新增、更改、刪除客戶資料*/
INSERT INTO Customer VALUE('陳六','F666666666','0966666666','桃園市龜山區長庚一街22號','1996','06','06');
UPDATE Customer SET cus_address='台中市南區工學北路50號' WHERE customer_id='F666666666';
SELECT * FROM Customer;
DELETE FROM Customer WHERE customer_id='F666666666';
SELECT * FROM Customer;

/*新增、刪除卡片資料*/
INSERT INTO Card VALUE('ES00000010','H222222222','2016','06','06');
SELECT * FROM Card;
DELETE FROM Card WHERE card_id='ES00000010';
SELECT * FROM Card;

/*新增、刪除腳踏車資料*/
INSERT INTO Bike(bike_id) VALUE('D00005');
SELECT * FROM Bike;
DELETE FROM Bike WHERE bike_id='D00005';
SELECT * FROM Bike;

/*由 客戶身分證 查詢 卡號及註冊日期*/
SELECT card_id,register_year,register_month,register_day
FROM Card
WHERE cus_id='A111111111';

/*由 站名 查詢 停車桿停靠情況*/
SELECT rod_number,bike_number
FROM Station_Rod
WHERE station_name='淡水捷運站';

/*由 腳踏車 查詢 站名及地址*/
SELECT station_name,sta_address
FROM Station_Rod
WHERE bike_number='A00002';

/*借車*/
UPDATE Bike SET card_number='IP010000002' WHERE bike_id='A00001';
SELECT * FROM Bike;

/*還車*/
UPDATE Bike SET card_number=NULL WHERE bike_id='A00001';
SELECT * FROM Bike;
/*車有點小bug，就是借車之後，我不知道要怎麼把停車站的借走的車編號刪掉，你們可以討論看看
上面是只有在車編號中更改卡號而已，看不懂我在說甚麼的話再問我*/

