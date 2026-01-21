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

CREATE TABLE field_conference (
	major TEXT,
	field TEXT,
    conference TEXT PRIMARY KEY
);