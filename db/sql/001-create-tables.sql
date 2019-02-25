-- アクティビティログ
-- BackupToTempTable
-- drop table cm_aclg cascade;

-- RestoreFromTempTable
create table cm_aclg (
  al_idactv INT not null AUTO_INCREMENT comment 'ID'
  , al_nmactv VARCHAR(40) not null comment 'アクティビティ区分名'
  , al_noactv INT not null comment 'アクティビティ番号'
  , al_dtactv DATE not null comment 'アクティビティ日付'
  , al_cdsqsk VARCHAR(8) comment '請求先読者番号'
  , al_nmsqsk VARCHAR(200) not null comment '請求先顧客名'
  , al_nmsqbu VARCHAR(200) comment '請求先部署名'
  , al_nmsqtn VARCHAR(200) comment '請求先担当名'
  , al_txactv VARCHAR(200) not null comment 'アクティビティ内容'
  , al_susury INT comment '数量'
  , al_kgtnka INT comment '単価'
  , al_kggoke INT comment '合計金額'
  , al_txbiko VARCHAR(500) comment '備考'
  , al_cdcstm VARCHAR(8) comment '読者番号'
  , al_nmcstm VARCHAR(200) comment '顧客名'
  , al_nmtnbu VARCHAR(200) comment '部署名'
  , al_nmtnto VARCHAR(200) comment '担当者名'
  , constraint cm_aclg_pkc primary key (al_idactv)
) comment 'アクティビティログ' ;

create index cm_aclg_I01
  on cm_aclg(al_nmactv,al_cdsqsk);
 
create index cm_aclg_I02
  on cm_aclg(al_dtactv,al_nmactv,al_cdsqsk);
