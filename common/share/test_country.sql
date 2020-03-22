drop table if exists test_country;
create table test_country (
  country_code char(3) not null comment 'numeric',
  country_name varchar(100) not null comment 'ISO 3166-1 country name',
  alpha3 char(3) not null comment 'alpha-3',
  alpha2 char(2) not null comment 'alpha-2',
  division varchar(100) not null comment 'country division',
  primary key(country_code),
  unique key uq1(alpha3),
  unique key uq2(alpha2)
) engine=innodb charset=utf8mb4 row_format=dynamic comment='ISO 3166-1 country';

load data local
  infile "/app/share/test_country.tsv"
  into table test_country
  character set 'utf8'
  fields terminated by '\t'
  enclosed by ''
  lines terminated by '\n'
  ignore 1 lines
  (
    @country_name_jp,
    @country_name_en,
    @country_code,
    @alpha3,
    @alpha2,
    @place,
    @division
  )
  set
    country_code = @country_code,
    country_name = @country_name_en,
    alpha3 = @alpha3,
    alpha2 = @alpha2,
    division = @division
;
