CREATE TABLE conference_ranking (
	acronym TEXT,
	name TEXT,
	rank TEXT,
	society TEXT GENERATED ALWAYS AS (
		CASE 
			WHEN name ILIKE '%IEEE%' AND name ILIKE '%ACM%' THEN 'ACM+IEEE'
			WHEN name ILIKE '%IEEE%' THEN 'IEEE'
			WHEN name ILIKE '%ACM%' THEN 'ACM'
			ELSE 'other'
		END
	) STORED
);

CREATE TABLE csrankings (
	name TEXT PRIMARY KEY,
	affiliation TEXT,
	homepage TEXT,
	scholarid TEXT,
	first_name TEXT GENERATED ALWAYS AS (SPLIT_PART(name, ' ', 1)) STORED,
	middle_name TEXT GENERATED ALWAYS AS (
		CASE
			WHEN SPLIT_PART(name, ' ', 3) = '' THEN NULL
			ELSE SPLIT_PART(name, ' ', 2)
		END
	) STORED,
	last_name TEXT GENERATED ALWAYS AS (
		CASE
			WHEN SPLIT_PART(name, ' ', 3) = '' THEN SPLIT_PART(name, ' ', 2)
			ELSE SPLIT_PART(name, ' ', 3)
		END
	) STORED
);

CREATE TABLE author_info (
	name TEXT,
	dept TEXT,
	area TEXT,
	count DOUBLE PRECISION,
	adjustedcount DOUBLE PRECISION,
	year INT,
	first_name TEXT GENERATED ALWAYS AS (SPLIT_PART(name, ' ', 1)) STORED,
	middle_name TEXT GENERATED ALWAYS AS (
		CASE
			WHEN SPLIT_PART(name, ' ', 3) = '' THEN NULL
			ELSE SPLIT_PART(name, ' ', 2)
		END
	) STORED,
	last_name TEXT GENERATED ALWAYS AS (
		CASE
			WHEN SPLIT_PART(name, ' ', 3) = '' THEN SPLIT_PART(name, ' ', 2)
			ELSE SPLIT_PART(name, ' ', 3)
		END
	) STORED
);

/*
copy public."generated-author-info"(name, dept, area, paper_count, adjustedcount, year)
FROM 'C:\Users\travi\OneDrive\Desktop\Stats170A\170A Homework 1 Data\generated-author-info.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ',',
    QUOTE '"'
);

ALTER TABLE "generated-author-info"
ADD COLUMN first_name TEXT,
ADD COLUMN middle_name TEXT,
ADD COLUMN last_name TEXT;

UPDATE "generated-author-info"
SET
    first_name = split_part(name, ' ', 1),
    last_name  = split_part(name, ' ', array_length(string_to_array(name, ' '), 1)),
    middle_name =
        CASE
            WHEN array_length(string_to_array(name, ' '), 1) > 2
            THEN split_part(name, ' ', 2)
            ELSE NULL
        END;
*/

CREATE TABLE acm_fellows (
	name TEXT,
	year INT
);

CREATE TABLE turing (
	name TEXT PRIMARY KEY,
	year INT
);

CREATE TABLE geolocation (
	institution TEXT PRIMARY KEY,
	latitude DOUBLE PRECISION,
	longitude DOUBLE PRECISION
);

CREATE TABLE country_info (
	institution TEXT PRIMARY KEY,
	region TEXT,
	countryabbrv TEXT
);

CREATE TABLE dblp_aliases (
	alias TEXT,
	name TEXT
);

CREATE TABLE data (
    display_name TEXT PRIMARY KEY,
    school_type TEXT,
    alias_names TEXT,
    state TEXT,
    city TEXT,
    zip TEXT,
    region TEXT,
    is_public BOOLEAN,
    institutional_control TEXT,
    photo_thumb TEXT,
    display_rank TEXT,
    sort_rank INT,
    is_tied BOOLEAN,
    act_avg DOUBLE PRECISION,
    percent_aid DOUBLE PRECISION,
    acceptance_rate DOUBLE PRECISION,
    tuition DOUBLE PRECISION,
    hs_gpa_avg DOUBLE PRECISION,
    engineering_rep_score TEXT,
    parent_rank TEXT,
    enrollment INT,
    business_rep_score TEXT,
    sat_avg DOUBLE PRECISION,
    cost_after_aid DOUBLE PRECISION,
    sat_range TEXT,
    act_range TEXT
);

/*
CREATE TABLE data_raw (
    institution_displayname TEXT,
    institution_schooltype TEXT,
    institution_aliasnames TEXT,
    institution_state TEXT,
    institution_city TEXT,
    institution_zip TEXT,
    institution_region TEXT,
    institution_ispublic TEXT,
    institution_institutionalcontrol TEXT,
    institution_primaryphotocardthumb TEXT,
    ranking_displayrank TEXT,
    ranking_sortrank TEXT,
    ranking_istied TEXT,
    searchdata_actavg_rawvalue TEXT,
    searchdata_percentreceivingaid_rawvalue TEXT,
    searchdata_acceptancerate_rawvalue TEXT,
    searchdata_tuition_rawvalue TEXT,
    searchdata_hsgpaavg_rawvalue TEXT,
    searchdata_engineeringrepscore_rawvalue TEXT,
    searchdata_parentrank_rawvalue TEXT,
    searchdata_enrollment_rawvalue TEXT,
    searchdata_businessrepscore_rawvalue TEXT,
    searchdata_satavg_rawvalue TEXT,
    searchdata_costafteraid_rawvalue TEXT,
    searchdata_testavgs_displayvalue_0_value TEXT,
    searchdata_testavgs_displayvalue_1_value TEXT
);

COPY data_raw
FROM 'C:\Users\travi\OneDrive\Desktop\Stats170A\170A Homework 1 Data\data.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ',',
    QUOTE '"'
);
*/

CREATE TABLE field_conference (
	major TEXT,
	field TEXT,
    conference TEXT PRIMARY KEY
);
