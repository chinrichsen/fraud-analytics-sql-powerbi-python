
CREATE TABLE transactions_master (
	ID 	TEXT,
    trans_date_trans_time TIMESTAMP,
    cc_num           TEXT,
    merchant         TEXT,
    category         TEXT,
    amt              NUMERIC(12,2),
    first            TEXT,
    last             TEXT,
    gender           TEXT,
    street           TEXT,
    city             TEXT,
    state            TEXT,
    zip              INT,
    lat              NUMERIC(9,6),
    long             NUMERIC(9,6),
    city_pop         INT,
    job              TEXT,
    dob              DATE,
    trans_num        TEXT,
    unix_time        BIGINT,
    merch_lat        NUMERIC(9,6),
    merch_long       NUMERIC(9,6),
    is_fraud         INT,
    data_type	     TEXT
);

select * from transactions_master