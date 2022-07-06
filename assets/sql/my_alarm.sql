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

	-- alarm mission properties
	alarmMissionType text not null,
	missionDiffcutly integer,
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
	settingId integer primary key AUTOINCREMENT, -- switch between setting configuration - wip
	appTheme text,
	muteDuringMission integer default 0,
	appLanguage text,
	speakerAlways integer default 0,
	ascendingAlarmVolume integer default 0
);

-- Dummy data
insert into setting(appTheme, muteDuringMission, appLanguage, speakerAlways, ascendingAlarmVolume) values
('light', 0, 'vi', 0, 0);

insert into ringtone(ringtonePath) values
('assets\\ringtones\\fancy_like.mp3'), 
('assets\\ringtones\\money_jiggle_jiggle.mp3'), 
('assets\\ringtones\\my_baby.mp3'), 
('assets\\ringtones\\ringing_old_phone.mp3'), 
('assets\\ringtones\\suga_boom_boom.mp3'), 
('assets\\ringtones\\welcome_to_my_house.mp3');

insert into photo(photoPath) values
('assets\\photos\\photo1.jpg'),
('assets\\photos\\photo2.jpg'),
('assets\\photos\\photo3.jpg');

insert into barcodeQRcode(code) values
('code1'),
('code2'),
('code3'),
('code4');

insert into alarm(alarmType, alarmHour, alarmMinute, alarmRingtoneId, alarmVolume, alarmLabel, alarmVibrate, sunday, monday, tuesday, wednesday, thursday, friday, saturday, alarmMissionType, missionDiffcutly, numberOfProblems, barcodeQRcodeId, photoId) values
('normal', 10, 15, 1, 5, '', 0, 0, 0, 0, 0, 0, 0, 0, 'math', 3, 5, null, null),
('normal', 6, 45, 1, 5, '', 0, 0, 1, 0, 0, 0, 0, 0, 'photo', null, null, null, 1),
('normal', 6, 21, 1, 5, '', 0, 0, 0, 1, 0, 0, 0, 0, 'scanning', null, null, 1, null),
('normal', 15, 8, 1, 5, '', 0, 0, 0, 0, 0, 0, 1, 0, 'typing', null, 5, null, null),
('normal', 15, 8, 1, 5, '', 0, 0, 0, 0, 0, 0, 1, 0, 'default', null, null, null, null),
('fast', 6, 21, 1, 10, '', 0, 0, 0, 0, 0, 0, 0, 0, 'default', null, null, null, null);
