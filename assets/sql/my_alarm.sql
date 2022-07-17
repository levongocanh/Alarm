create table photo (
	photoId integer primary key AUTOINCREMENT,
	photoPath text not null
);

create table barcodeQRcode (
	barcodeQRcodeId integer primary key AUTOINCREMENT,
	code text not null
 );
 
create table ringtone (
	ringtoneId integer primary key AUTOINCREMENT,
	ringtonePath text not null
);

create table alarm (
	alarmId integer primary key AUTOINCREMENT,
	isActive integer not null,
	alarmType text not null,
	alarmHour integer not null, 
	alarmMinute integer not null, 
	alarmRingtoneId integer,
	alarmVolume integer,
	alarmLabel text,
	alarmVibrate integer,

	sunday integer,
	monday integer,
	tuesday integer,
	wednesday integer,
	thursday integer,
	friday integer,
	saturday integer,

	alarmMissionType text not null,
	missionDifficulty integer,
	numberOfProblems integer,
	barcodeQRcodeId integer,
	photoId integer,

	FOREIGN KEY(alarmRingtoneId) references ringtone(ringtoneId),
	FOREIGN KEY(photoId) references photo(photoId),
	FOREIGN KEY(barcodeQRcodeId) references barcodeQRcode(barcodeQRcodeId)
);
 
create table alarmHistory(
	alarmHistoryId integer primary key AUTOINCREMENT,
	alarmHistoryDate text not null,
	alarmHistoryTime text not null,
	alarmHistoryMissionType text not null
);
 
create table setting(
	settingId integer primary key AUTOINCREMENT, 
	appTheme text,
	muteDuringMission integer default 0,
	appLanguage text,
	speakerAlways integer default 0,
	ascendingAlarmVolume integer default 0
);

insert into setting(appTheme, muteDuringMission, appLanguage, speakerAlways, ascendingAlarmVolume) values
('light', 0, 'vi', 0, 0);

insert into ringtone(ringtonePath) values
('ringtones/fancy_like.mp3'), 
('ringtones/money_jiggle_jiggle.mp3'), 
('ringtones/my_baby.mp3'), 
('ringtones/ringing_old_phone.mp3'), 
('ringtones/suga_boom_boom.mp3'), 
('ringtones/welcome_to_my_house.mp3');

insert into photo(photoPath) values
('assets\\photos\\photo1.jpg'),
('assets\\photos\\photo2.jpg'),
('assets\\photos\\photo3.jpg');

insert into barcodeQRcode(code) values
('code1'),
('code2'),
('code3'),
('code4');

insert into alarm(isActive, alarmType, alarmHour, alarmMinute, alarmRingtoneId, alarmVolume, alarmLabel, alarmVibrate, sunday, monday, tuesday, wednesday, thursday, friday, saturday, alarmMissionType, missionDifficulty, numberOfProblems, barcodeQRcodeId, photoId) values
(1, 'normal', 10, 15, 1, 5, '', 0, 0, 0, 0, 0, 0, 0, 0, 'math', 3, 5, null, null),
(1, 'normal', 6, 45, 1, 5, '', 0, 0, 1, 0, 0, 0, 0, 0, 'photo', null, null, null, 1),
(1, 'normal', 6, 21, 1, 5, '', 0, 0, 0, 1, 0, 0, 0, 0, 'scanning', null, null, 1, null),
(0, 'normal', 15, 8, 1, 5, '', 0, 0, 0, 0, 0, 0, 1, 0, 'typing', null, 5, null, null),
(0, 'normal', 15, 8, 1, 5, '', 0, 0, 0, 0, 0, 0, 1, 0, 'default', null, null, null, null),
(0, 'normal', 15, 8, 1, 5, '', 0, 0, 0, 0, 0, 0, 1, 0, 'step', null, 10, null, null),
(1, 'quick', 6, 21, 1, 10, '', 0, 0, 0, 0, 0, 0, 0, 0, 'default', null, null, null, null);

insert into alarmHistory(alarmHistoryDate, alarmHistoryTime, alarmHistoryMissionType) values 
('2022:07:06', '15:06', 'math'),
('2022:07:06', '21:10', 'quick'),
('2022:07:07', '7:06', 'typing'),
('2022:07:08', '15:06', 'step'),
('2022:07:08', '19:06', 'photo'),
('2022:07:08', '19:30', 'scanning');