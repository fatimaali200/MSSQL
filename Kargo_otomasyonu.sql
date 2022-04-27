CREATE DATABASE Kargo_otomasyonu ;
USE Kargo_otomasyonu;


--
-- alici
--

CREATE TABLE alici (
  TcNo varchar(11) NOT NULL,
  Ad varchar(45) NOT NULL,
  Soyad varchar(45) NOT NULL,
  TelNo varchar(45) NOT NULL,
  Adres varchar(45) NOT NULL,
  Sehir varchar(45) NOT NULL,
  PRIMARY KEY (TcNo)
);

--
--Alici tablosu i�in veri d�k�m�n� alma
--

INSERT INTO alici (TcNo,Ad,Soyad,TelNo,Adres,Sehir) VALUES 

 ('15635874526','Mustafa','Demir','5342533692','Sisli','�stanbul'),
 ('36589214523','Bahadir','Eken','5045698521','Avcilar','�stanbul'),
 ('12595214756','Kerem','Solmaz','5053652146','bornova','izmir'),
 ('35365236303','Melike','Dert','5431023658','karsiyaka','izmir'),
 ('32698520258','Deniz','Kesim','5036387410','g�m�sler','denizli'),
 ('10252368525','Ali','Bilir','5436398741','pirimehmet','isparta'),
 ('10000000000','Gizem','Temiz','5447563258','cankaya','Ankara'),
 ('23698520258','Deniz','Ak','5036387411','Babada�','denizli'),
 ('07252368525','Ali','Kare','5436398742','G�nen','isparta'),
 ('16000000000','Gizem','Beyaz','5447563253','Elmada�','Ankara');


--
--g�nderici
--

CREATE TABLE gonderici (
  TcNo varchar(11) NOT NULL,
  Ad varchar(45) NOT NULL,
  Soyad varchar(45) NOT NULL,
  TelNo varchar(45) NOT NULL,
  Adres varchar(45) NOT NULL,
  Sehir varchar(45) NOT NULL,
  PRIMARY KEY (TcNo)
);

--
--G�nderici tablosu i�in veri d�k�m�n� alma
--

INSERT INTO gonderici (TcNo,Ad,Soyad,TelNo,Adres,Sehir) VALUES 

 ('34121643241','Ahmet','Can','3467864322','Cankaya','Ankara'),
 ('34131225652','Ayse','Canli','5054212399','Sisli','�stanbul'),
 ('34141247876','Arda','Tetik','4682342134','Kecioren','Ankara'),
 ('35624897568','Cevahir','Kara','5065321134','Atat�rk caddesi','�stanbul'),
 ('40412123654','Fatih','Semerci','5346421234','Sisli','�stanbul'),
 ('41412123654','�nanc','Temel','5351424234','Lara','Antalya'),
 ('44563215698','Mahsun','Ekin','4673244421','fatih','Isparta'),
 ('47712123654','Semanur','Elmas','5346421243','Beykoz','�stanbul'),
 ('48812123654','�ahin','Kemal','5351429834','Aksu','Antalya'),
 ('49963215698','Faruk','Atlas','4673244021','Senirkent.','Isparta');
 
 
 --
 -- personal giri�i
 --

 CREATE TABLE giris (
   Id varchar(16) NOT NULL PRIMARY KEY,
   Sifre varchar(16) NOT NULL,);

--
--Giri� tablosu i�in veri d�k�m�n� alma
--

INSERT INTO giris (Id,Sifre) VALUES 
 ('kargo','kargo');


 --
 --kargo i�lemi
 --
 
CREATE TABLE kargoislemi (
  KargoNo varchar(10) NOT NULL ,
  gonderici_TcNo varchar(11) NOT NULL ,
  gonderici_adi varchar(255) NOT NULL,
  GondericiAdres varchar(45) NOT NULL,
  alici_TcNo varchar(11) NOT NULL ,
  alici_adi varchar(255) not null,
  AliciAdres varchar(45) NOT NULL,
  islem_Tarihi DATE NOT NULL,
  Sayi int NOT NULL,
  Urunun_Tipi varchar(255) NOT NULL, /*Evrak , paket, koli */
  Tutar int NOT NULL, /*Evrak i�in standart 20 tl, paket i�in 30 tl, koli i�in 50 tl�dir*/
  PRIMARY KEY (KargoNo),
  
  CONSTRAINT FK_kargoislemi FOREIGN KEY (gonderici_TcNo) REFERENCES gonderici (TcNo) ,
  CONSTRAINT FK_kargoislemi_1 FOREIGN KEY (alici_TcNo) REFERENCES alici (TcNo) ,

);

