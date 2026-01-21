-- 2a Queries
SELECT COUNT (*) FROM conference_ranking;
SELECT * FROM conference_ranking LIMIT 5;

-- 2b Queries
SELECT COUNT (*) FROM csrankings;
SELECT * FROM csrankings LIMIT 5;

SELECT COUNT (*) FROM author_info;
SELECT * FROM author_info LIMIT 5;

-- 2c Queries
SELECT COUNT(*) FROM acm_fellows WHERE name ~ '[0-9]$';
SELECT COUNT(*) FROM author_info WHERE name ~ '[0-9]$';
SELECT COUNT(*) FROM csrankings WHERE name ~ '[0-9]$';
SELECT COUNT(*) FROM dblp_aliases WHERE name ~ '[0-9]$';
SELECT COUNT(*) FROM turing WHERE name ~ '[0-9]$';

ALTER TABLE acm_fellows
ADD COLUMN clean_author_name TEXT;

UPDATE acm_fellows
SET clean_author_name = REGEXP_REPLACE(name, '[0-9]', '', 'g');

ALTER TABLE author_info
ADD COLUMN clean_author_name TEXT;

UPDATE author_info
SET clean_author_name = REGEXP_REPLACE(name, '[0-9]', '', 'g');

ALTER TABLE csrankings
ADD COLUMN clean_author_name TEXT;

UPDATE csrankings
SET clean_author_name = REGEXP_REPLACE(name, '[0-9]', '', 'g');

ALTER TABLE dblp_aliases
ADD COLUMN clean_author_name TEXT;

UPDATE dblp_aliases
SET clean_author_name = REGEXP_REPLACE(name, '[0-9]', '', 'g');

ALTER TABLE turing
ADD COLUMN clean_author_name TEXT;

UPDATE turing
SET clean_author_name = REGEXP_REPLACE(name, '[0-9]', '', 'g');

SELECT COUNT(*) FROM acm_fellows WHERE clean_author_name ~ '[0-9]$';
SELECT COUNT(*) FROM author_info WHERE clean_author_name ~ '[0-9]$';
SELECT COUNT(*) FROM csrankings WHERE clean_author_name ~ '[0-9]$';
SELECT COUNT(*) FROM dblp_aliases WHERE clean_author_name ~ '[0-9]$';
SELECT COUNT(*) FROM turing WHERE clean_author_name ~ '[0-9]$';