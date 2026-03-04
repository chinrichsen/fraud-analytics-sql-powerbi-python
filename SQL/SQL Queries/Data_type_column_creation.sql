ALTER TABLE transactions_test
ADD data_type TEXT;

UPDATE transactions_test
SET data_type = 'test';

select * from transactions_test
limit 5


ALTER TABLE transactions_train
ADD data_type TEXT;

UPDATE transactions_train
SET data_type = 'train';

select * from transactions_train
limit 5