--
-- kargo i�lemi tablosu i�in veri d�k�m�n� alma
--

INSERT INTO kargoislemi(KargoNo,gonderici_TcNo,gonderici_adi,GondericiAdres,alici_TcNo,alici_adi,AliciAdres,islem_Tarihi,Sayi,Urunun_Tipi,Tutar) VALUES

 ('1','34121643241','Ahmet_Can','Cankaya_Ankara','15635874526','Mustafa_Demir','Sisli_�stanbul','2021-05-25',1,'Evrak',20),
 ('2','34131225652','Ayse_Canli','Sisli_�stanbul','36589214523','Bahadir_Eken','Avcilar_�stanbul','2021-05-29',1,'koli',50),
 ('3','34141247876','Arda_Tetik','Kecioren_Ankara','12595214756','Kerem_Solmaz','bornova_izmir','2021-05-29',1,'paket',30),
 ('4','35624897568','Cevahir_Kara','Atat�rk caddesi_�stanbul', '35365236303','Melike_Dert','karsiyaka_izmir','2021-06-29',3,'paket',90),
 ('5','40412123654','Fatih_Semerci','Sisli_�stanbul','32698520258','Deniz_Kesim','g�m�sler_denizli','2021-07-29',7,'koli',350),
 ('6','41412123654','�nanc_Temel','Lara_Antalya','10252368525','Ali_Bilir','pirimehmet_isparta','2020-07-29',7,'koli',350),
 ('7','44563215698','Mahsun_Ekin','fatih_Isparta','10000000000','Gizem_Temiz','cankaya_Ankara','2020-05-25',10,'Evrak',200),
 ('8','47712123654','Semanur_Elmas','Beykoz_�stanbul','23698520258','Deniz_Ak','Babada�_denizli','2020-08-29',60,'koli',3000),
 ('9','48812123654','�ahin_Kemal','Aksu_Antalya','07252368525','Ali_Kare','G�nen_isparta','2020-07-25',100,'Evrak',2000),
 ('10','49963215698','Faruk_Atlas','Senirkent_Isparta','16000000000','Gizem_Beyaz','Elmada�_Ankara','2020-06-29',9,'paket',270);

--
--kargo durumu
--

CREATE TABLE kargodurumu(
  KargoNo varchar(10) NOT NULL,
  Durum varchar(45) NOT NULL,
  kargo_subesi_telno varchar(11) NOT NULL,

  CONSTRAINT FK_kargodurumu FOREIGN KEY (KargoNo) REFERENCES kargoislemi (KargoNo) ,
);

