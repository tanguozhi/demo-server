drop table tbl_main_menu;
create table tbl_main_menu(
	uuid char(32) not null primary key,
	puuid char(32) not null,
	title char(10) not null,
	author_uuid char(32) not null,
	icon_src char(50)		
);