--
-- kargo durumu tablosu i�in veri d�k�m�n� alma
--
 INSERT INTO kargodurumu(KargoNo,Durum,kargo_subesi_telno) VALUES
 ('1','yolda','05234678981'),
 ('2','teslim-edildi','05234678981'),
 ('3','teslim-edildi','05234678981'),
 ('4','yolda','05234678981'),
 ('9','teslim-edildi','05234678981');

 
 --
 --Procedure
 --

 ---- G�nderi sorgulama men�s�nde-------

 create proc sorgulama_menusu
 as 
 select kargoislemi.alici_adi as alici_ad_soyad,kargoislemi.AliciAdres,alici.TelNo as alici_telno,
 kargoislemi.gonderici_adi as gonderici_ad_soyad,kargoislemi.GondericiAdres,gonderici.TelNo as gonderici_telno,
 kargodurumu.Durum as kargo_durumu
 from kargoislemi
 inner join kargodurumu on kargodurumu.KargoNo=kargoislemi.KargoNo
 inner join alici on alici.TcNo =kargoislemi.alici_TcNo
 inner join gonderici on gonderici.TcNo=kargoislemi.gonderici_TcNo
 order by islem_Tarihi asc
 sp_helptext 'sorgulama_menusu'
 EXEC sorgulama_menusu


 --
 --trigger1 e�er kargo durumu  tablosunda yeni veri eklersi hemen sorgylma menusu Procedure �al��t�rcak---
 --

 CREATE TRIGGER trigger1
 ON kargodurumu
 AFTER INSERT 
 AS
 EXEC sorgulama_menusu

 INSERT INTO kargodurumu(KargoNo,Durum,kargo_subesi_telno) VALUES
 ('10','teslim-edildi','05234678981')


 ---- 2020 y�l�nda ka� adet paket i�lemi yap�ld� -----

 create proc paket_2020_yilikislemi
 as 
 select  sum(Sayi) as adet  from kargoislemi
 where islem_Tarihi like '%2020%' and Urunun_Tipi like 'paket'
 sp_helptext 'paket_2020_yilikislemi'
 EXEC paket_2020_yilikislemi

 ---- 2021 y�l�nda ka� adet koli i�lemi yap�ld� -----
 
 create proc koli_2020_yilikislemi
 as 
 select  sum(Sayi) as adet  from kargoislemi
 where islem_Tarihi like '%2020%' and  Urunun_Tipi like 'Koli'
 sp_helptext 'koli_2020_yilikislemi'
 EXEC koli_2020_yilikislemi

 ---- 2021 y�l�nda ka� adet evrak i�lemi yap�ld� -----
 
 create proc evrak_2020_yilikislemi
 as 
 select  sum(Sayi) as adet  from kargoislemi
 where islem_Tarihi like '%2020%' and  Urunun_Tipi like 'Evrak'
 sp_helptext 'evrak_2020_yilikislemi'
 EXEC evrak_2020_yilikislemi

  ---- 2020 y�l�nda b�t�n i�lemlerden toplam tutau miktar� -----
 
 create proc yilikislemi_2020_toplam_tutar
 as 
 select  sum(tutar) as kazanc_miktari  from kargoislemi
 where islem_Tarihi like '%2020%' and Urunun_Tipi like 'paket' or Urunun_Tipi like 'koli' or Urunun_Tipi like 'Evrak' 
 sp_helptext 'yilikislemi_2020_toplam_tutar'
 EXEC yilikislemi_2020_toplam_tutar


 create proc paket_2021_yilikislemi
 as 
 select  sum(Sayi) as adet  from kargoislemi
 where islem_Tarihi like '%2021%' and Urunun_Tipi like 'paket'
 sp_helptext 'paket_2021_yilikislemi'
 EXEC paket_2021_yilikislemi

 ---- 2021 y�l�nda ka� adet koli i�lemi yap�ld� -----
 
 create proc koli_2021_yilikislemi
 as 
 select  sum(Sayi) as adet  from kargoislemi
 where islem_Tarihi like '%2021%' and  Urunun_Tipi like 'Koli'
 sp_helptext 'koli_2021_yilikislemi'
 EXEC koli_2021_yilikislemi

 ---- 2021 y�l�nda ka� adet evrak i�lemi yap�ld� -----
 
 create proc evrak_2021_yilikislemi
 as 
 select  sum(Sayi) as adet  from kargoislemi
 where islem_Tarihi like '%2021%' and  Urunun_Tipi like 'Evrak'
 sp_helptext 'evrak_2021_yilikislemi'
 EXEC evrak_2021_yilikislemi


 ---- 2021 y�l�nda b�t�n i�lemlerden toplam tutau miktar� -----
 
 create proc yilikislemi_2021_toplam_tutar
 as 
 select  sum(tutar) as kazanc_miktari  from kargoislemi
 where islem_Tarihi like '%2021%' and Urunun_Tipi like 'paket' or Urunun_Tipi like 'koli' or Urunun_Tipi like 'Evrak' 
 sp_helptext 'yilikislemi_2021_toplam_tutar'
 EXEC yilikislemi_2021_toplam_tutar





 