--
-- PostgreSQL database dump
--

\restrict IUTm5aQuW3ryDGrCvi8gCe2V1rsUsJwtJsNbZebjYBm0PFG7hsHbHRgEIcIOzVc

-- Dumped from database version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: ck_entry_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.ck_entry_type AS ENUM (
    'article',
    'book',
    'booklet',
    'conference',
    'inbook',
    'incollection',
    'inproceedings',
    'manual',
    'mastersthesis',
    'misc',
    'phdthesis',
    'proceedings',
    'techreport',
    'unpublished'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: afbolanguage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.afbolanguage (
    pk integer NOT NULL,
    family character varying
);


--
-- Name: afbovalue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.afbovalue (
    pk integer NOT NULL,
    pair_pk integer,
    "numeric" integer
);


--
-- Name: affixfunction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.affixfunction (
    pk integer NOT NULL,
    representation integer,
    count_borrowed integer
);


--
-- Name: config; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.config (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    value character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: config_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.config_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: config_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.config_pk_seq OWNED BY public.config.pk;


--
-- Name: contribution; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contribution (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    date date,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: contribution_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contribution_data (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: contribution_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contribution_data_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contribution_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contribution_data_pk_seq OWNED BY public.contribution_data.pk;


--
-- Name: contribution_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contribution_files (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: contribution_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contribution_files_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contribution_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contribution_files_pk_seq OWNED BY public.contribution_files.pk;


--
-- Name: contribution_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contribution_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contribution_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contribution_pk_seq OWNED BY public.contribution.pk;


--
-- Name: contributioncontributor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contributioncontributor (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    contribution_pk integer NOT NULL,
    contributor_pk integer NOT NULL,
    ord integer,
    "primary" boolean,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: contributioncontributor_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contributioncontributor_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributioncontributor_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contributioncontributor_pk_seq OWNED BY public.contributioncontributor.pk;


--
-- Name: contributionreference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contributionreference (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    description character varying,
    contribution_pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    source_pk integer NOT NULL
);


--
-- Name: contributionreference_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contributionreference_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributionreference_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contributionreference_pk_seq OWNED BY public.contributionreference.pk;


--
-- Name: contributor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contributor (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    url character varying,
    email character varying,
    address character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: contributor_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contributor_data (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: contributor_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contributor_data_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributor_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contributor_data_pk_seq OWNED BY public.contributor_data.pk;


--
-- Name: contributor_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contributor_files (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: contributor_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contributor_files_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributor_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contributor_files_pk_seq OWNED BY public.contributor_files.pk;


--
-- Name: contributor_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contributor_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributor_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contributor_pk_seq OWNED BY public.contributor.pk;


--
-- Name: dataset; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dataset (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    published date,
    publisher_name character varying,
    publisher_place character varying,
    publisher_url character varying,
    license character varying,
    domain character varying NOT NULL,
    contact character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: dataset_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dataset_data (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: dataset_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dataset_data_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dataset_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dataset_data_pk_seq OWNED BY public.dataset_data.pk;


--
-- Name: dataset_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dataset_files (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: dataset_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dataset_files_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dataset_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dataset_files_pk_seq OWNED BY public.dataset_files.pk;


--
-- Name: dataset_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dataset_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dataset_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dataset_pk_seq OWNED BY public.dataset.pk;


--
-- Name: domainelement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.domainelement (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    parameter_pk integer NOT NULL,
    number integer,
    abbr character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: domainelement_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.domainelement_data (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: domainelement_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.domainelement_data_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: domainelement_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.domainelement_data_pk_seq OWNED BY public.domainelement_data.pk;


--
-- Name: domainelement_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.domainelement_files (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: domainelement_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.domainelement_files_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: domainelement_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.domainelement_files_pk_seq OWNED BY public.domainelement_files.pk;


--
-- Name: domainelement_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.domainelement_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: domainelement_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.domainelement_pk_seq OWNED BY public.domainelement.pk;


--
-- Name: editor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.editor (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    dataset_pk integer NOT NULL,
    contributor_pk integer NOT NULL,
    ord integer,
    "primary" boolean,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: editor_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.editor_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: editor_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.editor_pk_seq OWNED BY public.editor.pk;


--
-- Name: glossabbreviation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.glossabbreviation (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    language_pk integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: glossabbreviation_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.glossabbreviation_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: glossabbreviation_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.glossabbreviation_pk_seq OWNED BY public.glossabbreviation.pk;


--
-- Name: identifier; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.identifier (
    pk integer NOT NULL,
    jsondata character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    id character varying,
    type character varying,
    lang character varying(3),
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: identifier_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.identifier_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: identifier_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.identifier_pk_seq OWNED BY public.identifier.pk;


--
-- Name: language; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.language (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    latitude double precision,
    longitude double precision,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    CONSTRAINT language_latitude_check CHECK (((('-90'::integer)::double precision <= latitude) AND (latitude <= (90)::double precision))),
    CONSTRAINT language_longitude_check CHECK (((('-180'::integer)::double precision <= longitude) AND (longitude <= (180)::double precision)))
);


--
-- Name: language_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.language_data (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: language_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.language_data_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: language_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.language_data_pk_seq OWNED BY public.language_data.pk;


--
-- Name: language_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.language_files (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: language_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.language_files_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: language_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.language_files_pk_seq OWNED BY public.language_files.pk;


--
-- Name: language_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.language_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: language_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.language_pk_seq OWNED BY public.language.pk;


--
-- Name: languageidentifier; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.languageidentifier (
    pk integer NOT NULL,
    jsondata character varying,
    language_pk integer NOT NULL,
    identifier_pk integer NOT NULL,
    description character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: languageidentifier_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.languageidentifier_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: languageidentifier_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.languageidentifier_pk_seq OWNED BY public.languageidentifier.pk;


--
-- Name: languagesource; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.languagesource (
    pk integer NOT NULL,
    jsondata character varying,
    language_pk integer NOT NULL,
    source_pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: languagesource_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.languagesource_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: languagesource_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.languagesource_pk_seq OWNED BY public.languagesource.pk;


--
-- Name: pair; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pair (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    recipient_pk integer,
    donor_pk integer,
    area character varying,
    reliability character varying,
    int_reliability integer,
    count_borrowed integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: pair_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pair_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pair_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pair_pk_seq OWNED BY public.pair.pk;


--
-- Name: pairsource; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pairsource (
    pk integer NOT NULL,
    jsondata character varying,
    pair_pk integer,
    source_pk integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: pairsource_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pairsource_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pairsource_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pairsource_pk_seq OWNED BY public.pairsource.pk;


--
-- Name: parameter; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameter (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: parameter_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameter_data (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: parameter_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameter_data_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameter_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameter_data_pk_seq OWNED BY public.parameter_data.pk;


--
-- Name: parameter_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameter_files (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: parameter_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameter_files_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameter_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameter_files_pk_seq OWNED BY public.parameter_files.pk;


--
-- Name: parameter_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameter_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameter_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameter_pk_seq OWNED BY public.parameter.pk;


--
-- Name: sentence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sentence (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    analyzed character varying,
    gloss character varying,
    type character varying,
    source character varying,
    comment character varying,
    original_script character varying,
    xhtml character varying,
    markup_text character varying,
    markup_analyzed character varying,
    markup_gloss character varying,
    markup_comment character varying,
    language_pk integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: sentence_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sentence_data (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: sentence_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sentence_data_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sentence_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sentence_data_pk_seq OWNED BY public.sentence_data.pk;


--
-- Name: sentence_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sentence_files (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: sentence_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sentence_files_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sentence_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sentence_files_pk_seq OWNED BY public.sentence_files.pk;


--
-- Name: sentence_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sentence_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sentence_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sentence_pk_seq OWNED BY public.sentence.pk;


--
-- Name: sentencereference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sentencereference (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    description character varying,
    sentence_pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    source_pk integer NOT NULL
);


--
-- Name: sentencereference_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sentencereference_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sentencereference_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sentencereference_pk_seq OWNED BY public.sentencereference.pk;


--
-- Name: source; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.source (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    glottolog_id character varying,
    google_book_search_id character varying,
    bibtex_type public.ck_entry_type,
    author character varying,
    year character varying,
    title character varying,
    type character varying,
    booktitle character varying,
    editor character varying,
    pages character varying,
    edition character varying,
    journal character varying,
    school character varying,
    address character varying,
    url character varying,
    note character varying,
    number character varying,
    series character varying,
    volume character varying,
    publisher character varying,
    organization character varying,
    chapter character varying,
    howpublished character varying,
    year_int integer,
    startpage_int integer,
    pages_int integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: source_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.source_data (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: source_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.source_data_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: source_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.source_data_pk_seq OWNED BY public.source_data.pk;


--
-- Name: source_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.source_files (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: source_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.source_files_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: source_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.source_files_pk_seq OWNED BY public.source_files.pk;


--
-- Name: source_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.source_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: source_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.source_pk_seq OWNED BY public.source.pk;


--
-- Name: unit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unit (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    language_pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: unit_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unit_data (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: unit_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unit_data_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unit_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unit_data_pk_seq OWNED BY public.unit_data.pk;


--
-- Name: unit_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unit_files (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: unit_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unit_files_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unit_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unit_files_pk_seq OWNED BY public.unit_files.pk;


--
-- Name: unit_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unit_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unit_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unit_pk_seq OWNED BY public.unit.pk;


--
-- Name: unitdomainelement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unitdomainelement (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    unitparameter_pk integer NOT NULL,
    ord integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: unitdomainelement_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unitdomainelement_data (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: unitdomainelement_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unitdomainelement_data_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitdomainelement_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unitdomainelement_data_pk_seq OWNED BY public.unitdomainelement_data.pk;


--
-- Name: unitdomainelement_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unitdomainelement_files (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: unitdomainelement_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unitdomainelement_files_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitdomainelement_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unitdomainelement_files_pk_seq OWNED BY public.unitdomainelement_files.pk;


--
-- Name: unitdomainelement_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unitdomainelement_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitdomainelement_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unitdomainelement_pk_seq OWNED BY public.unitdomainelement.pk;


--
-- Name: unitparameter; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unitparameter (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: unitparameter_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unitparameter_data (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: unitparameter_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unitparameter_data_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitparameter_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unitparameter_data_pk_seq OWNED BY public.unitparameter_data.pk;


--
-- Name: unitparameter_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unitparameter_files (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: unitparameter_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unitparameter_files_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitparameter_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unitparameter_files_pk_seq OWNED BY public.unitparameter_files.pk;


--
-- Name: unitparameter_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unitparameter_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitparameter_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unitparameter_pk_seq OWNED BY public.unitparameter.pk;


--
-- Name: unitvalue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unitvalue (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    unit_pk integer NOT NULL,
    unitparameter_pk integer NOT NULL,
    contribution_pk integer,
    unitdomainelement_pk integer,
    frequency double precision,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: unitvalue_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unitvalue_data (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: unitvalue_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unitvalue_data_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitvalue_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unitvalue_data_pk_seq OWNED BY public.unitvalue_data.pk;


--
-- Name: unitvalue_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unitvalue_files (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: unitvalue_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unitvalue_files_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitvalue_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unitvalue_files_pk_seq OWNED BY public.unitvalue_files.pk;


--
-- Name: unitvalue_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unitvalue_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unitvalue_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unitvalue_pk_seq OWNED BY public.unitvalue.pk;


--
-- Name: value; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.value (
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    pk integer NOT NULL,
    valueset_pk integer NOT NULL,
    domainelement_pk integer,
    frequency double precision,
    confidence character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: value_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.value_data (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: value_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.value_data_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: value_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.value_data_pk_seq OWNED BY public.value_data.pk;


--
-- Name: value_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.value_files (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: value_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.value_files_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: value_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.value_files_pk_seq OWNED BY public.value_files.pk;


--
-- Name: value_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.value_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: value_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.value_pk_seq OWNED BY public.value.pk;


--
-- Name: valuesentence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.valuesentence (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    value_pk integer NOT NULL,
    sentence_pk integer NOT NULL,
    description character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: valuesentence_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.valuesentence_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valuesentence_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.valuesentence_pk_seq OWNED BY public.valuesentence.pk;


--
-- Name: valueset; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.valueset (
    pk integer NOT NULL,
    jsondata character varying,
    polymorphic_type character varying(20),
    id character varying,
    description character varying,
    markup_description character varying,
    language_pk integer NOT NULL,
    parameter_pk integer NOT NULL,
    contribution_pk integer,
    source character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean
);


--
-- Name: valueset_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.valueset_data (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    value character varying,
    ord integer,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: valueset_data_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.valueset_data_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valueset_data_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.valueset_data_pk_seq OWNED BY public.valueset_data.pk;


--
-- Name: valueset_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.valueset_files (
    pk integer NOT NULL,
    jsondata character varying,
    id character varying,
    name character varying,
    description character varying,
    markup_description character varying,
    ord integer,
    mime_type character varying,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    object_pk integer
);


--
-- Name: valueset_files_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.valueset_files_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valueset_files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.valueset_files_pk_seq OWNED BY public.valueset_files.pk;


--
-- Name: valueset_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.valueset_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valueset_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.valueset_pk_seq OWNED BY public.valueset.pk;


--
-- Name: valuesetreference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.valuesetreference (
    pk integer NOT NULL,
    jsondata character varying,
    key character varying,
    description character varying,
    valueset_pk integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    active boolean,
    source_pk integer NOT NULL
);


--
-- Name: valuesetreference_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.valuesetreference_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: valuesetreference_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.valuesetreference_pk_seq OWNED BY public.valuesetreference.pk;


--
-- Name: config pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.config ALTER COLUMN pk SET DEFAULT nextval('public.config_pk_seq'::regclass);


--
-- Name: contribution pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribution ALTER COLUMN pk SET DEFAULT nextval('public.contribution_pk_seq'::regclass);


--
-- Name: contribution_data pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribution_data ALTER COLUMN pk SET DEFAULT nextval('public.contribution_data_pk_seq'::regclass);


--
-- Name: contribution_files pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribution_files ALTER COLUMN pk SET DEFAULT nextval('public.contribution_files_pk_seq'::regclass);


--
-- Name: contributioncontributor pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributioncontributor ALTER COLUMN pk SET DEFAULT nextval('public.contributioncontributor_pk_seq'::regclass);


--
-- Name: contributionreference pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributionreference ALTER COLUMN pk SET DEFAULT nextval('public.contributionreference_pk_seq'::regclass);


--
-- Name: contributor pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributor ALTER COLUMN pk SET DEFAULT nextval('public.contributor_pk_seq'::regclass);


--
-- Name: contributor_data pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributor_data ALTER COLUMN pk SET DEFAULT nextval('public.contributor_data_pk_seq'::regclass);


--
-- Name: contributor_files pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributor_files ALTER COLUMN pk SET DEFAULT nextval('public.contributor_files_pk_seq'::regclass);


--
-- Name: dataset pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset ALTER COLUMN pk SET DEFAULT nextval('public.dataset_pk_seq'::regclass);


--
-- Name: dataset_data pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_data ALTER COLUMN pk SET DEFAULT nextval('public.dataset_data_pk_seq'::regclass);


--
-- Name: dataset_files pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_files ALTER COLUMN pk SET DEFAULT nextval('public.dataset_files_pk_seq'::regclass);


--
-- Name: domainelement pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.domainelement ALTER COLUMN pk SET DEFAULT nextval('public.domainelement_pk_seq'::regclass);


--
-- Name: domainelement_data pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.domainelement_data ALTER COLUMN pk SET DEFAULT nextval('public.domainelement_data_pk_seq'::regclass);


--
-- Name: domainelement_files pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.domainelement_files ALTER COLUMN pk SET DEFAULT nextval('public.domainelement_files_pk_seq'::regclass);


--
-- Name: editor pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editor ALTER COLUMN pk SET DEFAULT nextval('public.editor_pk_seq'::regclass);


--
-- Name: glossabbreviation pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.glossabbreviation ALTER COLUMN pk SET DEFAULT nextval('public.glossabbreviation_pk_seq'::regclass);


--
-- Name: identifier pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.identifier ALTER COLUMN pk SET DEFAULT nextval('public.identifier_pk_seq'::regclass);


--
-- Name: language pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language ALTER COLUMN pk SET DEFAULT nextval('public.language_pk_seq'::regclass);


--
-- Name: language_data pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language_data ALTER COLUMN pk SET DEFAULT nextval('public.language_data_pk_seq'::regclass);


--
-- Name: language_files pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language_files ALTER COLUMN pk SET DEFAULT nextval('public.language_files_pk_seq'::regclass);


--
-- Name: languageidentifier pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languageidentifier ALTER COLUMN pk SET DEFAULT nextval('public.languageidentifier_pk_seq'::regclass);


--
-- Name: languagesource pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languagesource ALTER COLUMN pk SET DEFAULT nextval('public.languagesource_pk_seq'::regclass);


--
-- Name: pair pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pair ALTER COLUMN pk SET DEFAULT nextval('public.pair_pk_seq'::regclass);


--
-- Name: pairsource pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pairsource ALTER COLUMN pk SET DEFAULT nextval('public.pairsource_pk_seq'::regclass);


--
-- Name: parameter pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameter ALTER COLUMN pk SET DEFAULT nextval('public.parameter_pk_seq'::regclass);


--
-- Name: parameter_data pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameter_data ALTER COLUMN pk SET DEFAULT nextval('public.parameter_data_pk_seq'::regclass);


--
-- Name: parameter_files pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameter_files ALTER COLUMN pk SET DEFAULT nextval('public.parameter_files_pk_seq'::regclass);


--
-- Name: sentence pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentence ALTER COLUMN pk SET DEFAULT nextval('public.sentence_pk_seq'::regclass);


--
-- Name: sentence_data pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentence_data ALTER COLUMN pk SET DEFAULT nextval('public.sentence_data_pk_seq'::regclass);


--
-- Name: sentence_files pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentence_files ALTER COLUMN pk SET DEFAULT nextval('public.sentence_files_pk_seq'::regclass);


--
-- Name: sentencereference pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentencereference ALTER COLUMN pk SET DEFAULT nextval('public.sentencereference_pk_seq'::regclass);


--
-- Name: source pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.source ALTER COLUMN pk SET DEFAULT nextval('public.source_pk_seq'::regclass);


--
-- Name: source_data pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.source_data ALTER COLUMN pk SET DEFAULT nextval('public.source_data_pk_seq'::regclass);


--
-- Name: source_files pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.source_files ALTER COLUMN pk SET DEFAULT nextval('public.source_files_pk_seq'::regclass);


--
-- Name: unit pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit ALTER COLUMN pk SET DEFAULT nextval('public.unit_pk_seq'::regclass);


--
-- Name: unit_data pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit_data ALTER COLUMN pk SET DEFAULT nextval('public.unit_data_pk_seq'::regclass);


--
-- Name: unit_files pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit_files ALTER COLUMN pk SET DEFAULT nextval('public.unit_files_pk_seq'::regclass);


--
-- Name: unitdomainelement pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitdomainelement ALTER COLUMN pk SET DEFAULT nextval('public.unitdomainelement_pk_seq'::regclass);


--
-- Name: unitdomainelement_data pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitdomainelement_data ALTER COLUMN pk SET DEFAULT nextval('public.unitdomainelement_data_pk_seq'::regclass);


--
-- Name: unitdomainelement_files pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitdomainelement_files ALTER COLUMN pk SET DEFAULT nextval('public.unitdomainelement_files_pk_seq'::regclass);


--
-- Name: unitparameter pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitparameter ALTER COLUMN pk SET DEFAULT nextval('public.unitparameter_pk_seq'::regclass);


--
-- Name: unitparameter_data pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitparameter_data ALTER COLUMN pk SET DEFAULT nextval('public.unitparameter_data_pk_seq'::regclass);


--
-- Name: unitparameter_files pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitparameter_files ALTER COLUMN pk SET DEFAULT nextval('public.unitparameter_files_pk_seq'::regclass);


--
-- Name: unitvalue pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitvalue ALTER COLUMN pk SET DEFAULT nextval('public.unitvalue_pk_seq'::regclass);


--
-- Name: unitvalue_data pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitvalue_data ALTER COLUMN pk SET DEFAULT nextval('public.unitvalue_data_pk_seq'::regclass);


--
-- Name: unitvalue_files pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitvalue_files ALTER COLUMN pk SET DEFAULT nextval('public.unitvalue_files_pk_seq'::regclass);


--
-- Name: value pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.value ALTER COLUMN pk SET DEFAULT nextval('public.value_pk_seq'::regclass);


--
-- Name: value_data pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.value_data ALTER COLUMN pk SET DEFAULT nextval('public.value_data_pk_seq'::regclass);


--
-- Name: value_files pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.value_files ALTER COLUMN pk SET DEFAULT nextval('public.value_files_pk_seq'::regclass);


--
-- Name: valuesentence pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valuesentence ALTER COLUMN pk SET DEFAULT nextval('public.valuesentence_pk_seq'::regclass);


--
-- Name: valueset pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valueset ALTER COLUMN pk SET DEFAULT nextval('public.valueset_pk_seq'::regclass);


--
-- Name: valueset_data pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valueset_data ALTER COLUMN pk SET DEFAULT nextval('public.valueset_data_pk_seq'::regclass);


--
-- Name: valueset_files pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valueset_files ALTER COLUMN pk SET DEFAULT nextval('public.valueset_files_pk_seq'::regclass);


--
-- Name: valuesetreference pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valuesetreference ALTER COLUMN pk SET DEFAULT nextval('public.valuesetreference_pk_seq'::regclass);


--
-- Data for Name: afbolanguage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.afbolanguage (pk, family) FROM stdin;
1	Boran
2	Arawakan
3	Pama-Nyungan
4	Indo-European
5	Indo-European
6	Eskimo-Aleut
7	Mongolic-Khitan
8	Turkic
9	Indo-European
10	Indo-European
11	Tungusic
12	Turkic
13	Indo-European
14	Indo-European
15	Austronesian
16	Tungusic
17	Indo-European
18	Indo-European
19	Austronesian
20	Indo-European
21	Afro-Asiatic
22	Afro-Asiatic
23	Indo-European
24	Indo-European
25	Indo-European
26	Quechuan
27	Aymaran
28	Uru-Chipaya
29	Afro-Asiatic
30	Indo-European
31	Turkic
32	Indo-European
33	Indo-European
34	Afro-Asiatic
35	Afro-Asiatic
36	Afro-Asiatic
37	Gunwinyguan
38	Mangarrayi-Maran
39	Cariban
40	Arawakan
41	Turkic
42	Uralic
43	Indo-European
44	Sino-Tibetan
45	Gunwinyguan
46	Pama-Nyungan
47	Austronesian
48	Austronesian
49	Indo-European
50	Turkic
51	Indo-European
52	Indo-European
53	Siouan
54	Muskogean
55	Afro-Asiatic
56	Afro-Asiatic
57	Dravidian
58	Indo-European
59	Pama-Nyungan
60	Tangkic
61	Afro-Asiatic
62	Austronesian
63	Indo-European
64	Afro-Asiatic
65	Indo-European
66	Austroasiatic
67	Uralic
68	Uralic
69	Atlantic-Congo
70	Austronesian
71	Austronesian
72	Cariban
73	Tupian
74	Indo-European
75	Austronesian
76	Uralic
77	Indo-European
78	Sino-Tibetan
79	Indo-European
80	Indo-European
81	Indo-European
82	Indo-European
83	Indo-European
84	Mixe-Zoque
85	Indo-European
86	Dravidian
87	Austronesian
88	Austroasiatic
89	Austronesian
90	Indo-European
91	Nakh-Daghestanian
92	Chukotko-Kamchatkan
93	Eskimo-Aleut
94	Garrwan
95	Indo-European
96	Dravidian
97	Turkic
98	Indo-European
99	Uralic
100	Uralic
101	Indo-European
102	Uralic
103	Arawakan
104	Tucanoan
105	Indo-European
106	Basque
107	Afro-Asiatic
108	Afro-Asiatic
109	Sino-Tibetan
110	Sino-Tibetan
111	Quechuan
112	Mongolic-Khitan
113	Sino-Tibetan
114	Indo-European
115	Uralic
116	Tucanoan
117	Arawakan
118	Mayan
119	Mixe-Zoque
120	Afro-Asiatic
121	Afro-Asiatic
122	Sino-Tibetan
123	Indo-European
124	Indo-European
125	Austronesian
126	Tarascan
127	Uto-Aztecan
128	Mayan
129	Afro-Asiatic
130	Muskogean
131	Indo-European
132	Indo-European
133	Quechuan
134	Arawakan
135	Indo-European
136	Mongolic-Khitan
137	Sino-Tibetan
138	Mongolic-Khitan
139	Uralic
140	Tungusic
141	Turkic
142	Mongolic-Khitan
143	Atlantic-Congo
144	Atlantic-Congo
145	Afro-Asiatic
146	Atlantic-Congo
147	Atlantic-Congo
148	Atlantic-Congo
149	Uto-Aztecan
150	Indo-European
151	Indo-European
152	Indo-European
153	Indo-European
154	Turkic
155	Indo-European
156	Indo-European
157	Indo-European
158	Indo-European
159	Indo-European
160	Indo-European
161	Zamucoan
162	Guaicuruan
163	Mataguayan
164	Zamucoan
165	Indo-European
166	Afro-Asiatic
167	Afro-Asiatic
168	Turkic
169	Nakh-Daghestanian
170	Chinookan
171	Salishan
172	Afro-Asiatic
173	Indo-European
174	Songhay
175	Afro-Asiatic
176	Indo-European
177	Austronesian
178	Indo-European
179	Coosan
180	Alsea-Yaquina
181	Sino-Tibetan
182	Sino-Tibetan
183	Austroasiatic
184	Japonic
185	Indo-European
186	Sahaptian
187	Indo-European
188	Sino-Tibetan
189	Atlantic-Congo
190	Songhay
191	Arawakan
\.


--
-- Data for Name: afbovalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.afbovalue (pk, pair_pk, "numeric") FROM stdin;
1	1	1
2	1	2
3	1	38
4	1	1
5	1	3
6	1	3
7	1	2
8	2	1
9	2	1
10	2	1
11	2	3
12	2	1
13	2	2
14	2	1
15	2	1
16	2	2
17	2	1
18	2	4
19	3	1
20	3	13
21	3	1
22	4	4
23	4	1
24	4	1
25	4	1
26	4	3
27	4	1
28	4	1
29	4	1
30	4	1
31	5	1
32	5	1
33	5	1
34	5	1
35	5	6
36	5	1
37	6	1
38	6	21
39	7	1
40	7	1
41	7	1
42	7	2
43	7	2
44	7	1
45	7	1
46	7	2
47	8	1
48	8	2
49	8	15
50	9	1
51	9	1
52	9	6
53	10	1
54	10	3
55	10	4
56	11	3
57	11	1
58	11	1
59	11	1
60	11	2
61	12	8
62	13	4
63	13	6
64	13	1
65	13	2
66	13	1
67	14	3
68	14	1
69	14	1
70	14	2
71	15	2
72	15	2
73	15	1
74	15	1
75	16	1
76	16	3
77	16	2
78	17	2
79	17	1
80	17	3
81	17	5
82	18	1
83	18	1
84	18	2
85	18	1
86	19	2
87	19	1
88	19	2
89	20	1
90	20	1
91	20	1
92	20	1
93	20	1
94	21	2
95	21	3
96	22	1
97	22	2
98	22	1
99	22	1
100	22	1
101	23	1
102	23	1
103	24	1
104	24	1
105	24	4
106	24	1
107	24	1
108	24	1
109	24	1
110	24	1
111	24	1
112	25	4
113	25	2
114	26	1
115	26	1
116	26	1
117	26	1
118	27	1
119	27	2
120	28	1
121	28	1
122	28	1
123	28	2
124	29	1
125	29	1
126	30	2
127	30	7
128	31	1
129	32	1
130	32	1
131	33	1
132	33	1
133	34	1
134	35	1
135	36	1
136	36	1
137	36	1
138	36	1
139	36	1
140	36	3
141	37	2
142	38	2
143	39	1
144	39	1
145	40	1
146	40	1
147	40	1
148	40	1
149	41	1
150	42	1
151	43	1
152	43	2
153	43	1
154	43	1
155	44	1
156	45	1
157	46	2
158	46	1
159	46	3
160	46	3
161	46	2
162	46	1
163	46	1
164	47	2
165	47	1
166	47	11
167	47	1
168	47	4
169	47	2
170	47	2
171	47	9
172	47	2
173	48	4
174	48	1
175	48	1
176	48	13
177	48	9
178	48	4
179	49	1
180	49	5
181	50	1
182	51	1
183	51	1
184	51	1
185	52	1
186	52	1
187	52	1
188	52	1
189	52	4
190	53	1
191	54	1
192	54	2
193	55	3
194	56	1
195	57	4
196	57	1
197	57	2
198	57	1
199	58	1
200	58	1
201	58	3
202	58	1
203	58	1
204	59	3
205	59	1
206	59	4
207	59	1
208	59	1
209	60	4
210	60	1
211	60	2
212	60	2
213	60	4
214	61	1
215	61	1
216	61	4
217	61	1
218	61	1
219	61	1
220	61	1
221	61	3
222	61	1
223	61	1
224	62	2
225	62	1
226	63	1
227	64	2
228	64	1
229	64	1
230	64	2
231	64	2
232	64	4
233	64	17
234	64	2
235	64	4
236	64	1
237	65	1
238	66	1
239	66	1
240	66	1
241	66	2
242	66	2
243	67	8
244	67	1
245	68	1
246	69	1
247	69	1
248	69	1
249	69	1
250	69	2
251	70	6
252	71	1
253	71	2
254	72	1
255	72	1
256	72	2
257	72	1
258	73	3
259	74	1
260	75	1
261	76	15
262	77	1
263	78	1
264	79	1
265	80	1
266	81	1
267	81	1
268	81	1
269	81	1
270	82	1
271	83	1
272	84	1
273	85	2
274	85	1
275	86	1
276	86	1
277	86	1
278	86	4
279	87	1
280	88	1
281	89	3
282	90	1
283	90	4
284	90	1
285	90	1
286	91	3
287	91	1
288	91	1
289	91	1
290	92	4
291	93	4
292	94	2
293	95	1
294	95	1
295	95	1
296	96	1
297	97	3
298	98	3
299	98	1
300	99	1
301	100	1
302	101	1
303	102	1
304	103	1
305	104	1
306	105	1
307	105	3
308	105	1
309	105	1
310	105	2
311	105	1
312	106	1
313	107	1
314	107	1
315	107	1
316	108	1
317	108	1
318	108	1
319	109	1
320	109	1
321	109	1
322	109	1
323	109	1
324	109	1
325	110	1
326	111	1
327	111	1
328	112	1
329	113	1
330	113	1
331	114	1
332	115	1
333	116	3
334	116	2
335	116	1
336	116	2
337	117	5
338	117	1
339	117	1
340	117	3
341	117	1
342	117	1
343	118	1
344	119	1
345	120	1
346	121	1
347	121	1
348	122	6
349	122	5
350	122	1
351	122	1
352	122	1
353	122	1
354	123	1
355	123	1
356	123	1
357	124	1
358	124	2
359	125	1
360	126	1
361	126	2
362	126	2
363	126	1
364	127	1
365	127	1
366	127	1
367	127	2
368	128	1
369	129	1
370	130	1
371	131	1
372	132	1
373	132	1
\.


--
-- Data for Name: affixfunction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.affixfunction (pk, representation, count_borrowed) FROM stdin;
1	8	8
2	6	6
3	29	71
4	12	13
5	4	4
6	7	11
7	3	3
8	4	4
9	3	3
10	11	23
11	6	10
12	6	11
13	4	47
14	18	36
15	4	5
16	6	11
17	2	3
18	2	3
19	22	33
20	32	64
21	21	52
22	9	11
23	7	9
24	19	32
25	3	5
26	1	3
27	15	58
28	4	4
29	3	18
30	8	9
31	4	6
32	5	5
33	4	4
34	2	4
35	2	2
36	1	1
37	20	54
38	11	23
39	9	57
40	12	16
41	6	10
42	2	2
\.


--
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.config (pk, jsondata, key, value, created, updated, active) FROM stdin;
\.


--
-- Data for Name: contribution; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contribution (pk, jsondata, polymorphic_type, id, name, description, markup_description, date, created, updated, active) FROM stdin;
\.


--
-- Data for Name: contribution_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contribution_data (pk, jsondata, key, value, ord, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: contribution_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contribution_files (pk, jsondata, id, name, description, markup_description, ord, mime_type, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: contributioncontributor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contributioncontributor (pk, jsondata, polymorphic_type, contribution_pk, contributor_pk, ord, "primary", created, updated, active) FROM stdin;
\.


--
-- Data for Name: contributionreference; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contributionreference (pk, jsondata, key, description, contribution_pk, created, updated, active, source_pk) FROM stdin;
\.


--
-- Data for Name: contributor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contributor (pk, jsondata, polymorphic_type, id, name, description, markup_description, url, email, address, created, updated, active) FROM stdin;
1	{}	base	seifartf	Frank Seifart	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
2	{}	base	gardanif	Francesco Gardani	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
\.


--
-- Data for Name: contributor_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contributor_data (pk, jsondata, key, value, ord, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: contributor_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contributor_files (pk, jsondata, id, name, description, markup_description, ord, mime_type, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: dataset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dataset (pk, jsondata, polymorphic_type, id, name, description, markup_description, published, publisher_name, publisher_place, publisher_url, license, domain, contact, created, updated, active) FROM stdin;
1	{"license_icon": "cc-by.png", "license_name": "Creative Commons Attribution 4.0 International License", "about": [[2, "Data sources", "\\nInformation on borrowed affixes was compiled from a variety of sources, as explicitly indicated for each case. Most information comes from published sources, especially descriptive grammars and other descriptive studies on, e.g., language contact or morphology. Different sources on the same language were consulted wherever possible. In many cases important additional information (and in some cases, all information) comes from personal communications from experts on the languages in question.\\n\\n\\n"], [3, "Language sample", "\\nThe sample of languages includes in principle all cases of affix borrowing that have come to our attention between 2007 and 2026, i.e. no attempt has been made to make the sample genealogically or areally balanced. If two or more pairs of languages (or dialects) are very similar in the aspects relevant here, only one pair has been included in the database, namely the language pair with the higher number of borrowed affixes. For instance, Chuvash (Turkic) affixes in Mari (Uralic) are included in the database, but excluded is the similar set of Chuvash affixes that the Mordvinian languages borrowed, which are closely related to Mari.\\n\\nThere is a clear bias in the language sample towards those language families and areas that are linguistically best described, especially European/Western Eurasian and Oriental languages. This is because detecting affix borrowing requires relatively detailed information not only on the recipient and donor language but crucially also comparative evidence from both of these languages for the proof of borrowing and determining the direction of borrowing.\\n\\nIncluded in the sample are two languages that are often considered as \\"mixed languages\\", Gurindji Kriol from Northern Australia and Copper Island Aleut from the Commander Islands in the Bering Strait. Unlike other mixed languages, it is possible for these two to clearly identify one language as the matrix language ([Myers-Scotton 2002](cldf/sources.bib#cldf:myers_scotton2002a); [Myers-Scotton 2007](cldf/sources.bib#cldf:myers_scotton2007a)), which contributes the morphosyntactic framework as well as a substantial portion of the vocabulary. This language is identified as the recipient language (English for Gurindji Kriol and Aleut for Copper Island Aleut) and the other contributing languages as the donor language (Gurindji for Gurindji Kriol and Russian for Copper Island Aleut), following [Meakins' (2011)](cldf/sources.bib?label=Meakins%27+%282011%29#cldf:meakins2011a) analysis of (English-based) Gurindji Kriol as having borrowed Gurindji case markers. Note that in AfBo, Gurindji Kriol and Copper Island Aleut do not appear as borrowing exceptionally many affixes: Gurindji Kriol is the sixth most heavily affix-borrowing language in the sample, Copper Island Aleut the eight (sharing that rank with Khanty, Assamese, and Vietnamese).\\n\\n\\n"], [4, "What counts as an affix?", "\\nAny morphologically bound form from a closed class that fulfills a derivational or inflectional function counts as an affix in AfBo. By this definition, clitics are included as instances of affix borrowing, as long as they fulfill a derivational or inflectional function, e.g. tense, evidentiality, or topic marking. Arguments for considering a form is bound vs. free are explicitly given in the descriptions where possible.\\n\\nSome forms are included here that might be considered morphologically conditioned allomorphs because they fulfill the same function in different environments. For instance, a plural marker used with animate nouns and a plural marker used with inanimate nouns are counted as two borrowed affixes.\\n\\n\\n"], [5, "Proof of borrowing", "\\nAn affix is considered as effectively borrowed only if it is attested in at least some hybrid formations, i.e. combinations of the borrowed affix with native stems. An affix is not considered as borrowed if it is only attested in complex loanwords, i.e. in combination with stems that are borrowed from the same language. In addition, a complete proof that a given affix is borrowed would ideally include (i) evidence that the borrowed affix was not present in the recipient language before contact, (ii) evidence that the source form was present in the donor language at the time of contact, and (iii) evidence that the similarity between source form and borrowed form is not coincidental. Even though the sources consulted for AfBo rarely if ever explicitly provide such complete information, the authors of these sources are often authorities in the language families concerned, which gives credibility to their judgments that a given form is borrowed.\\n\\n\\n"], [6, "Data coding", "\\nData are coded for a number of properties for comparative analyses (note that parts of this information are included in the web interface, while other parts are included in the downloadable database). Information on recipient languages involved in affix borrowing include:\\n\\n1. language name\\n2. iso 639-3 language identification code\\n3. genealogical affiliation\\n4. affiliation with a geographic macro area\\n\\nFor each language pair, additionally the total number of borrowed affixes is given. Note that the previous version of AfBo (but not AfBo 2.0) also included information on the total number of interrelated borrowed affixes in the sense of [Seifart (2012)](cldf/sources.bib?label=Seifart+%282012%29#cldf:seifart2012a) and on the reliability of borrowed status/affixhood. The latter was omitted in AfBo 2.0 since all cases with a low reliability were removed.\\n\\nThe information provided for each borrowed affix consists of the following:\\n\\n1. form of the borrowed affix\\n2. approximate function (e.g. agent nominalizer) and distribution (e.g. forming nouns from adjectives)\\n3. examples of hybrid formations, i.e. combinations of borrowed affixes with native stems, for the majority of borrowed affixes. In the remaining cases, the original sources explicitly state that the form is used on native stems.\\n4. based on the approximate functions and distributions of borrowed affixes, these are grouped into morphosyntactic subsystems and the overall number of borrowed affixes per subsystem is given (e.g. three nominalizer that form nouns from adjectives, two case markers, and one number marker)\\n5. where possible, the overall number of forms in recipient language subsystems into which affixes were borrowed is given (e.g., three out of a total of five case markers are borrowed)\\n\\n\\n"], [7, "Representation of data", "\\nData are given throughout using the transcription conventions provided by the original sources, i.e. no attempt at standardization through transliteration was made.\\n\\n\\n"], [8, "Using and citing AfBo", "\\nIf you refer to information exclusively stemming from sources that are cited in AfBo, those original sources should be consulted and cited, optionally in addition to AfBo. If you refer to analyses provided by AfBo or results obtained from AfBo, such as the frequency of borrowing affixes with a specific function, you should cite AfBo as\\n\\n> Seifart, Frank, and Gardani, Francesco. 2026. AfBo 2.0: A world-wide survey of affix borrowing. Leipzig: Max Planck Institute for Evolutionary Anthropology. DOI: 10.5281/zenodo.3610154\\n\\n"], [9, "Acknowledgements", "\\nMany people have contributed to building AfBo, as explicitly noted in the descriptions of individual cases of affix borrowing. Tsan Tsai Chan and Nikita L. Beklemishev provided substantial research assistance for AfBo 2.0. Tsan Tsai Chan contributed to 10 language pairs (Coos - Alsea, English - Japanese, English - Mandarin, English - Spanish, English - Tagalog, French - Turkish, Middle Chinese - Japanese, Middle Chinese - Vietnamese, Middle Low German - Danish, and Spanish - Tagalog). Nikita L. Beklemishev contributed to 20 language pairs (Azeri - Udi, Belarusian - Lithuanian, Central Asian Turkic - Russian, Chamacoco - Kadiw\\u00e9u, English - Welsh, French - Russian, German - Estonian, German - Polish, Hebrew - Yiddish, Italian - Arb\\u00ebresh\\u00eb Albanian, Kurdish - Chaldean Neo-Aramaic, Kurdish - Suleimaniya Jewish Neo-Aramaic, Lombardic - Tuscan Italian, Middle Low German - Russian, Molisano Neapolitan - Slavomolisano, Nivacl\\u00e9 - Zamucoan, Russian - Estonian, Spanish - Nahuatl, Tasawaq - Tamajeq Tuareg, and Upper Chinook - Bela Coola).\\nIn addition, we are grateful to Robert Forkel for converting AfBo to CLLD, and to Lena Sell, Lisa Steinbach, Evgeniya Zhivotova, and Senta Zeugin for extensive proofreading.\\n"]]}	base	afbo	AfBo 2.0: A world-wide survey of affix borrowing		\N	2026-09-26	Max Planck Institute for Evolutionary Anthropology	Leipzig	https://www.eva.mpg.de/	http://creativecommons.org/licenses/by/4.0/	afbo.info	frank.seifart@cnrs.fr	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
\.


--
-- Data for Name: dataset_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dataset_data (pk, jsondata, key, value, ord, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: dataset_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dataset_files (pk, jsondata, id, name, description, markup_description, ord, mime_type, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: domainelement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.domainelement (pk, jsondata, polymorphic_type, id, name, description, markup_description, parameter_pk, number, abbr, created, updated, active) FROM stdin;
\.


--
-- Data for Name: domainelement_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.domainelement_data (pk, jsondata, key, value, ord, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: domainelement_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.domainelement_files (pk, jsondata, id, name, description, markup_description, ord, mime_type, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: editor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.editor (pk, jsondata, polymorphic_type, dataset_pk, contributor_pk, ord, "primary", created, updated, active) FROM stdin;
1	{}	base	1	1	0	t	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
2	{}	base	1	2	1	t	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
\.


--
-- Data for Name: glossabbreviation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.glossabbreviation (pk, jsondata, id, name, description, markup_description, language_pk, created, updated, active) FROM stdin;
\.


--
-- Data for Name: identifier; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.identifier (pk, jsondata, name, description, markup_description, id, type, lang, created, updated, active) FROM stdin;
1	{}	\N	\N	\N	bora1263	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
2	{}	\N	\N	\N	boa	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
3	{}	\N	\N	\N	resi1247	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
4	{}	\N	\N	\N	rgr	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
5	{}	\N	\N	\N	guri1247	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
6	{}	\N	\N	\N	gue	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
7	{}	\N	\N	\N	krio1252	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
8	{}	\N	\N	\N	rop	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
9	{}	\N	\N	\N	russ1263	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
10	{}	\N	\N	\N	rus	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
11	{}	\N	\N	\N	aleu1260	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
12	{}	\N	\N	\N	ale	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
13	{}	\N	\N	\N	halh1238	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
14	{}	\N	\N	\N	khk	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
15	{}	\N	\N	\N	yaku1245	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
16	{}	\N	\N	\N	sah	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
17	{}	\N	\N	\N	roma1327	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
18	{}	\N	\N	\N	ron	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
19	{}	\N	\N	\N	vlax1238	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
20	{}	\N	\N	\N	rmy	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
21	{}	\N	\N	\N	even1260	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
22	{}	\N	\N	\N	eve	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
23	{}	\N	\N	\N	nort2690	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
24	{}	\N	\N	\N	uzn	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
25	{}	\N	\N	\N	taji1245	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
26	{}	\N	\N	\N	tgk	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
27	{}	\N	\N	\N	sans1269	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
28	{}	\N	\N	\N	san	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
29	{}	\N	\N	\N	indo1316	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
30	{}	\N	\N	\N	ind	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
31	{}	\N	\N	\N	even1259	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
32	{}	\N	\N	\N	evn	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
33	{}	\N	\N	\N	norm1245	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
34	{}	\N	\N	\N	fra	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
35	{}	\N	\N	\N	midd1317	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
36	{}	\N	\N	\N	enm	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
37	{}	\N	\N	\N	cebu1242	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
38	{}	\N	\N	\N	ceb	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
39	{}	\N	\N	\N	chav1241	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
40	{}	\N	\N	\N	cbk	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
41	{}	\N	\N	\N	tigr1270	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
42	{}	\N	\N	\N	tig	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
43	{}	\N	\N	\N	bili1260	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
44	{}	\N	\N	\N	byn	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
45	{}	\N	\N	\N	sout1528	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
46	{}	\N	\N	\N	srp	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
47	{}	\N	\N	\N	gheg1238	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
48	{}	\N	\N	\N	aln	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
49	{}	\N	\N	\N	stan1288	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
50	{}	\N	\N	\N	spa	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
51	{}	\N	\N	\N	caja1238	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
52	{}	\N	\N	\N	qvc	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
53	{}	\N	\N	\N	cent2142	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
54	{}	\N	\N	\N	ayr	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
55	{}	\N	\N	\N	uruu1244	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
56	{}	\N	\N	\N	ure	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
57	{}	\N	\N	\N	hebr1245	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
58	{}	\N	\N	\N	heb	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
59	{}	\N	\N	\N	dutc1256	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
60	{}	\N	\N	\N	nld	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
61	{}	\N	\N	\N	nucl1301	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
62	{}	\N	\N	\N	tur	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
63	{}	\N	\N	\N	mode1248	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
64	{}	\N	\N	\N	ell	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
65	{}	\N	\N	\N	cypr1248	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
66	{}	\N	\N	\N	acy	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
67	{}	\N	\N	\N	liby1240	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
68	{}	\N	\N	\N	ayl	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
69	{}	\N	\N	\N	siwi1239	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
70	{}	\N	\N	\N	siz	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
71	{}	\N	\N	\N	nung1290	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
72	{}	\N	\N	\N	nuy	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
73	{}	\N	\N	\N	wand1263	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
74	{}	\N	\N	\N	wnd	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
75	{}	\N	\N	\N	gali1262	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
76	{}	\N	\N	\N	car	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
77	{}	\N	\N	\N	gari1256	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
78	{}	\N	\N	\N	cab	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
79	{}	\N	\N	\N	chuv1255	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
80	{}	\N	\N	\N	chv	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
81	{}	\N	\N	\N	east2328	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
82	{}	\N	\N	\N	mhr	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
83	{}	\N	\N	\N	east1436	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
84	{}	\N	\N	\N	nep	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
85	{}	\N	\N	\N	chan1310	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
86	{}	\N	\N	\N	chx	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
87	{}	\N	\N	\N	ngan1295	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
88	{}	\N	\N	\N	nid	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
89	{}	\N	\N	\N	rita1239	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
90	{}	\N	\N	\N	rit	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
91	{}	\N	\N	\N	ilok1237	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
92	{}	\N	\N	\N	ilo	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
93	{}	\N	\N	\N	bont1247	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
94	{}	\N	\N	\N	bnc	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
95	{}	\N	\N	\N	nort2641	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
96	{}	\N	\N	\N	kmr	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
97	{}	\N	\N	\N	sonq1234	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
98	{}	\N	\N	\N	croa1245	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
99	{}	\N	\N	\N	hrv	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
100	{}	\N	\N	\N	istr1245	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
101	{}	\N	\N	\N	ruo	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
102	{}	\N	\N	\N	quap1242	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
103	{}	\N	\N	\N	qua	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
104	{}	\N	\N	\N	koas1236	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
105	{}	\N	\N	\N	cku	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
106	{}	\N	\N	\N	hert1241	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
107	{}	\N	\N	\N	hrt	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
108	{}	\N	\N	\N	nort3139	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
109	{}	\N	\N	\N	apc	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
110	{}	\N	\N	\N	tami1289	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
111	{}	\N	\N	\N	tam	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
112	{}	\N	\N	\N	mala1544	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
113	{}	\N	\N	\N	por	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
114	{}	\N	\N	\N	nyun1247	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
115	{}	\N	\N	\N	nys	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
116	{}	\N	\N	\N	kaya1319	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
117	{}	\N	\N	\N	gyd	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
118	{}	\N	\N	\N	stan1318	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
119	{}	\N	\N	\N	arb	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
120	{}	\N	\N	\N	sici1248	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
121	{}	\N	\N	\N	scn	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
122	{}	\N	\N	\N	malt1254	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
123	{}	\N	\N	\N	mlt	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
124	{}	\N	\N	\N	sadr1248	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
125	{}	\N	\N	\N	sck	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
126	{}	\N	\N	\N	khar1287	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
127	{}	\N	\N	\N	khr	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
128	{}	\N	\N	\N	esto1258	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
129	{}	\N	\N	\N	ekk	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
130	{}	\N	\N	\N	finn1318	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
131	{}	\N	\N	\N	fin	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
132	{}	\N	\N	\N	swah1253	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
133	{}	\N	\N	\N	swh	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
134	{}	\N	\N	\N	plat1254	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
135	{}	\N	\N	\N	plt	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
136	{}	\N	\N	\N	banj1239	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
137	{}	\N	\N	\N	bjn	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
138	{}	\N	\N	\N	emer1243	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
139	{}	\N	\N	\N	eme	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
140	{}	\N	\N	\N	stan1293	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
141	{}	\N	\N	\N	eng	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
142	{}	\N	\N	\N	hawa1245	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
143	{}	\N	\N	\N	haw	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
144	{}	\N	\N	\N	kild1236	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
145	{}	\N	\N	\N	sjd	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
146	{}	\N	\N	\N	mana1288	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
147	{}	\N	\N	\N	nmm	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
148	{}	\N	\N	\N	east2295	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
149	{}	\N	\N	\N	ydd	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
150	{}	\N	\N	\N	bulg1262	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
151	{}	\N	\N	\N	bul	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
152	{}	\N	\N	\N	megl1237	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
153	{}	\N	\N	\N	ruq	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
154	{}	\N	\N	\N	arva1236	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
155	{}	\N	\N	\N	aat	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
156	{}	\N	\N	\N	balt1257	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
157	{}	\N	\N	\N	rml	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
158	{}	\N	\N	\N	high1276	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
159	{}	\N	\N	\N	poi	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
160	{}	\N	\N	\N	sout2642	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
161	{}	\N	\N	\N	bcc	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
162	{}	\N	\N	\N	brah1256	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
163	{}	\N	\N	\N	brh	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
164	{}	\N	\N	\N	stan1306	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
165	{}	\N	\N	\N	zsm	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
166	{}	\N	\N	\N	seme1247	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
167	{}	\N	\N	\N	sza	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
168	{}	\N	\N	\N	tuka1248	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
169	{}	\N	\N	\N	khc	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
170	{}	\N	\N	\N	west2369	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
171	{}	\N	\N	\N	pes	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
172	{}	\N	\N	\N	lezg1247	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
173	{}	\N	\N	\N	lez	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
174	{}	\N	\N	\N	chuk1273	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
175	{}	\N	\N	\N	ckt	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
176	{}	\N	\N	\N	cent2128	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
177	{}	\N	\N	\N	ess	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
178	{}	\N	\N	\N	garr1260	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
179	{}	\N	\N	\N	gbc	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
180	{}	\N	\N	\N	hind1269	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
181	{}	\N	\N	\N	hin	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
182	{}	\N	\N	\N	kuru1301	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
183	{}	\N	\N	\N	kru	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
184	{}	\N	\N	\N	sout2697	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
185	{}	\N	\N	\N	azb	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
186	{}	\N	\N	\N	kash1277	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
187	{}	\N	\N	\N	kas	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
188	{}	\N	\N	\N	komi1268	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
189	{}	\N	\N	\N	kpv	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
190	{}	\N	\N	\N	khan1273	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
191	{}	\N	\N	\N	kca	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
192	{}	\N	\N	\N	swed1254	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
193	{}	\N	\N	\N	swe	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
194	{}	\N	\N	\N	nucl1764	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
195	{}	\N	\N	\N	ycn	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
196	{}	\N	\N	\N	east2702	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
197	{}	\N	\N	\N	tav	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
198	{}	\N	\N	\N	lati1261	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
199	{}	\N	\N	\N	lat	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
200	{}	\N	\N	\N	basq1248	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
201	{}	\N	\N	\N	eus	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
202	{}	\N	\N	\N	cent2194	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
203	{}	\N	\N	\N	tzm	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
204	{}	\N	\N	\N	moro1292	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
205	{}	\N	\N	\N	ary	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
206	{}	\N	\N	\N	tibe1272	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
207	{}	\N	\N	\N	bod	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
208	{}	\N	\N	\N	wutu1241	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
209	{}	\N	\N	\N	wuh	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
210	{}	\N	\N	\N	puno1238	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
211	{}	\N	\N	\N	qxp	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
212	{}	\N	\N	\N	dong1285	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
213	{}	\N	\N	\N	sce	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
214	{}	\N	\N	\N	hezh1244	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
215	{}	\N	\N	\N	cmn	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
216	{}	\N	\N	\N	ladi1251	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
217	{}	\N	\N	\N	lad	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
218	{}	\N	\N	\N	kare1335	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
219	{}	\N	\N	\N	krl	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
220	{}	\N	\N	\N	east2698	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
221	{}	\N	\N	\N	tuo	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
222	{}	\N	\N	\N	tari1256	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
223	{}	\N	\N	\N	tae	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
224	{}	\N	\N	\N	taba1266	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
225	{}	\N	\N	\N	chf	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
226	{}	\N	\N	\N	copa1236	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
227	{}	\N	\N	\N	zoc	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
228	{}	\N	\N	\N	west2763	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
229	{}	\N	\N	\N	amw	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
230	{}	\N	\N	\N	bodo1269	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
231	{}	\N	\N	\N	brx	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
232	{}	\N	\N	\N	assa1263	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
233	{}	\N	\N	\N	asm	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
234	{}	\N	\N	\N	port1283	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
235	{}	\N	\N	\N	tetu1246	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
236	{}	\N	\N	\N	tdt	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
237	{}	\N	\N	\N	pure1242	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
238	{}	\N	\N	\N	tsz	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
239	{}	\N	\N	\N	dura1246	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
240	{}	\N	\N	\N	nln	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
241	{}	\N	\N	\N	yuca1254	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
242	{}	\N	\N	\N	yua	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
243	{}	\N	\N	\N	meso1252	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
244	{}	\N	\N	\N	acm	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
245	{}	\N	\N	\N	musk1252	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
246	{}	\N	\N	\N	akz	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
247	{}	\N	\N	\N	cic	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
248	{}	\N	\N	\N	cho	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
249	{}	\N	\N	\N	stan1325	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
250	{}	\N	\N	\N	lvs	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
251	{}	\N	\N	\N	stan1295	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
252	{}	\N	\N	\N	deu	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
253	{}	\N	\N	\N	ambo1252	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
254	{}	\N	\N	\N	qva	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
255	{}	\N	\N	\N	yane1238	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
256	{}	\N	\N	\N	ame	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
257	{}	\N	\N	\N	mogh1245	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
258	{}	\N	\N	\N	mhj	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
259	{}	\N	\N	\N	mand1415	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
260	{}	\N	\N	\N	daur1238	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
261	{}	\N	\N	\N	dta	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
262	{}	\N	\N	\N	hung1274	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
263	{}	\N	\N	\N	hun	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
264	{}	\N	\N	\N	mong1331	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
265	{}	\N	\N	\N	mon	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
266	{}	\N	\N	\N	ling1263	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
267	{}	\N	\N	\N	lin	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
268	{}	\N	\N	\N	ndun1249	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
269	{}	\N	\N	\N	ndt	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
270	{}	\N	\N	\N	soma1255	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
271	{}	\N	\N	\N	som	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
272	{}	\N	\N	\N	ilwa1237	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
273	{}	\N	\N	\N	mlk	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
274	{}	\N	\N	\N	cent2132	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
275	{}	\N	\N	\N	nhn	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
276	{}	\N	\N	\N	midd1318	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
277	{}	\N	\N	\N	gml	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
278	{}	\N	\N	\N	stan1290	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
279	{}	\N	\N	\N	bela1254	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
280	{}	\N	\N	\N	bel	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
281	{}	\N	\N	\N	lith1251	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
282	{}	\N	\N	\N	lit	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
283	{}	\N	\N	\N	tata1255	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
284	{}	\N	\N	\N	tat	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
285	{}	\N	\N	\N	neap1235	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
286	{}	\N	\N	\N	nap	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
287	{}	\N	\N	\N	slav1254	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
288	{}	\N	\N	\N	svm	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
289	{}	\N	\N	\N	high1286	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
290	{}	\N	\N	\N	lng	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
291	{}	\N	\N	\N	ital1282	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
292	{}	\N	\N	\N	ita	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
293	{}	\N	\N	\N	arbe1236	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
294	{}	\N	\N	\N	aae	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
295	{}	\N	\N	\N	cham1315	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
296	{}	\N	\N	\N	ceg	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
297	{}	\N	\N	\N	kadi1248	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
298	{}	\N	\N	\N	kbc	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
299	{}	\N	\N	\N	niva1238	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
300	{}	\N	\N	\N	cag	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
301	{}	\N	\N	\N	ayor1240	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
302	{}	\N	\N	\N	ayo	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
303	{}	\N	\N	\N	kurd1259	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
304	{}	\N	\N	\N	kur	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
305	{}	\N	\N	\N	chal1275	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
306	{}	\N	\N	\N	cld	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
307	{}	\N	\N	\N	sule1243	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
308	{}	\N	\N	\N	huy	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
309	{}	\N	\N	\N	azer1255	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
310	{}	\N	\N	\N	azj	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
311	{}	\N	\N	\N	udii1243	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
312	{}	\N	\N	\N	udi	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
313	{}	\N	\N	\N	wasc1239	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
314	{}	\N	\N	\N	wac	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
315	{}	\N	\N	\N	bell1243	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
316	{}	\N	\N	\N	blc	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
317	{}	\N	\N	\N	wels1247	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
318	{}	\N	\N	\N	cym	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
319	{}	\N	\N	\N	tasa1240	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
320	{}	\N	\N	\N	twq	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
321	{}	\N	\N	\N	taya1257	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
322	{}	\N	\N	\N	thz	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
323	{}	\N	\N	\N	poli1260	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
324	{}	\N	\N	\N	pol	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
325	{}	\N	\N	\N	taga1270	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
326	{}	\N	\N	\N	tgl	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
327	{}	\N	\N	\N	dani1285	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
328	{}	\N	\N	\N	dan	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
329	{}	\N	\N	\N	coos1249	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
330	{}	\N	\N	\N	csz	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
331	{}	\N	\N	\N	alse1251	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
332	{}	\N	\N	\N	aes	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
333	{}	\N	\N	\N	midd1344	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
334	{}	\N	\N	\N	ltc	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
335	{}	\N	\N	\N	viet1252	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
336	{}	\N	\N	\N	vie	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
337	{}	\N	\N	\N	nucl1643	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
338	{}	\N	\N	\N	jpn	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
339	{}	\N	\N	\N	anci1242	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
340	{}	\N	\N	\N	grc	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
341	{}	\N	\N	\N	yaki1237	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
342	{}	\N	\N	\N	yak	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
343	{}	\N	\N	\N	nepa1254	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
344	{}	\N	\N	\N	npi	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
345	{}	\N	\N	\N	bara1357	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
346	{}	\N	\N	\N	brd	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
347	{}	\N	\N	\N	gour1243	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
348	{}	\N	\N	\N	gux	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
349	{}	\N	\N	\N	zarm1239	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
350	{}	\N	\N	\N	dje	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
351	{}	\N	\N	\N	caqu1242	glottolog	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
352	{}	\N	\N	\N	cot	iso639-3	en	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.language (pk, jsondata, polymorphic_type, id, name, description, markup_description, latitude, longitude, created, updated, active) FROM stdin;
2	{"genus": null, "family_glottocode": "araw1281", "color": "8b4512"}	custom	resigarorgr	Resígaro	\N	\N	-1.169535	-71.60524	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
4	{"genus": "Germanic", "family_glottocode": "indo1319", "color": "8b4512"}	custom	gurindjikriolrop	Gurindji Kriol	\N	\N	-18.135	137.669	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
6	{"genus": null, "family_glottocode": "eski1264", "color": "8b4512"}	custom	copperislandaleutale	Copper Island Aleut	\N	\N	52.1228	-174.29	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
8	{"genus": null, "family_glottocode": "turk1311", "color": "8b4512"}	custom	sakhasah	Sakha	\N	\N	61.69744	133.98031	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
10	{"genus": "Indo-Aryan", "family_glottocode": "indo1319", "color": "8b4512"}	custom	kalderashromanirmy	Kalderash Romani	\N	\N	46.09	18.16	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
68	{"genus": "Finnic", "family_glottocode": "ural1272", "color": "ee7620"}	custom	ingrianfinnishfin	Ingrian Finnish	\N	\N	64.7628	25.5577	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
60	{"genus": null, "family_glottocode": "tang1340", "color": "ff7f24"}	custom	kayardildgyd	Kayardild	\N	\N	-17.0695	139.489	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
11	{"genus": null, "family_glottocode": "tung1282", "color": "8b4512"}	custom	sebjankuoleveneve	Sebjan-Küöl Ėven	\N	\N	70.6687	130.914	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
13	{"genus": "Iranian", "family_glottocode": "indo1319", "color": "8b4512"}	custom	northerntajiktgk	Northern Tajik	\N	\N	38.8213	68.5549	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
15	{"genus": "Malayo-Polynesian", "family_glottocode": "aust1307", "color": "8b4512"}	custom	indonesianind	Indonesian	\N	\N	-7.33458	109.716	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
16	{"genus": null, "family_glottocode": "tung1282", "color": "cd661c"}	custom	uchurevenkievn	Uchur Ėvenki	\N	\N	61.972	94.689	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
18	{"genus": "Germanic", "family_glottocode": "indo1319", "color": "cd661c"}	custom	middleenglishenm	Middle English	\N	\N	51.65	-1.11	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
104	{"genus": null, "family_glottocode": "tuca1253", "color": "ff7f24"}	custom	carapanatatuyowaimajaandyurutitav	Carapana, Tatuyo, Wáimaja, and Yurutí	\N	\N	0.584605625	-69.810456125	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
20	{"genus": "Romance", "family_glottocode": "indo1319", "color": "cd661c"}	custom	chabacanocbk	Chabacano	\N	\N	7.435034	122.18849	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
22	{"genus": "Cushitic", "family_glottocode": "afro1255", "color": "cd661c"}	custom	bilinbyn	Bilin	\N	\N	15.7833	38.3917	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
24	{"genus": "Albanian", "family_glottocode": "indo1319", "color": "8b4512"}	custom	albanianaln	Albanian	\N	\N	42.317	21.3837	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
26	{"genus": null, "family_glottocode": "quec1387", "color": "cd661c"}	custom	cajamarcaquechuaqvc	Cajamarca Quechua	\N	\N	-7.09314	-78.3214	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
28	{"genus": null, "family_glottocode": "uruc1242", "color": "cd661c"}	custom	uruure	Uru	\N	\N	-16.72547	-68.97119	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
29	{"genus": "Semitic", "family_glottocode": "afro1255", "color": "cd661c"}	custom	israelihebrewheb	Israeli Hebrew	\N	\N	31.1056	35.0179	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
106	{"genus": null, "family_glottocode": "basq1248", "color": "8b4512"}	custom	basqueeus	Basque	\N	\N	43.2787	-1.31622	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
125	{"genus": "Malayo-Polynesian", "family_glottocode": "aust1307", "color": "ff7f24"}	custom	tetundilitdt	Tetun Dili	\N	\N	-8.58405	125.583	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
32	{"genus": "Greek", "family_glottocode": "indo1319", "color": "cd661c"}	custom	cappadociangreekell	Cappadocian Greek	\N	\N	38.36	23.13	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
34	{"genus": "Semitic", "family_glottocode": "afro1255", "color": "cd661c"}	custom	cypriotarabicacy	Cypriot Arabic	\N	\N	35.1674	33.0943	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
36	{"genus": "Berber", "family_glottocode": "afro1255", "color": "cd661c"}	custom	siwisiz	Siwi	\N	\N	29.200415	25.519627	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
38	{"genus": null, "family_glottocode": "mang1423", "color": "cd661c"}	custom	warndarangwnd	Warndarang	\N	\N	-14.2996	135.705	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
70	{"genus": "Malayo-Polynesian", "family_glottocode": "aust1307", "color": "ee7620"}	custom	malagasyplt	Malagasy	\N	\N	-19.5907	47.1211	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
40	{"genus": null, "family_glottocode": "araw1281", "color": "ee7620"}	custom	garifunacab	Garifuna	\N	\N	15.3529	-86.9091	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
42	{"genus": "Mari", "family_glottocode": "ural1272", "color": "8b4512"}	custom	marimhr	Mari	\N	\N	55.8307	48.405	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
44	{"genus": "Tibeto-Burman", "family_glottocode": "sino1245", "color": "cd661c"}	custom	chantyalchx	Chantyal	\N	\N	28.684	83.4488	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
46	{"genus": null, "family_glottocode": "pama1250", "color": "ee7620"}	custom	ritharngurit	Ritharngu	\N	\N	-13.4559	135.259	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
48	{"genus": "Central Cordilleran", "family_glottocode": "aust1307", "color": "ee7620"}	custom	guinaangbontokbnc	Guina-ang Bontok	\N	\N	17.09386	121.02662	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
50	{"genus": null, "family_glottocode": "turk1311", "color": "cd661c"}	custom	sonqorturkictur	Sonqor Turkic	\N	\N	36.5137	48.4302	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
81	{"genus": "Romance", "family_glottocode": "indo1319", "color": "8b4512"}	custom	meglenoromanianruq	Megleno-Romanian	\N	\N	41.1174	22.3782	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
82	{"genus": "Albanian", "family_glottocode": "indo1319", "color": "8b4512"}	custom	arvaniticalbanianaat	Arvanitic Albanian	\N	\N	38.283	23.3703	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
83	{"genus": "Indo-Aryan", "family_glottocode": "indo1319", "color": "cd661c"}	custom	lithuanianromanirml	Lithuanian Romani	\N	\N	57.29	29.06	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
45	{"genus": null, "family_glottocode": "gunw1250", "color": "ee7620"}	custom	ngandinid	Ngandi	\N	\N	-12.8448	134.649	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
52	{"genus": "Romance", "family_glottocode": "indo1319", "color": "cd661c"}	custom	istroromanianruo	Istro-Romanian	\N	\N	45.433	14.2	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
54	{"genus": null, "family_glottocode": "musk1252", "color": "ff7f24"}	custom	koasaticku	Koasati	\N	\N	30.4096	-92.709	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
56	{"genus": "Semitic", "family_glottocode": "afro1255", "color": "ee7620"}	custom	hasankeyfarabicapc	Hasankeyf Arabic	\N	\N	34.1709	36.0468	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
58	{"genus": "Romance", "family_glottocode": "indo1319", "color": "ee7620"}	custom	srilankaportuguesepor	Sri Lanka Portuguese	\N	\N	8.5867	81.211885	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
62	{"genus": "Malayo-Polynesian", "family_glottocode": "aust1307", "color": "ff7f24"}	custom	indonesianstandardind	Indonesian, standard	\N	\N	-7.33458	109.716	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
64	{"genus": "Semitic", "family_glottocode": "afro1255", "color": "cd661c"}	custom	maltesemlt	Maltese	\N	\N	35.8884	14.4508	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
66	{"genus": "Munda", "family_glottocode": "aust1305", "color": "ee7620"}	custom	khariakhr	Kharia	\N	\N	22.3571	84.3922	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
73	{"genus": null, "family_glottocode": "tupi1275", "color": "ff7f24"}	custom	protowayampiemerillonzoeeme	Proto Wayampi-Emerillon-Zo’é	\N	\N	3.23694	-52.3699	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
75	{"genus": "Oceanic", "family_glottocode": "aust1307", "color": "ff7f24"}	custom	hawaiianhaw	Hawaiian	\N	\N	19.6297	-155.43	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
76	{"genus": "Saami", "family_glottocode": "ural1272", "color": "cd661c"}	custom	kolasaamisjd	Kola Saami	\N	\N	68.2158	35.8348	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
77	{"genus": "Iranian", "family_glottocode": "indo1319", "color": "ff7f24"}	custom	kurmanjikmr	Kurmanji	\N	\N	37	43	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
78	{"genus": "Tibeto-Burman", "family_glottocode": "sino1245", "color": "ff7f24"}	custom	manangenmm	Manange	\N	\N	28.6416	84.0515	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
79	{"genus": "Germanic", "family_glottocode": "indo1319", "color": "8b4512"}	custom	yiddishydd	Yiddish	\N	\N	51.75	19.42	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
84	{"genus": null, "family_glottocode": "mixe1284", "color": "ff7f24"}	custom	sierrapopolucapoi	Sierra Popoluca	\N	\N	18.198	-94.9109	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
86	{"genus": null, "family_glottocode": "drav1251", "color": "ee7620"}	custom	brahuibrh	Brahui	\N	\N	29.04	66.56	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
88	{"genus": "Mon-Khmer", "family_glottocode": "aust1305", "color": "cd661c"}	custom	semelaisza	Semelai	\N	\N	2.82799	102.806	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
89	{"genus": "Malayo-Polynesian", "family_glottocode": "aust1307", "color": "ff7f24"}	custom	tukangbesikhc	Tukang Besi	\N	\N	-5.30994	123.578	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
91	{"genus": "Lezgic", "family_glottocode": "nakh1245", "color": "ee7620"}	custom	lezgianlez	Lezgian	\N	\N	41.5157	47.8951	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
93	{"genus": null, "family_glottocode": "eski1264", "color": "ee7620"}	custom	centralsiberianyupikeskimoess	Central Siberian Yupik Eskimo	\N	\N	63.4308	-170.272	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
96	{"genus": null, "family_glottocode": "drav1251", "color": "cd661c"}	custom	kuruxkru	Kurux	\N	\N	24.46442	86.46568	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
31	{"genus": null, "family_glottocode": "turk1311", "color": "cd661c"}	custom	turkishtur	Turkish	\N	\N	39.8667	32.8667	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
97	{"genus": null, "family_glottocode": "turk1311", "color": "8b4512"}	custom	azariazb	Azari	\N	\N	36.5137	48.4302	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
98	{"genus": "Indo-Aryan", "family_glottocode": "indo1319", "color": "8b4512"}	custom	kashmirikas	Kashmiri	\N	\N	34.166825	74.330455	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
100	{"genus": "Khantic", "family_glottocode": "ural1272", "color": "8b4512"}	custom	khantykca	Khanty	\N	\N	62.4308	66.1218	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
102	{"genus": "Finnic", "family_glottocode": "ural1272", "color": "ee7620"}	custom	finnishfin	Finnish	\N	\N	64.7628	25.5577	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
108	{"genus": "Semitic", "family_glottocode": "afro1255", "color": "ff7f24"}	custom	moroccanarabicary	Moroccan Arabic	\N	\N	32.5	-7.5	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
110	{"genus": "Sinitic", "family_glottocode": "sino1245", "color": "cd661c"}	custom	wutunwuh	Wutun	\N	\N	35.269	101.957	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
111	{"genus": null, "family_glottocode": "quec1387", "color": "cd661c"}	custom	quechuadepunoqxp	Quechua de Puno	\N	\N	-14.608	-70.2084	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
113	{"genus": "Sinitic", "family_glottocode": "sino1245", "color": "ff7f24"}	custom	chineseoflinxiahezoucmn	Chinese of Línxìa/Hézōu	\N	\N	35.59	103.197	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
114	{"genus": "Romance", "family_glottocode": "indo1319", "color": "cd661c"}	custom	judeospanishlad	Judeo-Spanish	\N	\N	41.205	28.6632	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
115	{"genus": "Finnic", "family_glottocode": "ural1272", "color": "cd661c"}	custom	kareliankrl	Karelian	\N	\N	65.1691	30.8655	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
117	{"genus": null, "family_glottocode": "araw1281", "color": "ee7620"}	custom	tarianatae	Tariana	\N	\N	0.440205	-68.9042	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
118	{"genus": null, "family_glottocode": "maya1287", "color": "ee7620"}	custom	choolchf	Cho’ol	\N	\N	18.1713	-92.7367	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
121	{"genus": "Semitic", "family_glottocode": "afro1255", "color": "ff7f24"}	custom	westernneoaramaicofmalulaamw	Western Neo-Aramaic of Ma’lūla	\N	\N	33.8162	36.484	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
123	{"genus": "Indo-Aryan", "family_glottocode": "indo1319", "color": "8b4512"}	custom	assameseasm	Assamese	\N	\N	26.0876	91.2932	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
126	{"genus": "Purepecha", "family_glottocode": "tara1323", "color": "ff7f24"}	custom	purepechatarascantsz	Purepecha/Tarascan	\N	\N	19.2467	-101.631	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
127	{"genus": null, "family_glottocode": "utoa1244", "color": "ff7f24"}	custom	mexicanerodelasierramadreoccidentalnln	Mexicanero de la Sierra Madre Occidental	\N	\N	22.637999999999998	-104.76295	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
128	{"genus": null, "family_glottocode": "maya1287", "color": "ff7f24"}	custom	yucatecmayayua	Yucatec Maya	\N	\N	18.7757	-88.9567	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
129	{"genus": "Semitic", "family_glottocode": "afro1255", "color": "ee7620"}	custom	iraqiarabicacm	Iraqi Arabic	\N	\N	33.8178	43.1095	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
130	{"genus": null, "family_glottocode": "musk1252", "color": "ff7f24"}	custom	alabamaandchoctawchickasawakzciccho	Alabama and Choctaw-Chickasaw	\N	\N	31.685553333333328	-87.61149777777779	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
132	{"genus": "Germanic", "family_glottocode": "indo1319", "color": "ff7f24"}	custom	germandeu	German	\N	\N	48.649	12.4676	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
134	{"genus": null, "family_glottocode": "araw1281", "color": "ee7620"}	custom	amueshaame	Amuesha	\N	\N	-10.5454	-75.315	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
136	{"genus": null, "family_glottocode": "mong1349", "color": "cd661c"}	custom	mogholmhj	Moghol	\N	\N	34.25	62.28	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
138	{"genus": null, "family_glottocode": "mong1349", "color": "ee7620"}	custom	dagurdta	Dagur	\N	\N	48	124	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
139	{"genus": "Hungaric", "family_glottocode": "ural1272", "color": "ff7f24"}	custom	hungarianhun	Hungarian	\N	\N	46.9068585714	19.6555271429	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
112	{"genus": null, "family_glottocode": "mong1349", "color": "cd661c"}	custom	santasce	Santa	\N	\N	35.66354	103.38952	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
142	{"genus": null, "family_glottocode": "mong1349", "color": "cd661c"}	custom	middlemongolicmon	Middle Mongolic	\N	\N	45.77047900000001	87.25413566666667	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
144	{"genus": "Ubangian", "family_glottocode": "atla1278", "color": "ee7620"}	custom	ndungalendt	Ndunga-le	\N	\N	2.3886	21.5755	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
146	{"genus": "Bantu", "family_glottocode": "atla1278", "color": "ee7620"}	custom	ilwanamlk	Ilwana	\N	\N	-0.66322	39.793	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
148	{"genus": "Bantu", "family_glottocode": "atla1278", "color": "ee7620"}	custom	southswahiliswh	South Swahili	\N	\N	-8.25605	37.624	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
149	{"genus": null, "family_glottocode": "utoa1244", "color": "ee7620"}	custom	nahuatlnhn	Nahuatl	\N	\N	19.1248	-98.3002	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
5	{"genus": "Slavic", "family_glottocode": "indo1319", "color": "ee7620"}	custom	russianrus	Russian	\N	\N	59	50	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
153	{"genus": "Baltic", "family_glottocode": "indo1319", "color": "ee7620"}	custom	lithuanianlit	Lithuanian	\N	\N	55.1429	23.9601	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
156	{"genus": "Slavic", "family_glottocode": "indo1319", "color": "ff7f24"}	custom	slavomolisanosvm	Slavomolisano	\N	\N	41.89	14.7	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
158	{"genus": "Romance", "family_glottocode": "indo1319", "color": "ff7f24"}	custom	tuscanitalianita	Tuscan Italian	\N	\N	43.0464	12.6489	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
160	{"genus": "Albanian", "family_glottocode": "indo1319", "color": "ff7f24"}	custom	arbereshalbanianaae	Arbëresh Albanian	\N	\N	38.911	16.7164	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
162	{"genus": null, "family_glottocode": "guai1249", "color": "ff7f24"}	custom	kadiweukbc	Kadiwéu	\N	\N	-19.7222	-57.582	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
164	{"genus": null, "family_glottocode": "zamu1243", "color": "ff7f24"}	custom	zamucoanayo	Zamucoan	\N	\N	-19.220055	-60.217495	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
67	{"genus": "Finnic", "family_glottocode": "ural1272", "color": "cd661c"}	custom	estonianekk	Estonian	\N	\N	58.55	25.82	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
166	{"genus": "Semitic", "family_glottocode": "afro1255", "color": "ff7f24"}	custom	chaldeanneoaramaiccld	Chaldean Neo-Aramaic	\N	\N	37.0972	43.5027	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
167	{"genus": "Semitic", "family_glottocode": "afro1255", "color": "ee7620"}	custom	suleimaniyajewishneoaramaichuy	Suleimaniya Jewish Neo-Aramaic	\N	\N	31.9111	43.4865	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
169	{"genus": "Lezgic", "family_glottocode": "nakh1245", "color": "cd661c"}	custom	udiudi	Udi	\N	\N	40.9	47.7236	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
171	{"genus": null, "family_glottocode": "sali1255", "color": "ff7f24"}	custom	bellacoolablc	Bella Coola	\N	\N	52.3448	-126.689	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
173	{"genus": "Celtic", "family_glottocode": "indo1319", "color": "ff7f24"}	custom	welshcym	Welsh	\N	\N	52	-4	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
175	{"genus": "Berber", "family_glottocode": "afro1255", "color": "ee7620"}	custom	tamajeqtuaregthz	Tamajeq Tuareg	\N	\N	16.9232	7.6743	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
176	{"genus": "Slavic", "family_glottocode": "indo1319", "color": "ff7f24"}	custom	polishpol	Polish	\N	\N	51.8439	18.6255	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
25	{"genus": "Romance", "family_glottocode": "indo1319", "color": "ff7f24"}	custom	spanishspa	Spanish	\N	\N	40.4414	-1.11788	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
177	{"genus": "Malayo-Polynesian", "family_glottocode": "aust1307", "color": "cd661c"}	custom	tagalogtgl	Tagalog	\N	\N	14.06	121.747	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
178	{"genus": "Germanic", "family_glottocode": "indo1319", "color": "8b4512"}	custom	danishdan	Danish	\N	\N	54.8655	9.36284	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
180	{"genus": null, "family_glottocode": "alse1251", "color": "ff7f24"}	custom	alseaaes	Alsea	\N	\N	44.408	-123.94	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
181	{"genus": "Sinitic", "family_glottocode": "sino1245", "color": "ff7f24"}	custom	mandarincmn	Mandarin	\N	\N	40.0209	116.228	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
183	{"genus": "Vietic", "family_glottocode": "aust1305", "color": "8b4512"}	custom	vietnamesevie	Vietnamese	\N	\N	20.681188	105.774071	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
184	{"genus": null, "family_glottocode": "japo1237", "color": "ee7620"}	custom	japanesejpn	Japanese	\N	\N	35	135	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
105	{"genus": "Romance", "family_glottocode": "indo1319", "color": "ff7f24"}	custom	latinlat	Latin	\N	\N	41.9026	12.4502	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
170	{"genus": null, "family_glottocode": "chin1490", "color": "cd661c"}	custom	upperchinookwac	Upper Chinook	\N	\N	45.0278	-121.509	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
188	{"genus": "Tibeto-Burman", "family_glottocode": "sino1245", "color": "cd661c"}	custom	barambrd	Baram	\N	\N	28.3768	85.0584	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
190	{"genus": null, "family_glottocode": "song1307", "color": "ff7f24"}	custom	songhayciinedje	Songhay Ciiné	\N	\N	12.8554	2.41173	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
74	{"genus": "Germanic", "family_glottocode": "indo1319", "color": "ff7f24"}	custom	englisheng	English	\N	\N	53	-1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
191	{"genus": null, "family_glottocode": "araw1281", "color": "ee7620"}	custom	caquintecot	Caquinte	\N	\N	-11.4812	-73.4451	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
1	{"genus": null, "family_glottocode": "bora1262", "color": "ffffff"}	custom	boraboa	Bora	\N	\N	-2.000259	-72.257066	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
3	{"genus": null, "family_glottocode": "pama1250", "color": "ffffff"}	custom	gurindjigue	Gurindji	\N	\N	-17.0329	130.379	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
7	{"genus": null, "family_glottocode": "mong1349", "color": "ffffff"}	custom	mongoliankhk	Mongolian	\N	\N	48.32397	106.28874	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
9	{"genus": "Romance", "family_glottocode": "indo1319", "color": "ffffff"}	custom	romanianron	Romanian	\N	\N	46.3913	24.2256	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
12	{"genus": null, "family_glottocode": "turk1311", "color": "ffffff"}	custom	uzbekuzn	Uzbek	\N	\N	40.886	69.211	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
14	{"genus": "Indo-Aryan", "family_glottocode": "indo1319", "color": "ffffff"}	custom	sanskritsan	Sanskrit	\N	\N	20	77	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
17	{"genus": "Romance", "family_glottocode": "indo1319", "color": "ffffff"}	custom	normanfrenchfra	Norman French	\N	\N	49.081	-0.6591	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
19	{"genus": "Central Philippine", "family_glottocode": "aust1307", "color": "ffffff"}	custom	visayanceb	Visayan	\N	\N	8.38799	124.367	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
21	{"genus": "Semitic", "family_glottocode": "afro1255", "color": "ffffff"}	custom	tigretig	Tigre	\N	\N	17.3494	38.2233	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
23	{"genus": "Slavic", "family_glottocode": "indo1319", "color": "ffffff"}	custom	bosniancroatianserbiansrp	Bosnian/Croatian/Serbian	\N	\N	44.15	18.81	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
27	{"genus": null, "family_glottocode": "ayma1253", "color": "ffffff"}	custom	aymaraayr	Aymara	\N	\N	-17	-68.5	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
30	{"genus": "Germanic", "family_glottocode": "indo1319", "color": "ffffff"}	custom	dutchnld	Dutch	\N	\N	52	5	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
33	{"genus": "Greek", "family_glottocode": "indo1319", "color": "ffffff"}	custom	greekell	Greek	\N	\N	38.36	23.13	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
35	{"genus": "Semitic", "family_glottocode": "afro1255", "color": "ffffff"}	custom	libyanarabicayl	Libyan Arabic	\N	\N	22.0032	15.0014	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
37	{"genus": null, "family_glottocode": "gunw1250", "color": "ffffff"}	custom	nunggubuyunuy	Nunggubuyu	\N	\N	-14.2623	135.753	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
39	{"genus": null, "family_glottocode": "cari1283", "color": "ffffff"}	custom	caribcar	Carib	\N	\N	5.83772	-56.8323	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
41	{"genus": null, "family_glottocode": "turk1311", "color": "ffffff"}	custom	chuvashchv	Chuvash	\N	\N	55.48701	47.16298	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
43	{"genus": "Indo-Aryan", "family_glottocode": "indo1319", "color": "ffffff"}	custom	nepalinep	Nepali	\N	\N	27.5947033333	87.6200833333	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
47	{"genus": "Northern Philippine", "family_glottocode": "aust1307", "color": "ffffff"}	custom	ilokanoilo	Ilokano	\N	\N	15.9361	120.993	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
49	{"genus": "Iranian", "family_glottocode": "indo1319", "color": "ffffff"}	custom	kurdishkmr	Kurdish	\N	\N	37	43	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
51	{"genus": "Slavic", "family_glottocode": "indo1319", "color": "ffffff"}	custom	croatianhrv	Croatian	\N	\N	45.555	15.982	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
53	{"genus": null, "family_glottocode": "siou1252", "color": "ffffff"}	custom	quapawqua	Quapaw	\N	\N	34.15	-92	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
55	{"genus": "Semitic", "family_glottocode": "afro1255", "color": "ffffff"}	custom	aramaichrt	Aramaic	\N	\N	37.373	42.5192	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
57	{"genus": null, "family_glottocode": "drav1251", "color": "ffffff"}	custom	tamiltam	Tamil	\N	\N	10.520219	78.825989	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
59	{"genus": null, "family_glottocode": "pama1250", "color": "ffffff"}	custom	northernnyungicnys	Northern Nyungic	\N	\N	-33.1199	118.151	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
61	{"genus": "Semitic", "family_glottocode": "afro1255", "color": "ffffff"}	custom	arabicarb	Arabic	\N	\N	27.9625	43.8525	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
63	{"genus": "Romance", "family_glottocode": "indo1319", "color": "ffffff"}	custom	sicilianscn	Sicilian	\N	\N	37.5735	14.0414	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
65	{"genus": "Indo-Aryan", "family_glottocode": "indo1319", "color": "ffffff"}	custom	sadrisck	Sadri	\N	\N	23.6585	84.8114	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
69	{"genus": "Bantu", "family_glottocode": "atla1278", "color": "ffffff"}	custom	swahiliswh	Swahili	\N	\N	-8.25605	37.624	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
71	{"genus": "Malayo-Polynesian", "family_glottocode": "aust1307", "color": "ffffff"}	custom	banjarmalaybjn	Banjar Malay	\N	\N	0.747105	115.79	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
72	{"genus": null, "family_glottocode": "cari1283", "color": "ffffff"}	custom	intermediateprotocaribcar	intermediate Proto-Carib	\N	\N	5.83772	-56.8323	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
80	{"genus": "Slavic", "family_glottocode": "indo1319", "color": "ffffff"}	custom	bulgarianbul	Bulgarian	\N	\N	43.3646	25.047	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
85	{"genus": "Iranian", "family_glottocode": "indo1319", "color": "ffffff"}	custom	makranbaluchibcc	Makrān Baluchi	\N	\N	26	64	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
87	{"genus": "Malayo-Polynesian", "family_glottocode": "aust1307", "color": "ffffff"}	custom	malayzsm	Malay	\N	\N	3.08896	101.699	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
90	{"genus": "Iranian", "family_glottocode": "indo1319", "color": "ffffff"}	custom	persianpes	Persian	\N	\N	32.9	53.3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
92	{"genus": null, "family_glottocode": "chuk1271", "color": "ffffff"}	custom	chukchickt	Chukchi	\N	\N	68.6436	170.045	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
94	{"genus": null, "family_glottocode": "garr1260", "color": "ffffff"}	custom	karrwagbc	Karrwa	\N	\N	-18.05165	137.66406999999998	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
95	{"genus": "Indo-Aryan", "family_glottocode": "indo1319", "color": "ffffff"}	custom	hindihin	Hindi	\N	\N	25	77	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
99	{"genus": "Permic", "family_glottocode": "ural1272", "color": "ffffff"}	custom	komizyriankpv	Komi-Zyrian	\N	\N	64.0527	54.946	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
101	{"genus": "Germanic", "family_glottocode": "indo1319", "color": "ffffff"}	custom	swedishswe	Swedish	\N	\N	59.800634	17.389526	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
103	{"genus": null, "family_glottocode": "araw1281", "color": "ffffff"}	custom	yucunaandcabiyariycn	Yucuna and Cabiyarí	\N	\N	0.45004781836065966	-70.29323417808021	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
107	{"genus": "Berber", "family_glottocode": "afro1255", "color": "ffffff"}	custom	moroccanberberlanguagestzm	Moroccan Berber languages	\N	\N	32.7415	-2.40872	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
109	{"genus": "Tibeto-Burman", "family_glottocode": "sino1245", "color": "ffffff"}	custom	tibetanbod	Tibetan	\N	\N	28.3681	90.1872	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
116	{"genus": null, "family_glottocode": "tuca1253", "color": "ffffff"}	custom	easterntucanoanlanguagestuo	Eastern Tucanoan languages	\N	\N	0.057389423611111094	-70.14980529166667	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
119	{"genus": null, "family_glottocode": "mixe1284", "color": "ffffff"}	custom	zoqueanlanguageszoc	Zoquean languages	\N	\N	17.2157	-93.3183	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
120	{"genus": "Semitic", "family_glottocode": "afro1255", "color": "ffffff"}	custom	arabicapc	Arabic	\N	\N	34.1709	36.0468	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
122	{"genus": "Tibeto-Burman", "family_glottocode": "sino1245", "color": "ffffff"}	custom	tibetoburmanlanguagesbrx	Tibeto-Burman languages	\N	\N	26.1	92	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
124	{"genus": "Romance", "family_glottocode": "indo1319", "color": "ffffff"}	custom	portuguesepor	Portuguese	\N	\N	39.91	-8.1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
131	{"genus": "Baltic", "family_glottocode": "indo1319", "color": "ffffff"}	custom	latvianlvs	Latvian	\N	\N	57	24	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
133	{"genus": null, "family_glottocode": "quec1387", "color": "ffffff"}	custom	quechuaqva	Quechua	\N	\N	-10.5138	-76.1135	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
135	{"genus": "Iranian", "family_glottocode": "indo1319", "color": "ffffff"}	custom	tajiktgk	Tajik	\N	\N	38.8213	68.5549	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
137	{"genus": "Sinitic", "family_glottocode": "sino1245", "color": "ffffff"}	custom	chinesecmn	Chinese	\N	\N	40.0209	116.228	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
140	{"genus": null, "family_glottocode": "tung1282", "color": "ffffff"}	custom	evenkievn	Evenki	\N	\N	61.972	94.689	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
141	{"genus": null, "family_glottocode": "turk1311", "color": "ffffff"}	custom	turkictur	Turkic	\N	\N	39.8667	32.8667	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
143	{"genus": "Bantu", "family_glottocode": "atla1278", "color": "ffffff"}	custom	lingalalin	Lingala	\N	\N	-4.409174	15.28532	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
145	{"genus": "Cushitic", "family_glottocode": "afro1255", "color": "ffffff"}	custom	cushiticsom	Cushitic	\N	\N	4.778704	45.152856	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
147	{"genus": "Bantu", "family_glottocode": "atla1278", "color": "ffffff"}	custom	northswahiliswh	North Swahili	\N	\N	-8.25605	37.624	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
150	{"genus": "Germanic", "family_glottocode": "indo1319", "color": "ffffff"}	custom	middlelowgermangml	Middle Low German	\N	\N	53.14	9.67	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
151	{"genus": "Romance", "family_glottocode": "indo1319", "color": "ffffff"}	custom	frenchfra	French	\N	\N	48	2	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
152	{"genus": "Slavic", "family_glottocode": "indo1319", "color": "ffffff"}	custom	belarusianbel	Belarusian	\N	\N	53.2307	25.6038	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
154	{"genus": null, "family_glottocode": "turk1311", "color": "ffffff"}	custom	centralasianturkictat	Central Asian Turkic	\N	\N	55.79592	49.11577	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
155	{"genus": "Romance", "family_glottocode": "indo1319", "color": "ffffff"}	custom	molisanoneapolitannap	Molisano Neapolitan	\N	\N	39.2288	16.4225	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
157	{"genus": "Germanic", "family_glottocode": "indo1319", "color": "ffffff"}	custom	lombardiclng	Lombardic	\N	\N	50.0924665	10.411591083333333	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
159	{"genus": "Romance", "family_glottocode": "indo1319", "color": "ffffff"}	custom	italianita	Italian	\N	\N	43.0464	12.6489	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
161	{"genus": null, "family_glottocode": "zamu1243", "color": "ffffff"}	custom	chamacococeg	Chamacoco	\N	\N	-20.5899	-58.2005	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
163	{"genus": null, "family_glottocode": "mata1289", "color": "ffffff"}	custom	nivaclecag	Nivaclé	\N	\N	-22.8557	-61.7606	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
165	{"genus": "Iranian", "family_glottocode": "indo1319", "color": "ffffff"}	custom	kurdishkur	Kurdish	\N	\N	35.18386666666667	45.13510000000001	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
168	{"genus": null, "family_glottocode": "turk1311", "color": "ffffff"}	custom	azeriazbazj	Azeri	\N	\N	38.745689999999996	47.45195	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
172	{"genus": "Semitic", "family_glottocode": "afro1255", "color": "ffffff"}	custom	hebrewheb	Hebrew	\N	\N	31.1056	35.0179	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
174	{"genus": null, "family_glottocode": "song1307", "color": "ffffff"}	custom	tasawaqtwq	Tasawaq	\N	\N	16.7814	6.92037	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
179	{"genus": null, "family_glottocode": "coos1248", "color": "ffffff"}	custom	cooscsz	Coos	\N	\N	43.4413	-124.16	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
182	{"genus": "Sinitic", "family_glottocode": "sino1245", "color": "ffffff"}	custom	middlechineseltc	Middle Chinese	\N	\N	34.27	108.9	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
185	{"genus": "Greek", "family_glottocode": "indo1319", "color": "ffffff"}	custom	ancientgreekgrc	Ancient Greek	\N	\N	39.8155	21.9129	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
186	{"genus": null, "family_glottocode": "saha1239", "color": "ffffff"}	custom	sahaptinyak	Sahaptin	\N	\N	46.2655	-120.756	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
187	{"genus": "Indo-Aryan", "family_glottocode": "indo1319", "color": "ffffff"}	custom	nepalinpi	Nepali	\N	\N	28	85	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
189	{"genus": "Gur", "family_glottocode": "atla1278", "color": "ffffff"}	custom	gurmagux	Gurma	\N	\N	11.6711	1.28489	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.584923+02	t
\.


--
-- Data for Name: language_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.language_data (pk, jsondata, key, value, ord, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: language_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.language_files (pk, jsondata, id, name, description, markup_description, ord, mime_type, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: languageidentifier; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.languageidentifier (pk, jsondata, language_pk, identifier_pk, description, created, updated, active) FROM stdin;
1	{}	1	1	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
2	{}	1	2	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
3	{}	2	3	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
4	{}	2	4	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
5	{}	3	5	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
6	{}	3	6	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
7	{}	4	7	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
8	{}	4	8	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
9	{}	5	9	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
10	{}	5	10	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
11	{}	6	11	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
12	{}	6	12	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
13	{}	7	13	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
14	{}	7	14	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
15	{}	8	15	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
16	{}	8	16	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
17	{}	9	17	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
18	{}	9	18	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
19	{}	10	19	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
20	{}	10	20	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
21	{}	11	21	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
22	{}	11	22	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
23	{}	12	23	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
24	{}	12	24	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
25	{}	13	25	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
26	{}	13	26	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
27	{}	14	27	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
28	{}	14	28	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
29	{}	15	29	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
30	{}	15	30	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
31	{}	16	31	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
32	{}	16	32	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
33	{}	17	33	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
34	{}	17	34	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
35	{}	18	35	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
36	{}	18	36	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
37	{}	19	37	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
38	{}	19	38	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
39	{}	20	39	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
40	{}	20	40	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
41	{}	21	41	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
42	{}	21	42	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
43	{}	22	43	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
44	{}	22	44	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
45	{}	23	45	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
46	{}	23	46	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
47	{}	24	47	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
48	{}	24	48	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
49	{}	25	49	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
50	{}	25	50	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
51	{}	26	51	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
52	{}	26	52	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
53	{}	27	53	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
54	{}	27	54	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
55	{}	28	55	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
56	{}	28	56	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
57	{}	29	57	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
58	{}	29	58	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
59	{}	30	59	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
60	{}	30	60	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
61	{}	31	61	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
62	{}	31	62	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
63	{}	32	63	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
64	{}	32	64	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
65	{}	33	63	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
66	{}	33	64	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
67	{}	34	65	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
68	{}	34	66	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
69	{}	35	67	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
70	{}	35	68	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
71	{}	36	69	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
72	{}	36	70	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
73	{}	37	71	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
74	{}	37	72	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
75	{}	38	73	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
76	{}	38	74	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
77	{}	39	75	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
78	{}	39	76	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
79	{}	40	77	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
80	{}	40	78	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
81	{}	41	79	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
82	{}	41	80	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
83	{}	42	81	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
84	{}	42	82	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
85	{}	43	83	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
86	{}	43	84	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
87	{}	44	85	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
88	{}	44	86	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
89	{}	45	87	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
90	{}	45	88	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
91	{}	46	89	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
92	{}	46	90	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
93	{}	47	91	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
94	{}	47	92	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
95	{}	48	93	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
96	{}	48	94	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
97	{}	49	95	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
98	{}	49	96	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
99	{}	50	97	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
100	{}	50	62	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
101	{}	51	98	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
102	{}	51	99	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
103	{}	52	100	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
104	{}	52	101	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
105	{}	53	102	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
106	{}	53	103	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
107	{}	54	104	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
108	{}	54	105	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
109	{}	55	106	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
110	{}	55	107	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
111	{}	56	108	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
112	{}	56	109	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
113	{}	57	110	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
114	{}	57	111	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
115	{}	58	112	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
116	{}	58	113	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
117	{}	59	114	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
118	{}	59	115	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
119	{}	60	116	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
120	{}	60	117	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
121	{}	61	118	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
122	{}	61	119	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
123	{}	62	29	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
124	{}	62	30	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
125	{}	63	120	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
126	{}	63	121	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
127	{}	64	122	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
128	{}	64	123	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
129	{}	65	124	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
130	{}	65	125	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
131	{}	66	126	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
132	{}	66	127	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
133	{}	67	128	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
134	{}	67	129	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
135	{}	68	130	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
136	{}	68	131	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
137	{}	69	132	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
138	{}	69	133	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
139	{}	70	134	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
140	{}	70	135	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
141	{}	71	136	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
142	{}	71	137	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
143	{}	72	75	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
144	{}	72	76	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
145	{}	73	138	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
146	{}	73	139	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
147	{}	74	140	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
148	{}	74	141	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
149	{}	75	142	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
150	{}	75	143	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
151	{}	76	144	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
152	{}	76	145	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
153	{}	77	95	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
154	{}	77	96	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
155	{}	78	146	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
156	{}	78	147	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
157	{}	79	148	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
158	{}	79	149	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
159	{}	80	150	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
160	{}	80	151	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
161	{}	81	152	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
162	{}	81	153	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
163	{}	82	154	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
164	{}	82	155	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
165	{}	83	156	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
166	{}	83	157	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
167	{}	84	158	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
168	{}	84	159	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
169	{}	85	160	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
170	{}	85	161	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
171	{}	86	162	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
172	{}	86	163	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
173	{}	87	164	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
174	{}	87	165	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
175	{}	88	166	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
176	{}	88	167	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
177	{}	89	168	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
178	{}	89	169	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
179	{}	90	170	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
180	{}	90	171	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
181	{}	91	172	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
182	{}	91	173	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
183	{}	92	174	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
184	{}	92	175	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
185	{}	93	176	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
186	{}	93	177	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
187	{}	94	178	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
188	{}	94	179	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
189	{}	95	180	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
190	{}	95	181	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
191	{}	96	182	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
192	{}	96	183	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
193	{}	97	184	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
194	{}	97	185	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
195	{}	98	186	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
196	{}	98	187	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
197	{}	99	188	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
198	{}	99	189	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
199	{}	100	190	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
200	{}	100	191	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
201	{}	101	192	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
202	{}	101	193	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
203	{}	102	130	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
204	{}	102	131	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
205	{}	103	194	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
206	{}	103	195	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
207	{}	104	196	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
208	{}	104	197	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
209	{}	105	198	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
210	{}	105	199	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
211	{}	106	200	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
212	{}	106	201	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
213	{}	107	202	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
214	{}	107	203	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
215	{}	108	204	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
216	{}	108	205	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
217	{}	109	206	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
218	{}	109	207	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
219	{}	110	208	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
220	{}	110	209	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
221	{}	111	210	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
222	{}	111	211	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
223	{}	112	212	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
224	{}	112	213	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
225	{}	113	214	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
226	{}	113	215	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
227	{}	114	216	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
228	{}	114	217	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
229	{}	115	218	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
230	{}	115	219	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
231	{}	116	220	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
232	{}	116	221	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
233	{}	117	222	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
234	{}	117	223	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
235	{}	118	224	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
236	{}	118	225	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
237	{}	119	226	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
238	{}	119	227	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
239	{}	120	108	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
240	{}	120	109	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
241	{}	121	228	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
242	{}	121	229	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
243	{}	122	230	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
244	{}	122	231	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
245	{}	123	232	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
246	{}	123	233	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
247	{}	124	234	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
248	{}	124	113	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
249	{}	125	235	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
250	{}	125	236	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
251	{}	126	237	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
252	{}	126	238	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
253	{}	127	239	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
254	{}	127	240	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
255	{}	128	241	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
256	{}	128	242	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
257	{}	129	243	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
258	{}	129	244	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
259	{}	130	245	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
260	{}	130	246	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
261	{}	130	247	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
262	{}	130	248	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
263	{}	131	249	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
264	{}	131	250	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
265	{}	132	251	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
266	{}	132	252	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
267	{}	133	253	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
268	{}	133	254	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
269	{}	134	255	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
270	{}	134	256	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
271	{}	135	25	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
272	{}	135	26	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
273	{}	136	257	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
274	{}	136	258	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
275	{}	137	259	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
276	{}	137	215	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
277	{}	138	260	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
278	{}	138	261	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
279	{}	139	262	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
280	{}	139	263	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
281	{}	140	31	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
282	{}	140	32	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
283	{}	141	61	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
284	{}	141	62	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
285	{}	142	264	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
286	{}	142	265	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
287	{}	143	266	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
288	{}	143	267	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
289	{}	144	268	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
290	{}	144	269	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
291	{}	145	270	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
292	{}	145	271	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
293	{}	146	272	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
294	{}	146	273	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
295	{}	147	132	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
296	{}	147	133	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
297	{}	148	132	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
298	{}	148	133	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
299	{}	149	274	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
300	{}	149	275	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
301	{}	150	276	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
302	{}	150	277	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
303	{}	151	278	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
304	{}	151	34	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
305	{}	152	279	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
306	{}	152	280	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
307	{}	153	281	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
308	{}	153	282	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
309	{}	154	283	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
310	{}	154	284	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
311	{}	155	285	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
312	{}	155	286	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
313	{}	156	287	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
314	{}	156	288	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
315	{}	157	289	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
316	{}	157	290	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
317	{}	158	291	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
318	{}	158	292	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
319	{}	159	291	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
320	{}	159	292	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
321	{}	160	293	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
322	{}	160	294	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
323	{}	161	295	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
324	{}	161	296	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
325	{}	162	297	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
326	{}	162	298	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
327	{}	163	299	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
328	{}	163	300	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
329	{}	164	301	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
330	{}	164	302	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
331	{}	165	303	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
332	{}	165	304	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
333	{}	166	305	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
334	{}	166	306	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
335	{}	167	307	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
336	{}	167	308	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
337	{}	168	309	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
338	{}	168	185	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
339	{}	168	310	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
340	{}	169	311	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
341	{}	169	312	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
342	{}	170	313	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
343	{}	170	314	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
344	{}	171	315	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
345	{}	171	316	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
346	{}	172	57	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
347	{}	172	58	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
348	{}	173	317	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
349	{}	173	318	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
350	{}	174	319	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
351	{}	174	320	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
352	{}	175	321	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
353	{}	175	322	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
354	{}	176	323	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
355	{}	176	324	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
356	{}	177	325	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
357	{}	177	326	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
358	{}	178	327	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
359	{}	178	328	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
360	{}	179	329	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
361	{}	179	330	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
362	{}	180	331	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
363	{}	180	332	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
364	{}	181	259	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
365	{}	181	215	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
366	{}	182	333	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
367	{}	182	334	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
368	{}	183	335	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
369	{}	183	336	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
370	{}	184	337	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
371	{}	184	338	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
372	{}	185	339	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
373	{}	185	340	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
374	{}	186	341	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
375	{}	186	342	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
376	{}	187	343	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
377	{}	187	344	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
378	{}	188	345	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
379	{}	188	346	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
380	{}	189	347	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
381	{}	189	348	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
382	{}	190	349	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
383	{}	190	350	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
384	{}	191	351	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
385	{}	191	352	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
\.


--
-- Data for Name: languagesource; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.languagesource (pk, jsondata, language_pk, source_pk, created, updated, active) FROM stdin;
\.


--
-- Data for Name: pair; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pair (pk, jsondata, id, name, description, markup_description, recipient_pk, donor_pk, area, reliability, int_reliability, count_borrowed, created, updated, active) FROM stdin;
1	{}	1	Bora affixes in Resígaro	Information and examples are from [Seifart ](sources.bib?label=Seifart+#cldf:seifart2011a)([2011](sources.bib?label=2011#cldf:seifart2011a); [2012](sources.bib?label=2012#cldf:seifart2012a)). The following list is extracted from [Seifart’s ](sources.bib?label=Seifart%E2%80%99s+#cldf:seifart2011a)([2011](sources.bib?label=2011#cldf:seifart2011a):66–86) identification of Bora forms in [Allin’s ](sources.bib?label=Allin%E2%80%99s+#cldf:allin1976a)([1976](sources.bib?label=1976#cldf:allin1976a):382–458) list of about 1,590 Resígaro words, selecting those affixes that are attested with at least one native Arawakan stem. Added to this selection of forms is the augmentative marker and the dative case marker, which do not occur in the word list, but are widely attested in other parts of [Allin’s ](sources.bib?label=Allin%E2%80%99s+#cldf:allin1976a)([1976](sources.bib?label=1976#cldf:allin1976a)) work as well as in [Seifart’s ](sources.bib?label=Seifart%E2%80%99s+#cldf:seifart2009a)([2009](sources.bib?label=2009#cldf:seifart2009a); [2012](sources.bib?label=2012#cldf:seifart2012a)) data. Note that [Seifart ](sources.bib?label=Seifart+#cldf:seifart2012a)([2012](sources.bib?label=2012#cldf:seifart2012a)) provides a different, although largely overlapping, list of borrowed affixes, namely those that are attested in a given corpus of Resígaro text ([Seifart 2009](sources.bib?label=Seifart+2009#cldf:seifart2009a)).\n\n\n40 classifiers and gender markers (38 classifiers predominantly used with inanimates, 2 feminine gender markers) (one native form in the same slot: _-gi_ ‘non-feminine’)\n\n- _-ba_ ‘classifier.thing’, e.g. _aʔmitʰoótsibá_ ‘belly’\n- _-baba_ ‘classifier.bag’, e.g. _hiiʔpabábɯ́_ ‘sock’\n- _-dʒihɯ_ ‘classifier.powder’, e.g. _hípodʒíhɯ́_ ‘powder’\n- _-dʒiiʔo_ ‘classifier.broom’, e.g. _híβeʔdʒiiʔó_ ‘(long) hair’\n- _-gaaʔdʒó_ ‘classifier.raft’, e.g. _aβáanagaaʔdʒó_ ‘raft’\n- _-gahɯ_ ‘classifier.ridge’, e.g. _ín̥igahɯ́_ ‘eyebrow’\n- _-gɯ_ ‘classifier.plank’, e.g. _boeʔkʰóótsígɯ́_ ‘paddle’\n- _-ha_ ‘classifier.cover’, e.g. _aʔmitʰoótsihɯ́_ ‘kitchen’\n- _-hi_ ‘classifier.disc’, e.g. _epíitsíhí_ ‘axe’\n- _-hɯ_ ‘classifier.tube’, e.g. _okóniigihɯ́_ ‘rifle’\n- _-i_ ‘classifier.stick’, e.g. _aβáanaí_ ‘stick’\n- _-iko_ ‘classifier.nest’, e.g. _nanáanáʔiikó_ ‘shoot, new growth (of a pineapple)’\n- _-iʔikɯ_ ‘classifier.framework’, e.g. _aápiíʔíkɯ́_ ‘skeleton’\n- _-iʔo_ ‘classifier.point’, e.g. _henákoííʔo_ ‘horn’\n- _-kaahɯ_ ‘classifier.swamp’, e.g. _iteeβikaahɯ́_ ‘place where _aguaje_ palms grow’\n- _-ko_ ‘classifier.pointed’, e.g. _dʲɯííʃikó_ ‘hausai palm’\n- _-kooʔa_ ‘classifier.shaft’, e.g. _botoʔkʰoókooʔɯ́_ ‘broom’\n- _-kɯba_ ‘classifier.leg’, e.g. _hiiʔpákɯba_ ‘leg’\n- _-mi_ ‘classifier.transport’, e.g. _okóniigimí_ ‘launch, boat’\n- _-miiʔo_ ‘classifier.shell’, e.g. _an̥oógí eémámííʔo_ ‘tapir skin’\n- _-paahi_ ‘classifier.hollow’, e.g. _híβeʔpaahí_ ‘skull’\n- _-pahtsi_ ‘classifier.hole’, e.g. _henákopásí_ ‘earring’\n- _-pako_ ‘classifier.water’, e.g. _keʔβigipákó_ ‘brandy’\n- _-peko_ ‘classifier.night’, e.g. _nokótsapékó_ ‘the night before last’\n- _-ɯ_ ‘classifier.round’, e.g. _hímiɯ́_ ‘seed’\n- _-ɯɯʔo_ ‘classifier.string’, e.g. _epíipíɯɯʔó_ ‘liana cord’\n- _-ʔaakɯ_ ‘classifier.pillar’, e.g. _hiímiaakɯ́_ ‘pillar in house construction’\n- _-ʔaami_ ‘classifier.leaf’, e.g. _apánáʔaamí_ ‘leaf’\n- _-ʔasi_ ‘classifier.patio’, e.g. _híβeʔásí_ ‘crown (of the head)’\n- _-ʔe_ ‘classifier.trunk’, e.g. _áɲaahíʔé_ ‘cashew tree’\n- _-ʔehɯ_ ‘classifier.hole’, e.g. _hooniʔéhɯ́_ ‘well (waterhole)’\n- _-ʔi_ ‘classifier.bunch/classifier.river’, e.g. _pipíipíʔí_ ‘bunch of Guilelma (palm) fruits’\n- _-ʔidʒo_ ‘classifier.pot’, e.g. _itsaaʔniʔídʒó_ ‘earthware pot, pitcher, jug’\n- _-ʔo_ ‘classifier.oblong’, e.g. _ʃakooʔgíʔó_ ‘banana fruit’\n- _-ʔoohɯ_ ‘classifier.cylinder’, e.g. _hipon̥oótsíʔoohɯ́_ ‘prison’\n- _-ʔooβɯ_ ‘classifier.chunk’, e.g. _keétséʔooβɯ́_ ‘lantern, flashlight (torch)’\n- _-ʔosi_ ‘classifier.hand’, e.g. _apáʔmíʔosí_ ‘left hand’\n- _-βɯɯ́dɯ_ ‘classifier.chunk’, e.g. _aβáanaβɯɯdɯ́_ ‘log’\n- _-dʒe_ ‘feminine singular’, e.g. _-βanaaʔdʒé_ ‘sister-in-law (sister of sister-in-law or brother-in-law)’\n- _-pidʒe_ ‘feminine singular’, e.g. _pʰaipídʒé_ ‘old woman’\n\n\n\n6 number markers (one native form in the same slot: _-ne_ ‘plural for humans’)\n\n- _-mɯ_ ‘plural for animates’, e.g. _anadómɯ_ ‘macaws’\n- _-ʔa_ ‘plural for animates in certain pronominal expressions’, e.g. _faʔá_ ‘we (inclusive)’\n- _-hi_ ‘plural for inanimates’, e.g. _tsikíʔhɯ́hí_ ‘silly thing (lit. ‘empty words’)’\n- _-kɯ_ ‘dual for inanimates’, e.g. _hamáakábaakɯ́_ ‘hammocks (dl.)’\n- _-mɯpi_ ‘dual feminine’, e.g. _pʰaimɯpi_ ‘two old women’\n- _-mɯsi_ ‘dual animate’, e.g. _anáadómɯsi_ ‘two macaws’\n\n\n\n4 forms that are not interrelated with other borrowed affixes\n\n- _-a-_ ‘belonging to’, e.g. _ginomomináagi_ ‘white person (lit. one belonging to the white people)’\n- _-kobɯ_ ‘augmentative’, e.g. _keéʔʃékobɯ_ ‘big cow’\n- _-ke_ ‘dative case’, e.g. _náagi-ké_ ‘［she gave a fruit］ to her brother’\n- _-ʔi_ ‘verb marker (marking the main verb when in combination with the auxiliary verb _kʰɯ́_ ‘do’)’, e.g. _kaaʃodʒáʔi kʰɯ́_ ‘to like, to want’	\N	2	1	South America	\N	\N	50	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
2	{}	2	Gurindji affixes in Gurindji Kriol	Information and examples are from [McConvell and Meakins ](sources.bib?label=McConvell+and+Meakins+#cldf:mcconvell2005a)([2005](sources.bib?label=2005#cldf:mcconvell2005a)) and [Meakins ](sources.bib?label=Meakins+#cldf:meakins2007a)([2007](sources.bib?label=2007#cldf:meakins2007a); [2011](sources.bib?label=2011#cldf:meakins2011a)). [McConvell and Meakins ](sources.bib?label=McConvell+and+Meakins+#cldf:mcconvell2005a)([2005](sources.bib?label=2005#cldf:mcconvell2005a)) argue that Gurindji Kriol emerged from code-switching between Gurindji and Kriol, in which English-based Kriol was the matrix language, and that therefore elements from Gurindji can be considered as borrowings. Only forms for which there are sufficient indications that they are used with native, English-based stems, are counted here, e.g. the borrowed plural marker -_rrat_ is not counted here because it “is only found on demonstratives of Gurindji origin” ([Meakins 2007](sources.bib?label=Meakins+2007#cldf:meakins2007a):386).\n\n\n2 markers for core cases ([Meakins 2007](sources.bib?label=Meakins+2007#cldf:meakins2007a):367)\n\n- _-ngku ~-tu_ ‘ergative’, e.g. _diya_-_ngku_ ‘the deer (threw)’, _boi_-_ngku_ ‘the boy (was minding)’, _gel-tu_ ‘the girl (gave)’\n- _-yu ~ -wu ~ -u_ ‘dative’_,_ e.g. _Malingu-wu_ ‘to Malingu’; an additional example, _jikinfaul-u_ ‘for the chicken’, is a less clear because it dates from the 1970s, when loans were not established yet.\n\n\n\n3 markers for peripheral cases\n\n- _-ngka ~ -ta_ ‘locative’_,_ _diya_-_ngka_ ‘on the deer’, _tri-ngka_ ‘on the tree’\n- _-ngkirri ~ -jirri_ ‘allative’, e.g. _motika-ngkirri_ ‘to the car’\n- _-nginyi_ ‘ablative’, e.g. _klif-nginyi-ma_ (cliff-ablative-topic) ‘off the cliff’, _hol_-_nginyi-ma_ (hole-ablative-topic) ‘from the hole’, _juwingjuwing-nginyi_ ‘from the swing’\n\n\n\n3 number markers\n\n- -_kujarra_ ‘dual’ (no examples of hybrids)\n- -_walija_ ‘paucal’, e.g. _hook_-_walija_ ‘a few hooks’, _bi-walija_ ‘a few bees’\n- -_purrupurru_, -_nyarrara_, -_nganyjuk_ ‘associative plural’ (no examples of hybrids)\n\n\n\n2 nominalizers\n\n- -_ny_ ‘nominalizer’ (no examples of hybrids)\n- -_kaji_ ‘agentive noun’, e.g. _toktok_-_kaji_ (talk-agentive) ‘recorder’, _mok_-_kaji_ ‘cigarette lighter’\n\n\n\n4 nominal suffixes affecting information structure\n\n- -_rni_ ‘only’, e.g. _leg_-_ta-rni_ (leg-locative-only) ‘right through his leg’\n- -_ma_ ‘topic’, e.g. _klif-nginyi-ma_ (cliff-ablative-topic) ‘off the cliff’, _mami_-_ngku-ma_ (mother-ergative-topic) ‘the mother (got)’\n- _-rla_ ‘focus’, e.g. _hiya_-_rla_ ‘here’\n- -_rayinyj_ ‘alone’ (no examples of hybrids, not treated by Meakins as belonging to this set of forms)\n\n\n\n2 proprietive/privative suffixes\n\n- -_yawung_ ‘proprietive’_,_ e.g. _motika-yawung_ ‘their car’, _femli-yawung_ ‘his family’\n- -_murlung_ ‘privative adjectivizer’, e.g. _kuloj_-_murlung_ ‘naked’\n\n\n\n2 non-interrelated suffixes\n\n- -_kari_ ‘another’, e.g. _mor_-_kari_ ‘more’, _najan-kari_ ‘another’\n- -_k_, -_pijik_ ‘inchoative, attaching to nouns and verbs’ (no examples of hybrids)	\N	4	3	Australia	\N	\N	18	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
3	{}	4	Russian affixes in Copper Island Aleut	Information and examples are from [Golovko and Vakhtin ](sources.bib?label=Golovko+and+Vakhtin+#cldf:golovko1990a)([1990](sources.bib?label=1990#cldf:golovko1990a)) and [Sekerina ](sources.bib?label=Sekerina+#cldf:sekerina1994a)([1994](sources.bib?label=1994#cldf:sekerina1994a):22–29), the most complete descriptions and the only ones available in English. Some additional, and partially alternative, description is given by [Thomason ](sources.bib?label=Thomason+#cldf:thomason1997a)([1997](sources.bib?label=1997#cldf:thomason1997a)). The situation may be summarized as follows: “the derivational and nominal inflection system of CIA ［i.e. Copper Island Aleut, FS］ is entirely of Aleut origin, but the verbal inflectional system is that of Russian” ([Sekerina 1994](sources.bib?label=Sekerina+1994#cldf:sekerina1994a):22). A total of 15 borrowed affixes are productively used on native stems.\n\n\n6 present tense subject suffixes ([Golovko and Vakhtin 1990](sources.bib?label=Golovko+and+Vakhtin+1990#cldf:golovko1990a):98, 104, 107–112; [Sekerina 1994](sources.bib?label=Sekerina+1994#cldf:sekerina1994a):22–29)\n\n- -_yu_ ‘first singular’, e.g. _qɑ̄=yu_ ‘I eat’, _sū=yu_ ‘I take’\n- _-iŝ_ ‘second singular’, e.g. _qɑ̄=iŝ_ ‘you eat’, _sū=iŝ_ ‘you take’\n- _-it_ ‘third singular’, e.g. _qɑ̄=it_ ‘he/she/it eats’, _sū=it_ ‘he/she/it takes’, _cali=it_ ‘he fishes’\n- _-im_ ‘first plural’, e.g. _qɑ̄=im_ ‘we eat’, _sū=im_ ‘we take’\n- _-iti_ ‘second plural’, e.g. _qɑ̄=iti_ ‘you (pl) eat’, _sū=iti_ ‘you (pl) take’\n- _-yut ~ -yat_ ‘third plural’, e.g. _qɑ̄=yut_ ‘they eat’, _sū=yut_ ‘they take’\n\n\n\n6 past tense inflectional suffixes ([Sekerina 1994](sources.bib?label=Sekerina+1994#cldf:sekerina1994a):22–29; [Golovko and Vakhtin 1990](sources.bib?label=Golovko+and+Vakhtin+1990#cldf:golovko1990a):108)\n\n- _-l_ ‘past tense’, e.g. _ukuxtɑ̄=l_ ‘he saw’, _ayxacɑ̄=l=a=ya_ ‘I started’, _ayxɑ̄=l=ya_ ‘I travelled’, _ukuxtɑ̄=l=i_ ‘they saw’, _sū=l_ ‘he took’, _sū=l=i_ ‘they took’\n- _-i_ ‘past plural’, e.g. _anĝaĝí=l=i=mi_ ‘we lived’, _ú=l=i=mi_ ‘we were’, _ukuxtɑ̄=l=i_ ‘they saw’, _sū=l_ ‘he took’, _sū=l=i_ ‘they took’\n- _-ya_ ‘first singular’, e.g. _ayxacɑ̄=l=a=ya_ ‘I started’, _ayxɑ̄=l=ya_ ‘I travelled’, _ukuxtɑ̄=l_ ‘he saw’\n- _-ti_ ‘second singular’, e.g. _mɑ̄=l=ti_ ‘you did’,\n- _-mi_ ‘first plural’, e.g. _anĝaĝí=l=i=mi_ ‘we lived’, _ú=l=i=mi_ ‘we were’\n- _-vi_ ‘second plural’ (no examples of hybrids)\n\n\n(third person is unmarked)\n\n\n1 optional subject feminine gender suffix ([Golovko and Vakhtin 1990](sources.bib?label=Golovko+and+Vakhtin+1990#cldf:golovko1990a):108–109)\n\n- _-a_, used after the borrowed past tense marker _-l_, e.g. _ayxacɑ̄=l=a=ya_ ‘I started’\n\n\n\n1 infinitive marker\n\n- _-t’_ ‘infinitive’, suffixed to main verbs for plural formation which combine with a borrowed auxiliary, e.g. _taana ni-buud-ish ukuu-t’_ ‘You won’t see the land’ ([Sekerina 1994](sources.bib?label=Sekerina+1994#cldf:sekerina1994a):25). This marker may be considered part of finite verbal inflection and thus as being morphosyntactically related to the other morphology.\n\n\n\n1 negative verbal prefix ([Golovko and Vakhtin 1990](sources.bib?label=Golovko+and+Vakhtin+1990#cldf:golovko1990a):102, 104, 109)\n\n- _ni_- ‘negative’, e.g. _ni=túta=qaĝī=l_ ‘he would not listen’, _ni=sūy_ ‘don’t take!’	\N	6	5	Eurasia	\N	\N	15	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
4	{}	5	Mongolian affixes in Sakha	Information and examples are from [Pakendorf ](sources.bib?label=Pakendorf+#cldf:pakendorf2010a)([2010](sources.bib?label=2010#cldf:pakendorf2010a)). [Pakendorf ](sources.bib?label=Pakendorf+#cldf:pakendorf2010a)([2010](sources.bib?label=2010#cldf:pakendorf2010a)) analyzes data from [Kałużyński ](sources.bib?label=Ka%C5%82u%C5%BCy%C5%84ski+#cldf:ka1962a)([1962](sources.bib?label=1962#cldf:ka1962a)), [Korkina et al. ](sources.bib?label=Korkina+et+al.+#cldf:korkina1982a)([1982](sources.bib?label=1982#cldf:korkina1982a)) and from her own corpus and elicited data. She concludes that there are 14 affixes borrowed from Mongolic languages that are “currently still relatively productive” and used on native Turkic stems. A few other borrowed affixes are attested, but these are “previously productive, or marginally productive”. The following 14 are the ones that [Pakendorf ](sources.bib?label=Pakendorf+#cldf:pakendorf2010a)([2010](sources.bib?label=2010#cldf:pakendorf2010a)) characterizes as “currently still relatively productive” (see also [Pakendorf ](sources.bib?label=Pakendorf+#cldf:pakendorf2012a)([2012](sources.bib?label=2012#cldf:pakendorf2012a)). (Note, however, that Pakendorf counts more borrowed affixes because she accepts [Korkina et al.’s ](sources.bib?label=Korkina+et+al.%E2%80%99s+#cldf:korkina1982a)([1982](sources.bib?label=1982#cldf:korkina1982a)) claim that other affixes are productive, while these are not attested as hybrid formations).\n\n\n5 deverbal nominalizers\n\n- -_AːččI_ (also functions as habitual marker), e.g. _tut-aːččï_ ‘(he) build (it)’\n- -_AːhIn_, e.g. _ottoː-hun_ ‘the hay-making’\n- -_BIl_, e.g. _öröbül_ ‘Sunday’ (from _öröː-_ ‘to rest a day’)\n- -_lAŋ_, e.g. _kisteleŋ_ ‘secret’ (from _kisteː_- ‘hide’)\n- -_ltA_, e.g. _terilte_ ‘organization’ (from _terij_- ‘equip, organize’)\n\n\n\n4 deverbal adjectivizers\n\n- -_GAj_, e.g. _bïtarχaj_ ‘small’ (from _bïtarïj_- ‘crumble, smash, pulverize’)\n- -_ɣAr/-gIr_, e.g. _laspaɣar_ ‘broad’ (from _laspaj_- ‘be/seem too broad and fleshy’)\n- _-(I)mtAɣaj_, no attestations in Pakendorf’s corpus, but ‘productive’ according to ([Kałużyński 1962](sources.bib?label=Ka%C5%82u%C5%BCy%C5%84ski+1962#cldf:ka1962a):92; [Korkina et al. 1982](sources.bib?label=Korkina+et+al.+1982#cldf:korkina1982a):165)\n- -_mtIA_, no attestations in Pakendorf’s corpus, but nevertheless “mainly found with Turkic stems” ([Pakendorf 2010](sources.bib?label=Pakendorf+2010#cldf:pakendorf2010a)), and “relatively productive” according to [Korkina et al. ](sources.bib?label=Korkina+et+al.+#cldf:korkina1982a)([1982](sources.bib?label=1982#cldf:korkina1982a):165)\n\n\n\n5 non-interrelated suffixes\n\n- -_rɣAː_ ‘verbalizer’, e.g. _küːhürgeː_ ‘consider oneself strong’ (from _küːs_ ‘strength’)\n- -_TA_ ‘multiplicative derivative of numerals’, e.g. _biːr-diː-te_ ‘once’\n- _-(I)ččI_ ‘deverbal adverbializer’ (source form is a Mongolic imperfective converb), e.g. _ergičči_ ‘roundabout’ (from _ergij_- ‘return, turn around’)\n- -_t(tAr)_ ‘plural’, e.g. _ïaraχa-ttar_ ‘the heavy ones’\n- -_Aːt_: ‘immediate precedence converb’, e.g. _orgut-aːt_ ‘as soon as it boiled’	\N	8	7	Eurasia	\N	\N	14	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
5	{}	6	Romanian affixes in Kalderash Romani	Information and examples are from [Boretzky ](sources.bib?label=Boretzky+#cldf:boretzky1994a)([1994](sources.bib?label=1994#cldf:boretzky1994a)) and [Boretzky and Igla ](sources.bib?label=Boretzky+and+Igla+#cldf:boretzky1991a)([1991](sources.bib?label=1991#cldf:boretzky1991a)). Kalderash Romani has also borrowed morphemes from Greek and from various Slavic languages, but in each case fewer than from Romanian.\n\n\n1 adjectivizer\n\n- _-icios_, e.g. _kalits̆oso_ ‘blackish’\n\n\n\n1 diminutive\n\n- _-uljeco_ (and many phonologically related allomorphs), e.g. _foruljeco_ ‘little town’ (example from Kalderash spoken in Serbia)\n\n\n\n6 agent nouns/professions, including feminine\n\n- _-aš(i)_ (could be from Slavic languages), e.g. _tsir-aš_ ‘circus man’\n- _-tori_, e.g. _diilibatori_ ‘singer’\n- _-anka,_ e.g. _amerikánka_ ‘American woman’ (example from Kalderash of France)\n- _-àsa_, e.g. _amperacása_ ‘empress’ (example from Kalderash of France, _amperac-_ could also be Romanian)\n- _-ojka_ (no examples of hybrids)\n- _-twára_, e.g. _farmec̆twára_ ‘witch’ (example from Kalderash of France)\n\n\n\n1 ordinal number formation\n\n- _-leä_, e.g. _dúitoleä_ ‘for the second time’ (example from Kalderash of Sweden)\n\n\n\n1 indefinite pronoun formation prefix\n\n- _vare-_, e.g. _vareko_ ‘anybody’ (example from Kalderash spoken in Serbia)\n\n\n\n1 privative verbal derivational prefix\n\n- _des-_, e.g. _dezmekljol_ ‘melt’ (example from Kalderash spoken in Serbia)	\N	10	9	Eurasia	\N	\N	11	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
38	{}	70	Estonian affixes in Ingrian Finnish	Information and examples are from [Riionheimo ](sources.bib?label=Riionheimo+#cldf:riionheimo2002a)([2002](sources.bib?label=2002#cldf:riionheimo2002a); [2010](sources.bib?label=2010#cldf:riionheimo2010a)). Note that Finnish and Estonian are closely related.\n\n\n2 tense (and person) markers\n\n- _-p_ ‘third person present’, e.g. _maksa-a-p_ ‘it costs’, _istu-u-p_ ‘he sits’, _tullo-o-p_ ‘he comes’\n- _-si_ ‘past’, e.g. _ve-i-si-mme_ ‘we took’_, osta-si-it_ ‘they bought it’, _jouta-si-mme_ ‘we were in time’	\N	68	67	Eurasia	\N	\N	2	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
56	{}	101	Karrwa affixes in Kayardild	Information from Nicholas Evans (personal communication, February 2012).\n\n_-nganji_ ‘dear’ (applied to a relative) (no example of hybrid formation available).	\N	60	94	Australia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
6	{}	7	Sakha affixes in Sebjan-Küöl Ėven	Information and examples are from [Pakendorf ](sources.bib?label=Pakendorf+#cldf:pakendorf2012a)([2012](sources.bib?label=2012#cldf:pakendorf2012a)), see also [Pakendorf ](sources.bib?label=Pakendorf+#cldf:pakendorf2009a)([2009](sources.bib?label=2009#cldf:pakendorf2009a); [2010](sources.bib?label=2010#cldf:pakendorf2010a)), who counts fewer borrowed affixes because of adopting different criteria. The ones given here are all attested with native stems, even though examples of hybrid formations are only given for a few here. Note that there is some formal overlap in the person-number markers of the three different paradigms.\n\n\n4 mood markers\n\n- _-jAktAːk_ ‘necessitative’\n- _-dAg ~ -dAk_ ‘assertive’\n- _-A ~ -Ar_ ‘indicative present tense’, e.g. _ọrọn em-e-j-er_ (reindeer/come-epenthetic-connective-present.participle) ‘the reindeer are coming’\n- _-jAk ~ -jAːg_ ‘hypothetical mood’\n\n\n\n5 subject markers for necessitative mood and indicative mood (out of 6 such subject markers), combining with _-jAktAːk_ ‘necessitative’ and _-A ~ -Ar_ ‘indicative present tense’. Third person singular is unmarked.\n\n- _-pIn ~ -bIn_ ‘first singular’\n- _-kIn ~ -gIn_ ‘second singular’, e.g. _em-e-j-egin_ (come-epenthetic-connective-present.2sg) ‘you come’, _ọrọn em-e-j-er_ (reindeer/come-epenthetic-connective-present.participle) ‘the reindeer are coming’\n- _-pIt ~ -bIt_ ‘first plural’\n- _-kIt ~ -kI-hnAn_ ‘second plural’, e.g. _huː ọlọk ụtal-a-jaktaːkkịt_ (2pl/emphasis/understand-epenthetic-necessitative.2pl) ‘you have to understand’. (Note that the form _-hnAn_ used by one speaker on various occasions is native Ėven and that the borrowed element _-kIt_ is truncated in this form.)\n- _-llAr_ ‘third plural’ (Note that in the necessitative mood, native Ėven _-A-l_ ‘third plural’ is used.)\n\n\n\n5 subject markers for assertive mood (all 5 borrowed), combining with _-dAg ~ -dAk_ ‘assertive’. No second person plural form occurs in the corpus, since the assertive mood gives a strong nuance of emphasis to the assertion that would not be used with reference to the addressee.\n\n- _-Im_ ‘first singular’, e.g. _haː-j-bat bọl-lagịm_ (know-connective-negative/auxiliary-assertive.1sg) ‘I did not know’\n- _-Iŋ_ ‘second singular’, e.g. _neː-j-er bọl-lagịŋ_ (put-connective-present.participle/auxiliary-assertive.2sg) ‘you put (it)’\n- _-A_ ‘third singular’\n- _-pIt_ ‘first plural’\n- _-tArA_ ‘third plural’\n\n\n\n5 subject markers for hypothetical mood (all 5 borrowed), combining with _-jAk ~ -jAːg_ ‘hypothetical mood’. First and second person plural forms do not occur in the corpus.\n\n- _-pIn_ ‘first singular’\n- _-kIn_ ‘second singular’\n- _-In ~ -n_ (with deletion of final _-k_ of _-jAk_) ‘third singular’, e.g. _em-u-jen_ (come-causative-hypothetical.3sg) ‘(he) might bring’\n- _-tArIn_ ‘third plural’\n- _-kA_ ‘impersonal’\n\n\n\n1 non-interrelated suffix\n\n- -_Is_ ‘ordinal numeral formation marker’, e.g. _dig-is_ ‘forth’\n\n\nNote that two further Sakha affixes are found in the corpus, but only rarely occurring on Ėven stems, or in contexts where Sakha might be the matrix language, in which case Ėven words receive Sakha inflection. Therefore, they are not counted here. These are (i) -_An_ ‘perfective (sequential) converb’, e.g. _ič-e-j-en_ (see-epenthetic-connective-perfective.converb) ‘yes, they do see’; and (ii) -_BAt_ ‘negative present’, which stands in paradigmatic opposition to -_Ar_ ‘indicative present tense’, e.g. _haː-j-bat_ (know-connective-negative) ‘(I) did not know’.	\N	11	8	Eurasia	\N	\N	22	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
7	{}	8	Uzbek affixes in Northern Tajik	Information and examples are from [Doerfer ](sources.bib?label=Doerfer+#cldf:doerfer1967a)([1967](sources.bib?label=1967#cldf:doerfer1967a)), who mainly analyzes data from [Rastorgueva ](sources.bib?label=Rastorgueva+#cldf:rastorgueva1964a)([1964](sources.bib?label=1964#cldf:rastorgueva1964a)), see also [Boretzky ](sources.bib?label=Boretzky+#cldf:boretzky2004a)([2004](sources.bib?label=2004#cldf:boretzky2004a):1651). Information on the etymology of stems was provided by Don Stilo (personal communication 2013).\n\n\n2 nominalizers\n\n- _-či_ ‘agent noun’, e.g. _χizmat-či_ ‘servant’, “productive” according to [Doerfer ](sources.bib?label=Doerfer+#cldf:doerfer1967a)([1967](sources.bib?label=1967#cldf:doerfer1967a):54)\n- _-lik_ ‘abstract noun’, e.g. _χoǧa-lik_ ‘farm, estate’\n\n\n\n5 case suffixes (out of 6 Northern Tajik case suffixes). Some of the borrowed case markers seem to be used alternatively with native case markers, the genitive/accusative case is the only case for which there is only a native, and no borrowed case marker ([Doerfer 1967](sources.bib?label=Doerfer+1967#cldf:doerfer1967a):62).\n\n- _-ga_ ‘dative’, e.g. _χåna-ga_ ‘to the house’, used alternatively to _χåna-va_, with a native Persian case marker. _-ga_ is maybe only used with Persian verbs and nominalized verbs, but there is a clear tendency that it is on the rise ([Doerfer 1967](sources.bib?label=Doerfer+1967#cldf:doerfer1967a):62).\n- _-dan_ ‘ablative’, e.g. _yakom klasašdan_ (first/class-3sg.possessor-ablative) ‘from the first class/grade’ ([Doerfer 1967](sources.bib?label=Doerfer+1967#cldf:doerfer1967a):54)\n- _-nda_ ~ _-da_ ‘locative’, e.g. _inǧanda_ ‘here’ ([Doerfer 1967](sources.bib?label=Doerfer+1967#cldf:doerfer1967a):54)\n- _-gača_ ‘terminative’, e.g. _tå bist-u-haftom sål-gača_ ‘up to the 26th year’ ([Doerfer 1967](sources.bib?label=Doerfer+1967#cldf:doerfer1967a):54)\n- _-dak_ ‘equative/comparative’ ([Doerfer 1967](sources.bib?label=Doerfer+1967#cldf:doerfer1967a):16, 56), no examples given, but described as part of a borrowed paradigm of case markers ([Doerfer 1967](sources.bib?label=Doerfer+1967#cldf:doerfer1967a):62)\n\n\n\n2 derivational suffixes combining with numerals\n\n- _-gina_ ‘quantitative limiter’, e.g. _yak som-gina_ ‘one Ruble more ［e.g. more expensive, cheaper］’\n- _-la_, _-lamiš_ ‘collective numeral formation’, e.g. _duttalamå_ ‘both of us’, _čårtalamiš_ ‘(with) all four’\n\n\n\n2 suffixes not related to other borrowed morphology\n\n- _-ča_ ‘adverbializer’, e.g. _urus-ča_ ‘in Russian’\n- _-råq_ ‘comparative’, used together with the native Tajik comparative suffix, e.g. _tez-tar-råq_ or _tez-råq-tar_ ‘faster’\n\n\n[Doerfer ](sources.bib?label=Doerfer+#cldf:doerfer1967a)([1967](sources.bib?label=1967#cldf:doerfer1967a):18, 19, 25, 39, 56) mentions four other cases of morphological borrowing. They are not counted here for the following reasons: First, two of these appear to be free forms, although maybe derived from Turkic affixes: _ikin_ ‘dubitative’ and _či_ ‘emotional particle’. Second, the remaining two markers are explicitly described as combining only with Turkic stems: _inči_ ‘ordinal number formation’ and _miš_ ‘verbal noun formation’.	\N	13	12	Eurasia	\N	\N	11	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
8	{}	10	Sanskrit affixes in Indonesian	Information and examples are from [Jones ](sources.bib?label=Jones+#cldf:jones1984a)([1984](sources.bib?label=1984#cldf:jones1984a)), [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a)), [Tadmor ](sources.bib?label=Tadmor+#cldf:tadmor2009a)([2009](sources.bib?label=2009#cldf:tadmor2009a)), and personal communication with Uri Tadmor, David Gil, John Bowden, and a number of Indonesians working at the Jakarta Field Station of the Max Planck Institute for Evolutionary Anthropology in 2011, additionally supplemented with a number of hybrid formations and etymological details from Wiktionary (https://en.wiktionary.org/, accessed: 18.06.2024]). [Jones ](sources.bib?label=Jones+#cldf:jones1984a)([1984](sources.bib?label=1984#cldf:jones1984a):7) states that “some half dozen affixes derived from Sanskrit are productive; most have come into vogue within the last few decades”. All of these are also mentioned by [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a):20–21), who gives many more. Below, only affixes that are attested in hybrid formations, i.e. with non-Sanskrit stems, are given.\n\n\n16 miscellaneous nominal prefixes with non-Sanskrit stems are attested (most of them native Indonesian, some from Javanese)\n\n- _adi_- ‘super’, according to [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a):20–21) an affix of Sanskrit origin, compatible with native Indonesian stems, e.g. _adibintang_ (_bintang_ ‘star’) ‘superstar’, _adipenghantar_ (_penghantar_ ‘conductor’) ‘superconductor’. It also combines with stems of other origins, e.g. _adikuasa_ (_kuasa_ ‘power’) ‘superpower’ (the stem is also borrowed from Sanskrit, but this noun was formed in Indonesian).\n- _antar_- ‘inter’, according to [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a):20–21) an affix of Sanskrit origin which has become productive according to [Jones ](sources.bib?label=Jones+#cldf:jones1984a)([1984](sources.bib?label=1984#cldf:jones1984a):7). It may be a free form rather than a prefix, e.g. _antar suku_ ‘intertribal’, _antar kelompok_ ‘inter-group’.\n- _catur_- ‘four’, according to [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a):20–21) an affix of Sanskrit origin, e.g. _caturwulan_ (_wulan_ ‘month’ is Javanese) ‘four monthly’.\n- _dwi_- ‘two’, according to [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a):20–21) an affix of Sanskrit origin, e.g. _dwihari_ (_hari_ ‘day’) ‘lasting two days, two-day’, _dwirumah_ (_rumah_ ‘house’) ‘dioecy’. It also combines with stems of non-native non-Sanskrit origin, showing that the prefix is productive, e.g. _dwifungsi_ (_fungsi_ ‘function’, from Dutch) ‘bifunctional’.\n- _eka_- ‘one’, according to [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a):20–21) an affix of Sanskrit origin, e.g. _eka bahasa_ ‘monolingual’ – the stem is Sanskrit, but the derivation was coined in Indonesian.\n- _maha_- ‘very (important person)’, according to [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a):20–21) an affix of Sanskrit origin, e.g. _mahabesar_ (_besar_ ‘big’) ‘almighty’. Aside from its use as a prefix, this form apparently also exists as a free form, e.g. _maha pelit_ (_pelit_ ‘stingy’) ‘very stingy’ (examples provided by Uri Tadmor, personal communication, 2011).\n- _nir_- ‘privative, without, free from’, e.g. _nirkabel_ (_kabel_ ‘cable’, stem probably Dutch-derived) ‘wireless’. Has become productive according to [Jones ](sources.bib?label=Jones+#cldf:jones1984a)([1984](sources.bib?label=1984#cldf:jones1984a):7). Another example is _nirlaba_ (_laba_ ‘profit’, Sanskrit-derived stem) ‘non-profit’, which was likely coined in Indonesian.\n- _pasca_- ‘post-, after’, e.g. _pascapanen_ (_panen_ ‘harvest’) ‘post-harvest’, _pascamakan_ (_makan_ ‘to eat’) ‘post-meal tea’. Also, there is at least one formation with a Sanskrit stem, though it was likely coined in Indonesian, e.g. _pasca sarjana_ ‘postgraduate’.\n- _pra_- ‘pre’, only a few words are formed with this and other affixes, which are part of the learned vocabulary, according to [Mueller ](sources.bib?label=Mueller+#cldf:mueller2007a)([2007](sources.bib?label=2007#cldf:mueller2007a):1220). According to [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a):20–21), it is an affix of Sanskrit origin and has become productive on native stems ([Jones 1984](sources.bib?label=Jones+1984#cldf:jones1984a):7), e.g. _prabayar_ ‘prepaid’ (among others), and on Sanskrit-derived stems, e.g. _pra sarjana_ ‘undergraduate’.\n- _purna_- ‘after’, according to [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a):20–21) an affix of Sanskrit origin, e.g. _purna jual_ (_jual_ ‘sale’) ‘after sales service’, _purnajabatan_ (_jabatan_ ‘position, post, function’) ‘previous position’.\n- _sapta_- ‘seven’, according to [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a):20–21) an affix of Sanskrit origin, e.g. _sapta pesona_ (_pesona_ ‘charm’ of uncertain origin) ‘having seven charms’.\n- _serba_- ‘various’, according to [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a):20–21) an affix of Sanskrit origin, which has become productive according to [Jones ](sources.bib?label=Jones+#cldf:jones1984a)([1984](sources.bib?label=1984#cldf:jones1984a):7), e.g. _serba ada_ (_ada_ ‘to have, exist’) ‘having everything’, _serba salah_ (_salah_ ‘wrong’) ‘always wrong’ (examples provided by Uri Tadmor, personal communication, 2011).\n- _swa_- ‘self’, according to [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a):20–21) an affix of Sanskrit origin, which has become productive according to [Jones ](sources.bib?label=Jones+#cldf:jones1984a)([1984](sources.bib?label=1984#cldf:jones1984a):7), e.g. _swabakar_ (_bakar_ ‘to burn’) ‘self-immolate’, _swalayan_ (_layan(an)_ ‘service’) ‘supermarket, literally self-service’.\n- _tata_- ‘order, arrangement’, has become productive according to [Jones ](sources.bib?label=Jones+#cldf:jones1984a)([1984](sources.bib?label=1984#cldf:jones1984a):7), being attested with native stems e.g., _tata ruang_ ‘interior’. It is also found with other foreign non-Sanskrit stems, e.g. _tata tertib_ ‘law and order’, and likewise with Sanskrit-derived stems in what seem to be neologisms coined in Indonesian, e.g. _tata boga_ ‘table manners’.\n- _tri_- ‘three’, e.g. _triwulan_ (_wulan_ ‘month’ from Javanese) ‘three monthly’, _triwarna_ (_warna_ ‘color’ from Sanskrit) ‘three colors’. According to [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a):20–21) this affix is of Sanskrit origin.\n- _tuna_- ‘struck, hurt, cut’, according to [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a):20–21) an affix of Sanskrit origin, e.g. _tunarungu_ (_rungu_ ‘to hear’, from Javanese) ‘deaf’ (example provided by Uri Tadmor, personal communication, 2011).\n\n\n\n2 agent or profession noun derivational suffixes\n\n- -_wan_ ‘masculine agent or profession noun’, reasonably common according to [Mueller ](sources.bib?label=Mueller+#cldf:mueller2007a)([2007](sources.bib?label=2007#cldf:mueller2007a):1220) and [Jones ](sources.bib?label=Jones+#cldf:jones1984a)([1984](sources.bib?label=1984#cldf:jones1984a):7), it is also mentioned by [Tadmor ](sources.bib?label=Tadmor+#cldf:tadmor2009a)([2009](sources.bib?label=2009#cldf:tadmor2009a):705), e.g. _peragawan_ (_peraga_ ‘display’) ‘male model’, _rimbawan_ (_rimba_ ‘jungle’) ‘forester’. It is also attested with non-native non-Sanskrit stems, e.g. _kamerawan_ (_kamera_ ‘camera’) ‘male cameraman’. According to [Mueller ](sources.bib?label=Mueller+#cldf:mueller2007a)([2007](sources.bib?label=2007#cldf:mueller2007a):1220), -_man_ is an allomorph of -_wan._\n- -_wati_ ‘feminine agent or profession noun’, reasonably common according to [Mueller ](sources.bib?label=Mueller+#cldf:mueller2007a)([2007](sources.bib?label=2007#cldf:mueller2007a):1220) and [Jones ](sources.bib?label=Jones+#cldf:jones1984a)([1984](sources.bib?label=1984#cldf:jones1984a):7), also mentioned by [Tadmor ](sources.bib?label=Tadmor+#cldf:tadmor2009a)([2009](sources.bib?label=2009#cldf:tadmor2009a):705), e.g. _peragawati_ ‘female model’, _kamerawati_ ‘female cameraman’.	\N	15	14	Papunesia	\N	\N	18	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
9	{}	11	Sakha affixes in Uchur Ėvenki	Information and examples are from [Malchukov ](sources.bib?label=Malchukov+#cldf:malchukov2006a)([2006](sources.bib?label=2006#cldf:malchukov2006a)), who cites [Myreeva ](sources.bib?label=Myreeva+#cldf:myreeva1964a)([1964](sources.bib?label=1964#cldf:myreeva1964a)), see also [Malchukov ](sources.bib?label=Malchukov+#cldf:malchukov2003a)([2003](sources.bib?label=2003#cldf:malchukov2003a)).\n\n\n1 hypothetical mood marker\n\n- _-dax_ ‘hypothetical mood’ (this form is part of the complex marker _-r.dax-_, a combination of the native Evenki present tense marker -_r(a)_- with the Sakha hypothetical mood in -_tax_-), e.g. _waa-r.dag-im_ ‘I must have killed’, _waa-r.dag-a_ ‘he/she/it must have killed’\n\n\n\n6 person subject markers (all 6 borrowed) used only in combination with the hypothetical mood marker\n\n- _-im_ ‘first singular’, e.g. _waa-r.dag-im_ ‘I must have killed’, _waa-r.dag-a_ ‘he/she/it must have killed’\n- _-iŋ_ ‘second singular’, e.g. _waa-r.dag-iŋ_ ‘you (sg.) must have killed’\n- _-a_ ‘third singular’, e.g. _waa-r.dag-a_ ‘he/she/it must have killed’\n- _-put_ ‘first plural’, e.g. _waa-r.dak-put_ ‘we must have killed’\n- _-kit_ ‘second plural’, e.g. _waa-r.dak-kit_ ‘you (pl) must have killed’, _suu gorolli-r.dak-kit_ (you.nominative/far_away_go-probability-2pl) ‘you (pl) must have gone far away’\n- _-tara_ ‘third plural’, e.g. _waa-r.dak-tara_ ‘they must have killed’\n\n\n\n1 ordinal number-forming suffix\n\n- _-s_ ‘ordinal numeral derivation’, which is used in addition to a native derivational marker _-i(s)_, e.g. _d’uur-i-s_ ‘second’ (from _d’uur_ ‘two’)\n\n\nMalchukov (personal communication 2011) notes that the hypothetical mood marker is a “recently grammaticalized auxiliary verb, which explains why it comes with its own inflectional morphology.”	\N	16	8	Eurasia	\N	\N	8	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
10	{}	12	Norman French affixes in Middle English	Information and examples are from [Dalton-Puffer ](sources.bib?label=Dalton-Puffer+#cldf:dalton_puffer1996a)([1996](sources.bib?label=1996#cldf:dalton_puffer1996a)), see also [Ciszek ](sources.bib?label=Ciszek+#cldf:ciszek2008a)([2008](sources.bib?label=2008#cldf:ciszek2008a)) and [Palmer ](sources.bib?label=Palmer+#cldf:palmer2009a)([2009](sources.bib?label=2009#cldf:palmer2009a)). Thanks to Sarah Menzel for help with the analysis. There are 8 derivational suffixes that are used on at least some Germanic stems in Middle English already (there are 10 others that are only attested in combination with Romance stems in Middle English and therefore not counted here).\n\n\n4 abstract noun formation\n\n- _-age_ ‘abstract noun’_,_ e.g_. bondage_\n- _-erie_ ‘abstract noun’_,_ e.g. _aldermanrie, husbondrie, loselry, outlawerie_\n- _-ite_ ‘abstract noun’_,_ e.g. _scantetee_\n- _-ment_ ‘abstract noun’, e.g. _garnement_\n\n\n\n3 concrete noun formation\n\n- _-ard_ ‘concrete noun’_,_ e.g_. niggard, dotard_\n- _-esse_ ‘concrete noun’_,_ e.g. _hunteresse_\n- _-our_ ‘concrete noun’, e.g. _worshippour, harpour_\n\n\n\n1 adjectivizer\n\n- _-able_ ‘adjectivizer’, e.g. _spekable, knowable_	\N	18	17	Eurasia	\N	\N	8	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
63	{}	112	Yucuna and Cabiyarí affixes in Carapana, Tatuyo, Wáimaja, and Yurutí	Information and examples are from [Metzger ](sources.bib?label=Metzger+#cldf:metzger1998a)([1998](sources.bib?label=1998#cldf:metzger1998a)). This form also exists in a number of other South American languages, but the borrowing scenario for the Eastern Tucanoan languages Carapana, Tatuyo, Wáimaja, and Yurutí is quite clear: no other Eastern Tucanoan languages have it, but it is old in Arawakan. Examples below are from Carapana.\n\n\n1 multifunctional prefix\n\n- _ka-_ ‘deictic specifier or marker of specificity’, e.g. _ka-pakɨ_ ‘the/that father (the one referred to previously)’, _ka-bero_ ‘after the/that time (the time referred to previously)’	\N	104	103	South America	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
11	{}	13	Visayan affixes in Chabacano	Information and examples are from [Steinkrüger ](sources.bib?label=Steinkr%C3%BCger+#cldf:steinkrueger2003a)([2003](sources.bib?label=2003#cldf:steinkrueger2003a)), see also [Steinkrüger &amp; Seifart ](sources.bib?label=Steinkr%C3%BCger+%26+Seifart+#cldf:steinkrueger2009a)([2009](sources.bib?label=2009#cldf:steinkrueger2009a)) and [Seifart ](sources.bib?label=Seifart+#cldf:seifart2015a)([2015](sources.bib?label=2015#cldf:seifart2015a)).\n\n\n2 adjectivizer prefixes\n\n- _ma-_ ‘adjectivizer’, e.g. _ma-pyédra_ ‘stony, full of stones’\n- _maka-_ ‘adjectivizer, cause the state or event denoted by the root’, e.g. _maka-myédo_ ‘dreadful, scary’, _makarisa_ ‘funny’\n\n\n\n2 verbalizer prefixes\n\n- _man-_ ‘verbalizer’_,_ e.g. _man-amígo_ ‘to be(come) friends’\n- _pa-_ ‘verbalizer’, e.g. _pa-alísto_ ‘test each other’s skills’\n\n\n\n1 reciprocal/locative suffix, which in its reciprocal meaning is used in combination with a borrowed verbalizer prefix, and which is therefore considered to be syntagmatically related to that prefix\n\n- _-an, -han_ ‘reciprocal/locative’, e.g. _man-kwénto-han_ ‘to tell each other’, _tubu-han_ ‘sugar cane field’\n\n\n\n3 non-interrelated affixes\n\n- _-hin ~ -in_ ‘adjectivizer’, e.g. _myedú-hin_ ‘easily frightened’, _asmá-hin_ ‘asthmatic’\n- _paka-_ ‘nominalizer’, e.g. _paka-alísto_ ‘talent’\n- _ika-_ ‘ordinal number formation’, e.g. _ika-dos_ ‘second’, _ika-síngko_ ‘fifth’.	\N	20	19	Papunesia	\N	\N	8	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
12	{}	14	Tigre affixes in Bilin	Information and examples are from [Appleyard ](sources.bib?label=Appleyard+#cldf:appleyard2007a)([2007](sources.bib?label=2007#cldf:appleyard2007a)). Bilin has borrowed an entire set of object markers from Tigre: “Alone among the Agaw languages, Bilin also has a set of object suffix pronouns added to the verb. Both the construction and the form themselves are borrowed directly from Tigre even to the extent that as in Tigre the 2nd person distinguishes masculine and feminine, a contrast that is not made in Bilin elsewhere, neither in the independent pronoun nor in the subject marking of the verb” ([Appleyard 2007](sources.bib?label=Appleyard+2007#cldf:appleyard2007a):491).\n\n\n8 borrowed object markers\n\n- _-law_ ‘first singular object’\n- _-ka_ ‘second singular masculine object’\n- _-ki_ ‘second singular feminine object’\n- _-lu_ ‘third singular masculine object’\n- _-la_ ‘third singular feminine object’\n- _-na_ ‘first plural object’\n- _-kum_ ‘second plural object’\n- _-lom_ ‘third plural object’\n\n\nThese forms are also attested in [Reinisch ](sources.bib?label=Reinisch+#cldf:reinisch1882a)([1882](sources.bib?label=1882#cldf:reinisch1882a)), who did not recognize them as borrowed though. [Reinisch ](sources.bib?label=Reinisch+#cldf:reinisch1882a)([1882](sources.bib?label=1882#cldf:reinisch1882a):38) also gives forms that distinguish gender in the third person plural (masc. _-lom_, fem. _-län_), which do not appear in [Hamde’s ](sources.bib?label=Hamde%E2%80%99s+#cldf:hamde1986a)([1986](sources.bib?label=1986#cldf:hamde1986a)) grammar as noted by [Appleyard ](sources.bib?label=Appleyard+#cldf:appleyard2007a)([2007](sources.bib?label=2007#cldf:appleyard2007a)). [Hamde ](sources.bib?label=Hamde+#cldf:hamde1986a)([1986](sources.bib?label=1986#cldf:hamde1986a):33, 49–54, 93–94) gives the same forms as [Appleyard ](sources.bib?label=Appleyard+#cldf:appleyard2007a)([2007](sources.bib?label=2007#cldf:appleyard2007a)), without, however, a clear explanation of their function and distribution. [Hamde ](sources.bib?label=Hamde+#cldf:hamde1986a)([1986](sources.bib?label=1986#cldf:hamde1986a):48–52) mentions that suffixes are borrowed from Tigre and notes that “we cannot escape the fact that Tigre is invading Bilin through such grammatical explainable aspects of the grammar” ([Hamde 1986](sources.bib?label=Hamde+1986#cldf:hamde1986a):51), without giving further details. [Hamde ](sources.bib?label=Hamde+#cldf:hamde1986a)([1986](sources.bib?label=1986#cldf:hamde1986a):51–52) mentions two “prefixes and phrases” that would be borrowed from Tigre, one would be a verbal prefix (although written separately) translated as “as, that, is as” ([Hamde 1986](sources.bib?label=Hamde+1986#cldf:hamde1986a):51), another is apparently a nominal derivational element, translated as “mismal, improper” (also written separately). [Hamde ](sources.bib?label=Hamde+#cldf:hamde1986a)([1986](sources.bib?label=1986#cldf:hamde1986a)) dismisses both as incorrect forms. It seems that both can be treated as borrowed lexical elements or maybe as particles. Neither [Appleyard ](sources.bib?label=Appleyard+#cldf:appleyard2007a)([2007](sources.bib?label=2007#cldf:appleyard2007a)) nor [Hamde ](sources.bib?label=Hamde+#cldf:hamde1986a)([1986](sources.bib?label=1986#cldf:hamde1986a)) give examples of hybrid formation. However, since these forms are apparently obligatory, inflectional object markers, and there is no indication that all transitive verbs would be borrowed from Tigre, it is safe to assume that they give rise to hybrid formations.	\N	22	21	Africa	\N	\N	8	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
13	{}	15	Bosnian/Croatian/Serbian affixes in Albanian	Information and examples are from [Xhuvani and Çabej ](sources.bib?label=Xhuvani+and+%C3%87abej+#cldf:xhuvani1962a)([1962](sources.bib?label=1962#cldf:xhuvani1962a)), [Demiraj ](sources.bib?label=Demiraj+#cldf:demiraj1988a)([1988](sources.bib?label=1988#cldf:demiraj1988a):122–123), [Svane ](sources.bib?label=Svane+#cldf:svane1992a)([1992](sources.bib?label=1992#cldf:svane1992a):290), [Orel ](sources.bib?label=Orel+#cldf:orel1998a)([1998](sources.bib?label=1998#cldf:orel1998a)), [Boretzky ](sources.bib?label=Boretzky+#cldf:boretzky2004a)([2004](sources.bib?label=2004#cldf:boretzky2004a):1647), and Johanna Nichols (personal communication 14.7.2011). Examples were compiled by Lisa Morgenroth, some additional translation by Suzana Dibrani.\n\n\n5 gender or declension class differentiated suffixes that form masculine nouns and adjectives\n\n- _-ac_ ［ats］ ‘adjectivizer’ ([Boretzky 2004](sources.bib?label=Boretzky+2004#cldf:boretzky2004a):1647; [Demiraj 1988](sources.bib?label=Demiraj+1988#cldf:demiraj1988a):122)_,_ e.g. _sqepac_ ‘beak-shaped’ (from _sqep_ ‘beak’), _thumbac_ ‘metal tip of a goad’ (from _thumb_ ‘thorn’), _dorac_ ‘one-handed’ (from _dorë_ ‘hand’)\n- _-aç_ ［atʃ］ ‘nominal derivation’ ([Boretzky 2004](sources.bib?label=Boretzky+2004#cldf:boretzky2004a):1647; [Svane 1992](sources.bib?label=Svane+1992#cldf:svane1992a):290), e.g. _biraç_ ‘wall niche next to the hearth’ (from _birë_ ‘hole’), _gjembaç_ ‘thistle, sharp spine’ (from _gjemb_ ‘thorn’), _kungullaç_ ‘unripe, immature’ (from _kungull_ ‘marrow, pumpkin, bottle’)\n- _-ak_ ［ak］ ‘nominal derivation’ ([Boretzky 2004](sources.bib?label=Boretzky+2004#cldf:boretzky2004a):1647), e.g. _dorak_ ‘handle’ (from _dorë_ ‘hand’), _fytak_ ‘small wooden jug with a spout’ (from _fyt_ ‘throat, gullet’), _pishak_ ‘thick pine tree, stump’ (from _pishë_ ‘pine’)\n- _-ash_ ‘adjectivizer’ ([Demiraj 1988](sources.bib?label=Demiraj+1988#cldf:demiraj1988a):122), e.g. _buzash_ ‘lips’ (from _buzë_ ‘end, edge’), _gjumash_ ‘sleepy’ (from _gjumë_ ‘sleep’), _jargash_ ‘slobbering, drooling’ (from _jargë_ ‘spit, phlegm’), _kromash_ ‘scabious’ (from _kromë_ ‘scabies, dogrose’)\n- _-avec_ ‘agent nominalizer’ ([Demiraj 1988](sources.bib?label=Demiraj+1988#cldf:demiraj1988a):122)_,_ e.g. _jargavec_ ‘slug, slobbering’ (from _jargë_ ‘spit, phlegm’), _ligavec_ ‘slug, sniveling coward’ (from _lig_ ‘evil, cowardly’), _qullavec_ ‘person who is slow and clumsy’ (from _qull_ ‘porridge, get soaked, soggy’)\n\n\n\n3 gender or declension class differentiated suffixes that form masculine (-_ik_) and feminine (-_itsə_) nouns and adjectives\n\n- _-icë_ ［itsə］ ‘nominal derivation’ ([Boretzky 2004](sources.bib?label=Boretzky+2004#cldf:boretzky2004a):1647; [Svane 1992](sources.bib?label=Svane+1992#cldf:svane1992a):290; [Demiraj 1988](sources.bib?label=Demiraj+1988#cldf:demiraj1988a):123), e.g. _petkicë_ ‘small sized garment’ (from _petk_ ‘clothes’), _tulicë_ ‘tender meat’ (from _tul_ ‘meat, flesh’), _balticë_ ‘ground that gets muddy quickly’ (from _baltë_ ‘swamp, dirt’)\n- _-içë_ ‘nominal derivation or adjectivizer’, e.g. _hardhiçë_ ‘wall lizard’ (from _hardhucë_ ‘lizard’), _barkiç_ ‘potbellied’ (from _bark_ ‘belly, abdomen’), _guriçkë_ ‘small rock’ (from _gur_ ‘stone, rock’)\n- _-ik_ ［ik］ ‘nominal derivation or adjectivizer’ ([Boretzky 2004](sources.bib?label=Boretzky+2004#cldf:boretzky2004a):1647), e.g. _balik_ ‘animal with white spotted face or body’ (from _balë_ ‘badger’), _baltik_ ‘muddy, marshy’ (from _baltë_ ‘swamp, dirt’), _çapik_ ‘impudent, saucy’ (from _çap_ ‘to chew’)\n\n\n\n2 gender or declension class differentiated affixes that form masculine (_-iʃtə_) and feminine (_-inə_) nouns, often having to do with locations\n\n- _-inë_ ［inə］ ‘location noun derivation’ ([Boretzky 2004](sources.bib?label=Boretzky+2004#cldf:boretzky2004a):1647; [Svane 1992](sources.bib?label=Svane+1992#cldf:svane1992a):290; [Demiraj 1988](sources.bib?label=Demiraj+1988#cldf:demiraj1988a):123), e.g. _baltinë_ ‘muddy ground’ (from _baltë_ ‘swamp, dirt’), _botinë_ ‘swampland’ (from _botë_ ‘earth, world’), _djerrinë_ ‘wilderness, fallow land’ (from _djerr_ ‘to destroy’)\n- _-ishtë_ ［iʃtə］ ‘location noun derivation’ ([Boretzky 2004](sources.bib?label=Boretzky+2004#cldf:boretzky2004a):1647; [Svane 1992](sources.bib?label=Svane+1992#cldf:svane1992a):290; [Demiraj 1988](sources.bib?label=Demiraj+1988#cldf:demiraj1988a):123), e.g. _ahishtë_ ‘beech forest’ (from _ah_ ‘beech-tree’), _arrishtë_ ‘walnut grove’ (from _arrë_ ‘walnut tree’), _baltishtë_ ‘ground that gets muddy quickly’ (from _baltë_ ‘swamp, dirt’)\n\n\n\n3 other nominal suffixes\n\n- _-nik_ ‘nominal derivation’ ([Svane 1992](sources.bib?label=Svane+1992#cldf:svane1992a):290; [Demiraj 1988](sources.bib?label=Demiraj+1988#cldf:demiraj1988a):123), e.g. _danik_ ‘special purpose room’ (from _daj_ ‘to divide’), _drithnik_ ‘granary’ (from _drithë_ ‘grain’), _kohënik_ ‘contemporary’ (from _kohë_ ‘time’)\n- _-kë_ ‘nominal derivation’ ([Svane 1992](sources.bib?label=Svane+1992#cldf:svane1992a):290), e.g. _vickë_ ‘perverseness’ (from _vithe_ ‘crupper, ramp’), _veshkë_ ‘kidney’ (from _vesh_ ‘ear, vine’)\n- _-ar_ ‘nominal derivation’ ([Xhuvani and Çabej 1962](sources.bib?label=Xhuvani+and+%C3%87abej+1962#cldf:xhuvani1962a):18), e.g. _grunar_ ‘granary’ (from _grunë_ ‘wheat’), _lumare_ ‘riverbanks’ (from _lumë_ ‘river’)\n\n\n\n1 verbalizer\n\n- _-it_ ([Demiraj 1988](sources.bib?label=Demiraj+1988#cldf:demiraj1988a):123), e.g. _djersit_ ‘to sweat’ (from _djersë_ ‘perspiration’), _shoshit_ ‘to sift, screen, scan’ (from _shosh_ ‘to sift’)	\N	24	23	Eurasia	\N	\N	14	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
14	{}	16	Spanish affixes in Cajamarca Quechua	The description of morphological borrowing from Spanish into various Quechuan languages is from [Muysken ](sources.bib?label=Muysken+#cldf:muysken2012a)([2012](sources.bib?label=2012#cldf:muysken2012a)), who argues explicitly that these 7 suffixes are “part of a cluster of related processes, processes which almost operate in paradigmatic opposition” ([Muysken 2012](sources.bib?label=Muysken+2012#cldf:muysken2012a):485). Examples are taken directly from the sources that [Muysken ](sources.bib?label=Muysken+#cldf:muysken2012a)([2012](sources.bib?label=2012#cldf:muysken2012a)) cites for Cajamarca Quechua ([Quesada Castillo 1976a](sources.bib?label=Quesada+Castillo+1976a#cldf:castillo1976a); 1976b).\n\n\n7 derivational suffixes\n\n- _-dor_ ‘agentive, occupation noun’, e.g. _michidor_ ‘shepherd’, _awador_ ‘tailor’, _ampidor_ ‘medicine man’ ([Quesada Castillo 1976b](sources.bib?label=Quesada+Castillo+1976b#cldf:castillo1976b):102)\n- _-iru_ ‘agentive, occupation’, e.g. _yamtiru_ ‘firewood gatherer’ ([Quesada Castillo 1976a](sources.bib?label=Quesada+Castillo+1976a#cldf:castillo1976a):150, see also [Muysken 2012](sources.bib?label=Muysken+2012#cldf:muysken2012a):485, 491)\n- _-itu ~ -ita ­~ -situ ~ -sita_ ‘diminutive’, e.g. _pishqito_ ‘little bird’, _warmisita_ ‘little woman’, _wishita_ ‘little sheep’ ([Quesada Castillo 1976b](sources.bib?label=Quesada+Castillo+1976b#cldf:castillo1976b):105)\n- _-liju_ ‘adjectivizer/nominalizer’, e.g. _mancha-liju_ ‘easily scared’ ([Quesada Castillo 1976a](sources.bib?label=Quesada+Castillo+1976a#cldf:castillo1976a):60, see also [Muysken 2012](sources.bib?label=Muysken+2012#cldf:muysken2012a):487, 491)\n- _-linku_ ‘adjectivizer/nominalizer’, e.g. _wañu-inku_ ‘dying, moribund’ ([Quesada Castillo 1976a](sources.bib?label=Quesada+Castillo+1976a#cldf:castillo1976a):96, see also [Muysken 2012](sources.bib?label=Muysken+2012#cldf:muysken2012a):487, 491)\n- _-nyentu ~ -chintu ~ -lyentu_ ‘adjectivizer’, e.g. _mallaqnyentu_ ‘hungry’, _qeshyachintu_ ‘sickly’, _iskilyentu_ ‘having lice’ ([Quesada Castillo 1976b](sources.bib?label=Quesada+Castillo+1976b#cldf:castillo1976b):103)\n- _-likido_ ‘characterizing derivation’, e.g. _qallo-likidu_ (tongue-liquid) ‘liar, talker, gossiper’, _qalla-likidu_ (lazy-liquid) ‘lazy’, _usa-likidu_ (louse-liquid) ‘full of lice’ ([Quesada Castillo 1976a](sources.bib?label=Quesada+Castillo+1976a#cldf:castillo1976a):125, 168, 169, see also [Muysken 2012](sources.bib?label=Muysken+2012#cldf:muysken2012a):487, 491)	\N	26	25	South America	\N	\N	7	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
15	{}	17	Aymara affixes in Uru	Information and examples are from [Hannß ](sources.bib?label=Hann%C3%9F+#cldf:hannss2008a)([2008](sources.bib?label=2008#cldf:hannss2008a)) and Katja Hannß (personal communication, 2011).\n\n\n3 case markers (out of a paradigm of 9 case markers in Uru)\n\n- _-kama_ ‘terminative case’, e.g. _uskatan-kama_ (moment-terminative) ‘in a moment, in an instant’ ([Hannß 2008](sources.bib?label=Hann%C3%9F+2008#cldf:hannss2008a):173; citing [Métraux 1935](sources.bib?label=M%C3%A9traux+1935#cldf:m1935a):101)\n- -_taki_ ‘benefactive case’, e.g. _suni-taki_ ‘for the people’ ([Hannß 2008](sources.bib?label=Hann%C3%9F+2008#cldf:hannss2008a):176; citing [Muysken 2005](sources.bib?label=Muysken+2005#cldf:muysken2005a):73)\n- _-na_ ‘locative case’, e.g. _kʷas-na_ ‘into the water’ ([Hannß 2008](sources.bib?label=Hann%C3%9F+2008#cldf:hannss2008a):167; citing [Vellard 1967](sources.bib?label=Vellard+1967#cldf:vellard1967a):4)\n\n\n\n3 suffixes that are not interrelated\n\n- -_pača_ ‘intensifier’, e.g. _tonx pača_ ‘even today’ ([Hannß 2008](sources.bib?label=Hann%C3%9F+2008#cldf:hannss2008a):253; citing [Métraux 1935](sources.bib?label=M%C3%A9traux+1935#cldf:m1935a):91, 101)\n- _-naka_ ‘plural’, e.g. _suni-naka_ ‘the Uru people’ ([Hannß 2008](sources.bib?label=Hann%C3%9F+2008#cldf:hannss2008a):138; citing [Vellard 1967](sources.bib?label=Vellard+1967#cldf:vellard1967a):3), _tusa-naka_ ‘balsa rafts’ ([Hannß 2008](sources.bib?label=Hann%C3%9F+2008#cldf:hannss2008a):168; citing [Métraux 1935](sources.bib?label=M%C3%A9traux+1935#cldf:m1935a):99)\n- -_pini_ ‘affirmative clausal clitic’, e.g. _kustak-pini-ki_ (brother-affirmative-topic) ‘the truly older brother’ ([Hannß 2008](sources.bib?label=Hann%C3%9F+2008#cldf:hannss2008a):274; citing [Vellard 1967](sources.bib?label=Vellard+1967#cldf:vellard1967a):24), _yuk-pini_ ‘very many’ ([Hannß 2008](sources.bib?label=Hann%C3%9F+2008#cldf:hannss2008a):274; citing [Vellard 1967](sources.bib?label=Vellard+1967#cldf:vellard1967a):16)	\N	28	27	South America	\N	\N	6	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
16	{}	18	Russian affixes in Israeli Hebrew	Information and examples are from [Bolozky ](sources.bib?label=Bolozky+#cldf:bolozky1999a)([1999](sources.bib?label=1999#cldf:bolozky1999a)). The following six affixes are identified by Uri Tadmor (personal communication, 2011) as productive, and as having entered Hebrew from Russian, although they may be ultimately French, and may also exist in English, such as _-er_ (from French _-aire_). [Bolozky ](sources.bib?label=Bolozky+#cldf:bolozky1999a)([1999](sources.bib?label=1999#cldf:bolozky1999a)) studies in detail the productivity of these affixes (in dictionaries, corpora, and by means of a “productivity test” involving native speaker judgments), providing also information on the extent to which they are used on native stems. See also [Cohen and Laks ](sources.bib?label=Cohen+and+Laks+#cldf:cohen2012a)([2012](sources.bib?label=2012#cldf:cohen2012a)), who describe some of the same borrowed affixes.\n\n\n4 agent noun formation suffixes\n\n- _-nik_ ‘agent noun’, e.g. _núdnik_ ‘pest’, _kibúcnik_ ‘kibbutz member’, _klumnik_ ‘good-for-nothing’ ([Schwarzwald 1998](sources.bib?label=Schwarzwald+1998#cldf:schwarzwald1998a):271)\n- _-tšik_ ‘diminutive; doer’ _politírtšik_ ‘furniture polisher’ (from _politum_ ‘polish’), _xaltúrištšik_ ‘one who does side-jobs’ (_xaltúra_ ‘side-job, non-serious job’), _katántšik_ ‘tiny’ (from _katan_ ‘small’), _šaméntšik_ ‘chubby’ (from _samen_ ‘fat’)\n- _-ist_ ‘agent, activist’ ([Schwarzwald 1998](sources.bib?label=Schwarzwald+1998#cldf:schwarzwald1998a):271), see also ([Bolozky 2007](sources.bib?label=Bolozky+2007#cldf:bolozky2007a):299–300)\n- _-er_ ‘agent noun formation’, e.g. _širyoner_ ‘soldier in armor’ (from _širyon_ ‘armor’) ([Bolozky 1999](sources.bib?label=Bolozky+1999#cldf:bolozky1999a):199)\n\n\n\n2 abstract noun formation suffixes\n\n- -_ológya_ (according to Uri Tadmor only comically, such as _xupológya_ ‘marital-canopy studies’, _xoxmológya_ ‘smart-alec-ness’)\n- _-izm_, e.g. _bitxonízm_ ‘emphasis on security’, _bicu’izm_ ‘no-nonsense, hands-on approach’ ([Bolozky 1999](sources.bib?label=Bolozky+1999#cldf:bolozky1999a):111, 224)	\N	29	5	Eurasia	\N	\N	6	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
17	{}	19	Dutch affixes in Indonesian	Information and examples are drawn from [Jones ](sources.bib?label=Jones+#cldf:jones1984a)([1984](sources.bib?label=1984#cldf:jones1984a)), [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a)), [Tadmor ](sources.bib?label=Tadmor+#cldf:tadmor2009a)([2009](sources.bib?label=2009#cldf:tadmor2009a)), [Torchia and Djuhari ](sources.bib?label=Torchia+and+Djuhari+#cldf:torchia2011a)([2011](sources.bib?label=2011#cldf:torchia2011a)) and personal communications with Uri Tadmor, David Gil, John Bowden, and a number of Indonesians working at the Jakarta Field Station of the Max Planck Institute for Evolutionary Anthropology in 2011, supplemented with etymological information from Wiktionary (https://en.wiktionary.org/ ［accessed: 18.06.2024］) and internet searches. Only affixes that are attested in hybrid formations are given below. These include nouns with native Austronesian stems and borrowed stems that were likely borrowed before the commencement of Dutch influence.\n\n\n5 miscellaneous nominal derivation, also used on adjectives\n\n- _anti_- ‘anti’, e.g. _anti-kuman_ (_kuman_ ‘germ’) ‘anti-germ’, _anti nyamuk_ (_nyamuk_ ‘mosquito’) ‘anti-mosquito’, _anti-cewek_ (_cewek_ ‘girl’) ‘anti-girls’, _anti-cowok_ (_cowok_ ‘boy’) ‘anti-boys’, _anti aturan jam malam_ (_aturan jam malam_ ‘curfew’) ‘anti-curfew’. Much like in English, this affix can also be used as an independent morpheme modifying, for instance, a headless relative clause, as in _saya anti pemikiran Tessa_ ‘I’m against what Tessa thinks’, _Selebriti Anti Aturan Berkendara?_ ‘Celebrity against traffic regulations? (caption of a picture)’.\n- _eks-_ ‘former’, e.g. _eks pacar_ (_pacar_ ‘romantic partner’) ‘ex-girlfriend/boyfriend’, _eks tapol_ (_tapol_ ‘political prisoner’) ‘former political prisoner’. Possibly, _eks_ is an independent word.\n- _kontra_- ‘contra’, e.g. _kontra pendidikan gratis_ (_pendidikan gratis_ ‘free education’) ‘against free education’, also _kontraalami_ (_alami_ ‘natural’, Arabic stem) ‘unnatural’, _saya kontra dengan pemikiran Tessa_ ‘I’m against what Tessa thinks’. _Kontra_ may be an independent adverb rather than a prefix.\n- _pro-_ ‘pro’, e.g. _pro pendidikan seksualitas_ (_pendidikan seksualitas_ ‘sex education’) ‘pro-sex education’, _pro perkembangan_ (_perkembangan_ ‘growth’) ‘pro-growth’, _kamu pro atau anti pemikiran Tessa?_ ‘Are you for or against what Tessa thinks?’ As indicated by the spelling, this may also be a free-form word.\n- _sub_- ‘sub-, noun denoting a subordinate version of a noun’, e.g. _subbagian_ (_bagian_ ‘part’) ‘subpart’, _subpohon_ (_pohon_ ‘tree’) ‘subtree’.\n\n\n\n3 adjectivizing prefixes\n\n- _inter_- ‘inter-, forms adjectives from nouns’, e.g. _intersuku_ (_suku_ ‘tribe’) ‘inter-tribal’, _interkelompok_ (_kelompok_ ‘group’) ‘inter-group’.\n- _intra_- ‘intra-, forms adjectives from nouns’, e.g. _intrakelompok_ (_kelompok_ ‘group’) ‘intra-group’.\n- _non_- ‘negative, forms adjectives from nouns and predicates’, e.g. _nonlingkungan_ (_lingkungan_ ‘environment’) ‘non-environmental’, _nonmigas_ (_migas_ ‘fossil fuel’) ‘non-fossil fuel’, _nonmenarik_ (_menarik_ ‘interesting’) ‘non-interesting’.\n\n\n\n3 abstract noun forming suffixes\n\n- -_isme_ ‘abstract noun’, e.g. _caloisme_ (from _calo_ ‘agent or intermediary who negotiates government things on someone’s behalf’) ‘a mentality and system characterized by using the power of one’s position for personal gain’, _goblokisme_ (neologism, from _goblok_ ‘stupid’) ‘stupidity’, _jahatisme_ (_jahat_ ‘bad, evil’) ‘crime’, also _premanisme_ (from _preman_ ‘gangster’, a Dutch stem) ‘gangsterism’, a term most probably coined in Indonesian.\n- _-sasi_ ‘abstract noun’, e.g. _kondomi-sasi_ ‘spreading the use of condoms’, this example is also given by [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a):24). This suffix is probably not the same as _-isasi_. Its status as an affix is disputed by [de Vries ](sources.bib?label=de+Vries+#cldf:vries1984a)([1984](sources.bib?label=1984#cldf:vries1984a)), see also [Mueller ](sources.bib?label=Mueller+#cldf:mueller2007a)([2007](sources.bib?label=2007#cldf:mueller2007a):1220).\n- _-isasi_ ‘transformation’, e.g. _swastanisasi_ (_swasta_ ‘private business’) ‘privatization’, _kapurisasi_ ‘adding lime (calcium)’; in both examples, the stems are also borrowed from Sanskrit, but these nouns were formed in Indonesian. The complete form of this suffix is _-(n)isasi_ with _n_ occurring after vowel-final roots. Its status as a productive affix is argued for by [de Vries ](sources.bib?label=de+Vries+#cldf:vries1984a)([1984](sources.bib?label=1984#cldf:vries1984a)), see also [Mueller ](sources.bib?label=Mueller+#cldf:mueller2007a)([2007](sources.bib?label=2007#cldf:mueller2007a):1220). _bodohisasi_ (neologism from _bodoh_ ‘stupid’) ‘becoming stupid, stupidification’, _bungkamisasi_ (_bungkam_ ‘to hush or gag someone’, [Torchia and Djuhari 2011](sources.bib?label=Torchia+and+Djuhari+2011#cldf:torchia2011a):84) ‘efforts to keep someone mum about a scandal’.	\N	15	30	Papunesia	\N	\N	11	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
64	{}	113	Latin affixes in Basque	Information and examples are from [Segura Munguía and Etxebarria Ayesta ](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+#cldf:mungu1996a)([1996](sources.bib?label=1996#cldf:mungu1996a)) and [Hualde and Urbina ](sources.bib?label=Hualde+and+Urbina+#cldf:hualde2003)([2003](sources.bib?label=2003#cldf:hualde2003)). [Eliasson’s ](sources.bib?label=Eliasson%E2%80%99s+#cldf:eliasson2012a)([2012](sources.bib?label=2012#cldf:eliasson2012a)) detailed discussion of Romance influence on Basque contains a list of borrowed affixes that is largely consistent with the set of borrowed derivational affixes given here. Information on the borrowed participle marker is from [Eliasson ](sources.bib?label=Eliasson+#cldf:eliasson2012a)([2012](sources.bib?label=2012#cldf:eliasson2012a)), who refers to [Trask ](sources.bib?label=Trask+#cldf:trask1995a)([1995](sources.bib?label=1995#cldf:trask1995a)). See also [Haase ](sources.bib?label=Haase+#cldf:haase1992a)([1992](sources.bib?label=1992#cldf:haase1992a):48–51), who focuses on French and Gascon influence on the Basque variety of lower Navarra, and [Mujika ](sources.bib?label=Mujika+#cldf:mujika1982a)([1982](sources.bib?label=1982#cldf:mujika1982a)).\n\n\n2 diminutive suffixes\n\n- _-ila, -ilo_ ‘diminutive’, e.g. _neskatila_ ‘little girl’ (from _neska_ ‘girl’), _leihatila_ ‘little window’ (from _leiho_ ‘window’), _andrakila_ ‘doll’ (from _andra_ ‘woman’), _astokilo_ ‘little donkey’ (from _asto_ ‘donkey’), _gizonilo_ ‘little man’ (from _gizon_ ‘man’) ([Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):331; see also [Haase 1992](sources.bib?label=Haase+1992#cldf:haase1992a):49; [Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):84, 89)\n- _-(i)no, -(i)na, -(i)ño, -(i)ña, -ño_ ‘diminutive’, e.g. _emekiñio_ ‘very softly’ (from _emeki_ ‘softly’), _batño_ ‘a little one’ (from _bat_ ‘one’) ([Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):331; [Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):89)\n\n\n\n2 augmentative suffixes\n\n- _-nda_ ‘diminutive female’, e.g. _urdanda_ ~_urdanga_ ‘sow’ (from _urde_ ‘hog’), _oilanda_ ‘young hen’ (from _oilo_ ‘hen’) ([Trask 2003](sources.bib?label=Trask+2003#cldf:trask2003a):117; [Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):331)\n- _-ote_ ‘augmentative’, e.g. _lodikote_ ‘kind of fat’ (from _lodi_ ‘fat, thick’), _handikote_ ‘kind of big’ (from _handi_ ‘big’, cf. Sp _grandote_) ([Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):331)\n\n\n\n7 human noun derivation (occupation, inhabitant) suffixes\n\n- _-(l)ari, -kari, -tari ~ -lari_ ‘occupation, names of meals’ (from Latin _-arius_), e.g. _pelotari_ ‘ball player’ (from _pelota_ ‘ball’), _bertsolari_ ‘verse singer’ (from _bertso_ ‘poem’), _txistulari_ ‘flutist’ (from _txistu_ ‘flute’), _haizkolari_ ‘lumberjack’ (from _haizkora_ ‘ax’), _koblakari_ ‘bard’ (from _kobla_ ‘song’), _mendikari_ ‘climber’ (from _mendi_ ‘mountain’), _hizkuntzalari_ ‘linguist’ (from _hizkuntza_ ‘language’), _albokari_ ‘lateral’ (from _albo_ ‘side’), _sudurkari_ ‘nasal’ (from _sudur_ ‘nose’), _egunkari_ ‘newspaper’ (from _egun_ ‘day’), _aldizkari_ ‘magazine’ (from _aldiz_ ‘time’), _lehendakari_ ‘president’ (from _lehen_ ‘first’), _agintari_ ‘authority’ (from _agin(du)_ ‘order’), _gosari_ ‘breakfast’ (from _gose_ ‘hunger’), _bazkari_ ‘dinner’ (from _baratze_ ‘vegetable garden’), _afari_ ‘supper’ (from _&ast;gauhari_ = _gau_ ‘night’ +_-ari_) ([Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):335; see also [Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):83)\n- _-tar_ ‘inhabitant, occupation, and adjectives’, e.g. _ofiatiar_ ‘Ofiatian’ (from _Ofiati_), _gipuzkoar_ ‘Gipuzkoan’ (from _Gipuzkoa_), _arabar_ ‘Araban’ (from _Araba_), _espainiar_ ‘Spanish’ (from _Espainia_), _gernikar_ ‘Gernikan’ (from _Gernika_), _donostiar_ ‘Donostian’ (from _Donostia_), _ainhoar_ ‘Ainhoan’ (from _Ainhoa_), _saratar_ ‘Saran’ (from _Sara_), _erromatar_ ‘Roman’ (from _Erroma_ ‘Rome’), _zuberotar_ ‘Zuberoan’ (from _Zubero-a_), _baztandar_ ‘Baztanese’ (from _Baztan_), _irundar_ ‘Irunese’ (from _Irún_), _brasildar_ ‘Brazilian’ (from _Brasil_), _paristar_ ‘Parisian’ (from _Paris_), _kanpotar_ ‘outsider’ (from _kanpo_ ‘outside’), _zerutar_ ‘heavenly’ (from _zeru_ ‘heaven’), _baserritar_ ‘farmer’ (from _baserri_ ‘farm’), _kaletar_ ‘town dweller’ (from _kale_ ‘street’). ([Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):339)\n- _-es_ ‘ethnonym’, e.g. _frantses_ ‘French’, _ingeles_ ‘English’, _baiones_ ‘from Bayonne (Bayonne)’, _biames_ ‘Biarnais’ ([Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):340)\n- _-duru_ ‘agent noun’, e.g. _hoberaduru_ ‘sinner’, _zorduru_ ‘debtor’_, harzedura_ ‘creditor’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):84)\n- _-er(o), -ier_ ‘agent noun’, e.g. _gezurtero_ ‘liar’, _zurrutero_ ‘drinker’, _zakutero_ ‘(heavy) eater’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):86)\n- _-(k)oi_ ‘agent noun’, e.g. _andrako_ ‘womanizer’, _berekoi_ ‘egoist’, _herrikoi_ ‘patriot’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):92–93)\n- _-(e)sa, -(t)sa_ ‘female person’, e.g. _jainkosa_ ‘goddess’ (from _jainko_ ‘god’), _okintsa_ ‘female baker’ (regional, from _okin_ ‘baker’), _alarguntsa_ ‘widow’ (from _alargun_ ‘widow’ and ‘widower’), _errientsa_ ‘female primary school teacher’ (from _errient_ ‘male primary school teacher’) ([Trask 2003](sources.bib?label=Trask+2003#cldf:trask2003a):117; see also [Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):95)\n\n\n\n19 inanimate and abstract noun derivation suffixes, and/or adjectivizers\n\n- _-eria_ ‘collective’, e.g. _tresneria_ ‘set of tools’ (from _tresna_ ‘tool’), _gazteria_ ‘youth, group of youngsters’ (from _gazte_ ‘young’), _umeteria_ ‘group of children’ (from _ume_ ‘child’), _langileria_ ‘staff, group of workers’ (from _langile_ ‘worker’) ([Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):333)\n- _-kada_ ‘blow with N’ or ‘heap of N’, e.g. _eskukada_ ‘blow with the hand, handful’ (from _esku_ ‘hand’), _harrikada_ ‘blow with a stone’ (from _harri_ ‘stone’), _ukabilkada_ ‘punch with the fist’ (from _ukabil_ ‘fist’), _ahokada_ ‘mouthful’ (from _aho_ ‘mouth’), _aurrerakada_ ‘step forward, progress’ (from _aurrera_ ‘onwards’), _karrokada_ ‘cartful’ (from _karro_ ‘cart’) ([Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):334; see also [Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):81)\n- _-keria_ ‘negative quality’, e.g. _erokeria_ ‘foolishness’ (from _ero_ ‘fool’), _zikinkeria_ ‘dirtiness’ (from _zikin_ ‘dirty’), _garbikeria_ ‘purism’ (from _garbi_ ‘clean’), _sorginkeria_ ‘witchcraft’ (from _sorgin_ ‘witch’), _alukeria_ ‘stupidity’ (from _alu_ ‘vulva, stupid’), also used to express an action or the result of an action, e.g. _astokeria_ ‘asinine behavior’ (from _asto_ ‘donkey’) ([Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):340; see also [Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):85–86)\n- _-gailu, -ailu, -kailu_ ‘instrument’, e.g. _sendagailu_ ‘remedy’ (from _senda(tu)_ ‘heal’), _zerrailu_ ‘lock’ (from _zerra(tu)_ ‘close’), _apaingailu_ ‘fixing, decoration’ (from _apain(du)_ ‘fix’), _edergailu_ ‘decoration’ (from _eder(tu)_ ‘beautify’), _berogailu_ ‘heater’ (from _bero(tu)_ ‘heat’), _hozkailu_ ‘refrigerator’ (from _hoz(tu)_ ‘make cold’) ([Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):341–342; see also [Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):80–81)\n- _-era, -kera_ ‘manner’ (in nouns derived from verbs), ‘dimension’ (in nouns from adjectives), ‘name of languages and dialects’, e.g. _ibil(k)era_ ‘way of walking’ (from _ibil(i)_ ‘walk’), _jarrera_ ‘position, attitude’ (from _jarr(i)_ ‘put’), _hasiera_ ‘beginning’ (from _has(i)_ ‘begin’), _zabalera_ ‘extension’ (from _zabal_ ‘wide’), _lodiera_ ‘fatness’ (from _lodi_ ‘fat’), _luzera_ ‘length’ (from _luze_ ‘long’), _italiera_ ‘Italian language’ (from _Italia_ ‘Italy’), _arabiera_ ‘Arabian language’ (from _Arabia_), _bizkaiera_ ‘Biscayan dialect’ (from _Bizkaia_) ([Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):342; see also [Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):84–85). [Hualde and Urbina ](sources.bib?label=Hualde+and+Urbina+#cldf:hualde2003)([2003](sources.bib?label=2003#cldf:hualde2003)) do not mention explicitly that this suffix would be borrowed, but [Segura Munguía and Etxebarria Ayesta ](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+#cldf:mungu1996a)([1996](sources.bib?label=1996#cldf:mungu1996a):84) do\n- _-keta_ ‘action or result’_,_ e.g. _hedaketa_ ‘act of spreading’ (from _heda(tu)_ ‘spread’), _garbiketa_ ‘cleaning’ (from _garbi(tu)_ ‘clean’), _aldaketa_ ‘change’ (from _alda(tu)_ ‘change’), _erosketa_ ‘purchase, shopping’ (from _eros(i)_ ‘buy’), _salketa_ ‘sale’ (from _sal(du)_ ‘sale’), _sorketa_ ‘creativity, creation’ (from _sor(tu)_ ‘create’), _salaketa_ ‘denunciation’ (from _sala(tu)_ ‘denounce’) ([Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):342–343; see also [Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):87)\n- _-dura_ ‘action or result’, e.g. _hedadura_ ‘extension, space that is covered’ (from _heda(tu)_ ‘spread’), _luzadura_ ‘lengthening’ (from _luza(tu)_ ‘lengthen’), _erredura_ ‘burn’ (from _erre_ ‘burn’), _kutsadura_ ‘pollution’ (from _kutsa(tu)_ ‘pollute’), _ebakidura_ ‘cut’ (from _ebaki_ ‘cut’) ([Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):342–343; see also [Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):97–98)\n- _-zio,_ _-(k)izun_ ‘action or result’, e.g. _barkazio_ ‘pardon’ (from _barka(tu)_ ‘forgive’) ([Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):342–343), _barkakizun_ ‘pardon’, _erraizun_ ‘(empty) talk’, _ikhuskizun_ ‘things to see’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):90–91, 98)\n- _-aje, -aia, -aie_ ‘abstract noun’, e.g. _lumaje_ ‘plumage’, _narruaje_ ‘skin’, _zuraje_ ‘woodwork’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):81–82)\n- _-antza, -antzia, -entzia_ ‘abstract noun’, e.g. _ustanza_ ‘confidence’, _gorantza_ ‘praise’, _durkentza_ ‘meeting’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):81–82)\n- _-duria_ ‘abstract noun’, e.g. _jakinduria_ ‘wisdom’, _apainduria_ ‘decoration’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):84)\n- _-eta_ ‘grove’, e.g. _lizarreta_ ‘ash tree grove’, _inxaurreta_ ‘walnut tree grove’, _aritzeta_ ‘oak tree grove’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):87–88)\n- _-gura_ ‘abstract noun’, e.g. _logura_ ‘sleepiness’, _barregura_ ‘desire to laugh’, _zelanguare_ ‘however’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):88)\n- _-(g/k)unde, -undia, -kune_ ‘abstract noun: action, ability, social group’, e.g. _beharkunde_ ‘necessity’, _gizonkunde_ ‘males’, _apezkunde_ ‘priests’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):91)\n- _-pen, -men(du/tu/ta)_ ‘abstract noun’, e.g. _luzamen_ ‘enlargement’, _aitomen_ ‘confession’, _pairmen_ ‘suffering’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):92)\n- _-ta(de/te), -da(te/de/re)_ ‘abstract noun’, e.g. _bakartade_ ‘solitude’, _egitade_ ‘action’, _hondare_ ‘heritage’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):96)\n- _-(t)za, -(e)zia_ ‘abstract noun’, e.g. _zuhurtzia_ ‘prudence’, _emaitza_ ‘result, production’, _agintza_ ‘promise’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):97)\n- _-os(o), -ts(u/a), -z(u/a)_ ‘abstract noun or adjective’, e.g. _menditsu_ ‘mountainous’, _elortza_ ‘thorny’, _harritza_ ‘stone desert’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):94)\n- _-tu, -du_ ‘adjectivizer’, e.g. _zigortu_ ‘punished’, _ihartu_ ‘dry’, _bazkaldu_ ‘eaten’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):96)\n\n\n\n5 derivational prefixes\n\n- _des-_ ‘privative’, e.g. _desegin_ ‘undo’ (from _egin_ ‘do, make’), _deslotu_ ‘untie’ (from _lotu_ ‘tie’), _desberdin_ ‘unequal, different’ (from _berdin_ ‘same, equal’), _desegoki_ ‘inappropriate’ (from _egoki_ ‘appropriate’), _desadostasun_ ‘lack of agreement’ (from _adostasun_ ‘agreement’) ([Hualde 2003a](sources.bib?label=Hualde+2003a#cldf:hualde2003a):349; see also [Hualde 2003b](sources.bib?label=Hualde+2003b#cldf:hualde2003b):42; [Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):99–100)\n- _erre-, arra-_ ‘repeated’, e.g. _arraseme_ ‘grandson’, _arraeraiki_ ‘lift up again’, _arraberritu_ ‘renovate’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):99; see also [Haase 1992](sources.bib?label=Haase+1992#cldf:haase1992a):50–51)\n- _kontra-_ ‘contra’, e.g. _kontraurre_ ‘stern’, _kontraease_ ‘contradiction’, _kontrajarri_ ‘put against’ ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):100)\n- _anti-_ ‘against’, e.g. _anitherritar_ ‘unpopular’ (only one example with a native stem) ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):100–101)\n- _super-_ ‘super’, e.g. _supermutil_ ‘big boy’, _superneska_ ‘impressive girl’ (only two example with a native stem) ([Segura Munguía and Etxebarria Ayesta 1996](sources.bib?label=Segura+Mungu%C3%ADa+and+Etxebarria+Ayesta+1996#cldf:mungu1996a):100–101)\n\n\n\n1 participle-forming suffix\n\n- -_tu_ ‘perfective participle formation’, e.g. _sartu_ ‘entered’, _sortu_ ‘born’, ‘saldu ‘sold’ ([Eliasson 2012](sources.bib?label=Eliasson+2012#cldf:eliasson2012a):282). [Eliasson ](sources.bib?label=Eliasson+#cldf:eliasson2012a)([2012](sources.bib?label=2012#cldf:eliasson2012a):282–283) characterizes this affix as an “inflectional suffix, albeit with strong derivational propertis” and states that it is “exceedingly productive”.	\N	106	105	Eurasia	\N	\N	36	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
77	{}	133	Portuguese affixes in Tetun Dili	Information and examples are from [Hajek ](sources.bib?label=Hajek+#cldf:hajek2006a)([2006](sources.bib?label=2006#cldf:hajek2006a):172).\n\n\n1 nominalizer\n\n- _-dor_ ‘agent nominalizer’, someone who habitually does something (often pejorative), i.e. more restricted than the general agentive noun derivation in Portuguese, e.g. _hemudór_ ‘drinker’ (from _hemu_ ‘drink’) “the only Portuguese affix that can be applied to a native root” according to [Hajek ](sources.bib?label=Hajek+#cldf:hajek2006a)([2006](sources.bib?label=2006#cldf:hajek2006a):172).	\N	125	124	Papunesia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
18	{}	20	Turkish affixes in Cappadocian Greek	Information and examples are from [Dawkins ](sources.bib?label=Dawkins+#cldf:dawkins1916a)([1916](sources.bib?label=1916#cldf:dawkins1916a)) and [Janse ](sources.bib?label=Janse+#cldf:janse2009a)([2009a](sources.bib?label=2009a#cldf:janse2009a); [2009b](sources.bib?label=2009b#cldf:janse2009b)), see also [Gardani ](sources.bib?label=Gardani+#cldf:gardani2008a)([2008](sources.bib?label=2008#cldf:gardani2008a):58–60). Cappadocian Greek has undergone heavy lexical and structural influence from Turkish, moving away from fusional and towards agglutinating structures, with some morphological borrowing. Different forms are attested in different dialects with only partial overlap. [Dawkins ](sources.bib?label=Dawkins+#cldf:dawkins1916a)([1916](sources.bib?label=1916#cldf:dawkins1916a):130) explicitly notes that _-lan_ ‘verbalizer, deriving intransitive verbs from adjectives’ and _-t_ ‘causative’ “occasionally find their way into Greek words”.\n\n\n1 verbal derivational marker\n\n- _-lan_ ‘verbalizer, deriving intransitive verbs from adjectives’, recorded in the variety of Ferték, e.g. _ἀστενάρλανσε_ ‘he became ill’\n\n\n\n1 valency-changing suffix\n\n- _-t_ ‘causative’, recorded in the variety of Ulağaç, e.g. _ψοφάτσαν_ ‘they killed him’\n\n\n\n2 subject agreement markers, in the varieties of Semenderé and (similarly) Sillí ([Dawkins 1916](sources.bib?label=Dawkins+1916#cldf:dawkins1916a):144)\n\n- _-k_ ‘first plural’, e.g. _κέτουμιστικ_ ‘we exist’\n- _-inis_ ‘second plural’, e.g. _κέτουστινις_ ‘they exist’\n\n\nThe borrowing of these forms is “probably due to the resemblance of _-misti_ with the Turkish pluperfect in _-mIs-tI_ to which the 1st and 2nd person plural markers _-k_ and _-nIz_ are added. The Semenderé forms seem to replicate the Central Anatolian Turkish pluperfect in _-DI-mIș-tI_, e.g. _ol-du-muș-tu-k_ → _cé-tun-mis-ti-c_” ([Janse 2009b](sources.bib?label=Janse+2009b#cldf:janse2009b)).\n\n\n1 element in possessive pronouns\n\n- _-ï_, a re-analyzed Turkish element used in the formation of possessive suffixes, which are accordingly all partially Turkish, e.g. 1sg _-ïm_ (combination of Turkish possessive element _-ï_ and the element _m_, which occurs in the native Greek and Turkish form), 2sg _-ïs_ (combination of Turkish possessive element _-ï_ and native Greek element _s_), 3sg _-ït_ (combination of Turkish possessive element _-ï_ and the native Greek element _t_), 1pl _-ïmas_ (combination of Turkish possessive element _-ï_ and native Greek _mas_), 2pl _-ïsas_ (combination of Turkish possessive element _-ï_ and native Greek _sas_), 3pl _-ïtne_ (combination of Turkish possessive element _-ï_ and _-tne_, which is of unclear origin) (examples from [Janse 2009b](sources.bib?label=Janse+2009b#cldf:janse2009b)).	\N	32	31	Eurasia	\N	\N	5	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
19	{}	21	Greek affixes in Cypriot Arabic	Information and examples mainly from [Borg ](sources.bib?label=Borg+#cldf:borg1985a)([1985](sources.bib?label=1985#cldf:borg1985a):125–126) and [Kossmann ](sources.bib?label=Kossmann+#cldf:kossmann2008a)([2008](sources.bib?label=2008#cldf:kossmann2008a); [2011](sources.bib?label=2011#cldf:kossmann2011a)) (see also [Newton 1964](sources.bib?label=Newton+1964#cldf:newton1964a); [Tsiapera 1964](sources.bib?label=Tsiapera+1964#cldf:tsiapera1964a):125–126; [Roth 1979](sources.bib?label=Roth+1979#cldf:roth1979a); 2003). Cypriot Arabic is also known as Kormakiti (Arabic). It has very many Greek loanwords which retain their Greek morphology, but relatively little Greek morphology is used on native Arabic stems, with one major exception: a set of suffixes marking diminutive, which is further specified for gender and number. These are productively used on Arabic nouns.\n\n\n1 diminutive marker\n\n- _-u_ ‘diminutive’\n\n\n\n4 gender/number marking suffixes\n\n- _-i_ ‘masculine singular’\n- _-kkya_ ‘masculine plural’\n- _-a_ ‘feminine singular’\n- -_úes_ ‘feminine plural’\n\n\nExamples of hybrids: _payt-u-i_ ‘little house’, _payt-u-kkya_ ‘little houses’ (from _payt_ ‘house’ (masc.)), _mišl-u-a_ ‘little ladle’, _mišl-u-es_ ‘little ladles’ (from _mišl-e_ ‘ladle’ (fem.)).	\N	34	33	Eurasia	\N	\N	5	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
20	{}	22	Libyan Arabic affixes in Siwi	Information and examples are from [Souag ](sources.bib?label=Souag+#cldf:souag2010a)([2010](sources.bib?label=2010#cldf:souag2010a)), see also [Souag ](sources.bib?label=Souag+#cldf:souag2009a)([2009](sources.bib?label=2009#cldf:souag2009a); [2020](sources.bib?label=2020#cldf:souag2020a)). There are five borrowed affixes/fusional patterns.\n\n\n2 comparative/superlative (conventionally termed the elative) markers\n\n- _C1C2əC3_ template imposed on triliteral adjectives ‘comparative’, e.g. _gzəl_ ‘shorter’ (from _a-gzāl_ ‘short’), _zṭəf_ ‘blacker’ (from _azəṭtạ̄f_ ‘black’), _zwər_ ‘bigger’ (from _a-zuwwar_ ‘big’) ([Souag 2020](sources.bib?label=Souag+2020#cldf:souag2020a):481)\n- _-hum_ ‘superlative’, e.g. _zwərhum_ ‘the biggest’ (from _a-z-uwwar_ ‘big’) ([Souag 2010](sources.bib?label=Souag+2010#cldf:souag2010a):159). Note that [Souag ](sources.bib?label=Souag+#cldf:souag2010a)([2010](sources.bib?label=2010#cldf:souag2010a):38) speaks of “full productivity of the Arabic comparative/superlative template in Siwi.”\n\n\n\n2 nominalizing root patterns\n\n- _āCəCCēCī_ template ‘agent (habitual doer)’, e.g. _aččēwī_ ‘glutton’ (from _əčč_ ‘eat’), _aruwwēlī_ ‘flee-er’ (from _rwəl_ ‘flee’), _ajəllēwī_ ‘someone who swears a lot’ (from _jəll_ ‘swear’) ([Souag 2010](sources.bib?label=Souag+2010#cldf:souag2010a):422)\n- _lə-/əl-_ + _C1C2āC3ət_ template ‘deadjectival nominalizer’, e.g. _ləmlālət_ ‘whiteness’ (from _aməllāl_ ‘white’), _zzṭāfət_ ‘blackness’ (from _azəṭtạ̄f_ ‘black’), _əzzwārət_ ‘bigness, size’ (from _a-zuwwar_ ‘big’) ([Souag 2010](sources.bib?label=Souag+2010#cldf:souag2010a):161)\n\n\n\n1 verbal derivational prefix\n\n- _dā-_ ‘suggestive’, e.g. _dā-təġḍəb!_ ‘let her get angry!’, _dā-iẓnant!_ ‘let them ［Algeria and Morocco］ divide it!’ ([Souag 2010](sources.bib?label=Souag+2010#cldf:souag2010a):384). It probably comes from Classical Arabic imperative _daʕ_ ‘leave, let’ ([Souag 2010](sources.bib?label=Souag+2010#cldf:souag2010a):379).\n\n\nAdditionally, there are two plural morphemes which are each only attested on one native Siwi (Berber) stem. Therefore, they are not counted here: it can be expected that [Souag’s ](sources.bib?label=Souag%E2%80%99s+#cldf:souag2010a)([2010](sources.bib?label=2010#cldf:souag2010a)) detailed study would have uncovered further hybrid formations if they existed: _lə-CCaCəC,_ e.g. _lŭgrazən_ ‘dogs’ (from _agŭrzni_ ‘dog’) ([Souag 2010](sources.bib?label=Souag+2010#cldf:souag2010a):90), _lə-kdew-a_ ‘squashes’ (from _lə-kdew-iyy-at_ ‘squash’) ([Souag 2010](sources.bib?label=Souag+2010#cldf:souag2010a):88).	\N	36	35	Africa	\N	\N	5	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
21	{}	23	Nunggubuyu affixes in Warndarang	Information and examples are from [Heath ](sources.bib?label=Heath+#cldf:heath1978a)([1978a](sources.bib?label=1978a#cldf:heath1978a); [1980a](sources.bib?label=1980a#cldf:heath1980a); [1984](sources.bib?label=1984#cldf:heath1984a)). 5 affixes were borrowed.\n\n\n3 noun class prefixes (out of a paradigm of 8 noun class prefixes in Warndarang) ([Heath 1980a](sources.bib?label=Heath+1980a#cldf:heath1980a):22–25); nouns can occur without prefixes, but usually take one.\n\n- _(ṛ)a-_ ‘indefinite/non-human class I’ (also optionally used in place of a human prefix), e.g. _ṛa-waṛiyi_ ‘Aborigine(s)’, _ṛa-jamaļagu_ ‘tapsticks’, _ra-waluŋma_ ‘python’ ([Heath 1980a](sources.bib?label=Heath+1980a#cldf:heath1980a):23, 25, 26)\n- _wu-_ ‘non-human class II’, e.g. _wu-bunjiyu_ ‘honey’, _wu-ndawaynu_ ‘words’, _wu-jambaguwnu_ ‘tobacco’ ([Heath 1980a](sources.bib?label=Heath+1980a#cldf:heath1980a):25)\n- _ma-_ ‘non-human class III’, e.g. _ma-ḍuŋal_ ‘spear’, _ma-gamba_ ‘pearl shell’, _ma-yimbiḍgu_ ‘cypress’ ([Heath 1980a](sources.bib?label=Heath+1980a#cldf:heath1980a):25)\n\n\n\n2 case markers (out of a paradigm of 5 case markers in Warndarang) ([Heath 1980a](sources.bib?label=Heath+1980a#cldf:heath1980a):26–28)\n\n- _-wala_ ‘ablative’, e.g. _wuyulbawala_ ‘from the tree’ ([Heath 1980a](sources.bib?label=Heath+1980a#cldf:heath1980a):26), _wunaya-wala_ ‘from here’, _awuni-wala_ ‘from there’ ([Heath 1980a](sources.bib?label=Heath+1980a#cldf:heath1980a):53)\n- _-miri_ ‘instrumental’, e.g. _maḍuŋamiri_ ‘by means of spears’ (three examples attested in corpora, but only one example given in [Heath 1980a](sources.bib?label=Heath+1980a#cldf:heath1980a):26–27).	\N	38	37	Australia	\N	\N	5	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
22	{}	25	Turkish affixes in Albanian	Information and examples are mostly from [Boretzky ](sources.bib?label=Boretzky+#cldf:boretzky1975a)([1975a](sources.bib?label=1975a#cldf:boretzky1975a):265–270), some additional examples stem from [Xhuvani and Çabej ](sources.bib?label=Xhuvani+and+%C3%87abej+#cldf:xhuvani1962a)([1962](sources.bib?label=1962#cldf:xhuvani1962a)). Information on the etymologies of stems comes from [Orel ](sources.bib?label=Orel+#cldf:orel1998a)([1998](sources.bib?label=1998#cldf:orel1998a)). According to [Boretzky ](sources.bib?label=Boretzky+#cldf:boretzky1975a)([1975a](sources.bib?label=1975a#cldf:boretzky1975a):265), there are many Turkish suffixes in Albanian, but only 34 are used to derive more than a few Albanian stems. [Boretzky ](sources.bib?label=Boretzky+#cldf:boretzky1975a)([1975a](sources.bib?label=1975a#cldf:boretzky1975a):265–270) nevertheless lists 5 borrowed suffixes and gives examples of combinations with native stems for each. Some of them may be restricted to spoken varieties.\n\n\n4 nominalizers\n\n- _-xhi/çi_ ‘profession derivation’, e.g. _derraxhi_ ‘swineherd’ (from _derre_ ‘pig’), _djathëxhi_ ‘cheese maker’ (from _djathë_ ‘cheese’), _lëkuraxhi_ ‘skinner’ (from _lëkurë_ ‘skin’). [Boretzky ](sources.bib?label=Boretzky+#cldf:boretzky1975a)([1975a](sources.bib?label=1975a#cldf:boretzky1975a):265–270) found about 40 derivations with this suffix, but expects that there are many more. Brian Joseph (personal communication, July 2011) confirms that this suffix is productively used. It also appears in [Genesin and Matzinger ](sources.bib?label=Genesin+and+Matzinger+#cldf:genesin2016a)([2016](sources.bib?label=2016#cldf:genesin2016a):3127). This agent noun suffix is frequently borrowed from Turkic across languages in Eurasia as discussed in the AfBo entries on Uzbek affixes in Northern Tajik, Turkish affixes in Iraqi Arabic, Turkic affixes in Middle Mongolic, Azeri affixes in Udi, and Central Asian Turkic affixes in Russian. More examples are given by [Hadzhieva et al. ](sources.bib?label=Hadzhieva+et+al.+#cldf:hadzhieva2012a)([2012](sources.bib?label=2012#cldf:hadzhieva2012a)), including _-džija_, borrowed from Turkish into Bulgarian. This form is now productively used in Bulgarian (https://en.wiktionary.org/wiki/-джия#Bulgarian ［accessed: 10.07.2024］).\n- _-llëk_ ‘abstract noun nominalizer (from adverbs, and others)’, e.g. _zjarrlëk_ ‘burning heat’ (from _zjarr_ ‘fire’). According to Brian Joseph (personal communication July 2011) this suffix is not very productive.\n- _-li/-lli_ ‘designation of residents’, e.g. _vendali_ ‘inhabitant’ (from _vend_ ‘place’), _Elbasanlli_ ‘inhabitant of Elbasan’, _Tiranalli_ ‘inhabitant of Tirana’.\n- _-qar_ ‘nouns denoting a person having a quality that is denoted by the noun or verb from which it is derived’, e.g. _nihmaçar_ ‘helper’ (from _ndihmë_ ‘help’), _mundqar_ ‘someone who earns his daily bread with effort’ (from _mund_ ‘effort’).\n\n\n\n1 adjectivizer\n\n- _-çe_ ‘ethnic or regional terms, and other derivations’, e.g. _Shqipëtarçe_ ‘Albanian (adj.)’ (from _Shqipëtar_ ‘Albanian (person)’), _vendçe_ ‘locally’ (from _vend_ ‘place’), _derrçe_ ‘pig-like’ (from _derr_ ‘pig’). Brian Joseph (personal communication, July 2011) confirms that this suffix is productive.\n\n\n\n1 plural marker\n\n- _-lar ~ -llar ~ -lerë_ ‘masculine human plural’, e.g. _mbretlerë_ ‘emperor’ (from _mbret_, originally from Latin), _priʃtlerë_ ‘priests’ (from _priʃt_, originally from Latin), _giyshllar_ ‘grandfathers’ (from _giyish_, from Proto Albanian). Examples are from [Gardani ](sources.bib?label=Gardani+#cldf:gardani2008a)([2008](sources.bib?label=2008#cldf:gardani2008a):72), who cites [Fiedler ](sources.bib?label=Fiedler+#cldf:fiedler1977a)([1977](sources.bib?label=1977#cldf:fiedler1977a)). This form is used only on a few words, probably most of them of Turkish origin, according to Brian Joseph (personal communication, July 2011).	\N	24	31	Eurasia	\N	\N	6	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
39	{}	72	Swahili affixes in Malagasy	Information and examples are from Alexander [Adelaar ](sources.bib?label=Adelaar+#cldf:adelaar2012a)([2012](sources.bib?label=2012#cldf:adelaar2012a):149–150); see also [Adelaar ](sources.bib?label=Adelaar+#cldf:adelaar2005a)([2005](sources.bib?label=2005#cldf:adelaar2005a); [2009](sources.bib?label=2009#cldf:adelaar2009a); [2010](sources.bib?label=2010#cldf:adelaar2010a)).\n\n\n2 non-interrelated prefixes\n\n- _ki-_ ~ _tsi-_ ‘nominalizer, diminutive’, e.g. _ki-tranu-trànu_, _tsi-tranu-trànu_ ‘doll house’ (from _trànu_ ‘house’)\n- _h- ~ hu(-)_ ‘future tense’, e.g. _h-angàlatră pàuli_ ‘Paul will steal’ (vs. _m-angàlatră Pàuli_ ‘Paul steals’), _h-umè-nă àzi ni vùla_ ‘Money will be given to her’ (vs. _umè-nă àzi ni vùla_ ‘Money is given to her’), _hu tùnga rahampìtsu ìzi_ ‘He’ll arrive tomorrow’ (vs. _tùnga izàu ìzi_ ‘He arrives today’)	\N	70	69	Africa	\N	\N	2	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
23	{}	26	Carib affixes in Garifuna	Information and examples are from [Taylor ](sources.bib?label=Taylor+#cldf:taylor1954a)([1954](sources.bib?label=1954#cldf:taylor1954a); [1956](sources.bib?label=1956#cldf:taylor1956a); [1959](sources.bib?label=1959#cldf:taylor1959a); [1977](sources.bib?label=1977#cldf:taylor1977a)), [Taylor and Hoff ](sources.bib?label=Taylor+and+Hoff+#cldf:taylor1980a)([1980](sources.bib?label=1980#cldf:taylor1980a)), [Hoff ](sources.bib?label=Hoff+#cldf:hoff1986a)([1986](sources.bib?label=1986#cldf:hoff1986a)), de [Pury ](sources.bib?label=Pury+#cldf:pury2001a)([2001](sources.bib?label=2001#cldf:pury2001a); [2005](sources.bib?label=2005#cldf:pury2005a)), and [Escure ](sources.bib?label=Escure+#cldf:escure2004a)([2004](sources.bib?label=2004#cldf:escure2004a):45–46) and [Escure ](sources.bib?label=Escure+#cldf:escure2012a)([2012](sources.bib?label=2012#cldf:escure2012a)). See also [Grant ](sources.bib?label=Grant+#cldf:grant2010a)([2010](sources.bib?label=2010#cldf:grant2010a)).\n\n\n1 possessive person-marker prefix\n\n- _i-_ ‘first singular possessor’, e.g. _iuaku_ ‘my drink’, _iúti_ ‘my share (of food etc.)’ ([Taylor 1956](sources.bib?label=Taylor+1956#cldf:taylor1956a):39)\n\n\n\n1 collective (plural) suffix\n\n- _-gu_ ‘collective, plural’, e.g. _níbirigu_ ‘my younger siblings’, _numégegu_ ‘my (personal) belongings’, _nibą́iagu_ ‘my grandchildren’, _tibegu_ ‘her people’ ([Taylor 1959](sources.bib?label=Taylor+1959#cldf:taylor1959a):190–191)\n\n\nNote that [Escure ](sources.bib?label=Escure+#cldf:escure2004a)([2004](sources.bib?label=2004#cldf:escure2004a):45–46) discusses a number of further affixes of putative Carib origin, in particular a nominalizing suffix _-un(i)_, and a large number of evidential particles (or suffixes) of which she discusses in particular _-ti_ (hearsay), _-na_ (uncertainty), and _-me_ (deductive). However, no corresponding elements have been identified in Carib (Kalin’a, Galibi), the source language for Cariban material in Garifuna. For the evidential particles, [Escure ](sources.bib?label=Escure+#cldf:escure2004a)([2004](sources.bib?label=2004#cldf:escure2004a):45–46) cites similar-looking forms from Hixkaryana as source forms ([Derbyshire 1999](sources.bib?label=Derbyshire+1999#cldf:derbyshire1999a):53), but Hixkaryana is from a different branch of the Cariban family. Additionally, the Garifuna evidential particles are only attested in [Escure’s ](sources.bib?label=Escure%E2%80%99s+#cldf:escure2004a)([2004](sources.bib?label=2004#cldf:escure2004a):45–46) material, and not mentioned by other sources. For the nominalizing suffix, Lokono/Arawak (the Arawakan language most closely related to Garifuna) _-n_ ([Pet 2011](sources.bib?label=Pet+2011#cldf:pet2011a):22–24 and _passim_), seems a likely cognate, which means the form would be native.	\N	40	39	South America	\N	\N	2	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
24	{}	27	Chuvash affixes in Mari	Information and examples mainly from [Bereczki ](sources.bib?label=Bereczki+#cldf:bereczki1979a)([1979](sources.bib?label=1979#cldf:bereczki1979a); [1993](sources.bib?label=1993#cldf:bereczki1993a); [2002](sources.bib?label=2002#cldf:bereczki2002a)) and [Kangasmaa-Minn ](sources.bib?label=Kangasmaa-Minn+#cldf:kangasmaa_minn1998a)([1998](sources.bib?label=1998#cldf:kangasmaa_minn1998a)), in addition to other sources, as specified below.\n\n\n4 case markers, out of 11 Mari case markers. Note that the “boundaries between case suffixes, derivational suffixes, and enclitics are far from clear-cut” ([Kangasmaa-Minn 1998](sources.bib?label=Kangasmaa-Minn+1998#cldf:kangasmaa_minn1998a):220).\n\n- -_la ~ -lä_ ‘modal, lative, comparative’, e.g. _mar-la ojla_ ‘speaks Mari’, _totar-la solə̂k_ ‘Tatar scarf’, _jal muča-ŝkə̂-la kaja_ (village/end-illocution-lative/goes) ‘goes to the end of the village’ ([Kangasmaa-Minn 1998](sources.bib?label=Kangasmaa-Minn+1998#cldf:kangasmaa_minn1998a):227), _kiɗemla_ ‘as my hand’ ([Bereczki 1979](sources.bib?label=Bereczki+1979#cldf:bereczki1979a):65)\n- _-sɘ̂(n)_ ‘causal case, used with participles’, e.g. _kottəmašən šolten o ̇ mɘ̂l_ ‘I did not cook so they would not eat’ ([Bereczki 1979](sources.bib?label=Bereczki+1979#cldf:bereczki1979a):68). See also [Kangasmaa-Minn ](sources.bib?label=Kangasmaa-Minn+#cldf:kangasmaa_minn1998a)([1998](sources.bib?label=1998#cldf:kangasmaa_minn1998a):233, 244). Note that [Bereczki ](sources.bib?label=Bereczki+#cldf:bereczki1979a)([1979](sources.bib?label=1979#cldf:bereczki1979a):68) considers this to be a causal case suffix, borrowed from a corresponding case suffix from Chuvash, the use of which is restricted to participles. Its status as a case suffix is confirmed by the fact that it can be replaced by a dative case marker.\n- _-len_ ‘distributive’, e.g. _kečɘ̂len_ ‘every day’_, almašlen_ ‘changing’ ([Bereczki 1979](sources.bib?label=Bereczki+1979#cldf:bereczki1979a):69)\n- _-j_ ‘vocative case (used with kinship terms)’, e.g. _isaj_ ‘my older brother!, my uncle!’ ([Bereczki 1993](sources.bib?label=Bereczki+1993#cldf:bereczki1993a):511). This form may also be from Tatar.\n\n\n\n2 valency-changing verbal suffixes\n\n- _-n_ ‘reflexive’, e.g. _wijnem_ ‘get up’ (from _wiem_ ‘lift up’) ([Bereczki 2002](sources.bib?label=Bereczki+2002#cldf:bereczki2002a):99)\n- _-tar, -tär, -dar, -där_ ‘causative’, e.g. _jomdara_ ‘he/she looses’ (from _jomam_ ‘I disappear’) ([Mägiste 1968](sources.bib?label=M%C3%A4giste+1968#cldf:maegiste1968a):10; citing [Beke 1911](sources.bib?label=Beke+1911#cldf:beke1911a):134–136, 287–288, 301–302)_._ [Kangasmaa-Minn ](sources.bib?label=Kangasmaa-Minn+#cldf:kangasmaa_minn1998a)([1998](sources.bib?label=1998#cldf:kangasmaa_minn1998a):235) gives the forms _=tə̂ ~ =də̂_, e.g. _joškar=tə̂_ ‘make red’, but does not explicitly state that it is borrowed. This form may also be from Tatar.\n\n\n\n6 miscellaneous derivational affixes\n\n- _-mVš_ ~ _-šV_ ‘ordinal numeral formation’, e.g. _kumuso_ ‘third’, _nilemise_ ‘fourth’ ([Bereczki 2002](sources.bib?label=Bereczki+2002#cldf:bereczki2002a):99; citing [Budenz 1864](sources.bib?label=Budenz+1864#cldf:budenz1864a):437–438), _koγә̑ mśo_ ‘second’ ([Bereczki 2002](sources.bib?label=Bereczki+2002#cldf:bereczki2002a):99; citing [Galkin 1964](sources.bib?label=Galkin+1964#cldf:galkin1964a):108), _kolә̑ šo_ ‘twentieth’ ([Bereczki 2002](sources.bib?label=Bereczki+2002#cldf:bereczki2002a):99). Note that [Kangasmaa-Minn ](sources.bib?label=Kangasmaa-Minn+#cldf:kangasmaa_minn1998a)([1998](sources.bib?label=1998#cldf:kangasmaa_minn1998a):233–234, 244) considers this to be “the same (or homophonous) suffix (with an _m-_ element)” as _=sɘ̂(n)_ ‘causal case, used with participles’, which is used in the formation of ordinal numerals, e.g. _nɘ̂lɘ̂mše_ ‘forth’.\n- _ala-_ ‘indefinite’, e.g. _ala-kö_ ‘someone’, _ala-mo_ ‘something’ _ala-kuze_ ‘somehow’ ([Bereczki 2002](sources.bib?label=Bereczki+2002#cldf:bereczki2002a):99)\n- _=le ~ =lö ~ =lo_ ‘adjectivizer’, e.g. _lüm=lö_ ‘famous’ ([Kangasmaa-Minn 1998](sources.bib?label=Kangasmaa-Minn+1998#cldf:kangasmaa_minn1998a):244)\n- _=rak_ ‘comparative, modal’, e.g. _joškar=gə̂=rak_ ‘reddish’ ([Kangasmaa-Minn 1998](sources.bib?label=Kangasmaa-Minn+1998#cldf:kangasmaa_minn1998a):234), _ko ̇yo-rak_ ‘bigger’ ([Mägiste 1968](sources.bib?label=M%C3%A4giste+1968#cldf:maegiste1968a):10; citing [Beke 1911](sources.bib?label=Beke+1911#cldf:beke1911a):134–136, 287–288, 301–302)_._ See also [Raun ](sources.bib?label=Raun+#cldf:raun1971a)([1971](sources.bib?label=1971#cldf:raun1971a):120 and passim) and [Wiedemann ](sources.bib?label=Wiedemann+#cldf:wiedemann1847a)([1847](sources.bib?label=1847#cldf:wiedemann1847a):50). This form may also be from Tatar.\n- _=lə̂k_ ‘abstract noun’, e.g. _kül-eš=lə̂k_ ‘necessity’ ([Kangasmaa-Minn 1998](sources.bib?label=Kangasmaa-Minn+1998#cldf:kangasmaa_minn1998a):244), _porlək_ ‘goodness’ ([Mägiste 1968](sources.bib?label=M%C3%A4giste+1968#cldf:maegiste1968a):10; citing [Beke 1911](sources.bib?label=Beke+1911#cldf:beke1911a):134–136, 287–288, 301–302)\n- _=kalə̂-_ ‘iterative aspect’, e.g_. lüj=kalə̂-_ ‘shoots repeatedly’ ([Kangasmaa-Minn 1998](sources.bib?label=Kangasmaa-Minn+1998#cldf:kangasmaa_minn1998a):245)\n\n\nNote that it is not clear what the total number of cases is. [Kangasmaa-Minn ](sources.bib?label=Kangasmaa-Minn+#cldf:kangasmaa_minn1998a)([1998](sources.bib?label=1998#cldf:kangasmaa_minn1998a):226) gives 10 (in addition to unmarked nominative), to which we added _-j_ ‘vocative’.	\N	42	41	Eurasia	\N	\N	12	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
25	{}	28	Nepali affixes in Chantyal	Information is drawn from [Noonan ](sources.bib?label=Noonan+#cldf:noonan2003a)([2003](sources.bib?label=2003#cldf:noonan2003a); [2008](sources.bib?label=2008#cldf:noonan2008a)), for some background see also [Noonan ](sources.bib?label=Noonan+#cldf:noonan1996a)([1996](sources.bib?label=1996#cldf:noonan1996a)). Examples are from [Noonan and Bhulanja ](sources.bib?label=Noonan+and+Bhulanja+#cldf:noonan2005a)([2005](sources.bib?label=2005#cldf:noonan2005a)).\n\n\n4 case markers, out of 22 Chantyal case markers\n\n- _-siŋ, -səŋ, -səŋə, -səŋgə_ ‘allative/comitative’, e.g. _na-siŋ_ ‘I (had)’, _gəjjab-siŋ_ ‘with goodness’. All examples in the literature consulted have a comitative reading, but [Noonan ](sources.bib?label=Noonan+#cldf:noonan2003a)([2003](sources.bib?label=2003#cldf:noonan2003a):319) characterizes this form as “allative/comitative”.\n- _-ma, -wã_ ‘temporal’, e.g. _bis bərsə-ma_ (twenty/year-temporal) ‘in twenty years’\n- _-bɦənda_ ‘comparative/temporal’, e.g. _nakhu-bɦənda_ ‘(bigger) than a dog’ (example from [Noonan 2003](sources.bib?label=Noonan+2003#cldf:noonan2003a):320). All examples in the literature consulted have a comparative reading, but [Noonan ](sources.bib?label=Noonan+#cldf:noonan2003a)([2003](sources.bib?label=2003#cldf:noonan2003a):319) characterizes this form as “comparative/temporal”.\n- _-dɦin, -dɦikin_ ‘comparative/temporal’, e.g. _khawa-dɦikin_ (coming-temporal) ‘since I had come home’, _pəyle-dɦikin_ ‘since the first’. All examples in the literature consulted have a temporal reading, but [Noonan ](sources.bib?label=Noonan+#cldf:noonan2003a)([2003](sources.bib?label=2003#cldf:noonan2003a):319) characterizes this form as “comparative/temporal”.\n\n\n\n2 subordinators, out of 4 Chantyal subordinators\n\n- -_nu_ ‘infinitive’, e.g. _thũ-nu la-gəy a-thũ_ (drink-infinitive/do-progressive/negative-drink) ‘she was about to drink, but didn’t’\n- -_khiri_, _-khir_, _-khi_ ‘cotemporal’, e.g. _ca-wa-khiri_ (eat-nominalization-cotemporal) ‘when we eat’, _thaa ta-wa-khiri_ (knowledge/become-nominalization-simultaneous) ‘when they know’\n\n\nIn addition, Chantyal borrowed all numerals (cardinal and ordinal), with two classifier suffixes for human vs. nonhuman used on numerals ‘one’, ‘two’, ‘three’. These classifiers are not counted here because their use is restricted to borrowed stems.	\N	44	43	Eurasia	\N	\N	6	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
26	{}	29	Ngandi affixes in Ritharngu	Information and examples are from [Heath ](sources.bib?label=Heath+#cldf:heath1978a)([1978a](sources.bib?label=1978a#cldf:heath1978a); [1980b](sources.bib?label=1980b#cldf:heath1980b)).\n\n\n4 suffixes which are not interrelated with other borrowed affixes\n\n- _-kaʔ_ ‘kin-term dyadic dual’, e.g. _gaykay-kaʔ_ ‘uncle and niece’, _mu:mu-kaʔ_ ‘mother’s father’s sister and brother’s daughter’s child’, _wa:wa-kaʔ_ ‘elder brother and younger sibling’ ([Heath 1980b](sources.bib?label=Heath+1980b#cldf:heath1980b):25–26)\n- _-ʔmayʔ_ ‘negative’, suffixed to verbs or other constituents, e.g. _wa:n-i-ʔmayʔ ṋi:_ (go-future-negative/you) ‘You will not go’, _munaŋa-ʔmayʔ ra_ (White-negative/I) ‘I am not a White’ ([Heath 1980b](sources.bib?label=Heath+1980b#cldf:heath1980b):101)\n- _-bukiʔ_ ‘only’, rarely used, and no examples available ([Heath 1980b](sources.bib?label=Heath+1980b#cldf:heath1980b):93)\n- _-ʔwañjiʔ_ ‘semblative case’, e.g. _bakara-ʔwañjiʔ_ ‘like long-necked turtles’ ([Heath 1980b](sources.bib?label=Heath+1980b#cldf:heath1980b):42) (out of a total of 14 case suffixes)\n\n\nNote that four more prefixes might be borrowed, but the directionality is unclear, therefore they are excluded here (see also the entry on Ngandi): two out of two derivational adverbializers (or “compounding elements”) ([Heath 1980b](sources.bib?label=Heath+1980b#cldf:heath1980b):81): _malk-_ ‘times’ and _bala-_ ‘side’; and two out of three verbal derivation markers (called “comitative” by Heath) ([Heath 1980b](sources.bib?label=Heath+1980b#cldf:heath1980b):79, 82–83): _baṱa-_ ‘applicative’, forming (semantically) transitive verbs with comitative object from intransitive verbs, and _ṛay-/yay-_ ‘applicative marker’, forming transitive verbs with an object that denotes something transported from intransitive verbs of motion.	\N	46	45	Australia	\N	\N	4	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
27	{}	31	Ilokano affixes in Guina-ang Bontok	Information and examples are from Lawrence Reid (personal communication, January 2012).\n\n\n3 non-interrelated forms\n\n- _=to/=nto_ ‘future’, encliticized to predicate, used in addition to inherited, preverbal future auxiliary. Only occurs in speech of younger generation (as of early 21st century), e.g. _mapan=ka=nto_ ‘you will go’\n- _mang-/nang-_ ‘completed aspect, intransitive’, replaced native _ma_{_n,n,ng_}- +deletion of initial consonant of stem, e.g. _nang-sulbar_ ‘(they) solved’\n- _taga-_ ‘a person from’ derivation, replaced native _i-_; could be from Ilokano or Tagalog, e.g. _tagabaryo_ ‘someone from the neighborhood’	\N	48	47	Papunesia	\N	\N	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
28	{}	33	Kurdish affixes in Sonqor Turkic	Information and examples are from [Bulut ](sources.bib?label=Bulut+#cldf:bulut2005a)([2005](sources.bib?label=2005#cldf:bulut2005a); [2007](sources.bib?label=2007#cldf:bulut2007a); [2014](sources.bib?label=2014#cldf:bulut2014a)), which is partially based on material presented by [Buluç ](sources.bib?label=Bulu%C3%A7+#cldf:bulu1975a)([1975](sources.bib?label=1975#cldf:bulu1975a)). The borrowed affixes are attested in various Turkic varieties belonging to the South Oghuz dialect group spoken in Iran and Iraq.\n\n\n2 object pronoun enclitics. Only the borrowed second singular and the third plural enclitics are attested in corpora, although it is very likely that other object pronoun enclitics (with different person and number values) are also borrowed (Christiane Bulut, personal communication 2012).\n\n- _-it_ ‘second singular’, e.g. _almæ âllæm-it_ (apple/buy.aorist.1sg-2sg.dative) ‘I will buy you an apple’ ([Buluç 1975](sources.bib?label=Bulu%C3%A7+1975#cldf:bulu1975a):183; [Bulut 2007](sources.bib?label=Bulut+2007#cldf:bulut2007a):174)\n- _-şan_ ‘third plural’, e.g. _yæyipt-şan_ (eat.perfect.3sg-3pl.accusative) ‘he has eaten them’ ([Buluç 1975](sources.bib?label=Bulu%C3%A7+1975#cldf:bulu1975a):183; [Bulut 2007](sources.bib?label=Bulut+2007#cldf:bulut2007a):174)\n\n\n\n3 non-interrelated suffixes\n\n- _-tar_ ‘comparative’, e.g. _çux-dar_ (much/most-comparative) ‘more’ ([Bulut 2005](sources.bib?label=Bulut+2005#cldf:bulut2005a):254), “the copied morpheme +_tar_ displays no combinatorial restrictions; it combines with Turkic and Iranian adjectives alike” ([Bulut 2005](sources.bib?label=Bulut+2005#cldf:bulut2005a):253)\n- _-aka_ _~ -eke ~ -ækæ_ ‘definite, specific’ (from Southern Kurdish, Gorani), e.g. _ušaġ-ækæ-le’_ (child-specific-pl) ‘those children’, _mincuġ-ækæ-re_ (bead-specific-ablative) ‘of those pearls’, _šê’r-eke-sin-ne_ (poem-specific-possessor-ablative) ‘about that poem by him’. This suffix “attaches directly to Turkic noun stems and precedes plural, possessive or case suffixes” ([Bulut 2005](sources.bib?label=Bulut+2005#cldf:bulut2005a):254). See also [Kossmann ](sources.bib?label=Kossmann+#cldf:kossmann2011a)([2011](sources.bib?label=2011#cldf:kossmann2011a)), who cites a Sorani source form from [Blau ](sources.bib?label=Blau+#cldf:blau1980a)([1980](sources.bib?label=1980#cldf:blau1980a):46, 63). This form is also borrowed into Southern Iraqi Turkman.\n- _-iş_ ‘also, even’, e.g. _yėmēduviş_ ‘you have not even eaten’, _ġēliş_ ‘come!’, _ōḫiş_ ‘even an eye’ ([Buluç 1975](sources.bib?label=Bulu%C3%A7+1975#cldf:bulu1975a):182). This suffix “is in all probability a copy of the Kurdish enclitic ［...］ which in southern Kurdish may be suffixed to either a nominal or a verbal form” ([Bulut 2007](sources.bib?label=Bulut+2007#cldf:bulut2007a):175).\n\n\nAn additional borrowed suffix, _-i_ ‘indefinite’ from Persian, “with similar function ［as _-aka_］” ([Bulut 2005](sources.bib?label=Bulut+2005#cldf:bulut2005a):254), is “in all instances of our material ［...］ attached to copied noun phrases” ([Bulut 2005](sources.bib?label=Bulut+2005#cldf:bulut2005a):255), i.e. stems that are likewise borrowed from Persian. For this reason, this suffix is not included here, although there is some indirect evidence that “could prove that the copied unit +_i_ is compatible with non-Persian nouns” ([Bulut 2005](sources.bib?label=Bulut+2005#cldf:bulut2005a):255).	\N	50	49	Eurasia	\N	\N	5	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
47	{}	87	Bulgarian affixes in Megleno-Romanian	Information and examples are from [Capidan ](sources.bib?label=Capidan+#cldf:capidan1925a)([1925](sources.bib?label=1925#cldf:capidan1925a)) and other sources as noted below.\n\n\n2 person markers on verbs. Examples of these are from [Capidan ](sources.bib?label=Capidan+#cldf:capidan1925a)([1925](sources.bib?label=1925#cldf:capidan1925a):94, 159), translations and evidence for Romance origins of the stems comes from [Pușcariu ](sources.bib?label=Pu%C8%99cariu+#cldf:pu1905a)([1905](sources.bib?label=1905#cldf:pu1905a):168, passim), [Weinreich ](sources.bib?label=Weinreich+#cldf:weinreich1953a)([1953](sources.bib?label=1953#cldf:weinreich1953a):32), and [Gardani ](sources.bib?label=Gardani+#cldf:gardani2008a)([2008](sources.bib?label=2008#cldf:gardani2008a):67). These suffixes are added to forms that are already inflected for the respective category by native suffixes _-u_ and _-i_, hence, e.g. _-um_, _-ǎm_ replaced native _-u,_ and _-iş_ replaced native _-i_. [Gardani ](sources.bib?label=Gardani+#cldf:gardani2008a)([2008](sources.bib?label=2008#cldf:gardani2008a):67), citing [Sandfeld ](sources.bib?label=Sandfeld+#cldf:sandfeld1938a)([1938](sources.bib?label=1938#cldf:sandfeld1938a):59), [Capidan ](sources.bib?label=Capidan+#cldf:capidan1940a)([1940](sources.bib?label=1940#cldf:capidan1940a):91), and [Pușcariu ](sources.bib?label=Pu%C8%99cariu+#cldf:pu1943a)([1943](sources.bib?label=1943#cldf:pu1943a):274), states that “the morphemes have been added to the corresponding Romanian morphemes _-u_ and _-i_, but are not productive since they apply only to certain verbs”, implying that at least some verbs select them, as the examples below suggest. [Friedman ](sources.bib?label=Friedman+#cldf:friedman2012a)([2012](sources.bib?label=2012#cldf:friedman2012a):327) points out that an alternative internal explanation of the phenomenon – in terms of a Megleno-Romanian conjugational restructuring – is also plausible.\n\n- _-m_ ‘first person singular indicative present’, e.g. _aflum_ ‘I find’, _antrum_ ‘I enter’, _amnum_ ‘I go’.\n- _-ş_ ‘second person singular indicative present’, e.g. _afliş_ ‘you (sg.) find’, _antriş_ ‘you (sg.) enter’.\n\n\n\n1 privative particle\n\n- _ni_- ‘privative particle’, e.g. _ni-bun_ (privative-good) _‘_evil’_, ni-ḁn-grup-at_ (privative-aspect-bury-participle) ‘unburied’ ([Capidan 1925](sources.bib?label=Capidan+1925#cldf:capidan1925a):197). The second example shows that this prefix is not in the same morphological slot as the aspectual/aktionsart prefixes. The source form in Old Bulgarian is a clitic that attaches to stems separately from aktionsart prefixes (e.g., _ne-pri-čestuvanje_ ［privative-aspect_-_communion］ not receiving communion’) and does not convey any aspectual meaning. In Megleno-Romanian, _ni_- is not attested in finite verbs, only in participles and a few nouns and adjectives.\n\n\n\n9 derivational prefixes (out of 13 in Megleno-Romanian). The ones listed here include pan-Slavic prefixes, but not prefixes that are exclusive to one Slavic language other than Bulgarian (e.g. only Serbian). Information and examples are from [Capidan ](sources.bib?label=Capidan+#cldf:capidan1925a)([1925](sources.bib?label=1925#cldf:capidan1925a):195–202). No examples of hybrid formations are provided by [Capidan ](sources.bib?label=Capidan+#cldf:capidan1925a)([1925](sources.bib?label=1925#cldf:capidan1925a):195–202), but some are explicitly described as “very productive”. The functions of these prefixes are hard to outline precisely, also in the Slavic source languages, they usually encode aspectual or aktionsart meanings and sometimes form pairs.\n\n- _du-_ ‘aktionsart’ (from Bulgarian _do_-), described as “very productive”\n- _iz-_ ‘aktionsart’ (from Bulgarian _iz_-)\n- _nӑ-_ ‘aktionsart’ (from Bulgarian _na_-)\n- _pri-_ ‘aktionsart’ (from Bulgarian _prĕ-_)\n- _pru_- ‘aktionsart’ (from Bulgarian _pro_-), described as “highly productive”\n- _pu_- ‘aktionsart’ (from Bulgarian _po-_)\n- _pud_- ~ _put_- ‘aktionsart’ (from Bulgarian _pod_-)\n- _răz_- ‘aktionsart’ (from Bulgarian _răs_-)\n- _ză-_ ‘aktionsart’ (from Bulgarian _za-_)\n\n\nSimilar sets of Slavic aktionsart prefixes have been borrowed into other Daco-Romance languages: 8 aktionsart prefixes are borrowed from Croatian to Istro-Romanian. The prefix _do-_ ‘attainment of the final point of motion or activity’ is found in Romanian varieties spoken in Serbian (Vlach Romanian), e.g. _do-facu_ preverb-do:past.3.singular) ‘s/he finished doing something’. Note that in Vlach Romanian, unlike Serbian (the source language) and Istro-Romanian ([Kovačec 1971](sources.bib?label=Kova%C4%8Dec+1971#cldf:kova1971a):125), the prefix does not have a perfectivizing role. Its meaning is derivational, and the category of Slavic aspect was not introduced with the borrowing ([Gardani, Arkadiev, and Amiridze 2015](sources.bib?label=Gardani%2C+Arkadiev%2C+and+Amiridze+2015#cldf:gardani2015a):7). The borrowing of aspectual/aktionsart preverbs is common in languages that have been in contact with Slavic (see Russian affixes in Lithuanian Romani, and Russian and Belarusian affixes in Lithuanian).\n\n23 derivational suffixes are borrowed from Bulgarian. Below, forms are listed that [Capidan ](sources.bib?label=Capidan+#cldf:capidan1925a)([1925](sources.bib?label=1925#cldf:capidan1925a):186–195) marks as pan-Slavic, while those marked only as Serbian are excluded. Note that some forms are probably complex and others may be allomorphs. There are a total of about 50 derivational suffixes in Megleno-Romanian, many of the non-Slavic ones have etymologies in Latin (i.e. count as native), but there are also several borrowings from Greek and some from Turkish. No examples of hybrid formations are provided by [Capidan ](sources.bib?label=Capidan+#cldf:capidan1925a)([1925](sources.bib?label=1925#cldf:capidan1925a):195–202).\n\n\n11 diminutives\n\n- -_atš_ ‘diminutive’, e.g. _ghiumatš_ ‘small brass pitcher’.\n- -_aş_ ‘diminutive’ (from Slavic in general), e.g. _cupilaş_ ‘little baby’.\n- -_cǎ_ ‘feminine diminutive’ (from Slavic in general), e.g. _izvorcǎ_ ‘little spring’, described as “very productive”.\n- -_ic_ ‘diminutive’ (from Slavic in general), e.g. _aric_ ‘yard (lit. little area)’.\n- -_icǎ_ ‘diminutive’ (from Slavic in general), e.g. _balitiicǎ_ ‘little lake’.\n- -_itşcǎ_ ‘diminutive’ (from Bulgarian), e.g. _cǎsitşcǎ_ ‘little house’.\n- -_iṭǎ_ ‘diminutive’/’feminine from masculine nouns’ (from Slavic in general), e.g. _gǎuriṭǎ_ ‘little hole’.\n- -_oşcǎ_ ‘diminutive’, e.g. _baroşcǎ_ ‘little puddle’.\n- -_utş_ ‘diminutive’, e.g. _fratutş_ ‘little brother’.\n- -_uş_ ‘diminutive’, e.g. _cǎldǎrǎş_ (sic!) ‘little bucket’.\n- -_tšoc_ (_-tše-oc_) ‘diminutive’, e.g. _cǎptšoc_ ‘small head’.\n\n\n\n9 nominalizers and nominal derivation\n\n- -_an_ ‘quality nouns’ (from Slavic in general and Bulgarian), e.g. _mijlucan_ ‘the middle one (middle brother)’.\n- -_ealǎ_ ‘abstract nouns from adjectives’, e.g. _nigrealǎ_ ‘blackness’.\n- -_ean_ ‘inhabitant of’ (from Slavic in general), e.g. _cǎtunean_ ‘someone who lives in a hamlet’.\n- -_eṭ_ (meaning unclear) (from Slavic in general), e.g. _vărdăreṭ_ ‘wind (from Vardar?)’.\n- _-i̯ǎ_ ‘nouns from adjectives’ (from Slavic in general), e.g. _vuṭi̯ǎ_ ‘wealth’.\n- -_ineṭ_ ‘inhabitant noun’ (from Bulgarian), e.g. _Cupineṭ_ ‘someone from Cupa’.\n- -_işti_ ‘place where x is/happens’, e.g. _bǎnişti_ ‘bathing place’.\n- -_niṭǎ_ ‘place name derivation’, e.g. _valturniṭǎ_ ‘place where eagles nest’.\n- -_utinǎ_ ‘collective nouns’, e.g. _erbutinǎ_ ‘grassland’.\n\n\n\n\n\n\n\n\n\n\n\n\n\n2 adjectivizers\n\n- -_lif_ ‘adjectives from nouns’ (from Bulgarian), e.g. _bǎnlif_ ‘wounded’.\n- -_nic_ ‘adjective from nouns’ (from Bulgarian -_nik_) three attestations, counting one with -_arnic_, e.g. _cǎvai̯nic_ ‘poor’.	\N	81	80	Eurasia	\N	\N	34	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
48	{}	88	Greek affixes in Arvanitic Albanian	Information and examples are mainly from [Sasse ](sources.bib?label=Sasse+#cldf:sasse1985a)([1985](sources.bib?label=1985#cldf:sasse1985a); [1991](sources.bib?label=1991#cldf:sasse1991a)). According to [Sasse ](sources.bib?label=Sasse+#cldf:sasse1985a)([1985](sources.bib?label=1985#cldf:sasse1985a):91–92), borrowed affixes have become productive and can today be used to form hybrid formations from Albanian stems. Additional information is from [Altimari ](sources.bib?label=Altimari+#cldf:altimari2011a)([2011](sources.bib?label=2011#cldf:altimari2011a)).\n\n\n4 diminutive markers, out of a total of 7 diminutive markers in Arvanitic Albanian ([Sasse 1991](sources.bib?label=Sasse+1991#cldf:sasse1991a):235–239), which do not seem to be phonologically conditioned allomorphs.\n\n- -(_á)ko_ ‘diminutive’, e.g. _priftáko_ ‘little priest’, limited to a few cases. [Sasse ](sources.bib?label=Sasse+#cldf:sasse1985a)([1985](sources.bib?label=1985#cldf:sasse1985a)) explicitly states that this form is borrowed.\n- _-átʃ_ ‘diminutive’, e.g. _kuðátʃ_ ‘little jar’, limited productivity. [Sasse ](sources.bib?label=Sasse+#cldf:sasse1985a)([1985](sources.bib?label=1985#cldf:sasse1985a)) explicitly states that this form is borrowed.\n- _-ác_ ‘diminutive (pup)’, e.g. _ʎepurác_ ‘rabbit’s pup’. Its use as a diminutive with nouns other than animals is restricted to Greek stems ([Sasse 1991](sources.bib?label=Sasse+1991#cldf:sasse1991a):240).\n- _-ópuł_ ‘diminutive (pup)’, e.g. _uʎkópuł_ ‘wolf’s pup’, has limited productivity ([Sasse 1991](sources.bib?label=Sasse+1991#cldf:sasse1991a):241).\n\n\n\n2 noun derivation suffixes, out of a large set of other noun-to-noun derivation markers, e.g. feminine occupation, etc. ([Sasse 1991](sources.bib?label=Sasse+1991#cldf:sasse1991a):241–246).\n\n- -_jár_ ‘agent noun’, e.g. _ʃurrjár_ ‘someone urinating’ (from _ʃúrrə_ ‘urine’). This suffix is largely productive and partially native and partially borrowed from Greek _(ι)άρης_ ([Sasse 1991](sources.bib?label=Sasse+1991#cldf:sasse1991a):242).\n- _-jót_ ‘inhabitant of’, e.g. _curkatjót_ ‘inhabitant of Kiurka’ (from _curkát_ ‘Kiurka’). This suffix is productive and [Sasse ](sources.bib?label=Sasse+#cldf:sasse1985a)([1985](sources.bib?label=1985#cldf:sasse1985a)) explicitly mentions that it is borrowed.\n\n\n\n4 verbalizers, out of a total of 9 in Arvanitic Albanian. All verbal derivational morphemes are unproductive ([Sasse 1991](sources.bib?label=Sasse+1991#cldf:sasse1991a):252–255).\n\n- _-(j)ás_ ‘verbalizer’, e.g. _morrá_ ‘delouse’ (from _mórr_ ‘louse’). The form is given as _(j)ás_ ([Sasse 1991](sources.bib?label=Sasse+1991#cldf:sasse1991a):254) or _á_ ([Sasse 1985](sources.bib?label=Sasse+1985#cldf:sasse1985a)), but according to Sasse (personal communication, 2012), _as_ is the correct form. [Sasse ](sources.bib?label=Sasse+#cldf:sasse1985a)([1985](sources.bib?label=1985#cldf:sasse1985a)) explicitly mentions that it is borrowed.\n- _-ís_ ‘verbalizer’, e.g. _dzarrís_ ‘to harrow’ (from _dzárrə_ ‘harrow’). It is only attested in a few words, yet [Sasse ](sources.bib?label=Sasse+#cldf:sasse1985a)([1985](sources.bib?label=1985#cldf:sasse1985a)) explicitly mentioned that it is borrowed.\n- _-ós_ ‘verbalizer’, e.g. _ɲatrós_ ‘let oneself seduce’ (from _ɲátrə_ ‘another’), only attested in one word. [Sasse ](sources.bib?label=Sasse+#cldf:sasse1985a)([1985](sources.bib?label=1985#cldf:sasse1985a)) explicitly states that this form is borrowed.\n- _-is-/-as-/-eks-_ ‘verbalizer’ to adapt loanwords from Italian that have a Greek etymology in Italian, as in the following examples from [Altimari ](sources.bib?label=Altimari+#cldf:altimari2011a)([2011](sources.bib?label=2011#cldf:altimari2011a):11): _ngol-is-ënj_ (&lt; _incollare_) ‘to paste’, compare Ancient Greek _κόλλα_ (_kólla_) ‘glue’; _shkerdhj-as-ënj_ (&lt; _scheggiare_) ‘to chip’, from Latin _schidia_ and ultimately Ancient Greek _σχίδια_ (_skhídia_) ‘chip’; _stirand-aks-ënj_ ~ _stirand-as-ënj_ (&lt; _stiracchiare_) ‘to stretch (washed clothes)’, probably from Ancient Greek _τείρω_ (_teírō_) ‘to wear out, rub’, via Latin.\n\n\n\n11 adjectives used as derivational prefixes or as bound first elements of compounds, out of a total of 11 such forms in Arvanitic Albanian. They are used on nouns, i.e. as adjective-noun compounds ([Sasse 1991](sources.bib?label=Sasse+1991#cldf:sasse1991a):257–258). All are productive and, for most, various examples with Albanian stems are found.\n\n- _aγrio-_ ‘wild’, e.g. _aγriodérr_ ‘wild boar’.\n- _ðoʎo_- ‘poor’, e.g. _ðoʎonún_ ‘poor godfather’, only three attestations, all from songs.\n- _meγalo-_ ‘big’, e.g. _meγalokopíʎe_ ‘old spinster’.\n- _mes-_ ‘medium’, e.g. _mesnátə_ ‘midnight’.\n- _mono-_ ‘single’, e.g. _monobíʎə_ ‘single daughter’.\n- _mavro_- ‘black, pitiful’, e.g. _mavropʎák_ ‘poor old man’.\n- _paʎo-_ ‘bad’ (very popular), e.g. _paʎodjáʎə_ ‘naughty child’.\n- _psefto-_ ‘fake’, e.g. _pseftopúnǝ_ ‘superficial work’.\n- _proto-_ ‘first’ (only one example given), e.g. _protohérǝ_ ‘for the first time’.\n- _stravo-_ ‘crooked’ (only attested once), e.g. _stravogrúa_ ‘stubborn woman’.\n- _vromo_- ‘dirty, smelly’, e.g. _vromopúnǝ_ ‘dirty work’.\n\n\nVery rarely and only in songs, Albanian adjectives are also used in such constructions ([Sasse 1991](sources.bib?label=Sasse+1991#cldf:sasse1991a):258).\n\n\n2 prepositions as derivational devices on nouns, out of a total of 3 in Arvanitic Albanian (the native Albanian form, not counted here, is _nənə_ ‘under’).\n\n- _para-_ ‘next to’, e.g. _paratátǝ_ ‘stepfather’.\n- _pro-_ ‘before’, e.g. _protátǝ_ ‘forefather’.\n\n\n\n5 verbal derivational devices, as part of a systems of 8 Arvanitic Albanian ‘preverbs’; _kata_ is also used in this function, but it is not counted here again ([Sasse 1991](sources.bib?label=Sasse+1991#cldf:sasse1991a):262–267). These forms have entered the language as part of Greek complex loanwords, but they have become productive with Albanian stems.\n\n- _apo-_ (different functions, only few cases), e.g. _apobǝ́nem_ ‘I become’, _apohíng(ǝ)ra_ ‘I ate up’.\n- _kse-_ (different functions, like German _ent, aus, auf_, very frequent, also with Albanian verbs), e.g. _kseʎóð(əɲ)_ ‘let someone rest’.\n- _ksana-_ ‘do x again’, e.g. _ksanaháp(əɲ)_ ‘open again’, very productive, also with Albanian stems.\n- _para-_ ‘excessively’, e.g. _parahá_ ‘eat too much’.\n- _kata-_ ‘intensifier’ (relatively rare), e.g. _kataʎóðem_ ‘I become very tired, i.e. I work too hard’. This form is also used as a derivational prefix on adjectives, participles, and adverbs (as part of a system of 2 such forms in Arvanitic Albanian, along with the native Albanian form _pa_ ‘without’), e.g. _kata-_ ‘very’, e.g. _katairi_ ‘brand new’ (from _iri_ ‘new’), _katanáni_ ‘right now’ (from _náni_ ‘now’).\n\n\n\n\n\n\n\n\n\n4 verbal derivational devices as first elements of compounds ([Sasse 1991](sources.bib?label=Sasse+1991#cldf:sasse1991a):267).\n\n- _kalo-_ ‘good’, e.g. _kalopagúan_ ‘pay well’.\n- _kako-_ ‘bad’, e.g. _kakopagúan_ ‘pay badly’.\n- _miso-_ ‘medium’, e.g. _misoháp(əɲ)_ ‘open partially’.\n- _proto-_ ‘for the first time’, e.g. _protovéte_ ‘go for the first time’.	\N	82	33	Eurasia	\N	\N	32	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
49	{}	92	Russian affixes in Lithuanian Romani	Information and examples are from [Tenser ](sources.bib?label=Tenser+#cldf:tenser2005a)([2005](sources.bib?label=2005#cldf:tenser2005a):13, 34–35).\n\n\n1 superlative prefix\n\n- _naj-_ ‘superlative’, e.g. _nai-bar-edvr_ (superlative-big-comparative) ‘the biggest’\n\n\n\n5 aktionsart prefixes\n\n- _po-_ ‘aktionsart’, e.g. _po-mang-_ ‘to ask’\n- _pod-_ ‘aktionsart’, e.g. _pod-gij-_ ‘to approach’\n- _ros-_ ‘aktionsart’, e.g. _ros-pxen-_ ‘to tell’\n- _vy-_ ‘aktionsart’, e.g. _vy-pi-_ ‘to drink’\n- _za-_ ‘aktionsart’, e.g. _za-pres-_ ‘to pay’	\N	83	5	Eurasia	\N	\N	6	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
29	{}	34	Ritharngu affixes in Ngandi	Information and examples are from [Heath ](sources.bib?label=Heath+#cldf:heath1978a)([1978a](sources.bib?label=1978a#cldf:heath1978a); [1978b](sources.bib?label=1978b#cldf:heath1978b)).\n\n\n2 case markers (out of 7 Ngandi case markers) ([Heath 1978b](sources.bib?label=Heath+1978b#cldf:heath1978b):41–50)\n\n- _-ṱu_ ~ _-ḓu_ ‘ergative/instrumental’, e.g. _-mumbaʔ-ḓu_ ‘with axes’, _awaṭuʔṇayi-ṱu_ ‘his dog ［bit me］’\n- _-ku_ ‘genitive, dative, purposive’, e.g. _ŋayi-ku_ ‘mine’, _mawaṇguraʔ-gu_ ‘the bandicoot’s’\n\n\nNote that four further affixes may have been borrowed, but the directionality of borrowing is not clear, therefore they are not counted here (see also the entry on Ritharngu): (i) 2 out of 3 derivational adverbializers (called “compounding” elements by [Heath ](sources.bib?label=Heath+#cldf:heath1978b)([1978b](sources.bib?label=1978b#cldf:heath1978b):121)): _malk-_ ‘times’, _bala-_ ‘side’; (ii) 2 out of 2 verbal derivation markers (called “comitative” by [Heath ](sources.bib?label=Heath+#cldf:heath1978b)([1978b](sources.bib?label=1978b#cldf:heath1978b):83)): _-baṱa-_ ‘applicative’ (forming (semantically) transitive verbs with comitative object from intransitive verbs), _-ṛi-_ ‘applicative’ (forming transitive verbs with an object that denotes something transported from intransitive verbs of motion).	\N	45	46	Australia	\N	\N	2	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
30	{}	37	Croatian affixes in Istro-Romanian	Information and examples are drawn from various sources, as noted below. For additional discussion of some of the following examples, see [Rozencvejg ](sources.bib?label=Rozencvejg+#cldf:rozencvejg1976a)([1976](sources.bib?label=1976#cldf:rozencvejg1976a):24), [Dahmen ](sources.bib?label=Dahmen+#cldf:dahmen1989a)([1989](sources.bib?label=1989#cldf:dahmen1989a):455), [Breu ](sources.bib?label=Breu+#cldf:breu1992a)([1992](sources.bib?label=1992#cldf:breu1992a); [1996](sources.bib?label=1996#cldf:breu1996a):35–36), and [Boretzky ](sources.bib?label=Boretzky+#cldf:boretzky2004a)([2004](sources.bib?label=2004#cldf:boretzky2004a):1648).\n\n\n2 agreement suffixes, marking agreement with neuter nouns on adjectives. The singular suffix occurs in both varieties of Istro-Romanian (viz. Northern Istro-Romanin and Southern Istro-Romanian), whereas the agreement marker _-a_ only occurs in Northern Istro-Romanian.\n\n- _-o_ marking mass neuter singular agreement, e.g. Southern Istro-Romanian _nov-o_ ‘new-mass.neuter.singular’) (from Latin _novum_) ([Gardani 2020](sources.bib?label=Gardani+2020#cldf:gardani2020a):275; Kovačec 1966:68; [Loporcaro, Gardani and Giudici 2021](sources.bib?label=Loporcaro%2C+Gardani+and+Giudici+2021#cldf:loporcaro2021a):92).\n- _-a_ marking collective neuter plural agreement_,_ e.g. Northern Istro-Romanian (_diːtsa_) _bur-a_ ‘(children) good-collective.neuter.plural’ (from Latin _bonum_); it occurs on class one adjectives, articles, personal pronouns and demonstratives ([Loporcaro 2018](sources.bib?label=Loporcaro+2018#cldf:loporcaro2018a):295; [Loporcaro, Gardani and Giudici 2021](sources.bib?label=Loporcaro%2C+Gardani+and+Giudici+2021#cldf:loporcaro2021a):118).\n\n\n\n7 derivational prefixes, forming to some extent aspectual pairs. Further prefixes are mentioned in some of the sources, but these are not attested in hybrid formations.\n\n- _po-_ ‘perfective’, e.g. _potorče_ ‘to spin (perfective)’ from _torče_ ‘to spin (imperfective)’ ([Hurren 1969](sources.bib?label=Hurren+1969#cldf:hurren1969a):62; [Kovačec 1971](sources.bib?label=Kova%C4%8Dec+1971#cldf:kova1971a):125), _posúže_ ‘to suck (perfective)’ from _súže_ ‘to suck (imperfective)’ ([Sala 1988](sources.bib?label=Sala+1988#cldf:sala1988a):79).\n- _za- ~ ze-_ ‘perfective’_,_ e.g. _zadurmi/zedurmi_ ‘to sleep (perfective)’ from _durmi_ ‘to sleep (imperfective)’, _zaplənče_ ‘to weep (perfective)’ from _plənče_ ‘to weep (imperfective)’ ([Hurren 1969](sources.bib?label=Hurren+1969#cldf:hurren1969a):62; [Kovačec 1971](sources.bib?label=Kova%C4%8Dec+1971#cldf:kova1971a):125), _zalatrɑ̊_ bark (perfective/inchoative) ‘to begin to bark’ from _latrɑ̊_ ‘bark.imperfective’ ([Gardani 2020](sources.bib?label=Gardani+2020#cldf:gardani2020a):276; [Sala 1988](sources.bib?label=Sala+1988#cldf:sala1988a):79).\n- _raz-_ ‘perfective’_,_ e.g. _razlegua_ ‘to bind (perfective)’ from _legua_ ‘to bind (imperfective)’ ([Hurren 1969](sources.bib?label=Hurren+1969#cldf:hurren1969a):62; [Kovačec 1971](sources.bib?label=Kova%C4%8Dec+1971#cldf:kova1971a):125; [Sala 1988](sources.bib?label=Sala+1988#cldf:sala1988a):79).\n- _s-_ ‘perfective’, e.g. _skopei_ ‘to dig (perfective)’ from _kopei_ ‘to dig (imperfective)’ ([Hurren 1969](sources.bib?label=Hurren+1969#cldf:hurren1969a):62; [Kovačec 1971](sources.bib?label=Kova%C4%8Dec+1971#cldf:kova1971a):125).\n- _od-_ ‘perfective’, e.g. _odlomi_ ‘to break (perfective)’ from _lomi_ ‘to break (imperfective)’ ([Hurren 1969](sources.bib?label=Hurren+1969#cldf:hurren1969a):62; [Kovačec 1971](sources.bib?label=Kova%C4%8Dec+1971#cldf:kova1971a):125).\n- _na- ~ ne-_ ‘perfective’, e.g. _namâŋcɑ̊_ ‘to eat (perfective)’ from _mâncɑ̊_ ‘to eat’ ([Sala 1988](sources.bib?label=Sala+1988#cldf:sala1988a):79).\n- _pri-_ ‘perfective’, e.g. _prifače_ ‘to finish changing, to do differently’ from _fače_ ‘to do’ ([Sala 1988](sources.bib?label=Sala+1988#cldf:sala1988a):79).\n\n\nSimilar sets of Slavic aktionsart prefixes have been borrowed into other Daco-Romance languages: 9 aktionsart prefixes found in Megleno-Romanian are borrowed from Bulgarian. The prefix _do-_ ‘attainment of the final point of motion or activity’ is found in Romanian varieties spoken in Serbian (Vlach Romanian), e.g. _do-facu_ preverb-do:past.3.singular) ‘s/he finished doing something’. Note that in Vlach Romanian, unlike Serbian (the source language) and Istro-Romanian ([Kovačec 1971](sources.bib?label=Kova%C4%8Dec+1971#cldf:kova1971a):125), the prefix does not have a perfectivizing role. Its meaning is derivational, and the category of Slavic aspect was not introduced with the borrowing ([Gardani, Arkadiev, and Amiridze 2015](sources.bib?label=Gardani%2C+Arkadiev%2C+and+Amiridze+2015#cldf:gardani2015a):7). The borrowing of aspectual/aktionsart preverbs is common in languages that have been in contact with Slavic (see Russian affixes in Lithuanian Romani, and Russian and Belarusian affixes in Lithuanian).\n\n[Gardani ](sources.bib?label=Gardani+#cldf:gardani2008a)([2008](sources.bib?label=2008#cldf:gardani2008a):69; citing [Pușcariu 1943](sources.bib?label=Pu%C8%99cariu+1943#cldf:pu1943a):280) also mentions that the accusative marker _-u_ would have replaced the inherited _-ɑ̌_ in just only fixed phrase involving a native Romance lexical base, viz. _za ţiru_ ‘at dinner‘ (cf. Latin _cēna_).	\N	52	51	Eurasia	\N	\N	9	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
31	{}	39	Quapaw affixes in Koasati	Information is from [Rankin ](sources.bib?label=Rankin+#cldf:rankin1988a)([1988](sources.bib?label=1988#cldf:rankin1988a):643–644, citing Geoffrey Kimball, personal communication). No examples of hybrids are given. The identification of the affix as borrowed is based on similarities in form, the presence of cognate forms in other Siouan languages, and the absence of similar forms in other Muskogean languages.\n\n\n1 numeral-forming suffix\n\n- _-nąną_ ‘distributive of numerals’	\N	54	53	North America	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
32	{}	40	Aramaic affixes in Hasankeyf Arabic	These borrowed affixes are reported for the variety spoken in Hasankeyf (Turkey). Information and examples are from Andreas Fink (personal communication), see also [Diem ](sources.bib?label=Diem+#cldf:diem1971a)([1971](sources.bib?label=1971#cldf:diem1971a)) and [Jastrow ](sources.bib?label=Jastrow+#cldf:jastrow1978a)([1978](sources.bib?label=1978#cldf:jastrow1978a):31) for the _n-_pattern.\n\n\n2 non-interrelated patterns\n\n- _n_-pattern ‘plural’, e.g. _hənne_ ‘they’ (instead of native Arabic _həmmu_)\n- _a-ə_ pattern ‘perfect verb stem formation’ (no examples of hybrids)	\N	56	55	Eurasia	\N	\N	2	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
33	{}	41	Tamil affixes in Sri Lanka Portuguese	Information and examples are from [Nordhoff ](sources.bib?label=Nordhoff+#cldf:nordhoff2013a)([2013](sources.bib?label=2013#cldf:nordhoff2013a)), [Smith ](sources.bib?label=Smith+#cldf:smith2013a)([2013](sources.bib?label=2013#cldf:smith2013a)) and personal communications from Sebastian Nordhoff and Ian Smith, 2012.\n\n\n1 polite imperative marker\n\n- _-nga_ ‘imperative’, e.g. _vii_ ‘come! (fam.)’ vs. _viinga_ ‘come! (polite)’, _kummenga_ ‘eat! (polite)’\n\n\n\n1 conjunctive participle marker\n\n- _=tu_ ‘participle’, e.g. _aka noos aka uusha kampani-pa daa=tu, aka jaa-faya dreetu_ (that/1pl/that/Usha/company-dative/give=perfective.participle/that/past-make/right) ‘we gave that to the Usha company and repaired it’	\N	58	57	Eurasia	\N	\N	2	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
34	{}	42	Northern Nyungic affixes in Kayardild	Information and examples are from [Evans ](sources.bib?label=Evans+#cldf:evans1995a)([1995](sources.bib?label=1995#cldf:evans1995a):38, 129).\n\n\n1 derivational suffix\n\n- _-kuru ~ -wuru_ ‘proprietive’, e.g_. wara-wuran-kuru-_ (mouth-food-proprietive) ‘having food in its mouth’, _kurndu-kunawuna-wuru-_ (chest-child-proprietive) ‘having a child on her chest’ (examples from [Round 2010](sources.bib?label=Round+2010#cldf:round2010a):199)	\N	60	59	Australia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
35	{}	46	Arabic affixes in Indonesian, standard	Information and examples are from [Jones ](sources.bib?label=Jones+#cldf:jones1984a)([1984](sources.bib?label=1984#cldf:jones1984a)), [Verhaar ](sources.bib?label=Verhaar+#cldf:verhaar1984a)([1984](sources.bib?label=1984#cldf:verhaar1984a)), [Tadmor ](sources.bib?label=Tadmor+#cldf:tadmor2009a)([2009](sources.bib?label=2009#cldf:tadmor2009a)) and personal communications from Uri Tadmor. [Jones ](sources.bib?label=Jones+#cldf:jones1984a)([1984](sources.bib?label=1984#cldf:jones1984a):12–17) discusses loanwords and some “Arabic phrases and bound morphemes; Arabic grammar”, but it is unclear whether these are used with native Indonesian stems. According to Uri Tadmor (personal communication), only one affix from Arabic is attested with non-Arabic stems.\n\n\n1 suffix\n\n- _-awi_ ‘adjectivizer’ ([Tadmor 2009](sources.bib?label=Tadmor+2009#cldf:tadmor2009a):705), e.g. _gerejawi_ ‘related to church’\n\n\nAnother Arabic adjectivizer, _-iah_, occurs only on Arabic roots and on roots perceived as Arabic according to Uri Tadmor (personal communication).	\N	62	61	Papunesia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
36	{}	67	Sicilian affixes in Maltese	Information and examples are taken from [Borg ](sources.bib?label=Borg+#cldf:borg1994a)([1994](sources.bib?label=1994#cldf:borg1994a):57), [Borg and Azzopardi-Alexander ](sources.bib?label=Borg+and+Azzopardi-Alexander+#cldf:borg1997a)([1997](sources.bib?label=1997#cldf:borg1997a):280, 291), [Saade ](sources.bib?label=Saade+#cldf:saade2020a)([2020](sources.bib?label=2020#cldf:saade2020a):454, 455), and other sources cited below. See also [Gardani ](sources.bib?label=Gardani+#cldf:gardani2008a)([2008](sources.bib?label=2008#cldf:gardani2008a):75; 2012:81).\n\n\n3 singulative suffixes\n\n- _-ata_ ‘singulative’, e.g. _xemxata_ ‘sunstroke’ (from _xemx_ ‘sun’), _ksuħata_ ‘(act of) snobbery’ (from _ksuħa_ ‘snobbery’), as described in [Borg and Azzopardi-Alexander ](sources.bib?label=Borg+and+Azzopardi-Alexander+#cldf:borg1997a)([1997](sources.bib?label=1997#cldf:borg1997a):280).\n- _-u_ ‘singulative masculine’, e.g. _wizzu_ ‘goose’, _du:du_ ‘worm’, _fu:lu_ ‘bean’, see [Borg ](sources.bib?label=Borg+#cldf:borg1994a)([1994](sources.bib?label=1994#cldf:borg1994a):57).\n- _-a_ ‘singulative feminine’, e.g. _du:da_ ‘worm’, _fu:la_ ‘bean’ ([Borg 1994](sources.bib?label=Borg+1994#cldf:borg1994a):57). [Borg and Azzopardi-Alexander ](sources.bib?label=Borg+and+Azzopardi-Alexander+#cldf:borg1997a)([1997](sources.bib?label=1997#cldf:borg1997a):174, 245) also mention singulative _-a_, e.g. _nemla_ ‘ant’ (from _nemel_ ‘ants’), _xirja_ ‘a purchase’ (from _xiri_ ‘shopping’), but do not say whether this is borrowed.\n\n\n\n3 nominalizers\n\n- _-ż_ (masculine), _-ża_ (feminine) ‘inhabitant nouns and adjectives from place names and adjectives’, e.g. _Karkariż, Karkariża_ ‘person from _Birkirkara’_, _Ċiniż_ ‘Chinese’, _Ingliż_ ‘English’.\n- _-azz_ ‘nominal from adjective or noun’, e.g. _sakranazz_ ‘drunkard’ (from _sakran_ ‘drunk’), it can have a pejorative connotation following [Saade ](sources.bib?label=Saade+#cldf:saade2020a)([2020](sources.bib?label=2020#cldf:saade2020a):454, 455), see also [Drewes ](sources.bib?label=Drewes+#cldf:drewes1994a)([1994](sources.bib?label=1994#cldf:drewes1994a):94).\n- _-iżmu_ ‘deadjectival noun’, e.g. _lagħqiżmu_ ‘servilism’ (from _lagħaq_ ‘to be servile’), cf. [Saade ](sources.bib?label=Saade+#cldf:saade2020a)([2020](sources.bib?label=2020#cldf:saade2020a):454, 455), see also [Brincat and Mifsud ](sources.bib?label=Brincat+and+Mifsud+#cldf:brincat2015a)([2015](sources.bib?label=2015#cldf:brincat2015a):3350).\n\n\n\n1 adjectivizer\n\n- _-uż_ ‘adjectivizer’, e.g. _nkejjuż_ ‘annoying’ (from _nkejja_ ‘vexation’), as shown in [Saade ](sources.bib?label=Saade+#cldf:saade2020a)([2020](sources.bib?label=2020#cldf:saade2020a):455), cf. also [Drewes ](sources.bib?label=Drewes+#cldf:drewes1994a)([1994](sources.bib?label=1994#cldf:drewes1994a):93).\n\n\n\n1 augmentative suffix\n\n- _-un_ ‘augmentative’, e.g. _darun_ ‘large house’ (from _dar_ ‘house’), cf. [Saade ](sources.bib?label=Saade+#cldf:saade2020a)([2020](sources.bib?label=2020#cldf:saade2020a):454, 455), see also [Brincat and Mifsud ](sources.bib?label=Brincat+and+Mifsud+#cldf:brincat2015a)([2015](sources.bib?label=2015#cldf:brincat2015a):3350).	\N	64	63	Eurasia	\N	\N	8	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
37	{}	68	Sadri affixes in Kharia	Information and examples are from [Peterson ](sources.bib?label=Peterson+#cldf:peterson2011a)([2011](sources.bib?label=2011#cldf:peterson2011a):324) and John Peterson (personal communication, March 2012).\n\n\n2 so-called “sequential converbs”/”conjunctive participles” (out of a paradigm of 3 forms in Kharia)\n\n- =_ke_, e.g. _kaʔ kom=ki ɖhoʔ=ke_ (bow/arrow=pl grab=sequential) ‘having taken their bows and arrows, ...’\n- =_ker_ (no examples available)\n\n\nNote that [Abbi ](sources.bib?label=Abbi+#cldf:abbi1995a)([1995a](sources.bib?label=1995a#cldf:abbi1995a):183), [Abbi ](sources.bib?label=Abbi+#cldf:abbi1997a)([1997](sources.bib?label=1997#cldf:abbi1997a):139–142) and [Abbi ](sources.bib?label=Abbi+#cldf:abbi2001a)([2001](sources.bib?label=2001#cldf:abbi2001a):47,53) mentions a number of other borrowed affixes in Kharia, but according to John Peterson (personal communication, March 2012), it is not certain whether any of these can be used with native stems.	\N	66	65	Eurasia	\N	\N	2	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
40	{}	73	Banjar Malay affixes in Malagasy	Information and examples are from Alexander [Adelaar ](sources.bib?label=Adelaar+#cldf:adelaar2010a)([2010](sources.bib?label=2010#cldf:adelaar2010a)). The identification of these affixes as borrowed is based on sound changes.\n\n\n4 non-interrelated affixes\n\n- _vua-_ ‘passive’, e.g. _vua-helukă_ ‘guilty’ (compare _mana-melukă_ ‘to condemn O’), _vuampanga_ ‘accused’ (compare _mi-ampanga_ ‘to accuse O’) (example from [Adelaar and Vérin 1995](sources.bib?label=Adelaar+and+V%C3%A9rin+1995#cldf:adelaar1995a):401), _vua-suràtr-o_ ‘to be written’, _vua-valì-ko_ ‘answered by me’, _vua-lazà-ku_ ‘said by me’ (examples from [Adelaar 2012](sources.bib?label=Adelaar+2012#cldf:adelaar2012a):144)\n- _tafa-_ ‘accomplished act (verbal aspect)’ (no example of hybrid formations available)\n- _ra-_ ‘honorific personal prefix’ (used in nouns with human reference, including kinship terms), e.g. _ra-fuȼi_ ‘term of address for an old lady’ (_fuȼi_ ‘white’) (example from [Adelaar and Vérin 1995](sources.bib?label=Adelaar+and+V%C3%A9rin+1995#cldf:adelaar1995a):403–404)\n- _ta-_ ‘ethnic or geographical group’ derivation (no example of hybrid formations available)	\N	70	71	Africa	\N	\N	4	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
41	{}	75	intermediate Proto-Carib affixes in Proto Wayampi-Emerillon-Zo’é	Information and examples are from [Rose ](sources.bib?label=Rose+#cldf:rose2012a)([2012](sources.bib?label=2012#cldf:rose2012a)). Detailed reconstruction allows determining that the plural marker was borrowed from an intermediate Proto-Carib language into Proto Wayampi-Emerillon-Zo’é. The marker is a suffix in two daughter languages (Wayampi and Emerillon) and a free form in Zo’é.\n\n\n1 plural suffix\n\n- _-kom_ (Emerillon), _-kõ_ (Wayampi) ‘plural’, e.g. _wãĩwĩ-kom_ (women-pl) ‘women’ (Emerillon), _e-mɛmɨ-kũ_ (1sg-child-pl) ‘my children’ (Wayampi)	\N	73	72	South America	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
42	{}	77	English affixes in Hawaiian	Information and examples are from [Parker Jones ](sources.bib?label=Parker+Jones+#cldf:parker2009a)([2009](sources.bib?label=2009#cldf:parker2009a):784).\n\n\n1 derivational suffix\n\n- _-kona_ ‘sports event’ (from English _marathon_), e.g. _hele-kona_ ‘walk-athon’ (from _hele_ ‘go’)\n\n\nA number of other English affixes in Hawaiian are not attested with native stems, i.e. _heko-kalame_ ‘hecto-gram’, _keni-kalame_ ‘centi-gram’, _polai-posapahate_ ‘poly-phosphate’.	\N	75	74	Papunesia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
43	{}	78	Russian affixes in Kola Saami	Information and examples are from work by Michael Rießler and Rogier Blokland, as noted below. These forms are used on native stems according to Michael Rießler and Rogier Blokland (personal communication), although no examples of hybrids are given below.\n\n\n3 pragmatic particles\n\n- _=že_ ‘topic’ (no examples of hybrid formations) ([Rießler 2009](sources.bib?label=Rie%C3%9Fler+2009#cldf:riessler2009a):392; see also [Rießler 2007](sources.bib?label=Rie%C3%9Fler+2007#cldf:riessler2007a):238)\n- _=dak_ ‘topic’ (the exact function of the source form is described as “the preceding linguistic expression, say A, represents information, say x, on which a certain thought is based” ([Post 2006](sources.bib?label=Post+2006#cldf:post2006a):495)) (no examples of hybrid formations) (Rießler, personal communication, February 2012)\n- _-ka_ ‘hortative’, e.g. _vancla-ka_ ‘(let him) go!’ ([Blokland and Rießler 2011](sources.bib?label=Blokland+and+Rie%C3%9Fler+2011#cldf:blokland2011a):15)\n\n\n\n1 negative indefinite prefix\n\n- _nie-_ ‘negative indefinite’, forming expressions like ‘nobody, nowhere, nothing’ from expressions like ‘who, where, what’ (no examples of hybrid formations) ([Rießler 2007](sources.bib?label=Rie%C3%9Fler+2007#cldf:riessler2007a):237–238; see also [Blokland and Rießler 2011](sources.bib?label=Blokland+and+Rie%C3%9Fler+2011#cldf:blokland2011a):14–15)\n\n\n\n1 agent nominalizer\n\n- -_nihk ~ -nɨhk_ ~ -_nehk_ ‘agent nouns’, e.g. _pastlesnɨhk_ ‘a thorny shrub’ (from _pastel_ ‘sharp’), _v(ɨnn)ājtnihk_ ‘winegrower’ ([Blokland and Rießler 2011](sources.bib?label=Blokland+and+Rie%C3%9Fler+2011#cldf:blokland2011a):15; citing [Mägiste 1968](sources.bib?label=M%C3%A4giste+1968#cldf:maegiste1968a):16–17).	\N	76	5	Eurasia	\N	\N	5	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
44	{}	82	Turkish affixes in Kurmanji	Information and examples are from [Haig ](sources.bib?label=Haig+#cldf:haig2007a)([2007](sources.bib?label=2007#cldf:haig2007a):173; see also [Matras 2007](sources.bib?label=Matras+2007#cldf:matras2007a):45). The borrowing occurs in the western dialects of Kurmanji.\n\n\n1 clause-final clitic conditional marker\n\n- _=se_ ‘conditional’, e.g. _eer bapirê min ewna ne-girt-ine cem xa=sa ew-na di-mir-in_ (if/grandfather/I/they/not_take/to/reflexive=conditional/they/die) ‘If my grandfather had not taken them in they would have died’	\N	77	31	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
45	{}	83	Nepali affixes in Manange	Information and examples are from [Hildebrandt ](sources.bib?label=Hildebrandt+#cldf:hildebrandt2004a)([2004](sources.bib?label=2004#cldf:hildebrandt2004a):82–83; see also [Hildebrandt 2007](sources.bib?label=Hildebrandt+2007#cldf:hildebrandt2007a):292). Note that the same classifier is also borrowed from Nepali to Baram (see Nepali affixes in Baram). Both cases of affix borrowing are included here because Baram and Manange are only distantly related and the borrowing events are assumed to be independent.\n\n\n1 numeral classifier\n\n- _-tʰa_ ‘general numeral classifier’, used optionally for every kind of noun (the only classifier in Manange, the Nepali source form is the non-human classifier, opposed to a human classifier), e.g. _4ŋi-ŋtha kòla_ (two-classifier/child) ‘two children’, _4shi-ŋtha 1p_ʌ_le_ (one-classifier/hand) ‘one hand’ (numbers in the transcription indicate tone).	\N	78	43	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
46	{}	85	Russian affixes in Yiddish	Information and examples are from [Weinreich ](sources.bib?label=Weinreich+#cldf:weinreich1958a)([1958](sources.bib?label=1958#cldf:weinreich1958a):378–380; see also [Reershemius 2007](sources.bib?label=Reershemius+2007#cldf:reershemius2007a)). [Weinreich ](sources.bib?label=Weinreich+#cldf:weinreich1958a)([1958](sources.bib?label=1958#cldf:weinreich1958a):378) notes that the following eight additional potential cases of borrowed affixes have “rather limited distribution in the lexicon ［and］ are limited to a relatively small number of words each”, therefore they are not counted here: -_še_ ‘feminizer’, -_čik_ ‘endearing’, and five ‘pejoratives’ _-ak, -áč, -éts,_ and _-l’ák, -nák_. The remaining thirteen borrowed affixes, given in the following, are said to be “highly productive” ([Weinreich 1958](sources.bib?label=Weinreich+1958#cldf:weinreich1958a):378). [Weinreich ](sources.bib?label=Weinreich+#cldf:weinreich1958a)([1958](sources.bib?label=1958#cldf:weinreich1958a):378) notes that there are “many others”, without giving further details.\n\n\n3 feminine noun derivation\n\n- -_ke_ ‘feminine’, e.g. _lérerke_ ‘woman teacher’\n- -_ixe_ ‘feminine form of animal and (pejorative) personal names’, e.g. _léjb-ixe_ ‘lioness, Leyb’s wife’\n- -_ńítse_ ‘feminine form of personalizing or agentive nouns’, e.g. _ejšes-íš-ńítse_ ‘adulteress’\n\n\n\n2 (pejorative) adjectivizers\n\n- -_ske_, e.g. _oriman-ske_ ‘fit for a pauper’\n- _-(ev)ate_, e.g. _tam-evate_ ‘dull’\n\n\n\n3 noun-noun derivation\n\n- _-arné_ ‘place name mildly contemptuous’, e.g. _xasid_-_arné_ ‘gathering place for khasidim’\n- -_ńik_ ‘personalizing or agentive derivation’, e.g. _jišuf_-_ńik_ ‘village Jew’\n- -_úk_ ‘pejorative, especially for names of occupations’, e.g. _šuster-úk_ ‘contemptible cobbler’\n\n\n\n3 endearing vocatives/diminutives\n\n- _-(e)ńu_, e.g. _kínd-eńu_ ‘dear child’\n- _-ink(e)_, used with nouns, e.g. _múm-inke_ ‘dear aunt’, with adjectives, e.g. _dos rójt-ink-e kíšele_ ‘the little red (endearing) pillow’, with verbs, e.g. _šlóf-inke-en_ ‘to sleep (nursery-talk)’, with adverbs, e.g. _pamél-ink-es_ ‘slowly (endearing)’, and with at least one interjection, e.g. _gváld-ink-es_ ‘heavens!’\n- _-ičk_, used (also) with adjectives, e.g. _der ált-ičk-er_ _man_ ‘the old (endearing) man’\n\n\n\n1 privative prefix, “incipiently productive” ([Weinreich 1958](sources.bib?label=Weinreich+1958#cldf:weinreich1958a):378) and syntagmatically related to the personalizing or agentive derivational suffix -_ńik_ in the sense that it “seems to be limited to constructions with -_ńik_ in pejorative vocabulary” ([Weinreich 1958](sources.bib?label=Weinreich+1958#cldf:weinreich1958a):378).\n\n- _bez-_ ‘without’, e.g. _bez-buš_-_ńik_ ‘shameless person’\n\n\n\n1 verbalizer of interjections\n\n- -_ke_- ‘verbalizer’, e.g. _bom-ke-n_ ‘to say “bom”’	\N	79	5	Eurasia	\N	\N	13	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
50	{}	93	Spanish affixes in Sierra Popoluca	_­_Information and examples are from [Gutiérrez-Morales ](sources.bib?label=Guti%C3%A9rrez-Morales+#cldf:morales2005a)([2005](sources.bib?label=2005#cldf:morales2005a); [2008](sources.bib?label=2008#cldf:morales2008a)). Note that the form of this affix is probably influenced by Nahuatl, where it appears as _-teero_ in the complex loanword _kuenteero_ (from Spanish _cohetero_) ‘fireworks specialist’, and where it is reinforced by similar Nahuatl form ([Gutiérrez-Morales 2008](sources.bib?label=Guti%C3%A9rrez-Morales+2008#cldf:morales2008a); [Gutiérrez-Morales 2005](sources.bib?label=Guti%C3%A9rrez-Morales+2005#cldf:morales2005a)).\n\n\n1 agent noun derivation\n\n- _-teero_ ‘agent noun’, e.g. _kööp-teeroj_ (firewood-agent) ‘wood cutter’, _nöts-teeroj-am_ (armadillo-agent-already) ‘armadillo hunter’, _aa-teeroj_ (canoe-agent) ‘rower, paddler’, _tö’öp-teeroj_ (fish-agent) ‘fisherman’, _nö’-teeroj_ (water-agent) ‘water carrier’, _muut-teeroj_ (well-agent) ‘well driller’, _yooxa-teeroj_ (work-agent) ‘hard worker’	\N	84	25	South America	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
51	{}	94	Makrān Baluchi affixes in Brahui	Information and examples are from [Emeneau ](sources.bib?label=Emeneau+#cldf:emeneau1962a)([1962](sources.bib?label=1962#cldf:emeneau1962a)) and [Andronov ](sources.bib?label=Andronov+#cldf:andronov1980a)([1980](sources.bib?label=1980#cldf:andronov1980a)).\n\n\n1 verbal prefix\n\n- _a-_ ‘present-future and imperfect’, e.g. _ī-a kāva,_ underlying form _ī a-kāva_ (I/future-go) ‘I shall go’ ([Emeneau 1962](sources.bib?label=Emeneau+1962#cldf:emeneau1962a):56–57; [Andronov 1980](sources.bib?label=Andronov+1980#cldf:andronov1980a):68)\n\n\n\n2 adjectival derivational suffixes\n\n- _-tir_ ‘comparative’, e.g. _juāntir_ ‘better’ (from _juān_ ‘good’) ([Andronov 1980](sources.bib?label=Andronov+1980#cldf:andronov1980a):45). This marker is originally Persian, but entered Brahui through Baluchi ([Elfenbein 1998](sources.bib?label=Elfenbein+1998#cldf:elfenbein1998a):398).\n- _-ēn_ ‘adjective formation’, e.g. _pudēn_ ‘cold’, _‘anēn_ ‘sweet’, _xarēn_ ‘bitter’, _kubēn_ ‘heavy’ ([Andronov 1980](sources.bib?label=Andronov+1980#cldf:andronov1980a):29)	\N	86	85	Eurasia	\N	\N	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
52	{}	95	Malay affixes in Semelai	Information and examples are from [Kruspe ](sources.bib?label=Kruspe+#cldf:kruspe2004a)([2004](sources.bib?label=2004#cldf:kruspe2004a):64–69, 81–85, 206–208). This is a case of extreme compartmentalization of borrowed and native morphology since all native morphology is non-concatenative, and all borrowed morphology is concatenative. In this sense, all borrowed affixes are related. (For a typology of morphological compartmentalization, see [Gardani 2021](sources.bib?label=Gardani+2021#cldf:gardani2021a).)\n\n\n2 valency-changing prefixes\n\n- _br-_ ‘middle voice’ (passivization of verbs, nominalization ‘have’ of nouns), e.g. _br-bɒy_ ‘be dug up’\n- _p-_ ‘causative’ (used alternatively to non-concatenative causative morpheme, with some roots only), e.g. _p-jʔjiʔ_ ‘to make dirty’\n\n\n\n4 aspect prefixes, including one circumfix\n\n- _tr-_ ‘happenstance’, ‘happen to x’ (used with roots or causative-derived, or reduplicated roots from verbs), e.g. _tr-ca_ ‘happen to eat’\n- _par-_ ~ _pr-_ ‘excessive agent/performer’ (with verbs), e.g. _par-ca_ ‘one who eats incessantly, a glutton’\n- _m(N)-_ ‘imperfective’ (derives intransitive verbs from nouns and imperfective verb forms from verbs), e.g. _m-nar-deh_ ‘be denying’\n- _b-...-an_ ‘collective’ (collective activity verbs from verbs), e.g. _b&lt;pa’loh&gt;an_ ‘many people hiding together’\n\n\n\n1 valency-changing suffix\n\n- _-iʔ_ ‘applicative’ (increases valency, marks iterative aspect), e.g. _glɔk-iʔ_ ‘to laugh unkindly at someone’\n\n\n\n1 nominalizing suffix\n\n- _-an_ ‘nominalizer’ (relatively infrequent), e.g. _jʔjiʔ-an_ ‘dirtiness, filth’	\N	88	87	Eurasia	\N	\N	8	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
53	{}	96	Indonesian affixes in Tukang Besi	Information from Marc Donohue (personal communication, 2012). Although no examples of hybrid formation are available, this prefix seems to be used with native stems.\n\n\n1 passive marker\n\n- _di-_ ‘passive’, used as a passive in subordinate clauses only in Tukang Besi, in addition to native (cognate) markers _i-_ and (less commonly used) _ni-_. What additionally may have helped borrowing is that Tukang Besi past tense marker is _di-_ ~ _i-_, i.e. the same allomorphy as the resulting passive marking pattern ([Donohue 1999](sources.bib?label=Donohue+1999#cldf:donohue1999a)).\n\n\nAn additional, marginal case is _kempe-_, a reanalysis of the first two syllables of _kempetai_ ‘Japanese secret police during the occupation’ and Tukang Besi _-taʔi_ ‘feces’. Now, _kempe-_ can be used with native stems such as _-buta_ ‘vagina’, _-lau_ ‘penis’, etc. (Marc Donohue, personal communication, 2012).	\N	89	15	Papunesia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
54	{}	98	Persian affixes in Lezgian	Information and examples are from [Haspelmath ](sources.bib?label=Haspelmath+#cldf:haspelmath1993a)([1993](sources.bib?label=1993#cldf:haspelmath1993a):107) and from Don Stilo (personal communication 2013).\n\n\n3 nominalizers (out of a total of 8 nominalizers in Lezgian)\n\n- _-qʰan_ ‘agent nouns from nouns’, e.g. _xpe-qʰan_ ‘sheep herder’\n- _-gan_ ‘nouns denoting containers from nouns’, e.g. _t’urar-gan_ ‘box for spoons’\n- _-ban_ ‘nouns denoting people associated with the thing denoted by the base word’, e.g. _wak’ar-ban_ ‘swineherd’	\N	91	90	Eurasia	\N	\N	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
55	{}	100	Chukchi affixes in Central Siberian Yupik Eskimo	Information and examples are from [de Reuse ](sources.bib?label=de+Reuse+#cldf:reuse1994a)([1994](sources.bib?label=1994#cldf:reuse1994a)). There are many loanwords and very many borrowed adverbial and conjunctional particles, but only 3 bound forms were borrowed, 1 suffix and 2 clitics. They seem to have a similar distribution ([de Reuse 1994](sources.bib?label=de+Reuse+1994#cldf:reuse1994a):288) and similar meanings, therefore they are considered to be paradigmatically related.\n\n\n3 emphatic enclitics/suffixes\n\n- _-am_ ‘emphatic’, e.g. _maatenllaam_ ‘this time’ (from _maaten_ ‘time’, _=llu_ ‘and’), _sanganllaam_ ‘why now’ (from _sangan_ ‘why’, _=llu_ ‘and’), _qayuqham_ ‘how is it? how did it go?’ (from _qayuq_ ‘how’) ([de Reuse 1994](sources.bib?label=de+Reuse+1994#cldf:reuse1994a):364). This form is called an affix, but follows other clitics, such as _=llu_ ‘and’ ([de Reuse 1994](sources.bib?label=de+Reuse+1994#cldf:reuse1994a):288). See also [Miyaoka ](sources.bib?label=Miyaoka+#cldf:miyaoka2012a)([2012](sources.bib?label=2012#cldf:miyaoka2012a):1549–1550), who analyzes this form as a clitic.\n- _=qun_ ‘affirmative, emphasis’, e.g. _natenqun_ ‘how (could you think)?’ (from _naten_ ‘how’), _esghaqaghnakenqun_ ‘Look!’ (from _esghagh_ ‘see’), _tuugkaatqun_ ‘Harpoon heads!’ (from _tugkagh_ ‘harpoon head’) ([de Reuse 1994](sources.bib?label=de+Reuse+1994#cldf:reuse1994a):270–276, 424)\n- _=Vy_ ‘emphatic vocative’, e.g. _angyaay_ ‘Hey, boat!’ (from _angyagh_ ‘boat’), _qakmaay_ ‘You out there!’ (from _qakma_ ‘out’), _kangsughtungaay_ ‘I cannot fit through!’ (from _kangsugh_ ‘cannot fit through’) ([de Reuse 1994](sources.bib?label=de+Reuse+1994#cldf:reuse1994a):285–287, 424)	\N	93	92	North America	\N	\N	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
57	{}	102	Hindi affixes in Kurux	Information and examples are from [Mishra ](sources.bib?label=Mishra+#cldf:mishra1996a)([1996](sources.bib?label=1996#cldf:mishra1996a)). Only affixes for which there are indications that they are used on native stems are given in the following.\n\n\n4 adjectivizers. About these four, [Mishra ](sources.bib?label=Mishra+#cldf:mishra1996a)([1996](sources.bib?label=1996#cldf:mishra1996a):98) explicitly states that they are borrowed and productive, [Mishra ](sources.bib?label=Mishra+#cldf:mishra1996a)([1996](sources.bib?label=1996#cldf:mishra1996a):48–51) gives many other affixes, about which this is not explicitly stated.\n\n- _-ū_ ‘adjectivizer’, e.g. _pīṭū_ ‘fatal’ (from _pīṭ_ ‘to kill’)\n- _-hā_ ‘adjectivizer’, e.g. _bhūthā_ ‘haunted’ (from _bhūt_ ‘ghost’)\n- _-yā_ ‘adjectivizer’, e.g. _banyā_ ‘wild’ (from _ban_ ‘forest’)\n- _-al_ ‘adjectivizer’, e.g. _ḍubal_ ‘drowned’ (from _ḍub-_ ‘to drown’)\n\n\n\n1 gender marker, assuming that the following forms are phonologically conditioned allomorphs\n\n- _-ī, -in, -āin, -nī_ ‘feminine’, e.g. _āl-i_ ‘girl’ (vs. _ālas_ ‘boy’) ([Abbi 1995b](sources.bib?label=Abbi+1995b#cldf:abbi1995b):4; 2001:47; [Gardani 2012](sources.bib?label=Gardani+2012#cldf:gardani2012a):83). These are “directly borrowed from Indo-Aryan. The suffixes are mostly added to the borrowed nouns” ([Mishra 1996](sources.bib?label=Mishra+1996#cldf:mishra1996a):96, see also 21-22), but not exclusively (see also [Abbi 1997](sources.bib?label=Abbi+1997#cldf:abbi1997a):142).\n\n\n\n2 forms deriving special numerals. The “suffixes _khēp_ and _bahrī_ are used to form enumerative/proportional numerals ［...］ the suffix _-ō_ forming adjectival constructions from numerals” ([Mishra 1996](sources.bib?label=Mishra+1996#cldf:mishra1996a):96–97). Examples of -_khēp_ and _-bahrī_ are given in [Mishra ](sources.bib?label=Mishra+#cldf:mishra1996a)([1996](sources.bib?label=1996#cldf:mishra1996a):32), where they are also written as suffixes. Numerals one to four are indigenous Kurux ([Mishra 1996](sources.bib?label=Mishra+1996#cldf:mishra1996a):30). There are examples of _-ō_ and -_khēp_ in combination with numerals lower than five, but all examples of _-bahrī_ are with the borrowed numerals five or higher, therefore _-bahrī_ is not included here.\n\n- _-khēp_ ‘enumerative/proportional numerals’, e.g. _ōnd khēp_ ‘once’\n- _-ō_ ‘adjectives from numerals’, e.g. _tin-ō_ ‘all the three’\n\n\n\n1 passive marker\n\n- _-r/-tār_ ‘passive’, e.g. _cōx-tār/cōx-r_ ‘to be plucked’ (from _cōx_ ‘to pluck’), _la’ō-tār/la’ō-r_ ‘to be beaten up’ (from _la’ō_ ‘to beat someone up’). [Abbi ](sources.bib?label=Abbi+#cldf:abbi1997a)([1997](sources.bib?label=1997#cldf:abbi1997a):140) explicitly claims this form is borrowed from Indo-Aryan. [Mishra ](sources.bib?label=Mishra+#cldf:mishra1996a)([1996](sources.bib?label=1996#cldf:mishra1996a):108) discusses this form and says that the passive arose from contact with Indo-Aryan, but does not say explicitly that the form _-r/-tār_ would be borrowed.\n\n\n[Abbi ](sources.bib?label=Abbi+#cldf:abbi1997a)([1997](sources.bib?label=1997#cldf:abbi1997a):140, 142) mentions that the two Indo-Aryan “conjunctive participles” _-ar_ and _-ki_ would be used in urban Kurux. Because they are written as separate words by [Abbi ](sources.bib?label=Abbi+#cldf:abbi1997a)([1997](sources.bib?label=1997#cldf:abbi1997a):140), and also because no corresponding forms were found in [Mishra ](sources.bib?label=Mishra+#cldf:mishra1996a)([1996](sources.bib?label=1996#cldf:mishra1996a)), they are not considered here.	\N	96	95	Eurasia	\N	\N	8	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
58	{}	107	Persian affixes in Turkish	Information and examples are from [Göksel and Kerslake ](sources.bib?label=G%C3%B6ksel+and+Kerslake+#cldf:goeksel2005a)([2005](sources.bib?label=2005#cldf:goeksel2005a)), [Vietze, Zenker, and Warnke ](sources.bib?label=Vietze%2C+Zenker%2C+and+Warnke+#cldf:vietze1975a)([1975](sources.bib?label=1975#cldf:vietze1975a)), [Kubiyak ](sources.bib?label=Kubiyak+#cldf:kubiyak2004a)([2004](sources.bib?label=2004#cldf:kubiyak2004a)), [Memoglu-Süleymanoglu ](sources.bib?label=Memoglu-S%C3%BCleymanoglu+#cldf:memoglu_sueleymanoglu2006a)([2006](sources.bib?label=2006#cldf:memoglu_sueleymanoglu2006a)), [Nişanyan ](sources.bib?label=Ni%C5%9Fanyan+#cldf:ni2009a)([2009](sources.bib?label=2009#cldf:ni2009a)), [Zengin ](sources.bib?label=Zengin+#cldf:zengin2009a)([2009](sources.bib?label=2009#cldf:zengin2009a)), and personal communication from Jaklin Kornfilt, as well as [Kornfilt ](sources.bib?label=Kornfilt+#cldf:kornfilt1997a)([1997](sources.bib?label=1997#cldf:kornfilt1997a):463–465). During the Ottoman Empire (13th-19th century), there was a heavy influence from Arabic (especially in religious styles) and Persian (especially in literary styles), particularly in higher and educated registers ([Göksel and Kerslake 2005](sources.bib?label=G%C3%B6ksel+and+Kerslake+2005#cldf:goeksel2005a):xxv–xxviii). Since 1911 there is a movement to clear Turkish of Arabic and Persian influence and “words containing Arabic and Persian suffixes are increasingly giving way to their synonyms of Turkish origin” ([Göksel and Kerslake 2005](sources.bib?label=G%C3%B6ksel+and+Kerslake+2005#cldf:goeksel2005a):59). The following examples were compiled with the help of Sabine Günther. Only affixes that are attested with Turkish stems are given, there are also Persian affixes that are only used with Persian stems.\n\n\n6 noun-forming suffixes (including one forming nouns and adjectives)\n\n- _-baz_ ‘agent or occupation noun’, e.g. _madrabaz_ ‘swindler’ (from _mandıra_ ‘small cheesery’), _dilbaz_ ‘somebody who’s good with words’ (from _dil_ ‘tongue, language’), _davlumbaz_ ‘shrouding, chimney hood, paddle box’ (from _davul_ ‘drum’), _düzenbaz_ ‘cheater’ (from _düzen_ ‘regulation, scheme’), _oyunbaz_ ‘playful person’ (from _oyun_ ‘play, game, jest, trick’), _kuşbaz_ ‘raiser, trainer, or seller of birds’ (from _kuş_ ‘bird’)\n- _-dan_ (various noun derivations), e.g. _yağdan(lık)_ ‘lubricator’ (from _yağ_ ‘oil’), _sonradan_ ‘afterwards’ (from _sonra_ ‘after, later’), _yaradan_ ‘the Creator’ (from _yara_ ‘injury’)\n- _-(h)ane_ ‘place noun derivation’, e.g. _balıkhane_ ‘fish market’ (from _balık_ ‘fish’), _boyahane_ ‘dyeing factory’ (from _boya_ ‘dye’), _yemekhane_ ‘dining room’ (from _yemek_ ‘food’)\n- _-kar_ ‘a person associated with a profession or occupation and other derivations’, e.g. _koçkar_ ‘a ram that was raised for fighting’ (from _koç_ ‘ram’), _buzulkar_ ‘fern’ (from _buzul_ ‘glacier’)\n- _-zede_ ‘victims of a catastrophic event’, e.g. _depremzede_ ‘earthquake victim’ (from _deprem_ ‘earthquake’), _sınavzede_ ‘student who suffers from exams’ (from _sınav_ ‘test, examination’)\n- _-dar_ ‘agent noun derivation’, e.g. _bayraktar_ ‘standard-bearer’ (from _bayrak_ ‘flag’), _sancaktar_ ‘standard-bearer’ (from _sancak_ ‘flag’)\n\n\n\n1 adjective-forming suffix (plus one forming nouns and adjectives, see above)\n\n- _-vari_ ‘adjectivizer’, e.g. _yengeçvari_ ‘crab-like’ (from _yengeç_ ‘crab’), _Türkvari_ ‘Turk-like’ (from _Türk_ ‘Turk’). There are also many new formations based on non-Turkish stems, e.g. _gangstervari_ ‘gangsterlike’, _Amerikanvari_ ‘American-style’.\n\n\nNote that none of the very many derivational suffixes attaching to verbs were borrowed and also no suffixes that attach to nominals to form verbs ([Göksel and Kerslake 2005](sources.bib?label=G%C3%B6ksel+and+Kerslake+2005#cldf:goeksel2005a):53–57). Note also that the set of Persian affixes in Azari (closely related to Turkish) is different.	\N	31	90	Eurasia	\N	\N	7	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
59	{}	108	Persian affixes in Azari	Information and examples are from [Dehghani ](sources.bib?label=Dehghani+#cldf:dehghani2000a)([2000](sources.bib?label=2000#cldf:dehghani2000a)). The affixes given in the following are described as “borrowed prefixes and suffixes which are used frequently in Azari and which can attach to some native stems”, unlike others, which “can only attach to borrowed stems” ([Dehghani 2000](sources.bib?label=Dehghani+2000#cldf:dehghani2000a):96–97). [Dehghani ](sources.bib?label=Dehghani+#cldf:dehghani2000a)([2000](sources.bib?label=2000#cldf:dehghani2000a):87–96) provides a clear description of the morphology, allowing to see how many forms of the grammatical subsystems are borrowed affixes.\n\n\n2 privative-possessive adjectivizer prefixes. These two function as equivalents for the native suffixes -_sIz_ and -_lI_ ([Dehghani 2000](sources.bib?label=Dehghani+2000#cldf:dehghani2000a):97)\n\n- _ba-_ ‘having the quality specified by the noun’, e.g. _baädäb_ ‘polite’ (from _ädäb_ ‘politeness’), _basavad_ ‘literate’ (from _savad_ ‘literacy’)\n- _bi-_ ‘privative’, e.g. _biädäb_ ‘impolite’ (from _ädäb_ ‘politeness’), _bisavad_ ‘illiterate’ (from _savad_ ‘literacy’)\n\n\n\n7 noun-forming derivational suffixes (out of 10 such forms, i.e. there are 3 native ones, not counting “rarely used derivational suffixes”, of which another 2 derive nouns from nouns)\n\n- _-ban_ ‘a person who guards or maintains N as his usual occupation’, e.g. _bagban_ ‘gardener’ (from _bag_ ‘garden’), _jängäl-ban_ ‘forester’ (from _jängäl_ ‘forest’)\n- _-baz_ ‘the person whose occupation involves N’, e.g. _gumarbaz_ ‘gambler’ (from _gumar_ ‘gambling’), _gušbaz_ ‘bird keeper’ (from _guš_ ‘bird’)\n- _-čA_ ‘diminutive’, e.g. _bagča_ ‘small garden’ (from _bag_ ‘garden’), _käläkča_ ‘small boat’ (from _käläk_ ‘boat’)\n- _-dan_ ‘standard container for N’, e.g. _gänddan_ ‘sugar bowl’ (from _gänd_ ‘sugar’), _güldan_ ‘flower pot’ (from _gül_ ‘flower’)\n- _-dar_ ‘the person who owns N’, e.g. _eldar_ ‘the head of tribe’ (from _el_ ‘tribe’), _puldar_ ‘rich’ (from _pul_ ‘money’)\n- _-Istan_ ‘a place designed to contain N’, e.g. _gäbiristan_ ‘cemetery’ (from _gäbir_ ‘grave’), _gülüstan_ ‘rose garden’ (from _gül_ ‘flower’)\n- ­_-saz_ ‘the person who is the maker or repairer of N as his usual occupation’, e.g. _čıragsaz_ ‘lamp maker’ (from _čırag_ ‘lamp’), _sahatsaz_ ‘watch maker’ (from _sahat_ ‘watch’)\n\n\n\n1 adjective-forming derivational suffix (out of 3 such forms, the only two native denominal adjectivizing suffixes are the two mentioned above that are being replaced by the borrowed prefixes, not counting one rarely used derivational suffix, which derives adjectives from nouns)\n\n- _-I_ ‘pertaining to N, having the quality of N’, e.g. _bazari_ ‘commercial’ (from _bazar_ ‘market’), _tarixi_ ‘historical’ (from _tarix_ ‘history’)	\N	97	90	Eurasia	\N	\N	10	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
60	{}	109	Persian affixes in Kashmiri	The information and examples given below are taken from [Koul ](sources.bib?label=Koul+#cldf:koul2005a)([2005](sources.bib?label=2005#cldf:koul2005a):156–158), which is the most recent one of the three descriptions available to me. [Koul ](sources.bib?label=Koul+#cldf:koul2005a)([2005](sources.bib?label=2005#cldf:koul2005a):156–158) describes morphological borrowing in a section explicitly about borrowed morphology, and the affixes given below are explicitly described as combining with Kashmiri stems, even though this is in contradiction to an earlier description ([Wali and Koul 1996](sources.bib?label=Wali+and+Koul+1996#cldf:wali1996a):265) in at least one case, as noted below. [Bhat ](sources.bib?label=Bhat+#cldf:bhat1987a)([1987](sources.bib?label=1987#cldf:bhat1987a)) and [Wali &amp; Koul ](sources.bib?label=Wali+%26+Koul+#cldf:wali1996a)([1996](sources.bib?label=1996#cldf:wali1996a)) list a lot more Persian affixes than [Koul ](sources.bib?label=Koul+#cldf:koul2005a)([2005](sources.bib?label=2005#cldf:koul2005a):156–158), but they are less explicit about whether the forms they give are used with Kashmiri stems.\n\n\n5 derivational prefixes. It is uncertain whether the results are nouns, adjectives or may be both.\n\n- _be-_ ‘without’, e.g. _bepatsh_ ‘untrustworthy,’ _bezuv_ ‘without life’, _bevəti:r_ ‘without manners’. [Wali &amp; Koul ](sources.bib?label=Wali+%26+Koul+#cldf:wali1996a)([1996](sources.bib?label=1996#cldf:wali1996a):265) confirm that this prefix is used with native stems.\n- _ba:-_ ‘with’, e.g. _ba:darɨm_ ‘with religious piety’\n- _har-_ ‘every’, e.g. _harkã:h_ ‘every one’, _harja:yi_ ‘every place’\n- _kam-_ ‘little’, e.g. _kamza:n_ ‘a little acquainted person’\n- _bar-_ ‘on’, e.g. _barz’av_ ‘on the tip of the tongue’\n\n\nNote that there is also _bad-_ ‘bad’, e.g. _badza:th_ ‘bad character’, but [Wali &amp; Koul ](sources.bib?label=Wali+%26+Koul+#cldf:wali1996a)([1996](sources.bib?label=1996#cldf:wali1996a):265) state that this prefix is only used with Persian stems, therefore it is excluded here.\n\n\n2 suffixes deriving agent nouns\n\n- _-gor_ ‘agent noun’, e.g. _g’avangor_ ‘one who sings’, _gindangor_ ‘one who plays’, _natsangor_ ‘one who dances’\n- -_ci:_ ‘agent noun’, e.g. _tabalci:_ ‘one who plays on tabla’, _ə:phi:mci_ ‘one who is addicted to opium’\n\n\n\n2 suffixes deriving abstract nouns\n\n- _-gi:_ ‘abstract noun’, e.g. _ga:nɨgi:_ ‘the act of procurer’, _badma:šɨgi:_ ‘the act of a rogue’\n- _-i:_ ‘abstract nouns derived from nouns of agency’, e.g. _ma:sṭar_ ‘teacher’ vs. _ma:sṭəri:_ ‘teachership’, _aphsar_ ‘officer’ vs. _aphsari:_ ‘officership’, _da:kṭar_ ‘doctor’ vs. _ḍa:kṭəri:_ ‘medical practice’, _ci:n_ ‘China’ vs. _ci:ni:_ ‘Chinese’\n\n\n\n4 suffixes deriving adjectives from nouns\n\n- _-ba:z_ ‘adjectivizer’, e.g. _do:khɨba:z_ ‘deceitful’, _ca:lda:z_ ‘crafty’\n- _-mand_ ‘adjectivizer’, e.g. _phə:ydɨmand_ ‘useful’, _akɨlmand_ ‘wise’, _do:latmand_ ‘rich’\n- _-za:dɨ_ ‘adjectivizer’, e.g. _darza:dɨ_ ‘an offspring of Dars’\n- _-da:r_ ‘adjectivizer “with x”‘, e.g. _ləṭ’da:r_ ‘with tail’, _chiṭida:r_ ‘with prints’. [Koul ](sources.bib?label=Koul+#cldf:koul2005a)([2005](sources.bib?label=2005#cldf:koul2005a):157) gives this as an example of a combination of a Kashmiri prefix and Persian stem, but this is apparently the same as _-da:r_ described by [Bhat ](sources.bib?label=Bhat+#cldf:bhat1987a)([1987](sources.bib?label=1987#cldf:bhat1987a):88), who describes it as “added to nouns, common and productive” and gives examples such as “land lord, leader, honest” which suggest that _-da:r_ might be glossed as ‘with’.	\N	98	90	Eurasia	\N	\N	13	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
61	{}	110	Komi-Zyrian affixes in Khanty	Information and examples are from [Sauer ](sources.bib?label=Sauer+#cldf:sauer1967a)([1967](sources.bib?label=1967#cldf:sauer1967a):171–188; see also [Sauer 1963](sources.bib?label=Sauer+1963#cldf:sauer1963a); [Mägiste 1968](sources.bib?label=M%C3%A4giste+1968#cldf:maegiste1968a):6). According to [Sauer ](sources.bib?label=Sauer+#cldf:sauer1967a)([1967](sources.bib?label=1967#cldf:sauer1967a):171–172), borrowed affixes are primarily productive, also with native stems.\n\n\n7 nominal derivational suffixes. [Sauer ](sources.bib?label=Sauer+#cldf:sauer1967a)([1967](sources.bib?label=1967#cldf:sauer1967a)) gives a total of 11 borrowed nominal derivational suffixes, but 4 of these are excluded here because they are not attested with native stems\n\n- _-ja_ ‘adjectivizer’, e.g. _wŭ’rja_ ‘fat (of bears)’\n- _-ki̬m ~ -kem ~ -kim ~ -kam ~ -kȧm_ ‘diminutive (note that all examples are with adjectives)’, e.g. _łełkam_ ‘smallish’\n- _-kis_ ‘attenuative, adjectivizer’, e.g. _warkis_ ‘light red, reddish’\n- _-an_ ‘instrument noun’, e.g. _šestän_ ‘pole for pushing a boat along’\n- _-as_ ‘nominalizer’, e.g. _šărtas keʌ_ ‘belt’\n- _-tek, -tak_ ‘adjectivizer’, e.g. _šitak_ ‘peaceful’\n- _-tem ~ -tim ~ -tam ~ -tȧm_ ‘negative adjective formation’, e.g. _ŏččam_ ‘unintelligent, stupid’\n\n\n\n2 comparative/superlative particles\n\n- _-čək_ ‘comparative’, e.g. _ȧjčək_ ‘smaller’\n- _-mȧtȧ_ ‘superlative’, e.g. _ȧjmȧtȧ_ ‘smallest’\n\n\n\n6 verbal derivational suffixes, [Sauer ](sources.bib?label=Sauer+#cldf:sauer1963a)([1963](sources.bib?label=1963#cldf:sauer1963a):195–196) lists a total of 7, but one is excluded here because it is only attested with Komi-Zyrian stems. [Sauer ](sources.bib?label=Sauer+#cldf:sauer1963a)([1963](sources.bib?label=1963#cldf:sauer1963a)) does not give examples of hybrid formations, but explicitly states that these suffixes are added to native stems.\n\n- _-aś-_ ‘reflexive verbs from nouns’\n- _-e̬d-_ ‘causative verbs from nouns’\n- _-al-_ ‘intransitive verbs from nouns’\n- _-śi̬- ~ -źi̬- ~ -t’śi̬-_ ‘reflexive, intransitive’ from nouns\n- _-i̬ś-_ ‘reflexive, frequentive’ ［for this form, the only example seems to be verb-verb derivation with valency change, but I am assuming that it can have a verbalizing function, too.］\n- _-ki̬- ~ -gi̬-_ ‘affective verbs’\n\n\n[Mägiste ](sources.bib?label=M%C3%A4giste+#cldf:maegiste1968a)([1968](sources.bib?label=1968#cldf:maegiste1968a):6), citing [Sauer ](sources.bib?label=Sauer+#cldf:sauer1963a)([1963](sources.bib?label=1963#cldf:sauer1963a)) also mentions that there are a total of seven nominal derivational suffixes, seven verbal derivational suffixes, and two nominal particles. [Sauer ](sources.bib?label=Sauer+#cldf:sauer1967a)([1967](sources.bib?label=1967#cldf:sauer1967a):171–172, 182–188) discusses affixes from Russian, Samoyedic, Wogulian, and Tatar, but these do not seem to have become productive.	\N	100	99	Eurasia	\N	\N	15	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
62	{}	111	Swedish affixes in Finnish	Information and examples are from [Mägiste ](sources.bib?label=M%C3%A4giste+#cldf:maegiste1968a)([1968](sources.bib?label=1968#cldf:maegiste1968a):7).\n\n\n1 nominalizer\n\n- _-ri_ ‘agent noun, occupation noun’, e.g. _pellkuri_ ‘coward’, _petturi_ ‘cheater’\n\n\n\n2 feminine derivational affixes\n\n- _-inna_ ‘female person’_,_ e.g. _tohtorinna_ ‘female doctor’\n- _-ska_ ‘female person’, e.g. _seppäskä_ ‘tailor’s wife’\n\n\nVarious other affixes from Swedish are used in the slang of Helsinki, but their use is not clear.	\N	102	101	Eurasia	\N	\N	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
65	{}	114	Moroccan Berber languages affixes in Moroccan Arabic	Information and examples are from [Zellou ](sources.bib?label=Zellou+#cldf:zellou2011a)([2011](sources.bib?label=2011#cldf:zellou2011a)).\n\n\n1 derivational circumfix/pattern\n\n- _ta-...-t_ ‘abstract noun’, e.g. _takotbiyət_ ‘profession/art of bookseller’ (from _kotbi_ ‘bookseller’), _takəddabət_ ‘habitual liar’ (from _kəddab_ ‘liar’), _tabənnayət_ ‘profession of masonry’ (from _bənnay_ ‘mason’)\n\n\n[Zellou ](sources.bib?label=Zellou+#cldf:zellou2011a)([2011](sources.bib?label=2011#cldf:zellou2011a)) argues that “［t］he pattern that can be inferred for the MA circumfix is one where MA lexical items are diffused into Berber, the most common language contact scenario, then these stems are inflected to match the inflectional patterns of Berber, including noun state /a-/ and feminine gender /t-...-t/. Finally, these nouns with Berber inflectional morphology are incorporated back into MA with the inflectional morphology components reanalyzed as a single derivational morpheme.”	\N	108	107	Africa	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
66	{}	116	Tibetan affixes in Wutun	Information and examples are mainly from [Janhunen et al.’s ](sources.bib?label=Janhunen+et+al.%E2%80%99s+#cldf:janhunen2008a)([2008](sources.bib?label=2008#cldf:janhunen2008a)) detailed description, including etymologies for affixes. However, [Lee-Smith &amp; Wurm ](sources.bib?label=Lee-Smith+%26+Wurm+#cldf:lee_smith1996b)([1996](sources.bib?label=1996#cldf:lee_smith1996b)) give different etymologies for almost every one of the potentially borrowed items. The preference for [Janhunen et al.’s ](sources.bib?label=Janhunen+et+al.%E2%80%99s+#cldf:janhunen2008a)([2008](sources.bib?label=2008#cldf:janhunen2008a)) etymologies is based on the authority of Juha Janhunen as a specialist of East Asian languages. The situation in Wutun has been summarized as follows: “Wutun has borrowed so extensively from Amdo Tibetan, both grammatically and lexically, that on first encounter, one hardly recognizes it as a Chinese language” ([Li 1984](sources.bib?label=Li+1984#cldf:li1984a):320). Note also that according to [Slater ](sources.bib?label=Slater+#cldf:slater2003a)([2003](sources.bib?label=2003#cldf:slater2003a):329) it often “becomes impossible to trace the precise historical path of any given linguistic feature ［in China’s Qinghai-Gansu Sprachbund］”.\n\n\n2 case markers (out of a total of 7 in Wutun, the remaining 5 are native Chinese: genitive, locative, superessive, sociative, comparative)\n\n- _-na_ ‘distributive case’ ([Janhunen et al. 2008](sources.bib?label=Janhunen+et+al.+2008#cldf:janhunen2008a):59), e.g. _san nian-na_ ‘for three years’, _liang tian-na_ ‘for two days’\n- _-la ~ -ra_ ‘ablative case’_,_ e.g. _gguan-la_ ‘from the temple’, _gunse-la_ ‘from the company’. This marker is possibly identical to the verbal “serial marker” _-la_. Since [Janhunen et al. ](sources.bib?label=Janhunen+et+al.+#cldf:janhunen2008a)([2008](sources.bib?label=2008#cldf:janhunen2008a)) are silent about the possible etymology of this marker, in this case I follow [Lee-Smith &amp; Wurm ](sources.bib?label=Lee-Smith+%26+Wurm+#cldf:lee_smith1996b)([1996](sources.bib?label=1996#cldf:lee_smith1996b):888) according to whom “directional _-ra_ probably reflects the Tibetan directional, locative _-la._”\n\n\n\n3 “verb complements” (out of a total of 20 in Wutun). All of these appear to be paradigmatically related, the subdivision in three sets given by [Janhunen et al. ](sources.bib?label=Janhunen+et+al.+#cldf:janhunen2008a)([2008](sources.bib?label=2008#cldf:janhunen2008a):76–86) seems to be based on semantic criteria. With respect to their status as affixes, they “differ greatly in their degree of grammaticalization”, but all of these are written as suffixes. Some at least are “very close to grammatical markers”.\n\n- _-la_ ‘non-completive’ “voice complements”, “_-la_ can also be attached to verbs of a Sinitic origin” ([Janhunen et al. 2008](sources.bib?label=Janhunen+et+al.+2008#cldf:janhunen2008a):78), e.g. _qu-la-li_ ‘to live in it’ (from _qu_ ‘live’). The other two “voice complements” are _-gu_ ‘completive’ which is native Chinese, and _-ge_ ‘causative’ which is possibly native Chinese ([Janhunen et al. 2008](sources.bib?label=Janhunen+et+al.+2008#cldf:janhunen2008a):76–80).\n- _-qai_ ‘to get broken’ “aspect complement”, no example of hybrid formation given. There are a total of 11 “aspect complements” in Wutun ([Janhunen et al. 2008](sources.bib?label=Janhunen+et+al.+2008#cldf:janhunen2008a):80–82).\n- _-dd-_ ‘to want’ “modal complement”, no example of hybrid formation given. There are a total of 11 “modal complements” in Wutun.\n\n\n\n2 serial markers, which “indicate the relationships between the complement events described by the serialized verbs” ([Janhunen et al. 2008](sources.bib?label=Janhunen+et+al.+2008#cldf:janhunen2008a):89–92). For the general serial marker _-ma_ no etymology is provided, only that it is potentially identical to the conjunction _ma_ ‘and’. There are a total of 3 such serial markers in Wutun.\n\n- _-da_ ‘consequential’, e.g. _ngan-di-di_ ‘as (he) was pressing’, _jja-la-gu-da_ ‘if you visit’\n- _-la_ ‘conditional’, e.g. _kan-gu-de hong-la_ ‘if you read’. This marker is possibly the same as the ablative case (see above).	\N	110	109	Eurasia	\N	\N	7	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
67	{}	117	Aymara affixes in Quechua de Puno	Information and examples are drawn from [Adelaar ](sources.bib?label=Adelaar+#cldf:adelaar1987a)([1987](sources.bib?label=1987#cldf:adelaar1987a); see also [Adelaar 1996](sources.bib?label=Adelaar+1996#cldf:adelaar1996a):1328).\n\n\n1 polyfunctional derivational suffix that attaches to finite verbs, subordinate and nominalized verbs, adjectives, temporal expressions and other adverbial expressions\n\n- _-pacha_ (no meaning or examples given). This is probably the same “totality-marker” that Uru borrowed from Aymara ([Hannß 2008](sources.bib?label=Hann%C3%9F+2008#cldf:hannss2008a):9), according to [Adelaar ](sources.bib?label=Adelaar+#cldf:adelaar1987a)([1987](sources.bib?label=1987#cldf:adelaar1987a):225) it is extremely frequent.\n\n\n\n8 verbal derivational suffixes that occur with certain frequency and are treated together by [Adelaar ](sources.bib?label=Adelaar+#cldf:adelaar1987a)([1987](sources.bib?label=1987#cldf:adelaar1987a)), implying that they form a derivational system. Note also that they are also semantically related, expressing movement and direction.\n\n- _-ra-_ ‘repeated action’, ‘singular repetition’, or ‘undoing an action’, e.g. _wañurachin_ ‘he killed ［them］ one by one’, _chayaranku_ ‘they arrive one by one’. According to [Adelaar ](sources.bib?label=Adelaar+#cldf:adelaar1987a)([1987](sources.bib?label=1987#cldf:adelaar1987a):225), in some cases, the suffix _-ra-_ forms part of complex Aymara loanwords, implying that in most, it is used with Quechua stems\n- _-naqa-_ ‘diffuse, action, without goal’, e.g. _purinaqa-_ ‘go about, behave’ (from _puri-_ ‘go, walk’)\n- _-tata-_ ‘extension or dispersion in various directions’, e.g. _hump’itatachi_ ‘It makes sweat’\n- _-thapi-_ (opposite of _-tata-_) ‘concentration, reunion’, e.g. _mikhuthapi-_ ‘eat by gathering what is around’ (from _mikhu-_ ‘eat’)\n- _-qa-_ ‘downwards movement’ (part of a system of directionals in Aymara), e.g. _ituqa-_ ‘take a pot from the stove’ (from _itu-_ ‘carry (a pot) with both hands’)\n- _-t’a-_ ‘single, short action’, e.g. _q’epiyt’aku-_ ‘carry briefly’ (from _q’epi-_ ‘carry’)\n- _-kata-_ ‘crossing an empty space’, e.g. _q’epikatarqon_ ‘he carried ［him across the lake］’\n- _-kipa-_ ‘change of direction’, e.g. _q’epikiparqollantaq_ ‘he carried ［him running around the cacti］’\n\n\n[Adelaar ](sources.bib?label=Adelaar+#cldf:adelaar1987a)([1987](sources.bib?label=1987#cldf:adelaar1987a):230) notes that no native suffix has been displaced by borrowed affixes, i.e. these borrowed affixes seem to be gap-filling.	\N	111	27	South America	\N	\N	9	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
68	{}	118	Santa affixes in Chinese of Línxìa/Hézōu	Information and examples are mainly from [Li ](sources.bib?label=Li+#cldf:li1984a)([1984](sources.bib?label=1984#cldf:li1984a)). Hézōu ([Dwyer 1992](sources.bib?label=Dwyer+1992#cldf:dwyer1992a)) is the older name for the city and province ([Dwyer 1992](sources.bib?label=Dwyer+1992#cldf:dwyer1992a):161; [Lee-Smith 1996](sources.bib?label=Lee-Smith+1996#cldf:lee_smith1996a)a:366). There seem to be two ethnic groups living there, speaking different dialects, the Hàn and the Huí, who are Muslims ([Li 1984](sources.bib?label=Li+1984#cldf:li1984a):320).\n\n\n1 case marker (out of a total of 4 case markers in Chinese spoken in Línxìa/Hézōu)\n\n- _-lɑ_ ‘comitative case’, e.g. _ɑmɑ-lɑ_ ‘with mother’, _tɑmən-lɑ_ ‘with them’ (examples from [Li 1984](sources.bib?label=Li+1984#cldf:li1984a):314). Note that [Li ](sources.bib?label=Li+#cldf:li1984a)([1984](sources.bib?label=1984#cldf:li1984a):312–315) clearly states that the four case markers are suffixes, and they are written with a hyphen, e.g. _-la_, even though they are called “postpositions” in [Dwyer’s ](sources.bib?label=Dwyer%E2%80%99s+#cldf:dwyer1992a)([1992](sources.bib?label=1992#cldf:dwyer1992a)) description. The comitative case suffix is used primarily by Hàn people in Línxìa, according to [Dwyer ](sources.bib?label=Dwyer+#cldf:dwyer1992a)([1992](sources.bib?label=1992#cldf:dwyer1992a):169), and borrowed from Monguor, Santa, and/or Easter Yugur (Mongolic) according to [Dwyer ](sources.bib?label=Dwyer+#cldf:dwyer1992a)([1992](sources.bib?label=1992#cldf:dwyer1992a)). [Li ](sources.bib?label=Li+#cldf:li1984a)([1984](sources.bib?label=1984#cldf:li1984a):314) describes “comitative case suffix /lɑ/”, identifying it with a corresponding Santa (Mongolic) form, although he hypothesizes, based on ethnographic facts, that Mongolic influence on Línxìa/Hézōu is substratum influence, not borrowing. [Lee-Smith ](sources.bib?label=Lee-Smith+#cldf:lee_smith1996a)([1996](sources.bib?label=1996#cldf:lee_smith1996a):868) gives a Turkic etymology for this marker.\n\n\n[Lee-Smith ](sources.bib?label=Lee-Smith+#cldf:lee_smith1996a)([1996](sources.bib?label=1996#cldf:lee_smith1996a):868) also gives a Turkic etymology for the object marker _xa_ and a mixed Turkic/Tibetan etymology for the case marker glossed as “to/until”. I follow [Dwyer’s ](sources.bib?label=Dwyer%E2%80%99s+#cldf:dwyer1992a)([1992](sources.bib?label=1992#cldf:dwyer1992a)) and [Li’s ](sources.bib?label=Li%E2%80%99s+#cldf:li1984a)([1984](sources.bib?label=1984#cldf:li1984a)) analysis, which is based on much more careful argumentation, and not addressed by [Lee-Smith ](sources.bib?label=Lee-Smith+#cldf:lee_smith1996a)([1996](sources.bib?label=1996#cldf:lee_smith1996a)). Note also that according to [Slater ](sources.bib?label=Slater+#cldf:slater2003a)([2003](sources.bib?label=2003#cldf:slater2003a):329) it often “becomes impossible to trace the precise historical path of any given linguistic feature ［in China’s Qinghai-Gansu Sprachbund］”.	\N	113	112	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
69	{}	119	Turkish affixes in Judeo-Spanish	Information and examples are from [Varol-Bornes ](sources.bib?label=Varol-Bornes+#cldf:varol_bornes2008a)([2008](sources.bib?label=2008#cldf:varol_bornes2008a)). All prefixes are Spanish (except possibly _m-_ as part of a phenomenon called _mühmele_, e.g. _Kapará por ti Mapará por ti_.)\n\n\n4 nominal suffixes, nominalizers and noun-noun formation with overlaps\n\n- _-oğlu_ ‘son of’ (noun-noun derivation only), e.g. _mamzeroğlu_ ‘son of a bastard’ (stem originally from Hebrew)\n- _-cik ~ -çik_ (_-cuk ~ -çuk)_ ‘hypocoristic diminutive’ (noun-noun derivation and adjectivizer), no examples of hybrids given\n- _-ané ~ -aná_ ‘house of, place for’ (noun-noun derivation and nominalizer) (originally Persian, no clear examples of hybrids given)\n- _-lik_ ‘nominalizer for adjectives and others’ (only nominalizer), e.g. _semanalik_ ‘money for one week’\n\n\n\n2 privative-possessive adjectivizers\n\n- _-li ~ -liya ~ -lü ~ -lüya_ ‘having x’, used on Turkish loans, but also Hebrew loans, and Greek loans, e.g. _azlahari_ ‘making rich’ (stem from Hebrew)\n- _-siz, -siza, -suz, -suza_ ‘privative’, often used in spontaneous creations, e.g. _azlahasiz_ ‘unfavorable’ (stem from Hebrew)\n\n\nA further, uncertain case is _-tear_ ‘causative’, which has at least some influence of Spanish, but maybe some Turkish, too.	\N	114	31	Eurasia	\N	\N	6	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
70	{}	124	Russian affixes in Karelian	Information and examples are from [Alvre ](sources.bib?label=Alvre+#cldf:alvre2002a)([2002](sources.bib?label=2002#cldf:alvre2002a); see also [Raun 1964](sources.bib?label=Raun+1964#cldf:raun1964a); [Laanest 1982](sources.bib?label=Laanest+1982#cldf:laanest1982a)), which, however, deals specifically with indefinite-marking elements and provides no information whether any other affix was borrowed. The following set of borrowed forms refers to the Karelian Tikhvin variety. Similar but in different ways overlapping sets were borrowed in the closely related Karelian Tver variety, Karelian Valdai variety, Livvi-Karelian (Olonets Karelian), Veps, Wotic, and Ludic. All suffixes are used to form indefinite pronouns and adverbs.\n\n\n6 indefinite-marking suffixes\n\n- _-bį ~ -bi̬_ ‘indefinite’, e.g. _kenen bį_ ‘whoever’, _ku·ibi̬_ ‘in whatever way’\n- _-bui(ť) ~ -buit’en(a_) ‘indefinite’, e.g. _miľľä‿bui ripakolla_ ‘with any kind of cloth’, _miśśä‿buitėḛ_ ‘anywhere’, _miťüš‿buiť_ ‘anyone’\n- _-i_ ‘indefinite’, e.g. _keľľä‿i jōlu_ ‘nobody has’, _i ruadua ei miäii̯_ ‘and there is no work whatsoever’\n- _-ńi ~ -ni_ ‘indefinite’_,_ e.g. _ruvetti͔ḭ valamaa̰ reŋgilöiľľa da ken miľľä‿ńi_ ‘they began to pour with buckets or anyone with anything’, _možot muissat, miśśä ńi näit_ ‘maybe you can remember having seen it somewhere?’\n- _-ńibuť ~ -ńibit_ ‘indefinite’, e.g. _on ken‿ńibuť üökšun_ ‘somebody was wrong’\n- _-to_ ‘indefinite’, e.g. _miďä to šano_ ‘he/she said something’, _poiga šinä miśśä‿to meiľä on_ ‘the boy is there somewhere with us’, _kuin‿to_ ‘in any way’	\N	115	5	Eurasia	\N	\N	6	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
71	{}	125	Eastern Tucanoan languages affixes in Tariana	Information and examples are from [Aikhenvald ](sources.bib?label=Aikhenvald+#cldf:aikhenvald2012a)([2012](sources.bib?label=2012#cldf:aikhenvald2012a):175–177). The following three forms are used consistently by speakers of all generations, a few more by younger speakers or inconsistently.\n\n\n1 conditional-potential enclitic\n\n- _=bohta_, e.g. _kwe-bohtI_ _waha-pu-bohta_ (how-conditional/1pl-augmentative-conditional) ‘how could we...’, _hanipa-bohta kasitana_ (big+classifier.closed_space-conditional/be_fed_up) ‘It would be really annoying’ ([Aikhenvald 1999](sources.bib?label=Aikhenvald+1999#cldf:aikhenvald1999a):104–105; see also [Aikhenvald 2003](sources.bib?label=Aikhenvald+2003#cldf:aikhenvald2003a):390–393)\n\n\n\n2 manner enclitics\n\n- _=pisi_ ‘stretch’, no examples of hybrid formations are given by [Aikhenvald ](sources.bib?label=Aikhenvald+#cldf:aikhenvald2012a)([2012](sources.bib?label=2012#cldf:aikhenvald2012a):175–177) or [Aikhenvald ](sources.bib?label=Aikhenvald+#cldf:aikhenvald1999a)([1999](sources.bib?label=1999#cldf:aikhenvald1999a)), but since lexical borrowing is very limited, it is safe to assume that there are many.\n- _=miña_ ‘light’, used only with the verb ‘see’, e.g. _di-ka=miña_ (3sg.non_feminine-see=light) ‘(close one’s eyes) and see little lights and stars’ ([Aikhenvald 2012](sources.bib?label=Aikhenvald+2012#cldf:aikhenvald2012a):176)	\N	117	116	North America	\N	\N	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
72	{}	126	Greek affixes in Kalderash Romani	Information and examples are from [Boretzky ](sources.bib?label=Boretzky+#cldf:boretzky1994a)([1994](sources.bib?label=1994#cldf:boretzky1994a)) and [Boretzky and Igla ](sources.bib?label=Boretzky+and+Igla+#cldf:boretzky1991a)([1991](sources.bib?label=1991#cldf:boretzky1991a)). Kalderash Romani has also borrowed affixes from Romanian and from various Slavic languages.\n\n\n2 nominalizers (originally singular-plural)\n\n- _-imos_ ‘nominalizer’, e.g. _barvalimos_ ‘richness’\n- _-imata_ ‘nominalizer’, e.g. _marimata_ ‘brawl’ ([Boretzky and Igla 1991](sources.bib?label=Boretzky+and+Igla+1991#cldf:boretzky1991a):16)\n\n\n\n3 non-interrelated suffixes\n\n- _-to_ ‘ordinal number formation’, e.g. _štár-to_ ‘the fourth’ ([Boretzky 1994](sources.bib?label=Boretzky+1994#cldf:boretzky1994a):93)\n- _-icko, -icka_ ‘adjectivizer for languages and places’, e.g. _lovaricka_ ‘in Lovari’, _sogodicko_ ‘in ［various］ languages’ ([Boretzky and Igla 1991](sources.bib?label=Boretzky+and+Igla+1991#cldf:boretzky1991a):12)\n- _-icî_ ‘diminutive’, e.g. _kotoricí_ ‘little piece’ ([Boretzky and Igla 1991](sources.bib?label=Boretzky+and+Igla+1991#cldf:boretzky1991a):12)	\N	10	33	Eurasia	\N	\N	5	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
73	{}	127	Spanish affixes in Cho’ol	Information is from [Dürr ](sources.bib?label=D%C3%BCrr+#cldf:duerr2012a)([2012](sources.bib?label=2012#cldf:duerr2012a)), Dürr (personal communication, 2012) and [Vásquez Álvarez ](sources.bib?label=V%C3%A1squez+%C3%81lvarez+#cldf:lvarez2011a)([2011](sources.bib?label=2011#cldf:lvarez2011a)). The three adverbial particles borrowed are from a closed class of forms that have a fixed position before the verb stem and after the argument proclitics ([Dürr 2012](sources.bib?label=D%C3%BCrr+2012#cldf:duerr2012a):38, 92; [Vásquez Álvarez 2011](sources.bib?label=V%C3%A1squez+%C3%81lvarez+2011#cldf:lvarez2011a):138–145). In the closely related Chontal there are similar forms, e.g. _malah_ ‘badly’ ([Knowles 1984](sources.bib?label=Knowles+1984#cldf:knowles1984a):223–228).\n\n\n3 bound adverbial particles\n\n- _-mero_ ‘a little’, e.g. _i-mero-ña’ty-añ-ø_ (3.ergative-little-know-transitive-3.absolutive) ‘He knew a little something (e.g. has a power)’ ([Vásquez Álvarez 2011](sources.bib?label=V%C3%A1squez+%C3%81lvarez+2011#cldf:lvarez2011a):437), _i-mero-jajm-el_ (3.ergative-little-clear-nonfinite) ‘It is a little clear’ ([Vásquez Álvarez 2011](sources.bib?label=V%C3%A1squez+%C3%81lvarez+2011#cldf:lvarez2011a):492), _a-mero-tsep-ø_ (2.ergative-little-cut-3.absolutive) ‘You will cut’ ([Vásquez Álvarez 2011](sources.bib?label=V%C3%A1squez+%C3%81lvarez+2011#cldf:lvarez2011a):211)\n- _-weñ_ ‘a lot’, e.g. _k-weñ-bä’ñ-añ-ø_ (1.ergative-much-get.scared-transitive-3.absolutive) ‘It scared me a lot’ ([Vásquez Álvarez 2011](sources.bib?label=V%C3%A1squez+%C3%81lvarez+2011#cldf:lvarez2011a):211)\n- -_komoñ_ ‘together’, e.g. _la=j-komoñ-mel-ø_ (pl.inclusive=1.ergative-together-do-3.absolutive) ‘We make it together’ ([Vásquez Álvarez 2011](sources.bib?label=V%C3%A1squez+%C3%81lvarez+2011#cldf:lvarez2011a):139)	\N	118	25	North America	\N	\N	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
74	{}	128	Zoquean languages affixes in Cho’ol	Information and examples are from [Vásquez Álvarez ](sources.bib?label=V%C3%A1squez+%C3%81lvarez+#cldf:lvarez2011a)([2011](sources.bib?label=2011#cldf:lvarez2011a):11), who cites [Martínez Cruz ](sources.bib?label=Mart%C3%ADnez+Cruz+#cldf:cruz2007a)([2007](sources.bib?label=2007#cldf:cruz2007a)) and [Zavala Maldonado ](sources.bib?label=Zavala+Maldonado+#cldf:zavala2007a)([2007](sources.bib?label=2007#cldf:zavala2007a)). Evidence for borrowing includes that cognate forms are absent in the Tseltalan languages related to Chol.\n\n\n1 relative marker\n\n- _=bä_, e.g. _bu’ul pulem-bä_ (bean/burned-relative) ‘the beans that are burned’, _ilekax=bä xixik_ (beautiful=relative/woman) ‘beautiful woman’, _ixim päk’beñ=ba_ (corn/spoil=relative) ‘corn that is spoiled.’	\N	118	119	North America	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
75	{}	130	Arabic affixes in Western Neo-Aramaic of Ma’lūla	Information and examples are from [Lipiński ](sources.bib?label=Lipi%C5%84ski+#cldf:lipi1997a)([1997](sources.bib?label=1997#cldf:lipi1997a):280).\n\n\n1 comparative-forming pattern\n\n- _‘aw-_ ‘comparative’, e.g. _‘awrab_ ‘greater’ (from _rab_ ‘great’)	\N	121	120	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
76	{}	132	Tibeto-Burman languages affixes in Assamese	Examples are from [Goswami and Tamuli ](sources.bib?label=Goswami+and+Tamuli+#cldf:goswami2003a)([2003](sources.bib?label=2003#cldf:goswami2003a):456–458). These forms are “clearly of non-Aryan origin” ([Masica 1991](sources.bib?label=Masica+1991#cldf:masica1991a):250). According to [Matras ](sources.bib?label=Matras+#cldf:matras2009a)([2009](sources.bib?label=2009#cldf:matras2009a):216), they are “probably from Tibeto-Burman”.\n\n\n15 numeral classifiers\n\n- _-zɒn_ ‘human male, respect/polite’, e.g. _dɒɦ-zɒn_ ‘ten (men)’, _manuɦ-zɒn_ ‘the man’\n- _-zɒni_ ‘human female (with lack of respect), non-human female’, e.g. _sari-zɒni_ ‘four (females)’, _manuɦ-zɒni_ ‘the woman’, _sagɔli-zɒni_ ‘the she-goat’, _gai-zɒni_ ‘the cow’\n- _-gɒraki_ ‘human, respect’, e.g. _sari-gɒraki_ ‘four (gentlemen/ladies)’, _manuɦ-gɒraki_ ‘the gentleman/lady’\n- _-to_ ‘inanimate, non-human male, human male (impolite)’, e.g. _bɒlɒdfi-to_ ‘the bull’, _xadɦu-to_ ‘the story’, after numerals, the allomorph _-ɛta_ is used (impolite when used with human male referents)’, e.g. _dɒɦ-ta_ ‘ten (bulls, men, etc.)’, _ɛ-ta_ ‘one (story, man, etc.)’, _musi-to_ ‘the cobbler’, _manuɦ-to_ ‘the man’\n- _-ti_ ‘same as _to_, but diminutive, endearing’, e.g. _lɔra-ti_ ‘the (dear) little boy’, _zuri-ti_ ‘the little stream’\n- _-khɒn_ ‘dimensional (space, time)’, e.g. _natɒk-khɒn_ ‘the play’, _kitɒp-khɒn_ ‘the book’\n- _-khɒni_ ‘same as _khɒn_, but diminutive, endearing’, e.g. _natika-khɒni_ ‘the playlet’, _nɔi-khɒni_ ‘the river’\n- _-khini_ ‘non-count (mass) nouns and pronouns’, e.g. _xei-khini_ ‘that (place/thing)’, _pani-khini_ ‘the water’\n- _-dal_ ‘inanimate, flexible/stiff, oblong, human (pejorative)’, e.g. _manuɦ-dal_ ‘the man’, _lathi-dal_ ‘the stick’\n- _-bor_ ‘animate, inanimate’, e.g. _manuɦ-bor_ ‘the men’, _eõ-lok_ ‘these (people)’\n- _-ɦɑ̃t_ ‘human’, e.g. _lɔra-ɦɑ̃t_ ‘the boys’, _tekhet-xɒlɒl_ ‘those (ladies/gentlemen)’\n- _-ɦɑ̃t_ ‘non-human (pejorative reference to humans)’, e.g. _gɔru-ɦɑ̃t_ ‘fools’, _manuɦ-zɒn_ ‘the man’\n- _-lok_ ‘human, respect (occurs with some pronouns)’, e.g. _toma-lok_ ‘you’, _manuɦ-gɒraki_ ‘the gentleman/lady’\n- _-xɒlɒl_ ‘human, respect (occurs with select nouns and pronouns)’, e.g. _xikhyɒk-xɒlɒl_ ‘the teachers’, _kagɒz-khila_ ‘the (sheet of) paper’\n- _-khila_ ‘sheet, leaf-like’, e.g. _kagɒz-khila_ ‘the sheets of paper’	\N	123	122	Eurasia	\N	\N	15	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
78	{}	134	Spanish affixes in Purepecha/Tarascan	Information and examples are from [Chamoreau ](sources.bib?label=Chamoreau+#cldf:chamoreau2012a)([2012](sources.bib?label=2012#cldf:chamoreau2012a):81–82).\n\n\n1 diminutive\n\n- _-itu_ ‘diminutive’, e.g. _watsi-itu-etʃa-ni_ (boy-diminutive-pl-object) ‘(to) the boys’, _xantiakhu-itu_ ‘completely alone’ (from _xantiakhu_ ‘alone’), _sapilati-itu-e-p-ka_ (small-diminutive-predication-aorist.past-subject) ‘(you) were very young’	\N	126	25	North America	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
79	{}	135	Spanish affixes in Mexicanero de la Sierra Madre Occidental	Information and examples are from [Chamoreau ](sources.bib?label=Chamoreau+#cldf:chamoreau2012a)([2012](sources.bib?label=2012#cldf:chamoreau2012a):82–84).\n\n\n1 diminutive\n\n- _-ito_ ‘diminutive’, e.g. _tepitʃi-ito_ ‘tiny’ (from _tepitʃi_ ‘boy’), _meka-t-ito_ (string-sg-diminutive) ‘little string’, _nin-nakas-ito_ (3pl-ear-diminutive) ‘their tiny ears’	\N	127	25	North America	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
80	{}	136	Spanish affixes in Yucatec Maya	Information and examples are from [Chamoreau ](sources.bib?label=Chamoreau+#cldf:chamoreau2012a)([2012](sources.bib?label=2012#cldf:chamoreau2012a):84).\n\n\n1 diminutive\n\n- _-ito ~ -itu_ ‘diminutive’, e.g. _polok-ito_ ‘sort of fat (of a male)’, _bek’ech-ita_ ‘sort of thin (of a female)’, _sak-ito_ ‘sort of white (of a man)’, _xlo’obayan-ita_ ‘youthful (of a female)’	\N	128	25	North America	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
81	{}	138	Turkish affixes in Iraqi Arabic	Information and examples are from [Masliyah ](sources.bib?label=Masliyah+#cldf:masliyah1996a)([1996](sources.bib?label=1996#cldf:masliyah1996a)), etymological information from [Nişanyan ](sources.bib?label=Ni%C5%9Fanyan+#cldf:ni2009a)([2009](sources.bib?label=2009#cldf:ni2009a)).\n\n\n2 adverbializers (one also functions as inhabitant noun derivation)\n\n- _-li_ ‘having a property, inhabitant’, e.g. _Karkūkli_ ‘resident of Kirkuk’, _Oşmalli_ ‘Ottoman’, _Arbīlli_ ‘from Irbil’, _maktabli_ ‘student’ (from _maktab_ ‘school’), _buṭuḷli_ ‘deceiver’ (from _buṭuḷ_ ‘fraud’)\n- _-sizz_ ‘privative’, e.g. _šarafsizz_ ‘honourless’, _ġīrasizz_ ‘without jealousy’\n\n\n\n2 nominalizers\n\n- _-loġ_ ‘abstract nominalizer’, used in addition to Arabic abstract nominalizer _-iyya_, e.g. _zmālloġiyya_ ‘stupidity (lit. donkeyness)’, _ḫwārdlloġiyya_ ‘foolishness’\n- _-çi_ ‘agent nominalizer’, e.g. _saḫtaçi_ ‘wily’, _sakarçi_ ‘addicted drinker’ (from _sakar_ ‘drunkenness’), _ballamçi_ ‘boatman’ (from _balam_ ‘boat’)	\N	129	31	Eurasia	\N	\N	4	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
82	{}	139	Quapaw affixes in Alabama and Choctaw-Chickasaw	Information from [Rankin ](sources.bib?label=Rankin+#cldf:rankin1988a)([1988](sources.bib?label=1988#cldf:rankin1988a):644 citing Geoffrey Kimball, personal communication). No examples of hybrids are given. The identification of the affix as borrowed is based on similarities in form, the presence of cognate forms in other Siouan languages, and the absence of similar forms in other Muskogean languages.\n\n\n1 numeral formation prefix\n\n- _hi-_ ‘ordinal number formation’, no examples of hybrid formations are given.	\N	130	53	North America	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
83	{}	140	Hindi affixes in Kharia	Information and examples are from [Peterson ](sources.bib?label=Peterson+#cldf:peterson2011a)([2011](sources.bib?label=2011#cldf:peterson2011a):333–334) and John Peterson (personal communication, March 2012).\n\n\n1 participles marker (out of a total of 3 Kharia participle markers)\n\n- _=wala_ ‘iterativity and habituality’, e.g. _kamu=na=wala lebu=ki_ ‘working people’	\N	66	95	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
84	{}	142	Latvian affixes in German	This case refers to German dialects spoken in Latvia. Information and examples are from [Polanska ](sources.bib?label=Polanska+#cldf:polanska2002a)([2002](sources.bib?label=2002#cldf:polanska2002a):161–167).\n\n\n1 nominal derivational suffix\n\n- _-neck_ ‘occupation noun, agent noun’, e.g. _kammerneck_ ‘peasant (lit. inhabitant of a small chamber)’, _reiseneck_ ‘traveller’, _vlosseneck_ ‘rafter’	\N	132	131	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
85	{}	143	Quechua affixes in Amuesha	Information and examples are from [Adelaar ](sources.bib?label=Adelaar+#cldf:adelaar2006a)([2006](sources.bib?label=2006#cldf:adelaar2006a)), who takes examples from [Duff-Tripp ](sources.bib?label=Duff-Tripp+#cldf:duff_tripp1997a)([1997](sources.bib?label=1997#cldf:duff_tripp1997a)).\n\n\n2 tense-aspect mood clitics\n\n- _-(V:)kma_ ‘distributive’, used with demonstratives, possessive pronouns and adverbial expressions, e.g. _na:-nm-a:kma_ (1sg-first-distributive) ‘Always me first’, _no:-kma_ (1sg.possessor-distributive) ‘(Several) of mine, all mine’, _a:ly-ohty-e:kma_ (there-ablative-distributive) ‘Always from there’\n- _-nya_ ‘emphatic’ (sentential clitic), e.g. _aly-empo-nya-paʔ_ _a:w-oʔ_ _ot-a:n-eht-nya kornehšaʔ_ (there-time-sequential-topic/auxiliary-reported/say-3pl.object-3pl.agent-sequential/chief) ‘Then the chief said to them’\n\n\n\n1 case suffix (out of a total of 4 Amuesha case suffixes)\n\n- _-(V:)kop_ ‘benefactive case’, e.g_. a:č-e:kop_ (mother-benefactive) ‘for mother’, _no-:kop-pa’_ (1sg.possessor-benefactive-topic) ‘as for me, ...’	\N	134	133	South America	\N	\N	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
86	{}	144	Tajik affixes in Moghol	Information and examples are from [Weiers ](sources.bib?label=Weiers+#cldf:weiers2003a)([2003](sources.bib?label=2003#cldf:weiers2003a)).\n\n\n4 plural markers (one series, there is another native series)\n\n- _-ån_ ‘plural’, e.g. _cashm-ån_ ‘eyes’\n- -_åt ~ -yåt_ (after vowels) ‘plural’, e.g. _jar-åt_ ‘ghazals’, _urul-åt_ ‘lips’, _gazhi-yåt_ ‘signs’\n- -_hå_ ‘plural’, e.g. _qutuf-hå_ ‘slow steps’\n- -_håt_ ‘plural’, e.g. _cuqu-håt_ ‘realities’\n\n\nThe following implies that these are also used with native stems: “The second series is of Persian-Arabic origin and is mostly (but not only) used in connection with Persian-Arabic words, ［-_håt_］ is a combined Persian and Moghol plural suffix” ([Weiers 2003](sources.bib?label=Weiers+2003#cldf:weiers2003a):254).\n\n\n2 comparative/superlative markers\n\n- _-tar_ ‘comparative’\n- _-iin_ ‘superlative’, used in addition to comparative, i.e. -_tariin._ There are no examples of hybrids, but the following implies that they are used with native stems: “Adjectives are distinguished by the category of degree (comparison), borrowed from Iranian and marked by the Persian suffixes _-tar_ for the comparative and _-tar-iin_ for the superlative” ([Weiers 2003](sources.bib?label=Weiers+2003#cldf:weiers2003a):252).\n\n\n\n1 case marker (out of a total of 7 Moghol case markers)\n\n- _-az_ ‘ablative case’. There are no examples of hybrids, but the following implies that they are used with native stems: “The Persian preposition _az_ ‘from’ is sometimes used as an ablative suffix -_az_” ([Weiers 2003](sources.bib?label=Weiers+2003#cldf:weiers2003a):255).	\N	136	135	Eurasia	\N	\N	7	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
87	{}	145	Chinese affixes in Dagur	Information and examples are from [Tsumagari ](sources.bib?label=Tsumagari+#cldf:tsumagari2003a)([2003](sources.bib?label=2003#cldf:tsumagari2003a):136).\n\n\n1 plural suffix (out of 4 Dagur plural suffixes)\n\n- -_cieng_ ‘plural’, e.g. _gambul-cieng_ ‘executives’ (in Chinese, _-cieng_ denotes place of origin or habitation, e.g. _batgen-cieng_ ‘Butha people’, _degidee-cieng_ ‘upper-river-dwellers’)	\N	138	137	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
88	{}	146	Croatian affixes in Hungarian	This case refers to the dialects of Ormányság and Hosszúszó. Information and examples are from [Fuchs ](sources.bib?label=Fuchs+#cldf:fuchs1949a)([1949](sources.bib?label=1949#cldf:fuchs1949a):225–226). Examples are from the dialect of Ormányság, but the borrowed prefix is also attested in the dialect of Hosszúszó. The borrowed prefix is added to forms that include native Hungarian comparative suffixes. [Fuchs ](sources.bib?label=Fuchs+#cldf:fuchs1949a)([1949](sources.bib?label=1949#cldf:fuchs1949a):226) notes that the same Croatian prefix is used by German speaking children in Upper Hungary in combination with native German superlative forms, e.g. _naj-grösste_ (superlative-biggest) ‘biggest’_, najbeste_ (superlative-best) ‘best’.\n\n\n1 superlative prefix\n\n- _naj-_ ‘superlative’, e.g. _náj-nagy-obb_ (superlative-big-comparative) ‘biggest’, _náj-zë-bb_ (superlative-nice-comparative) ‘most beautiful’	\N	139	51	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
89	{}	147	Evenki affixes in Dagur	Information and examples are from [Tsumagari ](sources.bib?label=Tsumagari+#cldf:tsumagari2003a)([2003](sources.bib?label=2003#cldf:tsumagari2003a):136).\n\n\n3 plural suffixes (out of a total of 4 Dagur plural markers)\n\n- _-sul_ ‘plural’ (used with any noun), e.g. _akaa-sul_ ‘elder brothers’, _mori-sul_ ‘horses’, _mood-sul_ ‘trees’\n- -_nur_ ‘plural’ (for human nouns), e.g. _guc/i-nur_ ‘friends’, _deu-nur_ ‘younger brothers’\n- -_r_ ‘plural’ (for human nouns), e.g. _ugi-r_ ‘girls’, _uciike-r_ ‘infants’, _kek/u-r_ ‘children’	\N	138	140	Eurasia	\N	\N	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
90	{}	148	Chinese affixes in Santa	Information and examples are from [Kim ](sources.bib?label=Kim+#cldf:kim2003a)([2003](sources.bib?label=2003#cldf:kim2003a)).\n\n\n5 derivational suffixes forming denominal nouns (out of a total of 13 of such derivational suffixes in Santa)\n\n- _-kai_ ‘agent or occupation noun’, e.g. _su-kai_ (vinegar-nominalization) ‘vinegar seller’, _nienjinzi-kai_ (eye_glasses-nominalization) ‘a person wearing glasses’\n- _-tu_ ‘possessive adjectival nouns’, e.g. _amin-tu_ (life-nominalization) ‘living, alive’\n- _-sha_ ‘noun denoting a person having a characteristic’, e.g. _taghu-sha_ (fat-nominalization) ‘a fat person’\n- _-bao_ ‘noun denoting a person having a characteristic’, e.g. _yara-bao_ (tumor-nominalization) ‘a person with a tumor’\n- _-jian_ ‘noun denoting a person having a characteristic’, e.g. _borun-jian_ (right_side-nominalization) ‘a right-handed person’\n\n\n\n1 plural suffix for pronouns and kinship terms (out of a total of 2 such plural markers in Santa)\n\n- _-xie_, e.g. _gayijio-xie(-la)_ ‘younger brothers’\n\n\n\n1 passive marker\n\n- _neyi-_ ‘passive’, e.g. _bi gayi-se-ne (idun) neyi-wo_ ‘I was hit (one blow) by my brother’, _ene kewon changbang pipin neyizhi wo_ ‘this boy is frequently being rebuked’.	\N	112	137	Eurasia	\N	\N	7	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
91	{}	149	Turkic affixes in Middle Mongolic	Information and examples are from [Schönig ](sources.bib?label=Sch%C3%B6nig+#cldf:schoenig2003a)([2003](sources.bib?label=2003#cldf:schoenig2003a)). Note that many of the features concerned may be much older than Middle Mongolic.\n\n\n3 case markers\n\n- &ast;_-lUx-A_ ‘comitative’, based on the Turkic suffix &ast;_-lVg_ for possessive adjectival nouns, as in Turkic &ast;_at-lïg_ ‘with a horse’. The same Turkic suffix appears with a derivative function as a later borrowing in Middle Mongol, e.g. Middle Mongol _miqa-liq_ ‘corpulent’ (from _miqa/n_ ‘flesh’).\n- &ast;_-cAA_ ‘terminative’, rarely used, may be a borrowing from the Turkic equative in &ast;_-cA_ (‘as’); a connection of the latter with the Mongolic primary ablative in &ast;_-cA_ is also possible but less likely.\n- &ast;_-ki_ ‘secondary nominative’, has a cognate in Turkic and is probably of Turkic origin.\n\n\nOther Mongolic case suffixes that have been compared with Turkic include the locative in &ast;_-A_ (cf. the Turkic dative in &ast;_-GA_), the dative (dative-locative) in &ast;_-D-A_ (cf. the Turkic locative in &ast;_-DA_), and the accusative in &ast;_-g_ (only in Mongol proper, Ordos, Oirat, and Kalmuck, cf. the Turkic accusative in &ast;_-G_). All of these comparisons involve, however, considerable linguistic problems.\n\n\n1 plural suffix\n\n- &ast;_-s_ ‘plural’ (&gt; Common Turkic &ast;_-z_)\n\n\n\n1 nominal derivation suffix\n\n- &ast;_-cI_ ‘actor noun’\n\n\n\n1 verbalizer prefix\n\n- &ast;_-lA-_ ‘denominal verbalization’, e.g. &ast;_ger.le-_ ‘to marry’ (from &ast;_ger_ ‘house’)	\N	142	141	Eurasia	\N	\N	6	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
92	{}	150	Lingala affixes in Ndunga-le	Information and examples are from [Pasch ](sources.bib?label=Pasch+#cldf:pasch1988a)([1988](sources.bib?label=1988#cldf:pasch1988a)).\n\n\n4 noun class prefixes which form two singular-plural pairs\n\n- _mù-_ ‘singular class 1’, e.g. _mù-mbòmà-Ø_ ‘spirit’\n- _mì-_ ‘plural class 2’, e.g. _mì-mbòmà-yè_ ‘spirits’\n- _(l)í-_ ‘singular class 3’, e.g. _í-lágɛ̀-Ø_ ‘fire’\n- _ma-_ ‘plural class 4’, e.g, _má-lágɛ́-yɛ̀_ ‘fires’	\N	144	143	Africa	\N	\N	4	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
93	{}	151	Cushitic affixes in Ilwana	Information and examples are from [Möhlig ](sources.bib?label=M%C3%B6hlig+#cldf:moehlig1986a)([1986](sources.bib?label=1986#cldf:moehlig1986a)). The exact source language is unknown, but “plural formation with suffixes is certainly not Bantu ［and］ looks somehow Cushitic” ([Möhlig 1986](sources.bib?label=M%C3%B6hlig+1986#cldf:moehlig1986a):279).\n\n\n4 plural markers\n\n- _-ɛna_ ‘plural’, e.g. _ngɔ́mena_ ‘drums’ (_ngɔ́ma_ ‘drum’), _híɗɛna_ ‘roots’ (_híɗa_ ‘root’), _bɔ́kwɛna_ ‘cheeks’ (_bɔ́kɔ_ ‘cheek’)\n- _-ıɾa_ ‘plural’, e.g. _símbıɾa_ ‘sticks’ (_símbɔ_ ‘stick’), _sâ:pwıɾa_ ‘palms of hand’ (_sâ:pu_ ‘palm of hand’), _pâ:ngıɾa_ ‘machetes’ (_lupâ:nga_ ‘machete’)\n- _-wakı_ ‘plural’, e.g. _sî:ɾwakı_ ‘knives’ (_sî:ɾu_ ‘knife’), _ɣɛ́ɾwakı_ ‘giraffes’ (_ɣɛ́ɾı_ ‘giraffe’)\n- _-imɔ_ ‘plural’, e.g. _ɓánimɔ_ ‘branches’ (_ɓána_ ‘branch’), _ɓáɓalimɔ_ ‘doors’ (_ɓáɓala_ ‘door’), _ɲâ:limɔ_ ‘claws’ (_ɲâ:la_ ‘claw’)	\N	146	145	Africa	\N	\N	4	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
94	{}	152	North Swahili affixes in South Swahili	Information and examples are from [Güldemann ](sources.bib?label=G%C3%BCldemann+#cldf:gueldemann1992a)([1992](sources.bib?label=1992#cldf:gueldemann1992a):52, 53) and [Güldemann ](sources.bib?label=G%C3%BCldemann+#cldf:gueldemann2003a)([2003](sources.bib?label=2003#cldf:gueldemann2003a):187)­. No examples of hybrid formations are given here, but since these forms have become members of inflection in South Swahili, it is safe to assume that they regularly combine with native South Swahili stems. The forms do not share the same slot in the verbal template. Both prefixes have developed from multimorphemic forms of North Swahili.\n\n\n2 tense-aspect markers\n\n- _me-_ ‘perfect’\n- _hu-_ ‘habitual’	\N	148	147	Africa	\N	\N	2	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
95	{}	153	Spanish affixes in Nahuatl	Information and examples are from [Hill and Hill ](sources.bib?label=Hill+and+Hill+#cldf:hill1986a)([1986](sources.bib?label=1986#cldf:hill1986a):194, 197). See [Gardani ](sources.bib?label=Gardani+#cldf:gardani2021a)([2021](sources.bib?label=2021#cldf:gardani2021a)) for a detailed treatment of the agentivizer.\n\n\n2 diminutive/augmentative markers\n\n- _-ita_ ‘diminutive’, e.g. _nān-ita_ (mother-diminutive) ‘mother dear’, this is the only hybrid formation attested; in general, a native strategy for diminutives is employed on native roots, while _-ita_ is employed for Spanish roots. [González Casanova ](sources.bib?label=Gonz%C3%A1lez+Casanova+#cldf:casanova1933a)([1933](sources.bib?label=1933#cldf:casanova1933a):715) mentions an example with reduplicated stem that seems to be a hybrid formation _xa~xal-to_ (translation unknown).\n- _-ote_ ‘augmentative’, e.g. _huēy-ote_ (big-augmentative) ‘enormous’, this is the only hybrid formation attested.\n\n\n\n1 agent noun derivation\n\n- -_tero_ (_-ero_) ‘agent noun’, e.g. _cuah-tero_ (wood-agent) ‘wood cutter’, _tlahchiqu-ero_ (collect_maguey-agent) ‘one who collects maguey’. _tepalcat-ero_ (pottery-agent) ‘potter’, _tecol-ero_ (charcoal-agent) ‘coalman’, _tlacual-ero_ (food-agent) ‘waiter who brings lunch to the field workers’ ([González Casanova 1933](sources.bib?label=Gonz%C3%A1lez+Casanova+1933#cldf:casanova1933a):715).\n\n\nOther Nahuatl languages and varieties appear to have borrowed similar sets of suffixes. In Balsas Nahuatl plural _-s_ and agent marker _-ero_ are borrowed ([Chamoreau 2012](sources.bib?label=Chamoreau+2012#cldf:chamoreau2012a):72). [Suárez ](sources.bib?label=Su%C3%A1rez+#cldf:su1977a)([1977](sources.bib?label=1977#cldf:su1977a):118) mentions “sporadically” borrowed plural suffixes _-s_ / _-es_, but gives no examples. Mexicanero has borrowed diminutive _-ito_ (masculine in Spanish), e.g. _nin-nakas-ito_ (3.plural-ear-diminutive) ‘your little ear’, _tepitʃi-tʃih-ito-h_ (little-plural-diminutive-plural) ‘little’ ([Chamoreau 2012](sources.bib?label=Chamoreau+2012#cldf:chamoreau2012a):83). Papajan Nahuatl has also borrowed _-tero_ ‘agentive’, where it is explicitly argued that borrowing was indirect ([Gutiérrez-Morales 2012](sources.bib?label=Guti%C3%A9rrez-Morales+2012#cldf:morales2012a):224–225).	\N	149	25	South America	\N	\N	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
96	{}	154	Middle Low German affixes in Russian	Information and examples are from [Matushansky ](sources.bib?label=Matushansky+#cldf:matushansky2023a)([2023](sources.bib?label=2023#cldf:matushansky2023a):3). The affix _-ša_ was introduced into Russian via loanwords that include the Middle Low German adjectival affix _-sche_. It often attaches to bases ending with _-or, -er,_ and _-arʲ_ (e.g. _aptekarša_ ‘female pharmacist’), therefore it mostly occurs in loanwords denoting occupation ([Fufaeva 2021](sources.bib?label=Fufaeva+2021#cldf:fufaeva2021a)). However, hybrid formations are attested in [Fufaeva ](sources.bib?label=Fufaeva+#cldf:fufaeva2021a)([2021](sources.bib?label=2021#cldf:fufaeva2021a)). Note also that the final vowel of _-sche_ was reinterpreted as the nominative singular case marker _-a_ in Russian and alternates depending on the case. The form of the feminine morpheme itself is analyzed as -_š_ in Russian.\n\n\n1 nominal derivation suffix\n\n- _-ša_ ‘female equivalent’, e.g. _velikan-ša_ (giant-feminine.nominative.singular) ‘giantess’, _opek-un-ša_ (look.after-agent-feminine.nominative.singular) ‘trustee (woman)’.	\N	5	150	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
97	{}	155	French affixes in Russian	Information is taken from [Matushansky ](sources.bib?label=Matushansky+#cldf:matushansky2023a)([2023](sources.bib?label=2023#cldf:matushansky2023a)), personal communication from O. Matushansky in 2023, and from [Fufaeva ](sources.bib?label=Fufaeva+#cldf:fufaeva2021a)([2021](sources.bib?label=2021#cldf:fufaeva2021a)), see also [Yepishkin ](sources.bib?label=Yepishkin+#cldf:yepishkin2010a)([2010](sources.bib?label=2010#cldf:yepishkin2010a)). French affixes in Russian are mostly found on stems that are likewise borrowed from French, and the few hybrid formations often contain word play or irony.\n\n\n3 agent nominalization suffixes\n\n- -_is_ ‘female agent’, e.g. _igrok-is-a_ (player-agent.feminine-nominative.singular) ‘female player (in the gaming community)’.\n- -_ess_ ‘female agent’, e.g. _xryč-ess-a_ (geezer-agent.feminine-nominative.singular) ‘name of a fictional character’. Many other formations with _-ess_ are pseudo-foreignisms, i.e. derived from foreign stems, but most likely within Russian, e.g. _kritik-ess-a_ (critic-agent.feminine-nominative.singular) ‘critic (woman)’, _avtor-ess-a_ (author-agent.feminine-nominative.singular) ‘female writer (ironically)’, _advokat-ess-a_ (lawyer-agent.feminine-nominative.singular) ‘lawyer (woman)’, _frend-ess-a_ ‘a woman whose account is added as a “friend”, typically on Facebook’, _pilot-ess-a_ ‘female pilot’, _dramaturg-ess-a_ ‘female playwright (ironically)’, _vampir-ess-a_ ‘female vampire’, _got-ess-a_ ‘female goth (in goth community)’, _politik-ess-a_ ‘politician (woman)’.\n- -_ʲor_ ‘male (or unmarked) agent’, e.g. _uhaž-or_ (take.care-agent) ‘admirer’, _bašn-ʲor_ (turret-agent) ‘turret gunner in a tank’, _šum-ʲor_ (noise-agent) ‘sound engineer (in theaters, archaic)’. The suffix -_ʲor_ is most productive with foreign roots and often substitutes other agent affixes during adaptation of loanwords from European languages, resulting in, among others, French _volontaire_ borrowed as _volontʲor_ and English _boxer_ borrowed as _boksʲor_.	\N	5	151	Eurasia	\N	\N	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
98	{}	156	Belarusian affixes in Lithuanian	Information is taken from [Inčiuraitė-Noreikienė, Pakerys and Stundžia ](sources.bib?label=In%C4%8Diurait%C4%97-Noreikien%C4%97%2C+Pakerys+and+Stund%C5%BEia+#cldf:in2015a)([2015](sources.bib?label=2015#cldf:in2015a)), examples are mainly from [Zinkevičius ](sources.bib?label=Zinkevi%C4%8Dius+#cldf:zinkevi1966a)([1966](sources.bib?label=1966#cldf:zinkevi1966a):30–31, 334). Further background information is from [Arkadiev and Kozhanov ](sources.bib?label=Arkadiev+and+Kozhanov+#cldf:arkadiev2023a)([2023](sources.bib?label=2023#cldf:arkadiev2023a)), [Deksne ](sources.bib?label=Deksne+#cldf:deksne2022a)([2022](sources.bib?label=2022#cldf:deksne2022a)), [Nau and Arkadiev ](sources.bib?label=Nau+and+Arkadiev+#cldf:nau2015a)([2015](sources.bib?label=2015#cldf:nau2015a)), and [Wiemer ](sources.bib?label=Wiemer+#cldf:wiemer2009a)([2009](sources.bib?label=2009#cldf:wiemer2009a)). The borrowed affixes discussed here are not part of modern Standard Lithuanian, but occur in regional spoken Lithuanian, mostly in South-Eastern dialects, including those on the territory of modern Belarus ([Tuomienė 2020](sources.bib?label=Tuomien%C4%97+2020#cldf:tuomien2020a)). For example, for the derivational prefix _da-_ it is known that, even though words with _da-_ occur across the whole Lithuanian language area, the closer to Belarus the variety is, the more frequently they appear. The use of these hybrid formations seems to be discouraged in the standard language ([Kozhanov 2014](sources.bib?label=Kozhanov+2014#cldf:kozhanov2014a):267–268). In case of _da-_, it is argued that it was borrowed a very long time ago or might even be inherited ([Kozhanov 2013](sources.bib?label=Kozhanov+2013#cldf:kozhanov2013a):72). Assuming _da-_ was borrowed, it is one out of a set of three interrelated verbal aspect prefixes that were most likely borrowed directly, since they display a strong tendency to combine with native stems (95%). The verbalizer suffix _-ui_ was also most likely borrowed directly, as it also occurs primarily (in 70% of the cases) with native stems. In addition to Belarusian, Polish dialects of Podlachia may be a source language for these borrowed affixes.\n\n\n3 verbal derivational prefixes\n\n- _pad-_ ‘addition, approach, movement under’, e.g. _pad-áugau_ (under-grow.1.singular.past) ‘I grew up’, _pad-kált_ (under-strike.infinitive) ‘to shoe (horses)’.\n- _raz-_ ‘completion via separation, dispersal’, e.g. _raz-dãrai_ (separation-do.2.singular.present) ‘you open the door (all the way)’, _rãz-vogė_ (separation-steal.3.past) ‘she/he stole (everything)’.\n- _da-_ ‘point of achievement of the action, until’, e.g. _da-dùrti_ (until-stab.infinitive) ‘add (a remark)’, _ne-da-kẽpęs_ (negation-until-baking) ‘not quite smart’, _da-rašyti_ (until-write.infinitive) ‘to finish writing’ ([Kozhanov 2014](sources.bib?label=Kozhanov+2014#cldf:kozhanov2014a)).\n\n\n\n1 verbalizer suffix\n\n- _-ui_ ‘verbalizer, spend time doing something with X’ e.g. _nakt-ùi-t_ (night-verbalizer-infinitive) ‘to spend the night’, _dar̃b-uj-a_ (work-verbalizer-present.3) ‘she/he works’, _piet-ùj-a_ (lunch-verbalizer-present.3) ‘she/he has lunch’. This form is likely derived from the reinterpretation of East Slavic verbs with the imperfective verbalizer _-ova-_, which alternates with _-uj_ in present tense.	\N	153	152	Eurasia	\N	\N	4	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
99	{}	157	Central Asian Turkic affixes in Russian	Information is taken from [Matushansky ](sources.bib?label=Matushansky+#cldf:matushansky2023a)([2023](sources.bib?label=2023#cldf:matushansky2023a):4), quoting [Witkowski ](sources.bib?label=Witkowski+#cldf:witkowski1981a)([1981](sources.bib?label=1981#cldf:witkowski1981a)), and [Hadzhieva et al. ](sources.bib?label=Hadzhieva+et+al.+#cldf:hadzhieva2012a)([2012](sources.bib?label=2012#cldf:hadzhieva2012a)). The borrowed suffix _-ščik_ originated from the fusion of an adjectival ending -_čij_, which appeared extensively in Turkic noun agent borrowings, and a native nominalizer _-ik_. Eventually, -_ščik_ became productive, replacing _-čij_. An alternative native etymology, which is widely accepted in traditional historical morphology of Russian, analyzes the affix as a fusion of the native adjectival affix _-sk_ and the native nominalizer _-ik_. This is also how the form -_ščik_ can be analyzed synchronically ([Itkin 2007](sources.bib?label=Itkin+2007#cldf:itkin2007a):2). Note that the form _-čik_ is an allomorph of _-ščik_ and _-ščic_ is a feminine equivalent of _-ščik_ ([Matushansky 2023](sources.bib?label=Matushansky+2023#cldf:matushansky2023a)). We tentatively identify here proto Kipchak as a source language, the common ancestor of many central Asian Turkic languages, like Tatar. This agent noun suffix is frequently borrowed from Turkic languages across languages in Eurasia, including the AfBo language pairs Uzbek to Northern Tajik, Turkish to Iraqi Arabic, Turkic to Middle Mongolic, Azeri to Udi, and Turkish to Albanian. [Hadzhieva et al. ](sources.bib?label=Hadzhieva+et+al.+#cldf:hadzhieva2012a)([2012](sources.bib?label=2012#cldf:hadzhieva2012a)) also discuss the borrowing of _-čij_ into Old Church Slavonic.\n\n\n1 agent noun derivation\n\n- _-ščik_ ‘agent noun’, e.g. _časov-ščik_ (watch.adjective-agent) ‘watchmaker’, _postav-ščik_ (supply-agent) ‘supplier’, _kamenʲ-ščik_ (stone-agent) ‘bricklayer, mason’.	\N	5	154	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
100	{}	158	Molisano Neapolitan affixes in Slavomolisano	Information is from [Breu ](sources.bib?label=Breu+#cldf:breu2013a)([2013](sources.bib?label=2013#cldf:breu2013a); [2019](sources.bib?label=2019#cldf:breu2019a); [2020](sources.bib?label=2020#cldf:breu2020a)) and [Adamou et al. ](sources.bib?label=Adamou+et+al.+#cldf:adamou2016a)([2016](sources.bib?label=2016#cldf:adamou2016a):524), the examples are from [Adamou et al. ](sources.bib?label=Adamou+et+al.+#cldf:adamou2016a)([2016](sources.bib?label=2016#cldf:adamou2016a):524). The form _(-)ka_ is not only used as an affix, but also as an independent complementizer word and as a relative pronoun ([Breu 2020](sources.bib?label=Breu+2020#cldf:breu2020a):2). Slavomolisano has a strong tendency to copy syntactic and semantic structures from the local Italian varieties ([Breu 2020](sources.bib?label=Breu+2020#cldf:breu2020a)). The use of _(-)ka_ largely corresponds to the use of its source form _che_ in Italian. This morpheme is also used as a contracted form of the conjunction _perché_ ‘why, because’ in the local Italian varieties. Slavomolisano also uses _(-)ka_ in that function. The full form of the conjunction _perché_ was also borrowed into Slavomolisano as _pëke_. Since both component morphemes of _pëke_, _pe_ (from Italian _per_) ‘for’ and _ke_ (a variant of _ka_), are borrowed, _pëke_ can be synchronically analyzed in Slavomolisano. Besides _pëke_, the hybrid formation _aje-ka_ given below appears to be the only use of _ka_ as a bound form, suggesting that its productivity as a borrowed affix is limited.\n\n\n1 conjunction derivation from interrogatives\n\n- _-ka_ ‘complementizer’, e.g. _aje-ka_ (why-complementizer) ‘because’.	\N	156	155	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
101	{}	159	Lombardic affixes in Tuscan Italian	Information and examples are from [Aebischer ](sources.bib?label=Aebischer+#cldf:aebischer1941a)([1941](sources.bib?label=1941#cldf:aebischer1941a):114–121), citing [Bianchi ](sources.bib?label=Bianchi+#cldf:bianchi1888a)([1888](sources.bib?label=1888#cldf:bianchi1888a)). The affix _-ing(a) / -eng(a)_ was borrowed around the 10th–12th century from Lombardic (Germanic). It is best attested in Tuscan toponyms of Germanic, and sometimes also of Romance origin, and in personal names. Though it is not currently productive, it may once have been so to some extent, as it is also found in nouns and attributive adjectives. Apart from place names and personal names, it mostly occurs in hybrid formations.\n\n\n1 adjectivizer\n\n- _-ing(a) / -eng(a)_ ‘attributive, belonging to’, e.g. _casal-ing-o_ (hamlet-attributive-masculine.singular) ‘relevant to the house-life, home-made, homely’, _ram-ingo_ (branch-attributive) ‘wandering, roaming’, _maggior-ingo_ (greater-attributive) ‘important or influential person’.	\N	158	157	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
102	{}	160	Italian affixes in Arbëresh Albanian	Examples are from [Altimari ](sources.bib?label=Altimari+#cldf:altimari2011a)([2011](sources.bib?label=2011#cldf:altimari2011a):12–13). The affix is argued to be introduced via partial calques of Italian verbs, in which the nominal roots are translated to Arbëresh Albanian while the Italian infinitive _-are_ suffix is retained.\n\n\n1 verbalizer suffix\n\n- _-ar_ ‘verbalizer’, e.g. _thel-ar-ënj_ (nail-verbalizer-present.1.singular) ‘I slice’, _ajër-ār-ënj_ (air-verbalizer-present.1.singular) ‘I air, ventilate’. Note that the etymology of _ajër_ in this word is Albanian, even though this form was previously borrowed from Latin into Albanian.	\N	160	159	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
103	{}	161	Chamacoco affixes in Kadiwéu	Information and examples are from [Ciucci ](sources.bib?label=Ciucci+#cldf:ciucci2014a)([2014](sources.bib?label=2014#cldf:ciucci2014a):17), citing [Sandalo ](sources.bib?label=Sandalo+#cldf:sandalo1995a)([1995](sources.bib?label=1995#cldf:sandalo1995a):47–49). The relationship between the Kadiwéu and Chamacoco people is said to have been hostile. However, the form given here is argued to be very likely borrowed because affixes with such grammatical functions are typologically rare and there are no other possible sources attested for it in Kadiwéu. [Ciucci ](sources.bib?label=Ciucci+#cldf:ciucci2014a)([2014](sources.bib?label=2014#cldf:ciucci2014a)) identifies a number of other similarities in the morphology of Zamucoan, Guaycuruan, and Matacoan, but, for these, the circumstances and the direction of potential borrowing remain unclear.\n\n\n1 number agreement prefix\n\n- _o-_ ‘plural human verbal participant’, e.g. _o-j-awe_ (plural-3-blow) ‘they blow’, _o-j-alakatidi_ (plural-3-remember) ‘they remember’. The corresponding morpheme in the source language (a third person plural pronominal form) is also only used for humans and sometimes large animals.	\N	162	161	South America	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
104	{}	162	Nivaclé affixes in Zamucoan	Information and examples are from [Ciucci ](sources.bib?label=Ciucci+#cldf:ciucci2010a)([2010](sources.bib?label=2010#cldf:ciucci2010a):9, 22; 2014:22). The borrowing is argued to have happened already in an ancestor language of Zamuco, hence the prefix is also found in ancient Zamucoan and other Zamucoan languages. Therefore, the donor language would also have been an ancestor language of Nivaclé within the Mataguayan family, or possibly a Guaicuruan language. [Ciucci ](sources.bib?label=Ciucci+#cldf:ciucci2014a)([2014](sources.bib?label=2014#cldf:ciucci2014a):22) argues that the borrowing of this prefix may have created double 3rd person forms, which would have been reanalyzed as reflexive and non-reflexive. This grammatical distinction is absent in other languages of the region, including the source languages. [Ciucci ](sources.bib?label=Ciucci+#cldf:ciucci2014a)([2014](sources.bib?label=2014#cldf:ciucci2014a)) identifies a number of other similarities in the morphemeologies of Zamucoan, Guaycuruan, and Matacoan, but for these, the circumstances and direction of potential borrowing remain unclear.\n\n\n1 possessive person-marker prefix\n\n- _d-/l-_ ‘same-subject possessor, in noun 3rd person marking’ _d-a-huch_ ~ _l-a-huch_ (reflexive_possessor-3.possessee-house) ‘his/her house’ as in _Juan shiyokôr dahuch_ ‘John built his house.’ Note that /d/ and /l/ are in free variation word-initially.	\N	164	163	South America	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
105	{}	163	Russian affixes in Estonian	Information and examples are from [Blokland ](sources.bib?label=Blokland+#cldf:blokland2005a)([2005](sources.bib?label=2005#cldf:blokland2005a):39–41), citing many other sources. Some of the affixes are “found mostly in loan-contaminations in slang or dialects” ([Blokland 2005](sources.bib?label=Blokland+2005#cldf:blokland2005a):39).\n\n\n4 nominal derivational suffixes; 2 of these are described as adjectival, but both seem to have diminutive meaning, too\n\n- -_nik_ ‘agentive’, e.g. _koddenick_ ‘citizen’, _aednik_ ‘gardener’.\n- -_ski_ ‘adjectival/agentive/diminutive’, e.g. _tegelinski_ ‘hustler, go-getter’, _rakuski_ ‘little dog’.\n- -_uiska_ ‘adjectival/diminutive’ e.g. _pliikuska_ ‘young girl’, _söbruska_ ‘(boy)friend’, _kibluska_ ‘garlic’.\n- -_ka_ ‘local nominal’, e.g. _täika_ ‘flea market’, _Snelka_ ‘the sports field near Schnell’s pond in Tallinn’, _krimka_ ‘thriller, crime novel’.\n\n\n\n3 adjectivizer suffixes\n\n- -_noi_ ‘adjectival’ e.g. _kehvnoi_ ‘bad, poor’, _popsnoi_ ‘yokel-like’, _vahvnoi_/_vafnoi_ ‘cool, great’.\n- -_voi_ ‘adjectival’, e.g. _tobevei_ ‘silly’.\n- -_vaato_ ‘moderative’, e.g. _balavaato_ ‘pretty bad’.\n\n\n\n1 superlative prefix\n\n- _pre_- ‘superlative’ _preeillos_ ‘very beautiful’, rare and only in the dialect of Ludza.\n\n\n\n1 emphatic particle\n\n- -_to_ ‘emphatic particle’, e.g. _küll ‘este mina olin ‘kärme ‘marju-ta korjama_ ‘I could gather those berries pretty quickly’; this form is only attested in the Iisaku dialect.	\N	67	5	Eurasia	\N	\N	9	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
106	{}	164	Kurdish affixes in Chaldean Neo-Aramaic	Examples are from [Gutman ](sources.bib?label=Gutman+#cldf:gutman2015a)([2015](sources.bib?label=2015#cldf:gutman2015a):317) and pertain to the dialect of Ganzax. The affix was borrowed from Kurdish Ezafe, i.e. an affix marking the possessee, but in Neo-Aramaic it developed the meaning ‘descendant of’. This indicates that the affix was introduced via proper names ([Gutman 2018](sources.bib?label=Gutman+2018#cldf:gutman2018a):373). Kurdish Ezafe is also used in another North-Eastern Neo-Aramaic language, Suleimaniya Jewish Neo-Aramaic, but in that language only in complex loanwords consisting of Kurdish material only ([Khan 2007](sources.bib?label=Khan+2007#cldf:khan2007a):202).\n\n\n1 noun possessee suffix\n\n- _-ye_ ‘descendant of’, e.g. _Yaqo-ye Musa_ (Yaqo-possessee Musa) ‘Yaqo, son of Musa’.	\N	166	165	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
107	{}	165	Kurdish affixes in Suleimaniya Jewish Neo-Aramaic	Examples and information are from [Khan ](sources.bib?label=Khan+#cldf:khan2007a)([2007](sources.bib?label=2007#cldf:khan2007a)). All three forms are described as being not very tightly integrated into the morphology, as they only occur in word-final positions. They are, however, presented as bound forms.\n\n\n1 definite suffix\n\n- _-ăke_ ‘definite’, e.g. _barux-awal-ăke_ (friend-plural-definite) ‘the friends’. The source form of this suffix is a Kurdish particle _aka_ with a Kurdish oblique case marker _-y_.\n\n\n\n1 post-verbal particle\n\n- -_(a)wa_ ‘returning, restoring, repetition, completion’, e.g. _hiye-wa_ (come:past:3.masculine-particle) ‘he came back’, _qadome der-awa_ (tomorrow/return:fut:3masculine-particle) ‘he will return tomorrow.’\n\n\n\n1 nominal modifying particle\n\n- _-iš_ ‘inclusive’, e.g. _nošew-iš_ ‘also himself’.	\N	167	165	Eurasia	\N	\N	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
108	{}	166	German affixes in Estonian	Examples are from ([Mägiste 1968](sources.bib?label=M%C3%A4giste+1968#cldf:maegiste1968a):8, 9). Many affixes were borrowed from German, but only some are productive and have grammatical meanings, many others are marginal and restricted to obscene vocabulary and irony.\n\n\n1 adjectivizer\n\n- _-lik_ ‘adjectivizer’, e.g. _ilmalik_ ‘worldly’, _onnelik_ ‘happy’.\n\n\n\n2 nominal derivations\n\n- _-man(n)_ ‘agent’, e.g. _naak-man_ or _naga-man_ (bun-agent) ‘urchin, lout’. According to [Sõnaveeb ](sources.bib?label=S%C3%B5naveeb+#cldf:s2024a)([2024a](sources.bib?label=2024a#cldf:s2024a)), the stem _naga_ in modern Estonian has other meanings, including ‘urchin’ ([Sõnaveeb 2024b](sources.bib?label=S%C3%B5naveeb+2024b#cldf:s2024b)). The suffix is used colloquially in pejoratives, and is said to originate from German surnames ending in -_mann_ ([Mägiste 1968](sources.bib?label=M%C3%A4giste+1968#cldf:maegiste1968a):9).\n- _-ment_ ‘item’, e.g. _sakus-ment_ (snack-suffix) ‘snack’, _tagu-ment_ (behind-suffix) ‘buttocks’. This suffix is ultimately from French, but was borrowed into Estonian from German ([Mägiste 1968](sources.bib?label=M%C3%A4giste+1968#cldf:maegiste1968a)).	\N	67	132	Eurasia	\N	\N	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
109	{}	167	Azeri affixes in Udi	Information and examples are from [Maisak ](sources.bib?label=Maisak+#cldf:maisak2019a)([2019](sources.bib?label=2019#cldf:maisak2019a):339) and [Maisak ](sources.bib?label=Maisak+#cldf:maisak2023a)([2023](sources.bib?label=2023#cldf:maisak2023a):66). The Udi people have been using Azeri as a second language for centuries, and in the village of Nizh (Azerbaijan), where the majority of Udi speakers live, Udi speakers are nowadays functionally bilingual in Azeri ([Schulze 2016](sources.bib?label=Schulze+2016#cldf:schulze2016a)). Udi displays strong contact-induced changes from Azeri on all linguistic levels.\n\n\n1 conditional clitic\n\n- _=sa_ ‘conditional’, e.g. _bak-e=ne=sa_ (become-perfect=3.singular=conditional) ‘if s/he was’. The clitic _=sa_ is also used on verbs and nouns to mark the standard of comparison and it combines with the third person clitic into _=ne=sa_ which is described as an indefinite pronoun, e.g. _šu=ne=sa_ (who=3.singular=conditional) ‘someone’ ([Maisak 2019](sources.bib?label=Maisak+2019#cldf:maisak2019a):340).\n\n\n\n1 ordinal numeral formation\n\n- _-(i)mǯi_ ‘ordinal numeral’, e.g. _sa-mǯi_ ‘first’, _χib-imǯi_ (three-ordinal) ‘third’.\n\n\n\n1 privative adjectivizer\n\n- _-suz_ ‘privative’, e.g. _χe-suz_ (water-privative) ‘not having water’, _išqːar-suz_ (husband-privative) ‘not having a husband’. This suffix is in competition with the native Udi privative/negative morpheme _nutː_.\n\n\n\n3 nominal/nominalizer suffixes\n\n- _-lu_ ‘related to X’, e.g. _niˁžˁ-lu_ (Nizh-attributive) ‘inhabitant of Nizh (village)’.\n- _-luʁ_ ‘abstract or status noun’, e.g. _muˁq-luʁ_ (glad-nominalizer) ‘joy’. This suffix is highly productive ([Schulze 2002](sources.bib?label=Schulze+2002#cldf:schulze2002a):122).\n- _-či_ ‘agent noun’, e.g. _zido-či_ (iron-agent) ‘smith’. It is rare with native words in the written sources, but in spoken Udi, hybrid formations with this suffix can incidentally be heard ([Schulze 2002](sources.bib?label=Schulze+2002#cldf:schulze2002a):123). These are often certain calques modelled after Azeri lexemes.	\N	169	168	Eurasia	\N	\N	6	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
110	{}	168	Upper Chinook affixes in Bella Coola	Information and examples are from [Nater ](sources.bib?label=Nater+#cldf:nater2000a)([2000](sources.bib?label=2000#cldf:nater2000a); [2010](sources.bib?label=2010#cldf:nater2010a)). Bella Coola has borrowed a portion of its lexicon from Chinook Jargon, a creole language related to Upper Chinook. The plural suffix it borrowed from Upper Chinook has no known cognates in the Salishan languages related to Bella Coola, but Upper Chinook has a similar plural suffix, which is identified as the source form. In Chinook, this plural suffix is part of a circumfix and the suffix part can be omitted. Today, Chinook and Bella Coola are spoken far away from each other. However, [Nater ](sources.bib?label=Nater+#cldf:nater2010a)([2010](sources.bib?label=2010#cldf:nater2010a):204–207) argues that Bella Coola speakers were located near speakers of Chinookan languages until maybe the early 20th century, and that Bella Coola traders developed a vernacular variety that took in Chinook elements, including _-uks_, from where this suffix spread into other varieties of Bella Coola.\n\n\n1 nominal number suffix\n\n- _-uks_ ‘plural’, e.g. _ƛ̓’mstay-uks_ (person-plural) ‘persons’ ([Nater 2000](sources.bib?label=Nater+2000#cldf:nater2000a):137).	\N	171	170	South America	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
111	{}	169	Hebrew affixes in Yiddish	Information and examples are from [Weinreich ](sources.bib?label=Weinreich+#cldf:weinreich1953a)([1953](sources.bib?label=1953#cldf:weinreich1953a):32). The borrowing is explicitly argued to be indirect, i.e. these Hebrew affixes entered Yiddish as part of complex loanwords from where they spread to native Yiddish stems.\n\n\n1 nominal number suffix\n\n- _-im_ ‘plural’, e.g. _doktójr-im_ (doctor-plural) ‘doctors’, _pójer-im_ (peasant-plural) ‘peasants’. The source form is the Hebrew masculine plural suffix. The affix is no longer productive and attested in the plural formation of only about seven person nouns ([Gold 1998](sources.bib?label=Gold+1998#cldf:gold1998a):137).\n\n\n\n1 adverbializer\n\n- _bi-_ ‘with, among, by means of’, e.g. _bi-gvald_ (with-force) ‘by force’, _bi-langzam_ (with-slow) ‘slowly’, _bi-companye_ (with-company) ‘in company’, _bi-yidishlex_ ‘Jewish’ (this example is from Dutch Yiddish). The prefix derives adverbs from nouns and adjectives; it is not productive and stems from a Hebrew preposition ([Gold 1998](sources.bib?label=Gold+1998#cldf:gold1998a):137).	\N	79	172	Eurasia	\N	\N	2	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
112	{}	170	English affixes in Welsh	The information is taken from [Weinreich ](sources.bib?label=Weinreich+#cldf:weinreich1953a)([1953](sources.bib?label=1953#cldf:weinreich1953a):32). The borrowing is explicitly argued to be indirect, i.e. these English affixes entered Welsh as part of complex loanwords from where they spread to native Welsh stems. See also discussion of this case of affix borrowing in [Gardani ](sources.bib?label=Gardani+#cldf:gardani2008a)([2008](sources.bib?label=2008#cldf:gardani2008a):76–78, 2012:87–88).\n\n\n1 nominal inflection affix\n\n- _-s_ ‘plural’, e.g. _sêr-s_ (stars-plural) ‘stars’, _‎gwdihŵ-s_ (owl-plural) ‘owls’ (https://en.wiktionary.org/wiki/-s#Welsh ［accessed: 10.10.2025］). The use in hybrid formations is clearly attested, although it might be marginal. As can be seen in the example, _-s_ is attested both with collective nouns (_sêr_ ‘stars’) and with count nouns (_‎gwdihŵ_ ‘owl’).	\N	173	74	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
113	{}	171	Tasawaq affixes in Tamajeq Tuareg	Information and examples are from [Kossmann ](sources.bib?label=Kossmann+#cldf:kossmann2007a)([2007](sources.bib?label=2007#cldf:kossmann2007a)). Tasawaq is the main language of the date palm oasis of In-Gall, with less than 10,000 speakers. Tuareg is the language of the main nomadic group in the desert around In-Gall and the main contact language (most Tasawaq speakers are bilingual in Tuareg). Tasawaq has developed a morphological system that makes a strict distinction between borrowed and native lexicon strata. Borrowed affixes are generally only used on borrowed roots. Only a few occasional hybrid formations are attested.\n\n\n1 nominal number\n\n- _-(t)àⁿ_ ‘plural’, e.g. _gwánsì-tàn_ (snake-plural) ‘snakes’; 11 hybrid formations are attested.\n\n\n\n1 adjectivizer\n\n- -_àⁿ_ ‘adjectivizer’, e.g. _bààráy-àⁿ_ (change-adjective) ‘changed’, _kàkááy-àⁿ_ (build-adjective) ‘built’. This affix sometimes involves lengthening of the preceding syllable. It is borrowed from Tuareg participle forms.	\N	175	174	Africa	\N	\N	2	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
114	{}	172	German affixes in Polish	Information and examples are from Wiktionary (https://en.wiktionary.org/wiki/-unek#Polish ［accessed: 10.07.2024］) and _Słownik Języka Polskiego PWN_ ［_The Polish Language Dictionary by PWN］_ (https://sjp.pwn.pl/ ［accessed: 15.01.2026］). The affix was introduced through German borrowings, in which _-ung_ was reinterpreted as _-unek_, remodelled after the diminutive _-ek_.\n\n\n1 nominalization\n\n- _-unek_ ‘action noun’, e.g. _pomyśl-unek_ (think-nominalizer) ‘savvy, cleverness’, _pocał-unek_ (to_kiss-nominalizer) ‘kiss’.	\N	176	132	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
115	{}	173	English affixes in Spanish	Information and examples are from [Mott ](sources.bib?label=Mott+#cldf:mott2015a)([2015](sources.bib?label=2015#cldf:mott2015a)) and [García Velasco ](sources.bib?label=Garc%C3%ADa+Velasco+#cldf:velasco2020a)([2020](sources.bib?label=2020#cldf:velasco2020a)), and they relate to European Spanish. In that variety, the -_ing_ suffix is highly productive and generally used to form deverbal nouns. Two facts bear witness to its productivity: First, -_ing_ can freely combine with native Spanish stems to derive words that do not have direct equivalents in English, the source language; Second, nonce formations with the -_ing_ suffix regularly appear in advertisement language, as reported by [García Velasco ](sources.bib?label=Garc%C3%ADa+Velasco+#cldf:velasco2020a)([2020](sources.bib?label=2020#cldf:velasco2020a):126). This suffix -_ing_ is also attested in French as a gerund marker ([Lewis 2007](sources.bib?label=Lewis+2007#cldf:lewis2007a):52).\n\n\n1 nominalization suffix\n\n- -_ing_, used to form words in regular usage, e.g. _metring_ (_metro_ ‘underground railway’) ‘riding on the back of underground trains’ ([Mott 2015](sources.bib?label=Mott+2015#cldf:mott2015a):175), _tumbing_ (_tumbarse_ ‘to stretch out’) ‘lying around’ ([Mott 2015](sources.bib?label=Mott+2015#cldf:mott2015a):175), _bungee_ _salting_ (_saltar_ ‘to jump’, [Mott 2015](sources.bib?label=Mott+2015#cldf:mott2015a):180)/_cuerding_ (_cuerda_ ‘rope, string’, [Mott 2015](sources.bib?label=Mott+2015#cldf:mott2015a):180)/_goming_ (_goma_ ‘rubber’, [Mott 2015](sources.bib?label=Mott+2015#cldf:mott2015a):191)/_puenting_ (_puente_ ‘bridge’, [Mott 2015](sources.bib?label=Mott+2015#cldf:mott2015a):180) ‘bungee jumping’, _panching_ (_pancha_ ‘belly’) ‘sunbathing’ ([Mott 2015](sources.bib?label=Mott+2015#cldf:mott2015a):180), _balconing_ (_balcón_ ‘balcony’) ‘jumping from the balcony of a holiday apartment into the swimming pool below, often with fatal consequences’ ([Mott 2015](sources.bib?label=Mott+2015#cldf:mott2015a):180), _sanfermining_ (_San_ _Fermín_, name of a saint/holiday) ‘a humorous reference to the risky practice of running in the path of the bulls in the streets of Pamplona ［...］ as part of the celebrations in honour of San Fermin’ ([Lorenzo 1996](sources.bib?label=Lorenzo+1996#cldf:lorenzo1996a):250–52, quoted in [Mott 2015](sources.bib?label=Mott+2015#cldf:mott2015a):181). The suffix is also used in nonce formations in advertising, e.g. _cinking_ (_cinco_ ‘five’) ‘a five-year warranty provided by Hyundai cars’, _Aurging_ (_Aurgi_, a car repair company): here, the intended reading probably tries to emphasize the (presumably) good service of the company, _sonrising_ (_sonrisa_ ‘smile’) ‘to enjoy something’ (from a travel agency advertisement), _sofing_ (_sofá_ ‘sofa’) ‘to rest and do nothing’ (from a furniture store advertisement), _disfruting_ (_disfrutar_ ‘enjoy’): brand name of a financial services company, _edredoning_ (_edredón_ ‘duvet’) ‘to hide underneath a duvet to have sex avoiding being recorded by cameras’, _duerming_ (from an irregular form of the verb _dormir_ ‘to sleep’): brand name of a hotel chain, _viding_ (_vida_ ‘life’): a brand name for a real estate company, _vueling_ (_volar_ ‘fly’, alternate stem _vuel-_): brand name of a Spanish airline ([García Velasco 2020](sources.bib?label=Garc%C3%ADa+Velasco+2020#cldf:velasco2020a):126–127).	\N	25	74	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
116	{}	174	Spanish affixes in Tagalog	Information and examples are mainly from [Baklanova and Bellamy ](sources.bib?label=Baklanova+and+Bellamy+#cldf:baklanova2023a)([2023](sources.bib?label=2023#cldf:baklanova2023a)), with additions from [Baklanova ](sources.bib?label=Baklanova+#cldf:baklanova2016a)([2016](sources.bib?label=2016#cldf:baklanova2016a); [2017](sources.bib?label=2017#cldf:baklanova2017a)), and [Wolff ](sources.bib?label=Wolff+#cldf:wolff2001a)([2001](sources.bib?label=2001#cldf:wolff2001a)). Examples are spelled in accordance with the phonetic transcription in [Baklanova and Bellamy ](sources.bib?label=Baklanova+and+Bellamy+#cldf:baklanova2023a)([2023](sources.bib?label=2023#cldf:baklanova2023a)). Tagalog has borrowed multiple affixes from Spanish, some of which have overlapping functions. Vowel alternations in many of these specify the gender of the referent, with -_o_ for masculine gender and -_a_ for feminine. Native Tagalog affixes, on the other hand, do not usually mark gender. [Baklanova ](sources.bib?label=Baklanova+#cldf:baklanova2017a)([2017](sources.bib?label=2017#cldf:baklanova2017a)) therefore claims that Tagalog has developed ‘marginal gender’ as a result of borrowing these affixes from Spanish.\n\n\n2 adjectivizing suffixes. They appear to form both adjectives and nouns ([Baklanova 2017](sources.bib?label=Baklanova+2017#cldf:baklanova2017a):342, [Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):333).\n\n- -_ado/a_, ‘adjectivizer/nominalizer’, e.g. _palinghado_ (_paling_ ‘awry, to veer, slew’) ‘crooked, twisted; low in quality; contradiction, confusion’. [Baklanova ](sources.bib?label=Baklanova+#cldf:baklanova2017a)([2017](sources.bib?label=2017#cldf:baklanova2017a):342) characterizes this form as an ‘agentive suffix’.\n- -_ete_, ‘adjectivizer/nominalizer’, only one pair of hybrid formations appears to be currently in use: _kaliwéte_ (_kaliwáʔ_ ‘left’) ‘left-handed; leftist’; _kananéte_ (_kánan_ ‘right (side)’) ‘right-handed’, formed by analogy from a non-native, non-Spanish stem, _kanan_ ‘right (side)’, which is originally from Malay.\n\n\n\n1 nominalizer suffix\n\n- -_o/a_, ‘noun from adjective’, e.g. _lasenggo/a_ (_lasing_ ‘drunk’) ‘drunkard, m/f’ ([Baklanova 2016](sources.bib?label=Baklanova+2016#cldf:baklanova2016a):30). This is the only example of a hybrid formation that was found in the consulted literature.\n\n\n\n2 agentive nominalization suffixes\n\n- -_ero/a_, ‘agent of a verb, occupation, or a person with a certain characteristic’, e.g. _ansikutero_ (_ansikót_ ‘loitering, truancy’) ‘loiterer, truant’ ([Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):339), _babaero_ (_babae_ ‘woman’) ‘philanderer’ ([Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):339), _bangkéro_ (_bangkáʔ_ ‘boat’) ‘boatman’ ([Wolff 2001](sources.bib?label=Wolff+2001#cldf:wolff2001a):241), _bungangéro/a_ (_bunganga_ ‘gullet of animals/fish; mouth’) ‘chatterbox, m/f’ ([Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):339), _kaing(in)éro_ (_kaingín_ ‘burning off in field for cultivation; cleared land in a forest’) ‘one who clears land for farming’ ([Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):339), _kaskaséro/a_ (_kaskás_ ‘sudden effort; spurt; rush’) ‘speed maniac, m/f ‘ ([Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):339), _sipéro_ (_sipáʔ_ ‘kick with the boot; game with rattan ball’) ‘sipa player’ ([Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):318). _baságuléro_ (_baságúlo_ ‘altercation; scuffle’) ‘squabbler’ ([Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):318), _daldalero/a_ (_daldál_ ‘gossiping; jabber; talkative’) ‘gabbler; gossiper; chatterbox, m/f’ ([Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):340), _hambugéro_ (_hambóg_ ‘boastful, arrogant’) ‘boaster, braggart’ ([Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):340), _Katipunéro/a_ (_Katipunán_ ‘a revolutionary society’) ‘Katipunan revolutionary’ ([Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):340). There are also some hybrid formations with non-native, non-Spanish stems: _balitero_ (_balítaʔ_ ‘news’ ［originally from Malay］) ‘reporter’ ([Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):339), _butangéro_ (_butang_ ‘act of beating or hitting a person mercilessly (like a thug)’ ［originally from Cebuano］) ‘goon’ ([Wolff 2001](sources.bib?label=Wolff+2001#cldf:wolff2001a):241).\n- -_ista_, ‘person with a certain propensity/trait, generally having more neutral connotations than -_ero/a_’ ([Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):321, 327), e.g. _wangwangísta_ (_wangwáng_ ‘1. completely exposed; 2. special car signal to give a priority pass’) ‘one who uses special car signal to demonstrate authority’ ([Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):324). The affix is also used to form nouns denoting a follower of a tendency/movement/party’, e.g. _balagtasísta_ ‘follower of poet Balagtas’ ([Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):323), and in hybrid formations with a non-native, non-Spanish stem, e.g. _aghamísta_ (Tagalog _aghám_ ‘science’ &lt; Sanskrit _āgama_ ‘religion; sacred science’) ‘scientist’ ([Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):323). It is also used to form nouns denoting a person of a certain profession and relational adjectives corresponding to professional nouns, but no hybrid examples are found in the literature.\n\n\n\n2 diminutive suffixes\n\n- -_ito_/_a_, ‘diminutive noun’, e.g. _dalagíta_ (_dalága_ ‘young unmarried lady’) ‘preadolescent girl’ ([Wolff 2001](sources.bib?label=Wolff+2001#cldf:wolff2001a):241, [Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):330), _bagito_ (_bago_ ‘new’) ‘amateur (adj.), newbie/inexperienced person (n.)’ (https://en.wiktionary.org/wiki/Category:Tagalog_terms_by_suffix ［accessed: 02.04.2024］), _baklita/o_ (_bakláʔ_ ‘homosexual person’) ‘gay, lesbian, sissy’ ([Baklanova 2016](sources.bib?label=Baklanova+2016#cldf:baklanova2016a):30).\n- -_ilyo_/_a_, ‘diminutive noun’, e.g. _binatílyo_ (_binátaʔ_ ‘bachelor, young teenage boy’) ‘young preadolescent boy’ ([Wolff 2001](sources.bib?label=Wolff+2001#cldf:wolff2001a):241, [Baklanova and Bellamy 2023](sources.bib?label=Baklanova+and+Bellamy+2023#cldf:baklanova2023a):330).\n\n\n\n1 adjectivizer prefix\n\n- _de_-, ‘adjective or gerund associated with a certain noun or verb’, e.g. _desakbát_ (_sakbát_ ‘sling, put over a shoulder’) ‘slinging over a shoulder’, _dekahoy_ (_kahoy_ ‘wood’) ‘wooden’, _depadyák_ (_padyák_ ‘to stamp on, trample’) ‘stamping, trampling’ (e.g. _machina depadyák_ ‘sewing machine with a pedal’, example provided by M. Futagami), _desusì_ (_susì_ ‘key’ ［originally from Hokkien］) ‘with lock, something opened with a key’ (e.g. _desusing kahon_ ‘a box with lock’), _desalamín_ (_salamín_ ‘glass, mirror, spectacles, crystal’ ［originally from Malay］) ‘wearing spectacles’ ([Rachkov 2012](sources.bib?label=Rachkov+2012#cldf:rachkov2012a):363, [Baklanova 2017](sources.bib?label=Baklanova+2017#cldf:baklanova2017a):343).	\N	177	25	Papunesia	\N	\N	8	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
117	{}	175	Middle Low German affixes in Danish	This entry deals only with the Middle Low German influence on Danish. Information and examples are mainly from Den Danske Ordbog ([Sørensen and Sørensen 2024](sources.bib?label=S%C3%B8rensen+and+S%C3%B8rensen+2024#cldf:s2024c)) and Wiktionary. Collectively, these affixes are ubiquitous and fulfill a broad range of functions, modifying native and non-native stems to derive adjectives, nouns, and verbs, although they differ in how productive they are in the modern language. Middle Low German has contributed a similar set of affixes to Norwegian ([Skancke 2001](sources.bib?label=Skancke+2001#cldf:skancke2001a):54) and Swedish ([Peters 1983](sources.bib?label=Peters+1983#cldf:peters1983a):115), although like for Danish, there is a lack of information on hybrid formations in the literature.\n\n\n5 nominalizer suffixes\n\n- -_else_, ‘abstract noun formed from a verb or adjective’, e.g. _påmindelse_ (_påminde_ ‘admonish, remind’) ‘reminder, admonition, warning’, _betændelse_ (_betænde_ ‘to inflame’) ‘inflammation’, _størrelse_ (_stor_ ‘large, great’) ‘size, dimensions, volume’, _ragelse_ (_rage_ ‘to scrape’) ‘rubbish’ (https://en.wiktionary.org/wiki/Category:Danish_terms_suffixed_with_-else ［accessed: 02.04.2024］).\n- -_eri,_ ‘abstract or location noun formed from a verb’, e.g. _bryggeri_ (_brygge_ ‘to brew’) ‘brewery’, _luskeri_ (_luske_ ‘to sneak’) ‘sneaky business’. Another example here is a noun derived from a noun: _tyveri_ (_tyv_ ‘thief’) ‘theft’, (Wiktionary: https://nl.wiktionary.org/wiki/Categorie:Achtervoegsel_-eri_in_het_Deens ［accessed: 02.04.2024］, Den Danske Ordbog: https://ordnet.dk/ddo/ordbog?entry_id=51001302&amp;query=-eri ［accessed: 03.07.2025］).\n- -_hed_, ‘abstract noun formed from an adjective’, e.g. _bleghed_ (_bleg_ ‘pale’) ‘paleness’, _nøjsomhed_ (_nøjsom_ ‘frugal’) ‘frugality’, _synlighed_ (_synlig_ ‘visible’) ‘visibility’, _vanskelighed_ (_vanskelig_ ‘difficult’) ‘difficulty’ (https://en.wiktionary.org/wiki/Category:Danish_terms_suffixed_with_-hed ［accessed: 02.04.2024］).\n- -_inde_, ‘feminine noun formed from another noun’, e.g. _elskerinde_ (_elsker_ ‘lover’) ‘mistress’, _mandinde_ (_mand_ ‘man’) ‘woman’ (obsolete), _veninde_ (_ven_ ‘friend’) ‘female friend’ (https://en.wiktionary.org/wiki/Category:Danish_terms_suffixed_with_-inde ［accessed: 02.04.2024］).\n- -_tøj_, ‘noun formed from an associated noun or from a verb indicating an action facilitated by the noun’, e.g. _hovedtøj_ (_hoved_ ‘head’) ‘headwear’, _køretøj_ (_køre_ ‘to drive’) ‘vehicle’, _lukketøj_ (_lukke_ ‘to close, lock’) ‘device with which to close or lock something’, _troldtøj_ (_trold_ ‘troll’) ‘mythical beings such as trolls and elves’ (https://ordnet.dk/ddo/ordbog?query=-t%C3%B8j ［accessed: 03.07.2025］).\n\n\n\n3 adjectivizing suffixes\n\n- -_bar_, ‘adjective indicating possibility formed from a verb’, e.g. _drikbar_ (_drikke_ ‘to drink’) ‘potable, drinkable’, _flytbar_ (_flytte_ ‘to move, remove’) ‘movable’, _salgbar_ (_salge_ ‘to sell’) ‘marketable, sellable’ (https://ordnet.dk/ddo/ordbog?query=-bar ［accessed: 03.07.2025］).\n- -_ig_, ‘adjective formed from a noun’, it displaced the native Old Danish -_ugh_ but is no longer productive, e.g. _mandig_ (_mand_ ‘man’) ‘manly, masculine’, _yndig_ (_ynde_ ‘grace’) ‘lovely, charming, beautiful in a graceful way (often with connotations of femininity)’, _lydig_ (_lyde_ ‘(dated) to obey’) ‘obedient’, _tålmodig_ (_tålmod_ ‘patience’) ‘patient’ (https://ordnet.dk/ddo/ordbog?query=-ig ［accessed: 03.07.2025］).\n- -_agtig_, ‘adjective formed from a noun’, e.g. _barnagtig_ (_barn_ ‘child’) ‘childish’, _trælagtig_ (_træl_ ‘slave’) ‘slave-like’, _grinagtig_ (_grin_ ‘laugh’) ‘ridiculous’. This form is functionally a lexically conditioned allomorph of -_ig_, but it is listed separately because of the distinct affix form (Den Danske Ordbog: https://ordnet.dk/ddo/ordbog?query=-agtig ［accessed: 03.07.2025］, Wiktionary: https://en.wiktionary.org/wiki/Category:Danish_terms_suffixed_with_-agtig ［accessed: 02.04.2024］).\n\n\n\n2 prefixes for adjectival and nominal modification\n\n- _old_-, ‘adjective/adjectival noun formed from another adjective or noun indicating antiquity’, e.g. _olddansk_ (_dansk_ ‘Danish’) ‘Old Danish’, _oldengelsk_ (_engelsk_ ‘English’) ‘Old English’, _oldgræsk_ (_græsk_ ‘Greek’) ‘Ancient Greek’, _oldtid_ (_tid_ ‘time’) ‘antiquity, ancient times’ (https://en.wiktionary.org/wiki/Category:Danish_terms_prefixed_with_old- ［accessed: 02.04.2024］).\n- _ur_-, ‘noun formed from another noun, indicating antiquity, or adjective/ adjectival noun formed from another adjective, with intensified meaning’, e.g. _urbeboer_ (_beboer_ ‘inhabitant’) ‘earliest inhabitant(s) of a locality’, _urgammel_ (_gammel_ ‘old’) ‘very old`’ (https://ordnet.dk/ddo/ordbog?query=ur- ［accessed: 03.07.2025］). This prefix may be from German, not Low German.\n\n\n\n1 verbalizer/adjectivizer prefix\n\n- _be_-, ‘adjective or verb with a complex set of meanings and functions’. This borrowed prefix often occurs with various native suffixes, such as -_et_ and -_e_, e.g. _behjertet_ (_hjerte_ ‘heart’) ‘brave’, _belortet_ (_lort_ ‘shit, crap’) ‘covered in faeces, shit, goddamned’, _berolige_ (_rolig_ ‘calm’) ‘to calm, soothe’, _besejre_ (_sejre_ ‘to triumph, be victorious’) ‘to conquer, defeat’, _bevidne_ (_vidne_ ‘witness’) ‘to testify’ (https://en.wiktionary.org/wiki/Category:Danish_terms_prefixed_with_be-, https://en.wiktionary.org/wiki/be-#Danish ［both accessed: 02.04.2024］).\n\n\n\n1 verbalizer prefix\n\n- _for_-, ‘verb, often with a causative or change-of-state meaning, formed from another verb or an adjective’, e.g. _forelske_ (_elske_ ‘love’) ‘to fall in love’, _forstørre_ (_stor_ ‘big’) ‘to enlarge’, _forsvare_ (_svare_ ‘to answer, reply, respond’) ‘to defend’, _forvente_ (_vente_ ‘to wait’) ‘to expect’ (https://ordnet.dk/ddo/ordbog?select=for-,2&amp;query=for- ［accessed: 03.07.2025］).	\N	178	150	Eurasia	\N	\N	12	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
118	{}	176	Coos affixes in Alsea	[Mithun ](sources.bib?label=Mithun+#cldf:mithun2000a)([2000](sources.bib?label=2000#cldf:mithun2000a)) argues that the ergative case marker _q_- was borrowed from the Coosan languages bu Alsea, from where ist was subsequently also borrowed in Siuslaw. All three were small language families native to the Oregon coast that are now extinct. Mithun’s data comes almost entirely from work by [Frachtenberg ](sources.bib?label=Frachtenberg+#cldf:frachtenberg1913a)([1913](sources.bib?label=1913#cldf:frachtenberg1913a); [1914](sources.bib?label=1914#cldf:frachtenberg1914a); [1917](sources.bib?label=1917#cldf:frachtenberg1917a); [1918](sources.bib?label=1918#cldf:frachtenberg1918a); [1920](sources.bib?label=1920#cldf:frachtenberg1920a); [1922a](sources.bib?label=1922a#cldf:frachtenberg1922a); [1922b](sources.bib?label=1922b#cldf:frachtenberg1922b)) and [Jacobs ](sources.bib?label=Jacobs+#cldf:jacobs1939a)([1939](sources.bib?label=1939#cldf:jacobs1939a); [1940](sources.bib?label=1940#cldf:jacobs1940a)). Each of these language families started out marking ergative case in different ways, Coos with the prefix _q_-, Alsea with the prefix _x̣_-, and Siuslaw with ablaut. In Mithun’s analysis, Alsea subsequently borrowed the Coosan ergative prefix _q_-, which was reported to freely alternate with the native Alsean ergative prefix _x̣_- on native Alsean stems ([Frachtenberg 1918](sources.bib?label=Frachtenberg+1918#cldf:frachtenberg1918a):21). Siuslaw later borrowed the Coosan ergative prefix _q_- from Alsea, which in Siuslaw is only found on kinship nouns and first and second-person pronouns that may themselves be loanwords from Alsea. Non-borrowed nouns and pronouns are marked for ergative using the native ablaut strategy.\n\n\n1 case prefix\n\n- _q-_, ‘ergative marker’, hybrid formations are claimed by [Mithun ](sources.bib?label=Mithun+#cldf:mithun2000a)([2000](sources.bib?label=2000#cldf:mithun2000a)) to be present but no examples are provided. Examples of _q_- used in Alsea from [Frachtenberg ](sources.bib?label=Frachtenberg+#cldf:frachtenberg1918a)([1918](sources.bib?label=1918#cldf:frachtenberg1918a)) include _q-as_ ergative-article which alternates with _x̣-as_ ergative-article, and _qa-tas_ ergative-proximate, with the caveat that the roots cannot be conclusively shown to be native to Alsea ([Frachtenberg 1918](sources.bib?label=Frachtenberg+1918#cldf:frachtenberg1918a):62–65).	\N	180	179	North America	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
119	{}	177	English affixes in Mandarin	Information and examples for Taiwanese Mandarin are from [Tsai ](sources.bib?label=Tsai+#cldf:tsai2007a)([2007](sources.bib?label=2007#cldf:tsai2007a)) and those for Mainland Chinese Mandarin from [Yang and Ouyang ](sources.bib?label=Yang+and+Ouyang+#cldf:yang2013a)([2013](sources.bib?label=2013#cldf:yang2013a)). Drawing on social media data, both works show English -_ing_ to be used exclusively to express continuous aspect. No mention is made of -_ing_ being used to form gerunds or to convey other meanings that the suffix has in English.\n\n\n1 TAM suffix\n\n- -_ing_, ‘continuous aspect marker’, e.g. _kuángxiàoing_ (_kuángxiào_ ‘to laugh crazily’) ‘to be laughing crazily’, _huángkǒnging_ (_huángkǒng_ ‘to panic’) ‘to be panicking’ ([Tsai 2007](sources.bib?label=Tsai+2007#cldf:tsai2007a):31), _jiābāning_ (_jiābān_ ‘to work overtime’) ‘to be working overtime’, _yùmèning_ (_yùmèn_ ‘to feel down’) ‘to be feeling blue’ ([Yang and Ouyang 2013](sources.bib?label=Yang+and+Ouyang+2013#cldf:yang2013a):5).	\N	181	74	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
120	{}	178	English affixes in Tagalog	Information and examples are from [Goulet ](sources.bib?label=Goulet+#cldf:goulet1971a)([1971](sources.bib?label=1971#cldf:goulet1971a)) and from informal internet searches and subsequent elicitation with M. Futagami (personal communication with T. T. Chan, 2024). As of March 2024, the suffix seems to be reasonably productive, but has not given rise to many established formations.\n\n\n1 adjectivizing suffix\n\n- -_able_, ‘possibility marker’, noted by [Goulet ](sources.bib?label=Goulet+#cldf:goulet1971a)([1971](sources.bib?label=1971#cldf:goulet1971a):70–71) to be restricted to one jocular formation, _tanggálable_ (_tanggál_ ‘to remove’) ‘detachable’. Internet searches in 2024 provided the following examples: _balew(al)able_ (_balewaláʔ_ ‘never mind’) ‘ignorable’, _basagable_ (_basag_ ‘to break’) ‘breakable’, _palitable_ (_palit_ ‘change, substitute’) ‘exchangeable’, _tiklopable_ (_tiklop_ ‘to fold’) ‘foldable (for a chair)’.	\N	177	74	Papunesia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
121	{}	179	French affixes in Turkish	Examples are from Wiktionary, with confirmation and translations provided by F. Halilov (personal communication with T. T. Chan, 2024). Scholarly work on Turkish morphology does not include these suffixes (e.g. [Demir et al. 2017](sources.bib?label=Demir+et+al.+2017#cldf:demir2017a)). Turkish has borrowed two suffixes from French that both generally attach to nominal stems but differ in how productive they are on native stems.\n\n\n2 nominal derivational suffixes\n\n- -_matik_ ‘instrument related to the modified noun’, e.g. _dilekçematik_ (_dilekçe_ ‘application, petition’) ‘government services portal’, _sağlıkmatik_ (_sağlık_ ‘health’) ‘health/fitness app’, _sayımatik_ (_sayı_ ‘number’) ‘clicker counter’. Examples provided by F. Halilov. This suffix is attested in many hybrid formations.\n- -_syon_ ‘abstract noun from verb or gerund’, e.g. _uydurma-syon_ (_uydurma_ ‘making up a story’) ‘fictions, making things up’, _atma-syon_ (_atmak_ ‘to throw, to make up’) ‘bragging’ (https://en.wiktionary.org/wiki/Category:Turkish_terms_suffixed_with_-syon ［accessed: 02.04.2024］). This suffix is attested in only few hybrid formations.	\N	31	151	Eurasia	\N	\N	2	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
122	{}	180	Middle Chinese affixes in Vietnamese	Information on affixes and word etymologies is mostly derived from Wiktionary, supplemented by examples gathered informally via internet searches and verified via personal communications between T. Lê Thị, B. H. Nguyễn, V. A. Nguyễn and T. T. Chan in 2024. Being an isolating language, it is unclear what an affix is in Vietnamese. In the current entry, affixes are understood to be morphemes that either cannot be used on their own (i.e. bound morphemes) or if they can be, their meaning changes when used on their own. A secondary consideration is that prefixes with a predicative meaning (e.g. _cựu_ ‘former, old’, _cùng/đồng_ ‘co-, same’) are not seen as adjectives since they precede the noun they modify. This is unlike regular adjectives in Vietnamese, which follow their head noun. Finally, many of the forms discussed here are recognized as affixes in modern Chinese ([Arcodia 2012](sources.bib?label=Arcodia+2012#cldf:arcodia2012a):97–98).\n\nThe forms covered in the current entry were most probably borrowed when Vietnamese was undergoing intensive contact with ‘Annamese Middle Chinese’, a regional variety of Middle Chinese hypothesized by [Phan ](sources.bib?label=Phan+#cldf:phan2013a)([2013](sources.bib?label=2013#cldf:phan2013a):296–302) to have existed in northern Vietnam under the Tang dynasty prior to the 10th century CE. We therefore consider this the primary borrowing event. The morphemes most likely only came to be used as affixes much later, in the 19th and 20th centuries, under the influence of Chinese character-based compounds. These were first coined in Japanese and then borrowed into Vietnamese and other East Asian languages, including Sinitic languages in a process called ‘Sinographic borrowings’ ([Lê 2002](sources.bib?label=L%C3%AA+2002#cldf:l2002a):30, cited in [Phan 2013](sources.bib?label=Phan+2013#cldf:phan2013a):343–352).\n\n\n1 ordinal numeral (dates of month) prefix\n\n- _mồng_, ‘forms dates from the ten native cardinal numerals (_một, hai, ba, bốn, năm, sáu, bảy, tám, chín, mười_) in Northern Vietnamese, referring to the first ten days of a month’, e.g. _mồng một_ ‘the first day of the month’, _mồng hai_ ‘the second day of the month’ (https://en.wiktionary.org/wiki/m%E1%BB%93ng#Vietnamese ［accessed: 18.06.2024］).\n\n\n\n6 adjectivizing prefixes for nominal modification\n\n- _hậu_, ‘post-’, e.g. _hậu đổi mới_ (_Đổi Mới_ ‘period of market reforms in Vietnam, 1975–1985’) ‘post-Doi Moi’, _hậu nhà Nguyễn_ (_nhà Nguyễn_ ‘the Nguyen dynasty’) ‘post-Nguyen dynasty’ (https://en.wiktionary.org/wiki/h%E1%BA%ADu ［accessed: 18.06.2024］).\n- _kháng_, ‘anti-’, e.g. _kháng nghiện_ (_nghiện_ ‘addiction’) ‘addiction relief (medication), lit. anti-addiction’, _kháng rượu_ (_rượu_ ‘alcohol’) ‘(medication) providing relief from an alcohol addiction, lit. anti-alcohol’, _(năng lực) kháng buồn nôn_ (_buồn nôn_ ‘nauseous’) ‘anti-nausea (i.e. has the effect of combatting nausea)’. This morpheme behaves like a derivational prefix but can be used as a verb in very similar constructions, e.g. _tôi kháng nghiện_ (‘I resist an addiction’) (https://en.wiktionary.org/wiki/kh%C3%A1ng#Vietnamese ［accessed: 18.06.2024］).\n- _ngoài_, ‘extra-’ adjective formed from noun with the meaning external to that noun, extra-’, e.g. _ngoài trái đất_ (_trái đất_ ‘planet Earth’) ‘extraterrestrial’, _ngoài nước_ (_nước_ ‘water, country’) ‘overseas’, _ngoài hệ mặt trời_ (_hệ mặt trời_ ‘solar system’, _hệ_ ‘system’ is a Chinese borrowing, while _mặt trời_ ‘solar’ is native) ‘external to the solar system’ (https://en.wiktionary.org/wiki/ngo%C3%A0i ［accessed: 18.06.2024］).\n- _phản_, ‘anti-’, e.g. _phản xét lại_ (_xét lại_ ‘to review, reconsider’) ‘anti-revisionist’, _phản bóng đá_ (_bóng đá_ ‘football’) ‘anti-football’, _phản máy móc_ (_máy móc_ ‘machinery’) ‘anti-mechanical’ (https://en.wiktionary.org/wiki/ph%E1%BA%A3n ［accessed: 18.06.2024］).\n- _phòng,_ ‘anti-, protecting against, forms adjectives from nouns’, e.g. _phòng trộm_ (_trộm_ ‘theft’) ‘anti-theft’, _phòng thuốc trừ sâu_ (_thuốc trừ sâu_ ‘pesticide’) ‘protecting against pesticides’. This morpheme could potentially also be used as a free-standing verb (https://en.wiktionary.org/wiki/ph%C3%B2ng ［accessed: 18.06.2024］).\n- _tiền_, ‘pre-’, e.g. _tiền đổi mới_ (_Đổi Mới_ ‘period of market reforms in Vietnam, 1975–1985’) ‘pre-Doi Moi’, _tiền nhà Nguyễn_ (_nhà Nguyễn_ ‘the Nguyen dynasty’) ‘pre-Nguyen dynasty’ (https://en.wiktionary.org/wiki/ti%E1%BB%81n ［accessed: 18.06.2024］).\n\n\n\n6 nominal derivation prefixes\n\n- _chủ nghĩa_, ‘-ism, forms abstract nouns referring to an ideology from verbs or nouns’, e.g. _chủ nghĩa xét lại_ (_xét lại_ ‘to review, reconsider’, where _xét_ is derived from Chinese but _lại_ is native) ‘revisionism’, _chủ nghĩa yêu nước_ (_yêu nước_ ‘patriot, patriotic, patriotism’) ‘patriotism’ (https://en.wiktionary.org/wiki/ch%E1%BB%A7_ngh%C4%A9a ［accessed: 18.06.2024］).\n- _cùng_, ‘metonymic noun from noun, denoting referent sharing the noun, co-’, e.g. _(bạn) cùng lớp_ (_lớp_ ‘school year’) ‘classmate, lit. friend from the same class’, _cùng căn hộ_ (_căn hộ_ ‘flat’) ‘flatmate, lit. co-flat’ (https://en.wiktionary.org/wiki/c%C3%B9ng ［accessed: 18.06.2024］).\n- _cựu_, ‘former, forms modified nouns from nouns’, e.g. _cựu nhà báo_ (_nhà báo_ ‘journalist’, _báo_ is a loan from Chinese but _nhà_ is native) ‘former journalist’, _cựu nhà ngoại giao_ (_nhà ngoại giao_ ‘diplomat’, _ngoại giao_ is a Chinese loan) ‘former diplomat’, _cựu nhà tù_ (_nhà tù_ ‘jail’, _tù_ is a Chinese loan) ‘former prison’, _cựu người yêu_ (_người yêu_ ‘romantic partner’) ‘former romantic partner’, _cựu chồng_ (_chồng_ ‘husband’) ‘ex-husband’, _cựu sân bay_ (_sân bay_ ‘airport’) ‘former airport’ (https://en.wiktionary.org/wiki/c%E1%BB%B1u#Vietnamese ［accessed: 18.06.2024］).\n- _đồng_, ‘metonymic noun from noun, denoting referent sharing the noun, co-’, e.g. _đồng lòng_ (_lòng_ ‘heart’) ‘unanimous, lit. of the same heart’, _đồng bọn_ (_bọn_ ‘gang’) ‘accomplice, teammate, lit. co-gang’ (https://en.wiktionary.org/wiki/%C4%91%E1%BB%93ng#Vietnamese ［accessed: 18.06.2024］).\n- _siêu_, ‘super-, forms modified nouns from nouns’, e.g. _siêu sao_ (_sao_ ‘star’) ‘superstar’, _siêu máy tính_ (_máy tính_ ‘computer’) ‘supercomputer’ (https://en.wiktionary.org/wiki/si%C3%AAu#Vietnamese ［accessed: 18.06.2024］).\n- _trường_ ‘field or range’, e.g. _trường bắn_ (_bắn_ ‘to shoot’) ‘shooting range’, _trường lái_ (_lái_ ‘to drive’) ‘a range for motorcycle-riding or driving practice’, _trường nhìn_ (_nhìn_ ‘to look at’) ‘a field of view’ (https://en.wiktionary.org/wiki/tr%C6%B0%E1%BB%9Dng ［accessed: 18.06.2024］).\n\n\n\n1 agent nominalizer prefix/suffix\n\n- _trưởng_, ‘prefix or suffix indicating a leader, elder of the modified noun’, e.g. _lớp trưởng_ (_lớp_ ‘school year’) ‘chief student supervisor of the class’, _trưởng nhóm_ (_nhóm_ ‘group’) ‘a band leader, a frontman’ (https://en.wiktionary.org/wiki/tr%C6%B0%E1%BB%9Fng#Vietnamese ［accessed: 18.06.2024］).\n\n\n\n1 verbalizing suffix\n\n- _hoá_, ‘-ize, -ization’ derives verb or verbs that can also be used as nouns from noun indicating transition to a state defined by the modified noun’, e.g. _máy tính hoá_ (_máy tính_ ‘computer’) ‘computerization’, _máy móc hoá_ (_máy móc_ ‘machinery’) ‘mechanization, motorization’, _mũi hoá_ (_mũi_ ‘nose’) ‘to nasalize’ (https://en.wiktionary.org/wiki/ho%C3%A1 ［accessed: 18.06.2024］).	\N	183	182	Eurasia	\N	\N	15	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
123	{}	181	Middle Chinese affixes in Japanese	Information on affixes and word etymologies is mostly derived from Wiktionary (https://en.wiktionary.org/wiki/Category:Japanese_affixes ［accessed: 18.06.2024］), with confirmation and additional information from personal communication between T. Nakai and T. T. Chan in 2024. The suffixes cited below productively form hybrid formations with stems likewise borrowed, as well as complex loanwords with non-Chinese stems. Many hybrid formations involve stems that are borrowed from other languages, there are only a few hybrid formations attested with native Japanese stems. Most stems in the examples below are derived from English.\n\n\n1 negation prefix\n\n- _hi_- ‘negation’, _hi-randamu_ (_randamu_ ‘random’) ‘non-random’.\n\n\n\n1 verbal modification prefix\n\n- _sai-_ ‘re-, indicates an action carried out again’, _sai-randamuka_ (_randamuka_ ‘to randomize’) ‘to re-randomize’.\n\n\n\n1 nominalizing suffix\n\n- -_ka_, ‘-ization’, the only example found containing a native Japanese stem is _kaeru-ka_ (_kaeru_ ‘frog’) ‘dislike for a person one had feelings for, once those feelings start being reciprocated’ (example provided by T. Nakai, personal communication 2023); hybrid formations with English stems include _dejitaru-ka_ (_dejitaru_ ‘digital’) ‘digitization’, _gurōbaru_-_ka_ (_gurōbaru_ ‘global’) ‘globalization’, _konpyūta_-_ka_ (_konpyūta_ ‘computer’) ‘computerization’, _randamu_-_ka_ (_randamu_ ‘random’) ‘randomization’.	\N	184	182	Eurasia	\N	\N	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
124	{}	182	English affixes in Japanese	Information and examples are from [Nagano and Shimada ](sources.bib?label=Nagano+and+Shimada+#cldf:nagano2018a)([2018](sources.bib?label=2018#cldf:nagano2018a)). The affixes derived from English in this entry are colloquially used instead of native Japanese affixes. The English source forms for _mia_- (_my_) and -_in_ (_in_) are not affixes, but the one for -_chikku_ (-_tic_ ‘-like’) is.\n\n\n1 possessive noun formation prefix\n\n- _mai_- ‘privately owned, relating to oneself, noun modifier’, e.g. _mai-hashi_ (_hashi_ ‘chopsticks’) ‘personal pair of chopsticks’, _mai-kasa_ (_kasa_ ‘umbrella’) ‘personal umbrella’, _mai-kaya_ (_kaya_ ‘mosquito net’) ‘personal mosquito net’, _mai-nabe_ (_nabe_ ‘firepot meal, usually had as a group’) ‘firepot meal for one’, _mai-osechi_ (_osechi_ ‘traditional Japanese dish for the New Year’) ‘self-made osechi’, _mai-uchiage_ (_uchiage_ ‘celebration after a performance’) ‘one’s own party’ ([Nagano and Shimada 2018](sources.bib?label=Nagano+and+Shimada+2018#cldf:nagano2018a):76).\n\n\n\n2 adjectivizing suffixes\n\n- -_chikku_ ‘-like, adjective from noun’, derived from English -_tic_, e.g. _muneo-chikku_ (_Muneo_ first name of a famous Japanese politician) ‘reminding one of Muneo Suzuki’, _otome-chikku_ (_otome_ ‘a young girl, maiden’) ‘girlish’, _yarase-chikku_ (_yarase_ ‘staging’) ‘giving the impression of having been staged’. Native equivalents include -_kusai_, -_ppoi_, -_rashii_ and -_shii_ ([Nagano and Shimada 2018](sources.bib?label=Nagano+and+Shimada+2018#cldf:nagano2018a):66).\n- -_in_ ‘contained inside’, e.g. _takoyaki-in gyōza_ ‘takoyaki octopus stuffed gyoza dumpling’, with -_in_ substituting the native suffix -_iri_ when the latter immediately precedes the genitive marker _no_ ([Nagano and Shimada 2018](sources.bib?label=Nagano+and+Shimada+2018#cldf:nagano2018a):69–70). This form is also attested as a prefix with English stems, involving the containing and contained objects appearing in the reverse order ([Nagano and Shimada 2018](sources.bib?label=Nagano+and+Shimada+2018#cldf:nagano2018a):71).	\N	184	74	Eurasia	\N	\N	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
125	{}	183	Ancient Greek affixes in Latin	Information from [Magni ](sources.bib?label=Magni+#cldf:magni2017a)([2017](sources.bib?label=2017#cldf:magni2017a)), who provides detailed argumentation for the borrowing process of this affix, and cites the examples given here from [Adams ](sources.bib?label=Adams+#cldf:adams2013a)([2013](sources.bib?label=2013#cldf:adams2013a):564–565). There may be other affixes borrowed from Ancient Greek into Latin, but [Magni ](sources.bib?label=Magni+#cldf:magni2017a)([2017](sources.bib?label=2017#cldf:magni2017a)) focuses on this one only.\n\n\n1 adjectivizer\n\n- _-ĭnus_ _‘adjectivizer’, e.g._ _mĕl-ĭnus_ ‘made of honey’_,_ _cupressĭnus_ ‘made of cypress’, _fungĭnus_ ‘made of mushroom’, _laurĭnus_ ‘made of laurel’, _nucĭnus_ ‘made of nut’, _triticĭnus_ ‘made of wheat’	\N	105	185	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
126	{}	184	Sahaptin affixes in Upper Chinook	Information and examples are from [Sapir ](sources.bib?label=Sapir+#cldf:sapir1907a)([1907](sources.bib?label=1907#cldf:sapir1907a):541–542). He characterizes these forms as “loosely tagged on postposi­tions, in some cases optionally prepositions”, but also calls them “suffixed or prefixed”. [Silverstein ](sources.bib?label=Silverstein+#cldf:silverstein1974a)([1974](sources.bib?label=1974#cldf:silverstein1974a):S98) calls these forms “enclitics on noun phrases for adverbial “case” relations” and notes that “from the Chinookan structural perspective, these are superfluous to the system, which incorporates dativoid relations into the verb prefix”. [Campbell ](sources.bib?label=Campbell+#cldf:campbell1997a)([1997](sources.bib?label=1997#cldf:campbell1997a)) calls these forms “case endings” and “derivational suffix”. See also [Kinkade et al. ](sources.bib?label=Kinkade+et+al.+#cldf:kinkade1998a)([1998](sources.bib?label=1998#cldf:kinkade1998a)).\n\n\n4 peripheral case suffixes\n\n- _-ba_ ‘in, at’, e.g. _wimałba_ ‘in the river’, _dáuyaba wílX_ ‘in this country’ (lit. this-in country’), _gatcig̣ ÉkElba_ ‘where he saw him’ (from _gatcig̣ ÉkEl_ ‘he saw him’)\n- _-iamt_ ‘towards, from’, e.g. _wima**ꞁ**iámt_ ‘to or from the river’, _imig̣áł naikáyamt_ ‘you are bigger than I’ (lit. your bigness ［is］ me-from, compared with me’); _átpXiamd agáłax_ ‘to where she goes out towards ［us］ (_atpX_ ‘she goes out towards’), the sun’, i.e. ‘east’\n- _-báma_ ‘for’, e.g. _cán bama_ ‘for whom?’, _Múlmul bama_ ‘from, belonging to Fort Simcoe’. This form can be suffixed or prefixed\n- _-ÉnEgi_ ‘with’, e.g. _aq!ē’wiqxi ngi_ with a knife’. This element is described as “post-or pre-position”.\n\n\n\n1 adjectivizers\n\n- _ámEni_ ‘made out of’, e.g. _igábEnac amEni_ ‘made out of young oak’. This element is described as “post-or pre-position”.\n\n\n\n1 verb subordination suffix\n\n- -_bÉt_, ‘when’, e.g. _gayúyabEt_ ‘when he went ‘; _nk!áckacbEt_ ‘when I was a child.’ In lengthened form, _bä’t_ means ‘as soon as’, e.g. _gayuyabä’t_ ‘as soon as he went.’	\N	170	186	North America	\N	\N	6	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
127	{}	185	Nepali affixes in Baram	Information and examples are from [Dhakal ](sources.bib?label=Dhakal+#cldf:dhakal2014a)([2014](sources.bib?label=2014#cldf:dhakal2014a); [2017](sources.bib?label=2017#cldf:dhakal2017a)). [Dhakal ](sources.bib?label=Dhakal+#cldf:dhakal2017a)([2017](sources.bib?label=2017#cldf:dhakal2017a)) states that “Baram also make use of the object marker -_lai_ along with the native accusative marker -_gəi_”, but no examples of hybrid formations were found in the literature consulted.\n\n\n1 plural marker\n\n- -_həru_ ~ -_ru_ ‘plural’, e.g. _siŋ-həru_ (wood-plural) ‘firewoods’, _naŋ-ru_ (second_person-plural) ‘you (plural)’\n\n\n\n2 numeral classifier suffixes\n\n- _-ṭa_, e.g. _som-ṭa nam_ (three-classifier house ‘three houses’. Note that the same classifier is also borrowed from Nepali to Manange (see Nepali affixes in Manange). Both cases of affix borrowing are included here because Baram and Manange are only distantly related and the borrowing events are assumed to be independent.\n- _-dzəna_, e.g. _nis dzəәna_ (two/classifier) ‘two men!’\n\n\n\n1 case suffixes\n\n- -_ko_ ~ _-go_ ‘genitive’_,_ e.g. _ascãp-ko_ (chanp_tree-genitive) ‘of a chanp tree’, _us-ko_ (he-genitive) ‘his’, _ubaŋ-go_ (they-genitive) ‘their’.\n\n\n\n1 evidential suffix\n\n- -_chə_ ~_-cə_ ‘inferred evidence’, e.g. _bal-i dəәlin-həәru cun-o-chә_\n\n\n(man-ergative/purlin-plural/put-inferred_evidential-inferred_evidential) ‘The men fixed (lit. put) the purlin (unexpectedly)’. This form is used in addition to a native marker in the same word.	\N	188	187	Eurasia	\N	\N	5	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
128	{}	186	English affixes in German	Information and examples are from [Schlücker ](sources.bib?label=Schl%C3%BCcker+#cldf:schluecker2024a)([2024](sources.bib?label=2024#cldf:schluecker2024a)), who anaylzed thousands of tokens with _-like_ in the internet-based GermanWeb 2020/deTenTen20 corpus ([Jakubíček et al. 2013](sources.bib?label=Jakub%C3%AD%C4%8Dek+et+al.+2013#cldf:jakub2013a)) showing that 57.3% of the forms with _-like_ are hybrid formations and that -_like_ has become a producive word-formation pattern in German, at least in certain registers.\n\nadjectivizer\n\n-_like_, e.g. _kirchenlike_ ‘church-like’, _mensch_-_like_ ‘human-like’, _Zürich_-_like_, _eisenbahnlike_ ‘railway-like’.	\N	132	74	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
129	{}	187	Gurma affixes in Songhay Ciiné	Information and examples are from [Souag &amp; Eddyshaw ](sources.bib?label=Souag+%26+Eddyshaw+#cldf:souag2023a)([2023](sources.bib?label=2023#cldf:souag2023a)) who provide detailed argumentation for the complex borrowing process. They argue that the source language is from the Gurma subgroup of Oti-Volta, itself part of Central Gur (but not necessarily Gourmanchéma).\n\n\n1 nominalizer\n\n- _-mì ~ -mi ~ -mèy_ ‘action or result noun derivation’, e.g., _dey-mi_ (buy-nominalizer) ‘purchase’, _fàrí-mì_ (cultivate-nominalizer) ‘farming’, _fàrsí-mì_ (divide-nominalizer) ‘(a) share’, _sàrgà-mèy_ (offer-nominalizer) ‘offering’	\N	190	189	Africa	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
130	{}	188	German affixes in English	Information and examples are from [Majtényi ](sources.bib?label=Majt%C3%A9nyi+#cldf:majt2012a)([2012](sources.bib?label=2012#cldf:majt2012a)) who conducted a corpus study demonstrating the productivity of this prefix with both nouns and adjectives. The same prefix has been borrowed into Hungarian. Both cases are included here since they appear to be independed borrowing events.\n\n\n1 derivational prefix\n\n- _uber_- ‘intensifier’, e.g. _uber-rich, uber-liberal, uber-editor, uber-regulator_	\N	74	132	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
131	{}	189	German affixes in Hungarian	Information and examples are from [Majtényi ](sources.bib?label=Majt%C3%A9nyi+#cldf:majt2012a)([2012](sources.bib?label=2012#cldf:majt2012a)) who conducted a corpus study demonstrating the productivity of this prefix with both nouns and adjectives. The same prefix has been borrowed into English. Both cases are included here since they appear to be independed borrowing events.\n\n\n1 derivational prefix\n\n- _über_- ‘intensifier’, e.g. _überdemokratikus_ (intensifier-democratic) ‘overly democratic’, _übermacsó_ (intensifier-macho) ‘overly macho, _übernegatív_ (intensifier-negative) ‘overly negative’	\N	139	132	Eurasia	\N	\N	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
132	{}	190	Spanish affixes in Caquinte	Information and examples are from [O’Hagan ](sources.bib?label=O%E2%80%99Hagan+#cldf:o2022a)([2022](sources.bib?label=2022#cldf:o2022a)). It is possible that these affixes entered the language via Quechua.\n\n\n2 nominalizers\n\n- -_mero_ ‘instrument nominalizer’, e.g. _pishi-mero-ntsi_ (sweep- nominalizer-alienable) ‘broom’, _tinka-mero-ntsi_ (paddle nominalizer-alienable) ‘churning paddle’\n- _-mento_ ‘abstract nominaliziation’, e.g. _shogirik-mento-ntsi_\n\n\n(crank-nominalizer-alienable) ‘crank’, this example is originally from Salazar [Torres et al. ](sources.bib?label=Torres+et+al.+#cldf:torres2019a)([2019](sources.bib?label=2019#cldf:torres2019a):76).	\N	191	25	South America	\N	\N	2	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
\.


--
-- Data for Name: pairsource; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pairsource (pk, jsondata, pair_pk, source_pk, created, updated, active) FROM stdin;
1	{}	1	19	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
2	{}	1	277	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
3	{}	1	278	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
4	{}	1	279	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
5	{}	2	197	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
6	{}	2	198	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
7	{}	2	199	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
8	{}	3	115	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
9	{}	3	281	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
10	{}	3	304	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
11	{}	4	157	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
12	{}	4	163	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
13	{}	4	230	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
14	{}	4	231	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
15	{}	5	40	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
16	{}	5	43	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
17	{}	6	229	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
18	{}	6	230	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
19	{}	6	231	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
20	{}	7	44	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
21	{}	7	82	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
22	{}	7	247	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
23	{}	8	156	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
24	{}	8	208	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
25	{}	8	297	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
26	{}	8	315	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
27	{}	9	189	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
28	{}	9	190	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
29	{}	9	214	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
30	{}	10	63	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
31	{}	10	68	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
32	{}	10	232	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
33	{}	11	280	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
34	{}	11	294	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
35	{}	11	293	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
36	{}	12	23	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
37	{}	12	131	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
38	{}	12	251	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
39	{}	13	44	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
40	{}	13	77	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
41	{}	13	228	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
42	{}	13	296	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
43	{}	13	325	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
44	{}	14	243	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
45	{}	14	244	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
46	{}	14	211	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
47	{}	15	132	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
48	{}	15	201	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
49	{}	15	210	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
50	{}	15	314	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
51	{}	16	38	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
52	{}	16	39	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
53	{}	16	66	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
54	{}	16	275	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
55	{}	17	156	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
56	{}	17	208	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
57	{}	17	297	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
58	{}	17	305	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
59	{}	17	315	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
60	{}	17	73	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
61	{}	18	69	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
62	{}	18	107	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
63	{}	18	153	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
64	{}	18	154	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
65	{}	19	46	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
66	{}	19	166	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
67	{}	19	167	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
68	{}	19	219	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
69	{}	19	257	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
70	{}	19	309	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
71	{}	20	289	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
72	{}	20	290	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
73	{}	20	291	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
74	{}	21	134	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
75	{}	21	136	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
76	{}	21	138	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
77	{}	22	41	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
78	{}	22	94	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
79	{}	22	107	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
80	{}	22	112	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
81	{}	22	128	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
82	{}	22	228	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
83	{}	22	325	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
84	{}	23	78	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
85	{}	23	91	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
86	{}	23	92	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
87	{}	23	119	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
88	{}	23	142	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
89	{}	23	235	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
90	{}	23	70	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
91	{}	23	71	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
92	{}	23	299	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
93	{}	23	300	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
94	{}	23	301	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
95	{}	23	302	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
96	{}	23	298	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
97	{}	24	29	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
98	{}	24	30	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
99	{}	24	31	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
100	{}	24	32	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
101	{}	24	54	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
102	{}	24	105	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
103	{}	24	158	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
104	{}	24	184	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
105	{}	24	249	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
106	{}	24	321	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
107	{}	25	222	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
108	{}	25	223	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
109	{}	25	221	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
110	{}	25	224	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
111	{}	26	134	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
112	{}	26	137	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
113	{}	28	35	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
114	{}	28	55	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
115	{}	28	56	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
116	{}	28	57	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
117	{}	28	58	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
118	{}	28	167	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
119	{}	29	134	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
120	{}	29	135	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
121	{}	30	44	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
122	{}	30	48	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
123	{}	30	49	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
124	{}	30	67	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
125	{}	30	107	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
126	{}	30	111	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
127	{}	30	109	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
128	{}	30	146	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
129	{}	30	169	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
130	{}	30	181	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
131	{}	30	182	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
132	{}	30	242	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
133	{}	30	260	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
134	{}	30	262	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
135	{}	31	246	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
136	{}	32	81	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
137	{}	32	155	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
138	{}	33	225	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
139	{}	33	285	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
140	{}	34	93	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
141	{}	34	259	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
142	{}	35	156	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
143	{}	35	297	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
144	{}	35	315	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
145	{}	36	47	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
146	{}	36	45	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
147	{}	36	53	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
148	{}	36	84	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
149	{}	36	107	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
150	{}	36	261	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
151	{}	37	1	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
152	{}	37	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
153	{}	37	4	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
154	{}	37	237	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
155	{}	38	254	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
156	{}	38	255	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
157	{}	39	8	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
158	{}	39	9	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
159	{}	39	10	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
160	{}	39	11	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
161	{}	40	7	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
162	{}	40	10	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
163	{}	40	11	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
164	{}	41	256	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
165	{}	42	233	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
166	{}	43	36	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
167	{}	43	184	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
168	{}	43	240	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
169	{}	43	252	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
170	{}	43	253	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
171	{}	44	129	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
172	{}	44	194	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
173	{}	45	139	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
174	{}	45	140	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
175	{}	46	250	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
176	{}	46	320	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
177	{}	47	60	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
178	{}	47	61	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
179	{}	47	102	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
180	{}	47	107	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
181	{}	47	111	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
182	{}	47	169	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
183	{}	47	241	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
184	{}	47	242	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
185	{}	47	265	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
186	{}	47	319	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
187	{}	48	20	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
188	{}	48	267	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
189	{}	48	268	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
190	{}	49	303	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
191	{}	50	122	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
192	{}	50	123	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
193	{}	51	22	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
194	{}	51	88	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
195	{}	51	90	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
196	{}	52	110	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
197	{}	52	172	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
198	{}	53	83	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
199	{}	54	133	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
200	{}	55	205	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
201	{}	55	72	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
202	{}	57	2	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
203	{}	57	3	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
204	{}	57	108	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
205	{}	57	203	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
206	{}	58	113	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
207	{}	58	164	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
208	{}	58	173	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
209	{}	58	200	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
210	{}	58	220	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
211	{}	58	316	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
212	{}	58	330	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
213	{}	59	74	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
214	{}	60	33	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
215	{}	60	168	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
216	{}	60	317	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
217	{}	61	184	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
218	{}	61	269	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
219	{}	61	270	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
220	{}	62	184	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
221	{}	63	202	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
222	{}	64	89	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
223	{}	64	127	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
224	{}	64	143	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
225	{}	64	144	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
226	{}	64	145	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
227	{}	64	209	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
228	{}	64	276	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
229	{}	64	306	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
230	{}	64	307	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
231	{}	65	329	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
232	{}	66	152	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
233	{}	66	177	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
234	{}	66	179	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
235	{}	66	284	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
236	{}	67	12	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
237	{}	67	13	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
238	{}	67	132	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
239	{}	68	87	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
240	{}	68	176	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
241	{}	68	179	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
242	{}	68	284	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
243	{}	69	312	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
244	{}	70	21	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
245	{}	70	174	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
246	{}	70	248	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
247	{}	71	16	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
248	{}	71	17	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
249	{}	71	18	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
250	{}	72	40	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
251	{}	72	43	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
252	{}	73	86	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
253	{}	73	162	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
254	{}	73	313	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
255	{}	74	191	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
256	{}	74	313	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
257	{}	74	328	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
258	{}	75	180	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
259	{}	76	117	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
260	{}	76	192	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
261	{}	76	195	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
262	{}	77	130	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
263	{}	78	62	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
264	{}	79	62	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
265	{}	80	62	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
266	{}	81	193	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
267	{}	81	220	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
268	{}	82	246	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
269	{}	83	237	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
270	{}	84	239	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
271	{}	85	14	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
272	{}	85	85	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
273	{}	86	318	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
274	{}	87	310	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
275	{}	88	103	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
276	{}	89	310	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
277	{}	90	160	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
278	{}	91	272	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
279	{}	92	234	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
280	{}	93	206	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
281	{}	94	120	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
282	{}	94	121	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
283	{}	95	116	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
284	{}	95	62	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
285	{}	95	110	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
286	{}	95	141	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
287	{}	95	124	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
288	{}	95	295	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
289	{}	96	104	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
290	{}	96	196	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
291	{}	97	104	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
292	{}	97	196	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
293	{}	97	327	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
294	{}	98	25	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
295	{}	98	75	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
296	{}	98	147	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
297	{}	98	170	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
298	{}	98	171	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
299	{}	98	218	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
300	{}	98	311	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
301	{}	98	322	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
302	{}	98	331	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
303	{}	99	128	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
304	{}	99	148	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
305	{}	99	196	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
306	{}	99	323	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
307	{}	100	5	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
308	{}	100	50	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
309	{}	100	51	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
310	{}	100	52	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
311	{}	101	15	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
312	{}	101	34	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
313	{}	102	20	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
314	{}	103	65	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
315	{}	103	264	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
316	{}	104	64	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
317	{}	104	65	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
318	{}	105	37	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
319	{}	106	125	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
320	{}	106	126	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
321	{}	106	159	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
322	{}	107	159	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
323	{}	108	184	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
324	{}	108	286	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
325	{}	108	287	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
326	{}	109	186	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
327	{}	109	187	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
328	{}	109	273	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
329	{}	109	274	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
330	{}	110	216	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
331	{}	110	217	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
332	{}	111	114	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
333	{}	111	319	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
334	{}	112	107	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
335	{}	112	319	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
336	{}	113	165	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
337	{}	115	178	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
338	{}	115	183	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
339	{}	115	207	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
340	{}	115	106	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
341	{}	116	27	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
342	{}	116	28	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
343	{}	116	26	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
344	{}	116	245	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
345	{}	116	324	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
346	{}	117	236	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
347	{}	117	288	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
348	{}	117	283	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
349	{}	118	95	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
350	{}	118	96	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
351	{}	118	97	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
352	{}	118	98	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
353	{}	118	99	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
354	{}	118	100	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
355	{}	118	101	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
356	{}	118	149	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
357	{}	118	150	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
358	{}	118	204	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
359	{}	119	308	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
360	{}	119	326	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
361	{}	120	118	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
362	{}	121	76	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
363	{}	122	24	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
364	{}	122	175	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
365	{}	122	238	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
366	{}	124	215	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
367	{}	125	6	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
368	{}	125	185	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
369	{}	126	59	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
370	{}	126	161	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
371	{}	126	266	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
372	{}	126	282	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
373	{}	127	79	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
374	{}	127	80	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
375	{}	128	151	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
376	{}	128	271	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
377	{}	129	292	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
378	{}	130	188	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
379	{}	131	188	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
380	{}	132	227	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
381	{}	132	263	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
\.


--
-- Data for Name: parameter; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.parameter (pk, jsondata, polymorphic_type, id, name, description, markup_description, created, updated, active) FROM stdin;
1	{}	custom	comparative	comparative	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
2	{}	custom	superlative	superlative	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
3	{}	custom	adjectivizermiscellaneous	adjectivizer: miscellaneous	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
4	{}	custom	adjectivizerprivative	adjectivizer: privative	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
5	{}	custom	adverbializer	adverbializer	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
6	{}	custom	clauseleveltam	clause-level TAM	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
7	{}	custom	clauselinking	clause linking	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
8	{}	custom	casedative	case: dative	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
9	{}	custom	caseergative	case: ergative	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
10	{}	custom	casenonlocativeperipheralcase	case: non-locative peripheral case	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
11	{}	custom	caselocative	case: locative	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
12	{}	custom	genderhuman	gender (human)	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
13	{}	custom	nounclassinanimate	noun class (inanimate)	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
14	{}	custom	diminutive	diminutive	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
15	{}	custom	augmentative	augmentative	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
16	{}	custom	definiteindefinite	definite/indefinite	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
17	{}	custom	topic	topic	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
18	{}	custom	focus	focus	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
19	{}	custom	nominalizermiscellaneous	nominalizer: miscellaneous	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
20	{}	custom	nominalizeragent	nominalizer: agent	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
21	{}	custom	nominalizerabstract	nominalizer: abstract	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
22	{}	custom	nominalizersocialgroup	nominalizer: social group	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
23	{}	custom	nominalizerplacename	nominalizer: place name	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
24	{}	custom	numberplural	number: plural	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
25	{}	custom	numberdual	number: dual	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
26	{}	custom	numbersingular	number: singular	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
27	{}	custom	nominalderivationmiscellaneous	nominal derivation (miscellaneous)	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
28	{}	custom	possessorindexing	possessor indexing	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
29	{}	custom	numeralclassifier	numeral classifier	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
30	{}	custom	numeralderivationordinals	numeral derivation: ordinals	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
31	{}	custom	numeralandquantifierderivation	numeral and quantifier derivation	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
32	{}	custom	valencypassive	valency: passive	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
33	{}	custom	valencycausative	valency: causative	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
34	{}	custom	valencyreflexive	valency: reflexive	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
35	{}	custom	valencyapplicative	valency: applicative	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
36	{}	custom	valencyreciprocal	valency: reciprocal	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
37	{}	custom	verbaltam	verbal TAM	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
38	{}	custom	verbalderivationmiscellaneous	verbal derivation (miscellaneous)	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
39	{}	custom	subjectobjectindexing	subject/object indexing	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
40	{}	custom	verbalizer	verbalizer	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
41	{}	custom	relativizersubordinator	relativizer/subordinator	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
42	{}	custom	verbalnegation	verbal negation	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
\.


--
-- Data for Name: parameter_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.parameter_data (pk, jsondata, key, value, ord, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: parameter_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.parameter_files (pk, jsondata, id, name, description, markup_description, ord, mime_type, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: sentence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sentence (pk, jsondata, polymorphic_type, id, name, description, markup_description, analyzed, gloss, type, source, comment, original_script, xhtml, markup_text, markup_analyzed, markup_gloss, markup_comment, language_pk, created, updated, active) FROM stdin;
\.


--
-- Data for Name: sentence_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sentence_data (pk, jsondata, key, value, ord, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: sentence_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sentence_files (pk, jsondata, id, name, description, markup_description, ord, mime_type, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: sentencereference; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sentencereference (pk, jsondata, key, description, sentence_pk, created, updated, active, source_pk) FROM stdin;
\.


--
-- Data for Name: source; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.source (pk, jsondata, polymorphic_type, id, name, description, markup_description, glottolog_id, google_book_search_id, bibtex_type, author, year, title, type, booktitle, editor, pages, edition, journal, school, address, url, note, number, series, volume, publisher, organization, chapter, howpublished, year_int, startpage_int, pages_int, created, updated, active) FROM stdin;
1	{"key": "Abbi 1995a"}	base	abbi1995a	Abbi 1995	Language contact and language restructuring. A case study of tribal languages of Central India	\N	\N	\N	article	Abbi, Anvita	1995	Language contact and language restructuring. A case study of tribal languages of Central India	\N	\N	\N	175–185	\N	International Journal of the Sociology of Language	\N	\N	\N	\N	\N	\N	116	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
2	{"key": "Abbi 1995b"}	base	abbi1995b	Abbi 1995	Morphological change in tribal languages in central India	\N	\N	\N	article	Abbi, Anvita	1995	Morphological change in tribal languages in central India	\N	\N	\N	1–9	\N	PILC Journal of Dravidic Studies	\N	\N	\N	\N	1	\N	5	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
3	{"key": "Abbi 1997"}	base	abbi1997a	Abbi 1997	Languages in contact in Jharkhand. A case of language conflation, language change and language convergence	\N	\N	\N	incollection	Abbi, Anvita	1997	Languages in contact in Jharkhand. A case of language conflation, language change and language convergence	\N	Languages of tribal and indigenous peoples of India	Abbi, Anvita	131–148	\N	\N	\N	Delhi	\N	\N	\N	the ethnic space (MLBD Series in Linguistics)	10	Motilal Banarasidass	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
4	{"key": "Abbi 2001"}	base	abbi2001a	Abbi 2001	A manual of linguistic field work and structures of Indian languages (LINCOM Handbooks in Linguistics 17)	\N	\N	\N	book	Abbi, Anvita	2001	A manual of linguistic field work and structures of Indian languages (LINCOM Handbooks in Linguistics 17)	\N	\N	\N	\N	\N	\N	\N	Munich	\N	\N	\N	\N	\N	Lincom	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
5	{"key": "Adamou et al. 2016"}	base	adamou2016a	Adamou et al. 2016	Borrowing and contact intensity: A corpus-driven approach from four Slavic minority languages	\N	\N	\N	article	Adamou, Evangelia and Breu, Walter and Scholze, Lenka and Shen, Rachel Xingjia	2016	Borrowing and contact intensity: A corpus-driven approach from four Slavic minority languages	\N	\N	\N	513–542	\N	Journal of Language Contact	\N	\N	\N	\N	3	\N	9	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
6	{"key": "Adams 2013"}	base	adams2013a	Adams 2013	Social Variation and the Latin Language	\N	\N	\N	book	Adams, J.N.	2013	Social Variation and the Latin Language	\N	\N	\N	\N	\N	\N	\N	Cambridge	\N	\N	\N	\N	\N	Cambridge University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
7	{"key": "Adelaar and V\\u00e9rin 1995"}	base	adelaar1995a	Adelaar and Vérin 1995	Malagasy	\N	\N	\N	incollection	Adelaar, Alexander and Vérin, Pierre	1995	Malagasy	\N	Comparative Austronesian dictionary: An introduction to Austronesian studies	Tryon, Darrell T.	393–406	\N	\N	\N	Berlin, New York	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
8	{"key": "Adelaar 2005"}	base	adelaar2005a	Adelaar 2005	The Austronesian languages of South East Asia and Madagascar: a historical perspective	\N	\N	\N	incollection	Adelaar, Alexander	2005	The Austronesian languages of South East Asia and Madagascar: a historical perspective	\N	The Austronesian languages of Asia and Madagascar	Adelaar, Alexander and Himmelmann, Nikolaus P.	1–42	\N	\N	\N	London	\N	\N	\N	Routledge Language Family Series	7	Routledge	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
9	{"key": "Adelaar 2009"}	base	adelaar2009a	Adelaar 2009	Loanwords in Malagasy	\N	\N	\N	incollection	Adelaar, Alexander	2009	Loanwords in Malagasy	\N	Loanwords in the world’s languages. A comparative handbook	Haspelmath, Martin and Tadmor, Uri	717–746	\N	\N	\N	Berlin	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
10	{"key": "Adelaar 2010"}	base	adelaar2010a	Adelaar 2010	The amalgamation of Malagasy	\N	\N	\N	book	Adelaar, Alexander	2010	The amalgamation of Malagasy	\N	\N	Bowden, John and Himmelmann, Nikolaus P. and Ross, Malcolm	161–178	\N	\N	\N	Canberra	\N	\N	\N	Papers in honour of Andrew K. Pawley (Pacific Linguistics)	615	Pacific Linguistics	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
11	{"key": "Adelaar 2012"}	base	adelaar2012a	Adelaar 2012	Malagasy phonological history and Bantu influence	\N	\N	\N	article	Adelaar, Alexander	2012	Malagasy phonological history and Bantu influence	\N	\N	\N	123–159	\N	Oceanic Linguistics	\N	\N	\N	\N	\N	\N	51	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
12	{"key": "Adelaar 1987"}	base	adelaar1987a	Adelaar 1987	Aymarismos en el quechua de Puno	\N	\N	\N	article	Adelaar, Willem F.H.	1987	Aymarismos en el quechua de Puno	\N	\N	\N	223–231	\N	Indiana	\N	\N	\N	\N	\N	\N	11	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
13	{"key": "Adelaar 1996"}	base	adelaar1996a	Adelaar 1996	Quechua, a language of intercultural communication in the Middle Andes	\N	\N	\N	incollection	Adelaar, Willem F.H.	1996	Quechua, a language of intercultural communication in the Middle Andes	\N	Atlas of languages of intercultural communication in the Pacific, Asia and the Americas	Wurm, Stephen A. and Mühlhäusler, Peter and Tryon, Darrell T.	1325–1329	\N	\N	\N	Berlin, New York	\N	\N	\N	Trends in Linguistics, Documentation Series	2, Part 1	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
14	{"key": "Adelaar 2006"}	base	adelaar2006a	Adelaar 2006	The Quechua impact in the Amuesha language, an Arawak language of the Peruvian Amazon	\N	\N	\N	incollection	Adelaar, Willem F.H.	2006	The Quechua impact in the Amuesha language, an Arawak language of the Peruvian Amazon	\N	Grammars in contact. A cross-linguistic typology (Explorations in Linguistic Typology)	Aikhenvald, Alexandra Y. and Dixon, R.M.W.	290–312	\N	\N	\N	Oxford	\N	\N	\N	\N	4	Oxford University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
15	{"key": "Aebischer 1941"}	base	aebischer1941a	Aebischer 1941	Pour l’histoire du suffixe d’origine longobarde -ing dans l’Italie centrale	\N	\N	\N	article	Aebischer, Paul	1941	Pour l’histoire du suffixe d’origine longobarde -ing dans l’Italie centrale	\N	\N	\N	114–121	\N	Zeitschrift für Romanische Philologie	\N	\N	\N	\N	1	\N	61	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
16	{"key": "Aikhenvald 1999"}	base	aikhenvald1999a	Aikhenvald 1999	Tariana texts and cultural context	\N	\N	\N	book	Aikhenvald, Alexandra Y.	1999	Tariana texts and cultural context	\N	\N	\N	\N	\N	\N	\N	Munich	\N	\N	\N	\N	\N	LINCOM EUROPA	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
17	{"key": "Aikhenvald 2003"}	base	aikhenvald2003a	Aikhenvald 2003	A grammar of Tariana, from Northwest Amazonia	\N	\N	\N	book	Aikhenvald, Alexandra Y.	2003	A grammar of Tariana, from Northwest Amazonia	\N	\N	\N	\N	\N	\N	\N	Cambridge	\N	\N	\N	\N	\N	Cambridge University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
18	{"key": "Aikhenvald 2012"}	base	aikhenvald2012a	Aikhenvald 2012	Invisible” loans: How to borrow a bound form	\N	\N	\N	incollection	Aikhenvald, Alexandra Y.	2012	Invisible” loans: How to borrow a bound form	\N	Copies versus cognates in bound morphology (Brill’s Studies in Language, Cognition, and Culture)	Johanson, Lars and Robbeets, Martine	167–185	\N	\N	\N	Leiden, Boston	\N	\N	\N	\N	2	Brill	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
19	{"key": "Allin 1976"}	base	allin1976a	Allin 1976	A grammar of Resígaro. Horseleys Green: Summer Institute of Linguistics	\N	\N	\N	misc	Allin, Trevor R.	1976	A grammar of Resígaro. Horseleys Green: Summer Institute of Linguistics	\N	\N	\N	\N	\N	\N	\N	\N	http://research-repository.st-andrews.ac.uk/handle/10023/1012	accessed: 14.10.2025).	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
20	{"key": "Altimari 2011"}	base	altimari2011a	Altimari 2011	Sui prestiti dell’italiano e dei dialetti italo-romanzi nel sistema verbale dell’albanese di Calabria	\N	\N	\N	incollection	Altimari, Francesco	2011	Sui prestiti dell’italiano e dei dialetti italo-romanzi nel sistema verbale dell’albanese di Calabria	\N	L’influsso dell’italiano sul sistema del verbo delle lingue minoritarie. Resistenza e mutamento nella morfologia e nella sintassi. Atti del 2° convegno internazionale Costanza	Breu, Walter	10–13	\N	\N	\N	Bochum	\N	\N	\N	\N	\N	Brockmeyer	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
21	{"key": "Alvre 2002"}	base	alvre2002a	Alvre 2002	Russische Lehnelemente in Indefinitpronomen und -adverbien der ostseefinnischen Sprachen	\N	\N	\N	article	Alvre, Paul	2002	Russische Lehnelemente in Indefinitpronomen und -adverbien der ostseefinnischen Sprachen	\N	\N	\N	161–164	\N	Linguistica Uralica	\N	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
22	{"key": "Andronov 1980"}	base	andronov1980a	Andronov 1980	The Brahui language	\N	\N	\N	book	Andronov, Mikhail Sergeevich	1980	The Brahui language	\N	\N	\N	\N	\N	\N	\N	Moscow	\N	\N	\N	\N	\N	Nauka	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
23	{"key": "Appleyard 2007"}	base	appleyard2007a	Appleyard 2007	Bilin morphology	\N	\N	\N	incollection	Appleyard, David L.	2007	Bilin morphology	\N	Morphologies of Asia and Africa	Kaye, Alan S.	481–504	\N	\N	\N	Winona Lake	\N	\N	\N	\N	\N	Eisenbrauns	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
24	{"key": "Arcodia 2012"}	base	arcodia2012a	Arcodia 2012	Lexical derivation in Mandarin Chinese	\N	\N	\N	book	Arcodia, Giorgio F.	2012	Lexical derivation in Mandarin Chinese	\N	\N	\N	\N	\N	\N	\N	Taipei	\N	\N	\N	\N	\N	Crane Publishing	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
25	{"key": "Arkadiev and Kozhanov 2023"}	base	arkadiev2023a	Arkadiev and Kozhanov 2023	Borrowing of morphology. With a case study of Baltic and Slavic verbal prefixes	\N	\N	\N	incollection	Arkadiev, Peter and Kozhanov, Kirill	2023	Borrowing of morphology. With a case study of Baltic and Slavic verbal prefixes	\N	The Wiley Blackwell companion to morphology	Ackema, Peter and Bendjaballah, Sabrina and Bonet, Eulàlia and Fábregas, Antonio	1–33	\N	\N	\N	\N	\N	\N	\N	\N	\N	John Wiley & Sons	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
26	{"key": "Baklanova and Bellamy 2023"}	base	baklanova2023a	Baklanova and Bellamy 2023	Spanish suffixes in Tagalog: The case of common nouns	\N	\N	\N	incollection	Baklanova, Ekaterina and Bellamy, Kate	2023	Spanish suffixes in Tagalog: The case of common nouns	\N	Traces of contact in the lexicon – Austronesian and Papuan studies	Klamer, Marian and Moro, Francesca	307–347	\N	\N	\N	Leiden	\N	\N	\N	\N	\N	Brill	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
27	{"key": "Baklanova 2016"}	base	baklanova2016a	Baklanova 2016	On marginal gender in Tagalog: A case study	\N	\N	\N	inproceedings	Baklanova, Ekaterina	2016	On marginal gender in Tagalog: A case study	\N	Proceedings on XII LESEWA	\N	25–33	\N	\N	\N	Moscow	\N	\N	\N	\N	\N	Yazyki Narodov Mira	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
28	{"key": "Baklanova 2017"}	base	baklanova2017a	Baklanova 2017	On contact-induced changes in modern Tagalog: A case study	\N	\N	\N	incollection	Baklanova, Ekaterina	2017	On contact-induced changes in modern Tagalog: A case study	\N	Intercivilizational contacts in South-East Asia: Historical perspectives and globalization	Ogloblin, Alexander and Rudolf, Yanson and Sergey, Dmitrenko	329–359	\N	\N	\N	St Petersburg	\N	\N	\N	\N	\N	Nestor-Istoriya	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
29	{"key": "Beke 1911"}	base	beke1911a	Beke 1911	Cseremisz nyelvtan	\N	\N	\N	book	Beke, Ödön	1911	Cseremisz nyelvtan	\N	\N	\N	\N	\N	\N	\N	Budapest	\N	\N	\N	\N	\N	Kiadja a Magyar Tudományos Akadémia	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
30	{"key": "Bereczki 1979"}	base	bereczki1979a	Bereczki 1979	Tschuwaschische Kasussuffixe im Tscheremissischen	\N	\N	\N	article	Bereczki, Gábor	1979	Tschuwaschische Kasussuffixe im Tscheremissischen	\N	\N	\N	65–69	\N	Veröffentlichungen der Societas Uralo-Altaica	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
31	{"key": "Bereczki 1993"}	base	bereczki1993a	Bereczki 1993	The character and scale of Turkic influence on the structure of Finno-Ugric languages	\N	\N	\N	incollection	Bereczki, Gábor	1993	The character and scale of Turkic influence on the structure of Finno-Ugric languages	\N	Comparative-historical linguistics. Indo-European and Finno-Ugric. Papers in honor of Oswald Szemerényi III	Brogyanyi, Bela and Lipp, Reiner	509–519	\N	\N	\N	Amsterdam, Philadelphia	\N	\N	\N	Current Issues in the Theory and History of Linguistic Science Series IV - Current Issues in Linguistic Theory	97	John Benjamins	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
32	{"key": "Bereczki 2002"}	base	bereczki2002a	Bereczki 2002	Az alaktani elemek kölcsönzésének néhány típusa a Volga-Káma-vidéki area nyelveiben	\N	\N	\N	article	Bereczki, Gábor	2002	Az alaktani elemek kölcsönzésének néhány típusa a Volga-Káma-vidéki area nyelveiben	\N	\N	\N	97–101	\N	Nyelvtudományi Közlemények	\N	\N	\N	\N	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
33	{"key": "Bhat 1987"}	base	bhat1987a	Bhat 1987	A descriptive study of Kashmiri	\N	\N	\N	book	Bhat, Roopkrishen	1987	A descriptive study of Kashmiri	\N	\N	\N	\N	\N	\N	\N	Delhi	\N	\N	\N	\N	\N	Amar Prakashan	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
34	{"key": "Bianchi 1888"}	base	bianchi1888a	Bianchi 1888	La declinazione nei nomi di luogo della Toscana	\N	\N	\N	article	Bianchi, Brunone	1888	La declinazione nei nomi di luogo della Toscana	\N	\N	\N	305–412	\N	Archivio Glottologico Italiano	\N	\N	\N	\N	3	\N	10	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
35	{"key": "Blau 1980"}	base	blau1980a	Blau 1980	Manuel de kurde (dialecte sorani): grammaire, textes de lecture, vocabulaire kurde-français et français-kurde	\N	\N	\N	book	Blau, Joyce	1980	Manuel de kurde (dialecte sorani): grammaire, textes de lecture, vocabulaire kurde-français et français-kurde	\N	\N	\N	\N	\N	\N	\N	Paris	\N	\N	\N	\N	\N	Klincksieck	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
36	{"key": "Blokland and Rie\\u00dfler 2011"}	base	blokland2011a	Blokland and Rießler 2011	Komi-Saami-Russian contacts on the Kola peninsula	\N	\N	\N	incollection	Blokland, Rogier and Rießler, Michael	2011	Komi-Saami-Russian contacts on the Kola peninsula	\N	Language contact in times of globalization (Studies in Slavic and General Linguistics)	Hasselblatt, Cornelius and Houtzagers, Peter and Pareren, Remco	5–26	\N	\N	\N	Amsterdam, New York	\N	\N	\N	\N	\N	Rodopi	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
37	{"key": "Blokland 2005"}	base	blokland2005a	Blokland 2005	The Russian loanwords in literary Estonian	\N	\N	\N	book	Blokland, Rogier Philip Charles Eduard	2005	The Russian loanwords in literary Estonian	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	University of Groningen PhD thesis	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
38	{"key": "Bolozky 1999"}	base	bolozky1999a	Bolozky 1999	Measuring productivity in word formation: the case of Israeli Hebrew (Studies in Semitic Languages and Linguistics 27)	\N	\N	\N	book	Bolozky, Shmuel	1999	Measuring productivity in word formation: the case of Israeli Hebrew (Studies in Semitic Languages and Linguistics 27)	\N	\N	\N	\N	\N	\N	\N	Leiden	\N	\N	\N	\N	\N	Brill	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
39	{"key": "Bolozky 2007"}	base	bolozky2007a	Bolozky 2007	Israeli Hebrew morphology	\N	\N	\N	incollection	Bolozky, Shmuel	2007	Israeli Hebrew morphology	\N	Morphologies of Asia and Africa	Kaye, Alan S.	283–308	\N	\N	\N	Winona Lake	\N	\N	\N	\N	\N	Eisenbrauns	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
40	{"key": "Boretzky and Igla 1991"}	base	boretzky1991a	Boretzky and Igla 1991	Morphologische Entlehnung in den Romani-Dialekten	\N	\N	\N	book	Boretzky, Norbert and Igla, Birgit	1991	Morphologische Entlehnung in den Romani-Dialekten	\N	\N	\N	\N	\N	\N	\N	Essen	\N	\N	\N	Arbeitspapiere des Projekts “Prinzipien des Sprachwandels” 1	\N	Universität GH Essen	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
41	{"key": "Boretzky 1975a"}	base	boretzky1975a	Boretzky 1975	Der türkische Einfluss auf das Albanische. Teil 1: Phonologie und Morphologie der albanischen Turzismen	\N	\N	\N	book	Boretzky, Norbert	1975	Der türkische Einfluss auf das Albanische. Teil 1: Phonologie und Morphologie der albanischen Turzismen	\N	\N	\N	\N	\N	\N	\N	Wiesbaden	\N	\N	\N	Albanische Forschungen 11	\N	Harrassowitz	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
42	{"key": "Boretzky 1975b"}	base	boretzky1975b	Boretzky 1975	Der türkische Einfluss auf das Albanische. Teil 2: Wörterbuch der albanischen Turzismen	\N	\N	\N	book	Boretzky, Norbert	1975	Der türkische Einfluss auf das Albanische. Teil 2: Wörterbuch der albanischen Turzismen	\N	\N	\N	\N	\N	\N	\N	Wiesbaden	\N	\N	\N	Albanische Forschungen 12	\N	Harrassowitz	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
43	{"key": "Boretzky 1994"}	base	boretzky1994a	Boretzky 1994	Romani: Grammatik des Kalderaš-Dialektes mit Texten und Glossar	\N	\N	\N	book	Boretzky, Norbert	1994	Romani: Grammatik des Kalderaš-Dialektes mit Texten und Glossar	\N	\N	\N	\N	\N	\N	\N	Wiesbaden	\N	\N	\N	\N	\N	Harrassowitz	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
109	{"key": "Gardani 2020"}	base	gardani2020a	Gardani 2020	Borrowing matter and pattern in morphology. An overview	\N	\N	\N	article	Gardani, Francesco	2020	Borrowing matter and pattern in morphology. An overview	\N	\N	\N	263–282	\N	Morphology	\N	\N	\N	\N	4	\N	30	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
44	{"key": "Boretzky 2004"}	base	boretzky2004a	Boretzky 2004	Morphologische Entlehnung und Lehnübersetzung	\N	\N	\N	article	Boretzky, Norbert	2004	Morphologische Entlehnung und Lehnübersetzung	\N	\N	Booij, Geert E. and Lehmann, Christian and Mugdan, Joachim and Skopeteas, Stavros and Kesselheim, Wolfgang	1644–1652	\N	Part	\N	Berlin, New York	\N	\N	Teil	\N	2	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
45	{"key": "Borg and Azzopardi-Alexander 1997"}	base	borg1997a	Borg and Azzopardi-Alexander 1997	Maltese	\N	\N	\N	book	Borg, Albert and Azzopardi-Alexander, Marie	1997	Maltese	\N	\N	\N	\N	\N	\N	\N	London, New York	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
46	{"key": "Borg 1985"}	base	borg1985a	Borg 1985	Cypriot Arabic: a historical and comparative investigation into the phonology and morphology of the Arabic vernacular spoken by the Maronites of Kormakiti village in the Kyrenia district of North-Western Cyprus	\N	\N	\N	book	Borg, Alexander	1985	Cypriot Arabic: a historical and comparative investigation into the phonology and morphology of the Arabic vernacular spoken by the Maronites of Kormakiti village in the Kyrenia district of North-Western Cyprus	\N	\N	\N	\N	\N	\N	\N	Stuttgart	\N	\N	\N	Abhandlungen für die Kunde des Morgenlandes 47/4	\N	Steiner	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
47	{"key": "Borg 1994"}	base	borg1994a	Borg 1994	Some evolutionary parallels and divergences in Cypriot Arabic and Maltese	\N	\N	\N	article	Borg, Alexander	1994	Some evolutionary parallels and divergences in Cypriot Arabic and Maltese	\N	\N	\N	43–73	\N	Mediterranean Language Review	\N	\N	\N	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
48	{"key": "Breu 1992"}	base	breu1992a	Breu 1992	Zur Rolle der Präfigierung bei der Entstehung von Aspektsystemen. Linguistique et slavistique: Mélanges offerts à Paul Garde	\N	\N	\N	article	Breu, Walter	1992	Zur Rolle der Präfigierung bei der Entstehung von Aspektsystemen. Linguistique et slavistique: Mélanges offerts à Paul Garde	\N	\N	\N	117–135	\N	Tome	\N	Aix-en-Provence, Paris	http://www.slavistik-portal.de/datenpool/bibdatslav-db.html?data=252	\N	Travaux publiés par l’Institut d’Études slaves 36	\N	1	Publications de l’Université de Provence	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
49	{"key": "Breu 1996"}	base	breu1996a	Breu 1996	Überlegungen zu einer Klassifizierung des grammatischen Wandels im Sprachkontakt (am Beispiel slavischer Kontaktfälle)	\N	\N	\N	article	Breu, Walter	1996	Überlegungen zu einer Klassifizierung des grammatischen Wandels im Sprachkontakt (am Beispiel slavischer Kontaktfälle)	\N	\N	\N	21–38	\N	Sprachtypologie und Universalienforschung	\N	\N	\N	\N	\N	\N	49	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
50	{"key": "Breu 2013"}	base	breu2013a	Breu 2013	Molise Slavic corpus	\N	\N	\N	misc	Breu, Walter	2013	Molise Slavic corpus	\N	\N	Adamou, Evangelia and Breu, Walter and Drettas, Georges and Scholze, Lenka	\N	\N	\N	\N	\N	https://pangloss.cnrs.fr/corpus/show_text.php?id=cocoon-a67d0b37-bbb1-30e4-afd8-6221cc7c6862&idref=cocoon-255165c2-68ed-3ae5-b446-2a56c4afcbb8	accessed: 17.05.2024).	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
51	{"key": "Breu 2019"}	base	breu2019a	Breu 2019	Morphosyntactic changes in Slavic micro-languages: The case of Molise Slavic in total language contact	\N	\N	\N	incollection	Breu, Walter	2019	Morphosyntactic changes in Slavic micro-languages: The case of Molise Slavic in total language contact	\N	Slavic on the Language map of Europe	Danylenko, Andrii and Nomachi, Motoki	385–432	\N	\N	\N	Berlin, Boston	\N	\N	\N	\N	\N	De Gruyter Mouton	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
52	{"key": "Breu 2020"}	base	breu2020a	Breu 2020	Molise Slavic	\N	\N	\N	incollection	Breu, Walter	2020	Molise Slavic	\N	Encyclopedia of Slavic languages and linguistics online	Greenberg, Marc L.	\N	\N	\N	\N	Leiden	\N	\N	\N	\N	\N	Brill	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
53	{"key": "Brincat and Mifsud 2015"}	base	brincat2015a	Brincat and Mifsud 2015	Maltese	\N	\N	\N	incollection	Brincat, Joseph and Mifsud, Manwel	2015	Maltese	\N	Word-formation: An international handbook of the languages of Europe	Müller, Peter O. and Ohnheiser, Ingeborg and Olsen, Susan and Rainer, Franz	3349–3366	\N	\N	\N	Berlin	\N	\N	\N	\N	5	De Gruyter Mouton	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
54	{"key": "Budenz 1864"}	base	budenz1864a	Budenz 1864	Cseremisz tanulmányok	\N	\N	\N	article	Budenz, József	1864	Cseremisz tanulmányok	\N	\N	\N	397–470	\N	NyK	\N	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
55	{"key": "Bulu\\u00e7 1975"}	base	bulu1975a	Buluç 1975	Mendeli (Irak) Ağzının Özellikleri. Bilimsel bildiriler 1972: I. Türk Dili Bilimsel Kurultayina sunulan Bildiriler	\N	\N	\N	book	Buluç, Sadettin	1975	Mendeli (Irak) Ağzının Özellikleri. Bilimsel bildiriler 1972: I. Türk Dili Bilimsel Kurultayina sunulan Bildiriler	\N	\N	\N	181–183	\N	\N	\N	Ankara	\N	\N	\N	\N	\N	Ankara Universitesi Basimevi	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
56	{"key": "Bulut 2005"}	base	bulut2005a	Bulut 2005	Iranian influences in Sonqor Turkic	\N	\N	\N	incollection	Bulut, Christiane	2005	Iranian influences in Sonqor Turkic	\N	Linguistic convergence and areal diffusion: case studies from Iranian, Semitic, and Turkic	Csató, Éva Ágnes and Isaksson, Bo and Jahani, Carina	241–269	\N	\N	\N	London & New York	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
57	{"key": "Bulut 2007"}	base	bulut2007a	Bulut 2007	Iraqi Turkman	\N	\N	\N	incollection	Bulut, Christiane	2007	Iraqi Turkman	\N	Languages of Iraq, ancient and modern	Postgate, J.N.	159–187	\N	\N	\N	London	\N	\N	\N	\N	\N	British School of Archaeology in Iraq	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
58	{"key": "Bulut 2014"}	base	bulut2014a	Bulut 2014	Turkic varieties in West Iran and Iraq - Representatives of a South Oghuz dialect group?	\N	\N	\N	incollection	Bulut, Christiane	2014	Turkic varieties in West Iran and Iraq - Representatives of a South Oghuz dialect group?	\N	Turkic language in Iran - past and present	Stein, Heidi	15–99	\N	\N	\N	Wiesbaden	\N	\N	\N	\N	Turcologica 100	Harrassowitz	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
59	{"key": "Campbell 1997"}	base	campbell1997a	Campbell 1997	Genetic classification, typology, areal linguistics, language endangerment, and languages of the north Pacific rim	\N	\N	\N	incollection	Campbell, Lyle	1997	Genetic classification, typology, areal linguistics, language endangerment, and languages of the north Pacific rim	\N	Languages of the North Pacific Rim	Miyaoka, Osahito and Oshima, Minoru	179–242	\N	\N	\N	Kyoto	\N	\N	\N	\N	2	Graduate School of Letters, Kyoto University	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
60	{"key": "Capidan 1925"}	base	capidan1925a	Capidan 1925	Meglenoromânii. I, Istoria şi graiul lor (Academia Română)	\N	\N	\N	article	Capidan, Theodor	1925	Meglenoromânii. I, Istoria şi graiul lor (Academia Română)	\N	\N	\N	\N	\N	Studii şi Cercetări	\N	Bucarest	\N	\N	\N	\N	7	Cultura Naţională	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
61	{"key": "Capidan 1940"}	base	capidan1940a	Capidan 1940	Le bilinguisme chez les Roumains	\N	\N	\N	article	Capidan, Theodor	1940	Le bilinguisme chez les Roumains	\N	\N	\N	73–94	\N	Langue et Littérature. Bulletin de la Section Littéraire de l’Académie Roumaine	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
62	{"key": "Chamoreau 2012"}	base	chamoreau2012a	Chamoreau 2012	Spanish diminutive markers -ito/-ita in Mesoamerican languages: a challenge for acceptance of gender distinction	\N	\N	\N	incollection	Chamoreau, Claudine	2012	Spanish diminutive markers -ito/-ita in Mesoamerican languages: a challenge for acceptance of gender distinction	\N	Morphologies in Contact (Studia Typologica)	Vanhove, Martine and Stolz, Thomas and Urdze, Aina and Otsuka, Hitomi	71–89	\N	\N	\N	Berlin	\N	\N	\N	\N	10	Akademie Verlag	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
63	{"key": "Ciszek 2008"}	base	ciszek2008a	Ciszek 2008	Word derivation in Early Middle English	\N	\N	\N	book	Ciszek, Ewa	2008	Word derivation in Early Middle English	\N	\N	\N	\N	\N	\N	\N	Frankfurt am Main	\N	\N	\N	Studies in English Medieval Language and Literature 23	\N	Lang	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
64	{"key": "Ciucci 2010"}	base	ciucci2010a	Ciucci 2010	La flessione possessiva del chamacoco	\N	\N	\N	article	Ciucci, Luca	2010	La flessione possessiva del chamacoco	\N	\N	\N	\N	\N	Quaderni del Laboratorio di Linguistica della Scuola Normale Superiore	\N	\N	http://linguistica.sns.it/QLL/QLL10/Ciucci_chamacoco.pdf	accessed: 14.07.2025).	2	\N	9	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
65	{"key": "Ciucci 2014"}	base	ciucci2014a	Ciucci 2014	Tracce di contatto tra la famiglia zamuco (ayoreo, chamacoco) e altre lingue del Chaco: prime prospezioni	\N	\N	\N	article	Ciucci, Luca	2014	Tracce di contatto tra la famiglia zamuco (ayoreo, chamacoco) e altre lingue del Chaco: prime prospezioni	\N	\N	\N	\N	\N	Quaderni del Laboratorio di Linguistica della Scuola Normale Superiore di Pisa	\N	\N	https://linguistica.sns.it/QLL/QLL14/Ciucci_contatto_tra_famiglia_zamuco_e_altre_lingue_del_Chaco.pdf	accessed: 14.07.2025).	\N	\N	13	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
66	{"key": "Cohen and Laks 2012"}	base	cohen2012a	Cohen and Laks 2012	Hebrew bases with borrowed affixes: A multi-dimensional account	\N	\N	\N	incollection	Cohen, Evan-Gary and Laks, Lior	2012	Hebrew bases with borrowed affixes: A multi-dimensional account	\N	IMM15 Vienna 9–12 February 2012, Workshop on Borrowed Morphology Form and Meaning	\N	\N	\N	\N	\N	Vienna	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
67	{"key": "Dahmen 1989"}	base	dahmen1989a	Dahmen 1989	Rumänisch: Areallinguistik IV. Istrorumänisch	\N	\N	\N	incollection	Dahmen, Wolfgang	1989	Rumänisch: Areallinguistik IV. Istrorumänisch	\N	Lexikon der romanistischen Linguistik	Holtus, Günter and Metzeltin, Michael and Schmitt, Christian	448–460	\N	\N	\N	Tübingen	\N	\N	\N	\N	3	Niemeyer	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
68	{"key": "Dalton-Puffer 1996"}	base	dalton_puffer1996a	Dalton-Puffer 1996	The French influence on Middle English morphology. A corpus-based study of derivation	\N	\N	\N	book	Dalton-Puffer, Christiane	1996	The French influence on Middle English morphology. A corpus-based study of derivation	\N	\N	\N	\N	\N	\N	\N	Berlin, New York	\N	\N	\N	Topics in English Linguistics 20	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
69	{"key": "Dawkins 1916"}	base	dawkins1916a	Dawkins 1916	Modern Greek in Asia Minor	\N	\N	\N	book	Dawkins, R.M.	1916	Modern Greek in Asia Minor	\N	\N	\N	\N	\N	\N	\N	Cambridge	\N	\N	\N	\N	\N	Cambridge University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
70	{"key": "Pury 2001"}	base	pury2001a	Pury 2001	Le garífuna, une langue mixte	\N	\N	\N	article	Pury, Sybille	2001	Le garífuna, une langue mixte	\N	\N	\N	75–84	\N	Faits de Langues	\N	\N	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
71	{"key": "Pury 2005"}	base	pury2005a	Pury 2005	El género en garífuna. Un análisis dinámico	\N	\N	\N	incollection	Pury, Sybille	2005	El género en garífuna. Un análisis dinámico	\N	Dinámica lingüística de las lenguas en contacto	Chamoreau, Claudine and Lastra, Yolanda	87–102	\N	\N	\N	Hermosillo, Sonora	\N	\N	\N	Colección Lingüística: Serie Simposios	2	Universidad de Sonora	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
72	{"key": "de Reuse 1994"}	base	reuse1994a	de Reuse 1994	Siberian Yupik Eskimo. The language and its contacts with Chukchi	\N	\N	\N	book	de Reuse, Willem Joseph	1994	Siberian Yupik Eskimo. The language and its contacts with Chukchi	\N	\N	\N	\N	\N	\N	\N	Salt Lake City	\N	\N	\N	Studies in Indigenous Languages of the Americas	\N	University of Utah Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
73	{"key": "de Vries 1984"}	base	vries1984a	de Vries 1984	Adaptation of polymorphemic loanwords. The case of words ending in -asi in Indonesian. Bijdragen tot de Taal	\N	\N	\N	article	de Vries, J.W.	1984	Adaptation of polymorphemic loanwords. The case of words ending in -asi in Indonesian. Bijdragen tot de Taal	\N	\N	\N	476–496	\N	Land- en Volkenkunde	\N	\N	\N	\N	\N	\N	140	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
74	{"key": "Dehghani 2000"}	base	dehghani2000a	Dehghani 2000	A grammar of Iranian Azari: including comparisons with Persian	\N	\N	\N	book	Dehghani, Yavar	2000	A grammar of Iranian Azari: including comparisons with Persian	\N	\N	\N	\N	\N	\N	\N	Munich	\N	\N	\N	LINCOM Studies in Asian Linguistics 30	\N	LINCOM Europa	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
75	{"key": "Deksne 2022"}	base	deksne2022a	Deksne 2022	Verba priedēkļi latgaliešu rakstu un latviešu literārajā valodā [Verb prefixes in Standard Latgalian and Standard Latvian]. Valoda: nozīme un forma / Language	\N	\N	\N	article	Deksne, Daiga	2022	Verba priedēkļi latgaliešu rakstu un latviešu literārajā valodā [Verb prefixes in Standard Latgalian and Standard Latvian]. Valoda: nozīme un forma / Language	\N	\N	\N	78–90	\N	Meaning and Form	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
76	{"key": "Demir et al. 2017"}	base	demir2017a	Demir et al. 2017	Türkçe Biçim Bilgisi	\N	\N	\N	book	Demir, Nurettin and Demir, Sema Aslan and Erdem, Mevlüt and Yılmaz, Emine	2017	Türkçe Biçim Bilgisi	\N	\N	\N	\N	\N	\N	\N	Eskişehir	\N	\N	\N	\N	\N	Anadolu Üniversitesi Yayınları	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
77	{"key": "Demiraj 1988"}	base	demiraj1988a	Demiraj 1988	Gjuha shqipe dhe historia e saj	\N	\N	\N	book	Demiraj, Shaban	1988	Gjuha shqipe dhe historia e saj	\N	\N	\N	\N	\N	\N	\N	Tiranë	\N	\N	\N	\N	\N	Shtëpia Botuese e Librit Universitar	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
78	{"key": "Derbyshire 1999"}	base	derbyshire1999a	Derbyshire 1999	Carib	\N	\N	\N	incollection	Derbyshire, Desmond C.	1999	Carib	\N	The Amazonian languages	Dixon, R.M.W. and Aikhenvald, Alexandra Y.	22–64	\N	\N	\N	Cambridge	\N	\N	\N	\N	\N	Cambridge University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
79	{"key": "Dhakal 2014"}	base	dhakal2014a	Dhakal 2014	Contact-induced changes in Baram	\N	\N	\N	incollection	Dhakal, Dubi Nanda	2014	Contact-induced changes in Baram	\N	North East Indian Linguistics 6	Hyslop, Gwendolyn and Konnerth, Linda and Morey, Stephen and Sarmah, Priyankoo	167–190	\N	\N	\N	Canberra	\N	\N	\N	Eastern Himalayas Series	1	Asia-Pacific Linguistics, College of Asia and the Pacific, The Australian National University	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
80	{"key": "Dhakal 2017"}	base	dhakal2017a	Dhakal 2017	Language Changes in Baram. Presented at the XLanS: Triggers of language change in the Language Sciences	\N	\N	\N	misc	Dhakal, Dubi Nanda	2017	Language Changes in Baram. Presented at the XLanS: Triggers of language change in the Language Sciences	\N	\N	\N	\N	\N	\N	\N	Lyon	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
81	{"key": "Diem 1971"}	base	diem1971a	Diem 1971	Zum Problem der Personalpronomina -hənne (3.Pl.), -kon (2.Pl.) und-hon (3.Pl.) in den syrisch-libanesischen Dialekten	\N	\N	\N	article	Diem, Werner	1971	Zum Problem der Personalpronomina -hənne (3.Pl.), -kon (2.Pl.) und-hon (3.Pl.) in den syrisch-libanesischen Dialekten	\N	\N	\N	223–230	\N	Zeitschriften der Deutschen Morgenländischen Gesellschaft	\N	\N	\N	\N	\N	\N	121	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
82	{"key": "Doerfer 1967"}	base	doerfer1967a	Doerfer 1967	Türkische Lehnwörter im Tadschikischen	\N	\N	\N	book	Doerfer, Gerhard	1967	Türkische Lehnwörter im Tadschikischen	\N	\N	\N	\N	\N	\N	\N	Wiesbaden	\N	\N	\N	Abhandlungen für die Kunde des Morgenlandes 37/3	\N	Steiner	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
83	{"key": "Donohue 1999"}	base	donohue1999a	Donohue 1999	A grammar of Tukang Besi	\N	\N	\N	book	Donohue, Mark	1999	A grammar of Tukang Besi	\N	\N	\N	\N	\N	\N	\N	Berlin, New York	\N	\N	\N	Mouton Grammar Library 20	\N	Walter De Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
84	{"key": "Drewes 1994"}	base	drewes1994a	Drewes 1994	Borrowing in Maltese	\N	\N	\N	incollection	Drewes, Abraham J.	1994	Borrowing in Maltese	\N	Mixed languages: 15 case studies in language intertwining	Bakker, Peter and Mous, Maarten	83–111	\N	\N	\N	Amsterdam	\N	\N	\N	\N	\N	IFOTT	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
85	{"key": "Duff-Tripp 1997"}	base	duff_tripp1997a	Duff-Tripp 1997	Gramática del idioma Yanesha’ (Amueshai)	\N	\N	\N	misc	Duff-Tripp, Martha	1997	Gramática del idioma Yanesha’ (Amueshai)	(Serie Lingüística Peruana 43).	\N	\N	\N	\N	\N	\N	Lima	\N	\N	\N	\N	\N	Ministerio de Educación and Instituto Lingüístico de Verano	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
86	{"key": "D\\u00fcrr 2012"}	base	duerr2012a	Dürr 2012	Einführung in die Mayasprache Ch’ol	\N	\N	\N	misc	Dürr, Michael	2012	Einführung in die Mayasprache Ch’ol	\N	\N	\N	\N	\N	\N	\N	Berlin	http://home.snafu.de/duerr/PDF_Doku/Cholkurs.pdf	accessed: 14.10.2025).	\N	\N	\N	Lateinamerikainstitut der Freien Universität Berlin	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
87	{"key": "Dwyer 1992"}	base	dwyer1992a	Dwyer 1992	Altaic elements in the Línxìa dialect: contact-induced change on the Yellow River plateau	\N	\N	\N	article	Dwyer, Arienne M.	1992	Altaic elements in the Línxìa dialect: contact-induced change on the Yellow River plateau	\N	\N	\N	160–179	\N	Journal of Chinese Linguistics	\N	\N	\N	\N	1	\N	20	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
88	{"key": "Elfenbein 1998"}	base	elfenbein1998a	Elfenbein 1998	Brahui	\N	\N	\N	incollection	Elfenbein, Joseph	1998	Brahui	\N	The Dravidian languages	Steever, Sanford B.	388–414	\N	\N	\N	London	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
89	{"key": "Eliasson 2012"}	base	eliasson2012a	Eliasson 2012	On the degree of copiability of derivational and inflectional morphology: Evidence from Basque	\N	\N	\N	incollection	Eliasson, Stig	2012	On the degree of copiability of derivational and inflectional morphology: Evidence from Basque	\N	Copies versus Cognates in Bound Morphology	Johanson, Lars and Robbeets, Martine	257–296	\N	\N	\N	Brill	\N	\N	\N	Brill’s Studies in Language, Cognition and Culture	2	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
90	{"key": "Emeneau 1962"}	base	emeneau1962a	Emeneau 1962	Brahui and Dravidian comparative grammar	\N	\N	\N	book	Emeneau, Murray Barnson	1962	Brahui and Dravidian comparative grammar	\N	\N	\N	\N	\N	\N	\N	Berkeley, Los Angeles	\N	\N	\N	University of California Publications in Linguistics 27	\N	University of California Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
91	{"key": "Escure 2004"}	base	escure2004a	Escure 2004	Garifuna in Belize and Honduras	\N	\N	\N	article	Escure, Geneviève	2004	Garifuna in Belize and Honduras	\N	\N	Escure, Geneviève and Schwegler, Armin	\N	\N	Linguistic and social implications	\N	Amsterdam, Philadelphia	\N	\N	\N	\N	35–65	John Benjamins	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
92	{"key": "Escure 2012"}	base	escure2012a	Escure 2012	The grammaticalizaion of evidential markers in Garifuna	\N	\N	\N	incollection	Escure, Geneviève	2012	The grammaticalizaion of evidential markers in Garifuna	\N	Grammatical replication and borrowability in language contact	Wiemer, Björn and Wälchli, Bernhard and Hansen, Björn	357–380	\N	\N	\N	Berlin, Boston	\N	\N	\N	\N	\N	de Gruyter Mouton	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
93	{"key": "Evans 1995"}	base	evans1995a	Evans 1995	A grammar of Kayardild. With historical-comparative notes on Tangkic	\N	\N	\N	book	Evans, Nicholas D.	1995	A grammar of Kayardild. With historical-comparative notes on Tangkic	\N	\N	\N	\N	\N	\N	\N	Berlin	\N	\N	\N	Mouton Grammar Library 15	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
94	{"key": "Fiedler 1977"}	base	fiedler1977a	Fiedler 1977	Die Pluralbildung bei den türkischen Elementen des Albanischen	\N	\N	\N	article	Fiedler, Wilfried	1977	Die Pluralbildung bei den türkischen Elementen des Albanischen	\N	\N	\N	125–145	\N	Linguistique balkanique	\N	\N	\N	\N	\N	\N	XX	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
95	{"key": "Frachtenberg 1913"}	base	frachtenberg1913a	Frachtenberg 1913	Coos texts	\N	\N	\N	article	Frachtenberg, Leo J.	1913	Coos texts	\N	\N	\N	\N	\N	Columbia University Contributions to Anthropology	\N	New York	\N	\N	\N	\N	1	Columbia University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
96	{"key": "Frachtenberg 1914"}	base	frachtenberg1914a	Frachtenberg 1914	Lower Umpqua texts and notes on the Kusan dialect. Columbia University Contributions to Anthropology 4	\N	\N	\N	book	Frachtenberg, Leo J.	1914	Lower Umpqua texts and notes on the Kusan dialect. Columbia University Contributions to Anthropology 4	\N	\N	\N	\N	\N	\N	\N	New York	\N	\N	\N	\N	\N	Columbia University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
97	{"key": "Frachtenberg 1917"}	base	frachtenberg1917a	Frachtenberg 1917	Myths of the Alsea Indians of Northwestern Oregon	\N	\N	\N	article	Frachtenberg, Leo J.	1917	Myths of the Alsea Indians of Northwestern Oregon	\N	\N	\N	64–75	\N	International Journal of American Linguistics	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
98	{"key": "Frachtenberg 1918"}	base	frachtenberg1918a	Frachtenberg 1918	Yakonan (Alsea) grammar	\N	\N	\N	book	Frachtenberg, Leo J.	1918	Yakonan (Alsea) grammar	\N	\N	\N	394	\N	\N	\N	\N	\N	\N	\N	\N	\N	American Philosophical Society. Ms	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
99	{"key": "Frachtenberg 1920"}	base	frachtenberg1920a	Frachtenberg 1920	Alsea texts and myths	\N	\N	\N	book	Frachtenberg, Leo J.	1920	Alsea texts and myths	\N	\N	\N	\N	\N	\N	\N	Washington	\N	\N	\N	\N	\N	Government Printing Office	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
100	{"key": "Frachtenberg 1922a"}	base	frachtenberg1922a	Frachtenberg 1922	Coos	\N	\N	\N	incollection	Frachtenberg, Leo J.	1922	Coos	\N	Handbook of American Indian Languages	Boas, Franz	297–430	\N	\N	\N	Washington	\N	\N	\N	\N	2	Government Printing Office	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
101	{"key": "Frachtenberg 1922b"}	base	frachtenberg1922b	Frachtenberg 1922	Siuslawan (Lower Umpquai)	\N	\N	\N	incollection	Frachtenberg, Leo J.	1922	Siuslawan (Lower Umpquai)	\N	Handbook of American Indian Languages	Boas, Franz	431–630	\N	\N	\N	Washington	\N	\N	\N	\N	2	Government Printing Office	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
102	{"key": "Friedman 2012"}	base	friedman2012a	Friedman 2012	Copying and cognates in the Balkan Sprachbund	\N	\N	\N	incollection	Friedman, Victor A.	2012	Copying and cognates in the Balkan Sprachbund	\N	Copies versus cognates in bound morphology	Johanson, Lars and Robbeets, Martine I.	323–336	\N	\N	\N	Leiden & Boston	\N	\N	\N	\N	\N	Brill	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
103	{"key": "Fuchs 1949"}	base	fuchs1949a	Fuchs 1949	Der Komparativ und Superlativ in den finnisch-ugrischen Sprachen	\N	\N	\N	article	Fuchs, David R.	1949	Der Komparativ und Superlativ in den finnisch-ugrischen Sprachen	\N	\N	\N	147–230	\N	Finnisch-ugrische Forschungen	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
104	{"key": "Fufaeva 2021"}	base	fufaeva2021a	Fufaeva 2021	Как называются женщины: феминитивы: история, устройство, конкуренция [What women are called	\N	\N	\N	incollection	Fufaeva, Irina Vladimirovna	2021	Как называются женщины: феминитивы: история, устройство, конкуренция [What women are called	\N	Feminatives: History, structure, competition]. Серия Primus	\N	\N	\N	\N	\N	Moscow	\N	\N	\N	\N	\N	АСТ, Corpus	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
105	{"key": "Galkin 1964"}	base	galkin1964a	Galkin 1964	Istoritsheskaja grammatika marijskogo jazyka	\N	\N	\N	book	Galkin, Ivan Stepanovich	1964	Istoritsheskaja grammatika marijskogo jazyka	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Joshkar-Ola	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
106	{"key": "Garc\\u00eda Velasco 2020"}	base	velasco2020a	García Velasco 2020	Nominalizing -ing as a case of affix borrowing: An FDG account	\N	\N	\N	article	García Velasco, Daniel	2020	Nominalizing -ing as a case of affix borrowing: An FDG account	\N	\N	\N	123–143	\N	Revista Canaria de Estudios Ingleses	\N	\N	\N	\N	\N	\N	80	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
107	{"key": "Gardani 2008"}	base	gardani2008a	Gardani 2008	Borrowing of inflectional morphemes in language contact	\N	\N	\N	book	Gardani, Francesco	2008	Borrowing of inflectional morphemes in language contact	\N	\N	\N	\N	\N	\N	\N	Frankfurt am Main	\N	\N	\N	European University Studies 320	\N	Peter Lang	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
108	{"key": "Gardani 2012"}	base	gardani2012a	Gardani 2012	Plural across inflection and derivation, fusion and agglutination	\N	\N	\N	incollection	Gardani, Francesco	2012	Plural across inflection and derivation, fusion and agglutination	\N	Copies versus cognates in bound morphology	Johanson, Lars and Robbeets, Martine	71–97	\N	\N	\N	Leiden, Boston	\N	\N	\N	Brill’s Studies in Language, Cognition, and Culture	2	Brill	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
110	{"key": "Gardani 2021"}	base	gardani2021a	Gardani 2021	On how morphology spreads	\N	\N	\N	article	Gardani, Francesco	2021	On how morphology spreads	\N	\N	\N	129–147	\N	Word Structure	\N	\N	\N	\N	2	\N	14	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
111	{"key": "Gardani, Arkadiev, and Amiridze 2015"}	base	gardani2015a	Gardani et al. 2015	Borrowed morphology: an overview	\N	\N	\N	incollection	Gardani, Francesco and Arkadiev, Peter and Amiridze, Nino	2015	Borrowed morphology: an overview	\N	Borrowed Morphology	Gardani, Francesco and Arkadiev, Peter and Amiridze, Nino	1–23	\N	\N	\N	Berlin & Boston	\N	\N	\N	Language Contact and Bilingualism 8	\N	De Gruyter Mouton	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
112	{"key": "Genesin and Matzinger 2016"}	base	genesin2016a	Genesin and Matzinger 2016	Albanian	\N	\N	\N	incollection	Genesin, Monica and Matzinger, Joachim	2016	Albanian	\N	Word-formation. An international handbook of the languages of Europe	Müller, Peter O. and Ohnheiser, Ingeborg and Olsen, Susan and Rainer, Franz	3124–3137	\N	\N	\N	Berlin & Boston	\N	\N	\N	\N	5	De Gruyter Mouton	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
113	{"key": "G\\u00f6ksel and Kerslake 2005"}	base	goeksel2005a	Göksel and Kerslake 2005	Turkish: a comprehensive grammar	\N	\N	\N	book	Göksel, Aslı and Kerslake, Celia	2005	Turkish: a comprehensive grammar	\N	\N	\N	\N	\N	\N	\N	London, New York	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
114	{"key": "Gold 1998"}	base	gold1998a	Gold 1998	Yiddish and Hebrew: Borrowing through oral language contact	\N	\N	\N	inproceedings	Gold, Elaine	1998	Yiddish and Hebrew: Borrowing through oral language contact	\N	Historical linguistics 1997: Selected papers from the 13th international conference on historical linguistics, Düsseldorf	Schmid, Monika S. and Austin, Jennifer R. and Stein, Dieter	135–148	\N	\N	\N	Amsterdam	\N	\N	\N	\N	\N	John Benjamins	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
115	{"key": "Golovko and Vakhtin 1990"}	base	golovko1990a	Golovko and Vakhtin 1990	Aleut in contact: the Copper Island Aleut enigma	\N	\N	\N	article	Golovko, Evgenij V. and Vakhtin, Nikolai B.	1990	Aleut in contact: the Copper Island Aleut enigma	\N	\N	\N	97–125	\N	Acta Linguistica Hafniensia	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
116	{"key": "Gonz\\u00e1lez Casanova 1933"}	base	casanova1933a	González Casanova 1933	Los hispanismos en el idioma azteca	\N	\N	\N	article	González Casanova, Pablo	1933	Los hispanismos en el idioma azteca	\N	\N	\N	693–742	\N	Anales del Museo Nacional de México	\N	\N	\N	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
117	{"key": "Goswami and Tamuli 2003"}	base	goswami2003a	Goswami and Tamuli 2003	Asamiya	\N	\N	\N	incollection	Goswami, G.C. and Tamuli, Jyotiprakash	2003	Asamiya	\N	The Indo-Aryan languages	Cardona, George and Dhanesh, Jain	391–443	\N	\N	\N	London, New York	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
118	{"key": "Goulet 1971"}	base	goulet1971a	Goulet 1971	English, Spanish, and Tagalog: A study of grammatical, lexical, and cultural interference	\N	\N	\N	article	Goulet, Rosalina Morales	1971	English, Spanish, and Tagalog: A study of grammatical, lexical, and cultural interference	\N	\N	\N	\N	\N	Philippine Journal of Linguistics	\N	Manila	\N	Special Monograph Issue,	1	\N		Linguistic Society of the Philippines	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
119	{"key": "Grant 2010"}	base	grant2010a	Grant 2010	Contact-induced change beyond the lexicon: A comparison of some heavily borrowing languages	\N	\N	\N	misc	Grant, Anthony P.	2010	Contact-induced change beyond the lexicon: A comparison of some heavily borrowing languages	Paper.	\N	\N	\N	\N	\N	\N	Leipzig	\N	\N	\N	\N	\N	Max Planck Institute for Evolutionary Anthropology	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
120	{"key": "G\\u00fcldemann 1992"}	base	gueldemann1992a	Güldemann 1992	Ist Swahili eine monogenetische Einheit? - Betrachtungen aus der Sicht peripherer Varietäten unter besonderer Berücksichtigung der Verbalmorphologie	\N	\N	\N	article	Güldemann, Tom	1992	Ist Swahili eine monogenetische Einheit? - Betrachtungen aus der Sicht peripherer Varietäten unter besonderer Berücksichtigung der Verbalmorphologie	\N	\N	\N	35–62	\N	Afrikanische Arbeitspapiere. Schriftenreihe des Kölner Instituts für Afrikanistik	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
121	{"key": "G\\u00fcldemann 2003"}	base	gueldemann2003a	Güldemann 2003	Grammaticalization	\N	\N	\N	incollection	Güldemann, Tom	2003	Grammaticalization	\N	The Bantu languages	Nurse, Derek and Philippson, Gérard	182–194	\N	\N	\N	London	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
122	{"key": "Guti\\u00e9rrez-Morales 2005"}	base	morales2005a	Gutiérrez-Morales 2005	Kueteero where are you? The Spanish suffix –ero in Sierra Popoluca	\N	\N	\N	inproceedings	Gutiérrez-Morales, Salomé	2005	Kueteero where are you? The Spanish suffix –ero in Sierra Popoluca	\N	Proceedings from the 8th Workshop on American Indigenous Languages. Santa Barbara Papers in Linguistics	\N	42–49	\N	\N	\N	Santa Barbara	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
123	{"key": "Guti\\u00e9rrez-Morales 2008"}	base	morales2008a	Gutiérrez-Morales 2008	Borrowing and grammaticalization in Sierra Popoluca: The influence of Nahuatl and Spanish	\N	\N	\N	phdthesis	Gutiérrez-Morales, Salomé	2008	Borrowing and grammaticalization in Sierra Popoluca: The influence of Nahuatl and Spanish	\N	\N	\N	\N	\N	\N	University of California	Berkeley	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
124	{"key": "Guti\\u00e9rrez-Morales 2012"}	base	morales2012a	Gutiérrez-Morales 2012	Morphological borrowing in Sierra Popoluca	\N	\N	\N	incollection	Gutiérrez-Morales, Salomé	2012	Morphological borrowing in Sierra Popoluca	\N	Copies vs. cognates in bound morphology	Johanson, Lars and Robbeets, Martine	221–232	\N	\N	\N	Leiden	\N	\N	\N	Brill’s Studies in Language, Cognition and Culture	3	Brill	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
125	{"key": "Gutman 2015"}	base	gutman2015a	Gutman 2015	Some features of the Gaznax dialect (South-East Turkey)	\N	\N	\N	incollection	Gutman, Ariel	2015	Some features of the Gaznax dialect (South-East Turkey)	\N	Neo-Aramaic and its linguistic context	Khan, Geoffrey and Napiorkowska, Lidia	305–321	\N	\N	\N	Piscataway, NJ	\N	\N	\N	\N	\N	Gorgias Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
126	{"key": "Gutman 2018"}	base	gutman2018a	Gutman 2018	Attributive constructions in North-Eastern Neo-Aramaic	\N	\N	\N	book	Gutman, Ariel	2018	Attributive constructions in North-Eastern Neo-Aramaic	\N	\N	\N	\N	\N	\N	\N	Berlin	\N	\N	\N	\N	\N	Language Science Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
127	{"key": "Haase 1992"}	base	haase1992a	Haase 1992	Sprachkontakt und Sprachwandel im Baskenland: die Einflüsse des Gaskognischen und Französischen auf das Baskische	\N	\N	\N	book	Haase, Martin	1992	Sprachkontakt und Sprachwandel im Baskenland: die Einflüsse des Gaskognischen und Französischen auf das Baskische	\N	\N	\N	\N	\N	\N	\N	Hamburg	\N	\N	\N	\N	\N	Buske	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
128	{"key": "Hadzhieva et al. 2012"}	base	hadzhieva2012a	Hadzhieva et al. 2012	The suffix -či across languages: From the North Asian Pacific coast to the Albanian coasts of Adriatic Sea	\N	\N	\N	incollection	Hadzhieva, Krasimira and Ilieva, Lilia and Konedareva, Senem	2012	The suffix -či across languages: From the North Asian Pacific coast to the Albanian coasts of Adriatic Sea	\N	Abstract of a paper presented at IMM15 Vienna, 9–12 February 2012, Workshop on Borrowed Morphology Form and Meaning	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
129	{"key": "Haig 2007"}	base	haig2007a	Haig 2007	Grammatical borrowing in Kurdish (Northern Group)	\N	\N	\N	incollection	Haig, Geoffrey	2007	Grammatical borrowing in Kurdish (Northern Group)	\N	Grammatical borrowing in cross-linguistic perspective	Matras, Yaron and Sakel, Jeanette	165–183	\N	\N	\N	Berlin, New York	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
154	{"key": "Janse 2009b"}	base	janse2009b	Janse 2009	Greek-Turkish language contact in Asia Minor	\N	\N	\N	article	Janse, Mark	2009	Greek-Turkish language contact in Asia Minor	\N	\N	\N	37–54	\N	Études Helléniques/Hellenic Studies	\N	\N	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
130	{"key": "Hajek 2006"}	base	hajek2006a	Hajek 2006	Language contact and convergence in East Timor: The case of Tetun Dili	\N	\N	\N	incollection	Hajek, John	2006	Language contact and convergence in East Timor: The case of Tetun Dili	\N	Grammars in contact. A cross-linguistic typology	Aikhenvald, Alexandra Y. and Dixon, R.M.W.	163–178	\N	\N	\N	Oxford	\N	\N	\N	Explorations in Linguistic Typology	4	Oxford University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
131	{"key": "Hamde 1986"}	base	hamde1986a	Hamde 1986	The origin and development of Bilin	\N	\N	\N	book	Hamde, Kiflemariam	1986	The origin and development of Bilin	\N	\N	\N	\N	\N	\N	\N	Asmara	\N	\N	\N	\N	\N	Asmara University, The Institute of African Studies, Bilin Language Project	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
132	{"key": "Hann\\u00df 2008"}	base	hannss2008a	Hannß 2008	Uchumataqu. The lost language of the Urus of Bolivia. A grammatical description of the language as documented between 1894 and 1952	\N	\N	\N	book	Hannß, Katja	2008	Uchumataqu. The lost language of the Urus of Bolivia. A grammatical description of the language as documented between 1894 and 1952	\N	\N	\N	\N	\N	\N	\N	Leiden	\N	\N	\N	\N	\N	CNWS Publications	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
133	{"key": "Haspelmath 1993"}	base	haspelmath1993a	Haspelmath 1993	A grammar of Lezgian	\N	\N	\N	book	Haspelmath, Martin	1993	A grammar of Lezgian	\N	\N	\N	\N	\N	\N	\N	Berlin, New York	\N	\N	\N	Mouton Grammar Library 9	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
134	{"key": "Heath 1978a"}	base	heath1978a	Heath 1978	Linguistic diffusion in Arnhem Land	\N	\N	\N	book	Heath, Jeffrey	1978	Linguistic diffusion in Arnhem Land	\N	\N	\N	\N	\N	\N	\N	Canberra	\N	\N	\N	\N	\N	Australian Institute of Aboriginal Studies	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
135	{"key": "Heath 1978b"}	base	heath1978b	Heath 1978	Ngandi grammar, texts, and dictionary	\N	\N	\N	book	Heath, Jeffrey	1978	Ngandi grammar, texts, and dictionary	\N	\N	\N	\N	\N	\N	\N	Canberra	\N	\N	\N	\N	\N	Australian Institute of Aboriginal Studies	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
136	{"key": "Heath 1980a"}	base	heath1980a	Heath 1980	Basic materials in Warndarang: Grammar, texts and dictionary	\N	\N	\N	book	Heath, Jeffrey	1980	Basic materials in Warndarang: Grammar, texts and dictionary	\N	\N	\N	\N	\N	\N	\N	Canberra	\N	\N	\N	Pacific Linguistics. Series B, Monographs 72	\N	Australian National University	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
137	{"key": "Heath 1980b"}	base	heath1980b	Heath 1980	Basic materials in Ritharngu. Grammar, texts, and dictionary	\N	\N	\N	book	Heath, Jeffrey	1980	Basic materials in Ritharngu. Grammar, texts, and dictionary	\N	\N	\N	\N	\N	\N	\N	Canberra	\N	\N	\N	Pacific Linguistics. Series B, Monographs 59	\N	Deptartment of Linguistics	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
138	{"key": "Heath 1984"}	base	heath1984a	Heath 1984	Functional grammar of Nunggubuyu	\N	\N	\N	book	Heath, Jeffrey	1984	Functional grammar of Nunggubuyu	\N	\N	\N	\N	\N	\N	\N	Canberra	\N	\N	\N	\N	\N	Australian Institute of Aboriginal Studies	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
139	{"key": "Hildebrandt 2004"}	base	hildebrandt2004a	Hildebrandt 2004	A grammar and glossary of the Manange language	\N	\N	\N	book	Hildebrandt, Kristine A.	2004	A grammar and glossary of the Manange language	\N	\N	\N	\N	\N	\N	\N	Santa Barbara	\N	\N	\N	\N	\N	University of California	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
140	{"key": "Hildebrandt 2007"}	base	hildebrandt2007a	Hildebrandt 2007	Grammatical borrowing in Manage	\N	\N	\N	incollection	Hildebrandt, Kristine A.	2007	Grammatical borrowing in Manage	\N	Grammatical borrowing in cross-linguistic perspective	Matras, Yaron and Sakel, Jeanette	283–300	\N	\N	\N	Berlin, New York	\N	\N	\N	Empirical Approaches to Language Typology	38	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
141	{"key": "Hill and Hill 1986"}	base	hill1986a	Hill and Hill 1986	Speaking Mexicano: The dynamics of syncretic language in Central Mexico	\N	\N	\N	book	Hill, Jane H. and Hill, Kenneth C.	1986	Speaking Mexicano: The dynamics of syncretic language in Central Mexico	\N	\N	\N	\N	\N	\N	\N	Tucson	\N	\N	\N	\N	\N	University of Arizona Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
142	{"key": "Hoff 1986"}	base	hoff1986a	Hoff 1986	Evidentiality in Carib particles, affixes, and a variant of Wackernagel’s law	\N	\N	\N	article	Hoff, Berend J.	1986	Evidentiality in Carib particles, affixes, and a variant of Wackernagel’s law	\N	\N	\N	49–103	\N	Lingua	\N	\N	\N	\N	\N	\N	69	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
143	{"key": "Hualde and Urbina 2003"}	base	hualde2003	Hualde and Urbina (eds.) 2003	A grammar of Basque	\N	\N	\N	book	\N	2003	A grammar of Basque	\N	\N	Hualde, José Ignacio and Urbina, Jon Ortiz	\N	\N	\N	\N	Berlin, New York	\N	\N	\N	Mouton Grammar Library 26	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
144	{"key": "Hualde 2003a"}	base	hualde2003a	Hualde 2003	Derivation	\N	\N	\N	incollection	Hualde, José Ignacio	2003	Derivation	\N	A grammar of Basque	Hualde, José Ignacio and Urbina, Jon Ortiz	328–351	\N	\N	\N	Berlin, New York	\N	\N	\N	Mouton Grammar Library 26	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
145	{"key": "Hualde 2003b"}	base	hualde2003b	Hualde 2003	Segmental phonology	\N	\N	\N	incollection	Hualde, José Ignacio	2003	Segmental phonology	\N	A grammar of Basque	Hualde, José Ignacio and Urbina, Jon Ortiz	15–65	\N	\N	\N	Berlin, New York	\N	\N	\N	Mouton Grammar Library	26	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
146	{"key": "Hurren 1969"}	base	hurren1969a	Hurren 1969	Verbal aspect and archi-aspect in Istro-Rumanian	\N	\N	\N	article	Hurren, H.Antony	1969	Verbal aspect and archi-aspect in Istro-Rumanian	\N	\N	\N	59–90	\N	La Linguistique	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
147	{"key": "In\\u010diurait\\u0117-Noreikien\\u0117, Pakerys and Stund\\u017eia 2015"}	base	in2015a	Inčiuraitė-Noreikienė et al. 2015	On directly and indirectly borrowed verbal derivational affixes in Lithuanian	\N	\N	\N	incollection	Inčiuraitė-Noreikienė, Lina and Pakerys, Jurgis and Stundžia, Bonifacas	2015	On directly and indirectly borrowed verbal derivational affixes in Lithuanian	\N	Abstract of a paper presented at the 12th International Congress of Balticists	\N	\N	\N	\N	\N	Vilnius	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
148	{"key": "Itkin 2007"}	base	itkin2007a	Itkin 2007	Русская морфонология [Russian morphophonology	\N	\N	\N	book	Itkin, Ilya Borisovich	2007	Русская морфонология [Russian morphophonology	\N	\N	\N	\N	\N	\N	\N	Moscow	\N	\N	\N	\N	\N	Гнозис	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
149	{"key": "Jacobs 1939"}	base	jacobs1939a	Jacobs 1939	Coos narrative and ethnologic texts	\N	\N	\N	article	Jacobs, Melville	1939	Coos narrative and ethnologic texts	\N	\N	\N	1–126	\N	Anthropology	\N	\N	\N	\N	1	\N	8	University of Washington Publications	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
150	{"key": "Jacobs 1940"}	base	jacobs1940a	Jacobs 1940	Coos myth texts	\N	\N	\N	article	Jacobs, Melville	1940	Coos myth texts	\N	\N	\N	127–360	\N	University of Washington Publications in Anthropology	\N	\N	\N	\N	2	\N	8	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
151	{"key": "Jakub\\u00ed\\u010dek et al. 2013"}	base	jakub2013a	Jakubíček et al. 2013	The TenTen Corpus Family	\N	\N	\N	inproceedings	Jakubíček, Miloš and Kilgarriff, Adam and Kovář, Vojtěch and Rychlý, Pavel and Suchomel, Vít	2013	The TenTen Corpus Family	\N	7th International Corpus Linguistics Conference CL	\N	125–127	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
152	{"key": "Janhunen et al. 2008"}	base	janhunen2008a	Janhunen et al. 2008	Wutun	\N	\N	\N	book	Janhunen, Juha and Peltomaa, Marja and Sandman, Erika and Dongzhou, Xiawu	2008	Wutun	\N	\N	\N	\N	\N	\N	\N	Munich	\N	\N	\N	Language of the World/Materials 466	\N	LINCOM EUROPA	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
153	{"key": "Janse 2009a"}	base	janse2009a	Janse 2009	Agglutination and the psychology of double inflections in Cappadocian	\N	\N	\N	incollection	Janse, Mark	2009	Agglutination and the psychology of double inflections in Cappadocian	\N	Studies in Modern Greek dialects and linguistic theory	Janse, Mark and Joseph, Brian D. and Pavlou, Pavlos and Ralli, Angela	135–145	\N	\N	\N	Nicosia	\N	\N	\N	\N	\N	Research Center of the Holy Monastery of Kykkos	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
155	{"key": "Jastrow 1978"}	base	jastrow1978a	Jastrow 1978	Die mesopotamisch-arabischen Qəltu-Dialekte: Band 1: Phonologie und Morphologie	\N	\N	\N	book	Jastrow, Otto	1978	Die mesopotamisch-arabischen Qəltu-Dialekte: Band 1: Phonologie und Morphologie	\N	\N	\N	\N	\N	\N	\N	Wiesbaden	\N	\N	\N	Abhandlungen für die Kunde des Morgenlandes 43/4	\N	Steiner	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
156	{"key": "Jones 1984"}	base	jones1984a	Jones 1984	Loan-words in contemporary Indonesian	\N	\N	\N	incollection	Jones, Russel	1984	Loan-words in contemporary Indonesian	\N	Towards a description of contemporary Indonesian. Preliminary studies, Part II	Verhaar, John W.M.	1–38	\N	\N	\N	Jakarta	\N	\N	\N	NUSA Linguistic Studies of Indonesian and Other Languages of Indonesia	19	Universitas Atma Jaya	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
157	{"key": "Ka\\u0142u\\u017cy\\u0144ski 1962"}	base	ka1962a	Kałużyński 1962	Mongolische Elemente in der jakutischen Sprache	\N	\N	\N	book	Kałużyński, Stanisław	1962	Mongolische Elemente in der jakutischen Sprache	\N	\N	\N	\N	\N	\N	\N	Warsaw, ’s-Gravenhage	\N	\N	\N	\N	\N	Państwowe Wydawnictwo Naukowe, Mouton & Co	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
158	{"key": "Kangasmaa-Minn 1998"}	base	kangasmaa_minn1998a	Kangasmaa-Minn 1998	Mari	\N	\N	\N	incollection	Kangasmaa-Minn, Eeva	1998	Mari	\N	The Uralic languages	Abondolo, Daniel	219–248	\N	\N	\N	London	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
159	{"key": "Khan 2007"}	base	khan2007a	Khan 2007	Grammatical borrowing in North-eastern Neo-Aramaic	\N	\N	\N	incollection	Khan, Geoffrey	2007	Grammatical borrowing in North-eastern Neo-Aramaic	\N	Grammatical borrowing in cross-linguistic perspective	Matras, Yaron and Sakel, Jeannette	197–214	\N	\N	\N	Berlin, New York	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
160	{"key": "Kim 2003"}	base	kim2003a	Kim 2003	Santa	\N	\N	\N	incollection	Kim, Stephen S.	2003	Santa	\N	The Mongolic languages	Janhunen, Juha	346–363	\N	\N	\N	London	\N	\N	\N	Routledge Language Family Series	5	Routledge Curzon	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
161	{"key": "Kinkade et al. 1998"}	base	kinkade1998a	Kinkade et al. 1998	Languages	\N	\N	\N	incollection	Kinkade, M.Dale and Elmendorf, William W. and Rigsby, Bruce and Aoki, Haruo	1998	Languages	\N	Handbook of North American Indians	Walker, Jr, Edward E.	49–72	\N	\N	\N	Washington, DC	\N	\N	\N	\N	12: Plateau	Smithsonian Institution	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
162	{"key": "Knowles 1984"}	base	knowles1984a	Knowles 1984	A descriptive grammar of Chontal Maya (San Carlos dialect)	\N	\N	\N	book	Knowles, Susan Marie	1984	A descriptive grammar of Chontal Maya (San Carlos dialect)	\N	\N	\N	\N	\N	\N	\N	New Orleans	\N	\N	\N	\N	\N	Tulane University PhD thesis	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
163	{"key": "Korkina et al. 1982"}	base	korkina1982a	Korkina et al. 1982	Grammatika sovremennogo jakutskogo literaturnogo jazyka. Fonetika i morfologija	\N	\N	\N	book	Korkina, Evdokija I. and Ubrjatova, Elizaveta I. and Xaritonov, L.N. and Petrov, N.E.	1982	Grammatika sovremennogo jakutskogo literaturnogo jazyka. Fonetika i morfologija	\N	\N	\N	\N	\N	\N	\N	Moscow	\N	\N	\N	\N	\N	Izdatel’stvo ‛Nauka’	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
164	{"key": "Kornfilt 1997"}	base	kornfilt1997a	Kornfilt 1997	Turkish	\N	\N	\N	book	Kornfilt, Jaklin	1997	Turkish	\N	\N	\N	\N	\N	\N	\N	London, New York	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
165	{"key": "Kossmann 2007"}	base	kossmann2007a	Kossmann 2007	Grammatical borrowing in Tasawaq	\N	\N	\N	incollection	Kossmann, Maarten	2007	Grammatical borrowing in Tasawaq	\N	Grammatical borrowing in cross-linguistic perspective	Matras, Yaron and Sakel, Jeannette	75–90	\N	\N	\N	Berlin, New York	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
166	{"key": "Kossmann 2008"}	base	kossmann2008a	Kossmann 2008	On the nature of borrowing in Cypriot Arabic	\N	\N	\N	article	Kossmann, Maarten	2008	On the nature of borrowing in Cypriot Arabic	\N	\N	\N	5–24	\N	Zeitschrift für Arabische Linguistik	\N	\N	\N	\N	\N	\N	49	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
167	{"key": "Kossmann 2011"}	base	kossmann2011a	Kossmann 2011	On inflectional borrowing	\N	\N	\N	incollection	Kossmann, Maarten	2011	On inflectional borrowing	\N	Rethinking Contact Induced Change	\N	\N	\N	\N	\N	Leiden	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
168	{"key": "Koul 2005"}	base	koul2005a	Koul 2005	Studies in Kashmiri linguistics	\N	\N	\N	book	Koul, Omkar N.	2005	Studies in Kashmiri linguistics	\N	\N	\N	\N	\N	\N	\N	Delhi	\N	\N	\N	\N	\N	Indian Institute of Language Studies	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
169	{"key": "Kova\\u010dec 1971"}	base	kova1971a	Kovačec 1971	Descrierea istroromânei actuale	\N	\N	\N	book	Kovačec, August	1971	Descrierea istroromânei actuale	\N	\N	\N	\N	\N	\N	\N	Bucarest	\N	\N	\N	\N	\N	Editura Academiei Republicii Socialiste România	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
170	{"key": "Kozhanov 2013"}	base	kozhanov2013a	Kozhanov 2013	История изучения глагольных префиксов в литовском языке. I [The history of the studies of verbal prefixes in Lithuanian	\N	\N	\N	misc	Kozhanov, Kirill	2013	История изучения глагольных префиксов в литовском языке. I [The history of the studies of verbal prefixes in Lithuanian	\N	\N	\N	70–79	\N	\N	\N	\N	\N	\N	\N	\N	I]. Славноведение 3	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
171	{"key": "Kozhanov 2014"}	base	kozhanov2014a	Kozhanov 2014	Priešdėlio da- semantika lietuvių kalboje [Semantics of the prefix da- in Lithuanian	\N	\N	\N	incollection	Kozhanov, Kirill	2014	Priešdėlio da- semantika lietuvių kalboje [Semantics of the prefix da- in Lithuanian	\N	Baltai ir slavai: dvasinių kultūrų sankirtos [The Balts and the Slavs: Intersections of spiritual cultures	Civjan, T. and Zavjalova, M. and Judžentis, A.	254–274	\N	\N	\N	Vilnius	\N	\N	\N	\N	\N	Versmė	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
172	{"key": "Kruspe 2004"}	base	kruspe2004a	Kruspe 2004	A grammar of Semelai	\N	\N	\N	book	Kruspe, Nicole	2004	A grammar of Semelai	\N	\N	\N	\N	\N	\N	\N	Cambridge	\N	\N	\N	\N	\N	Cambridge University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
173	{"key": "Kubiyak 2004"}	base	kubiyak2004a	Kubiyak 2004	Rückläufiges Wörterbuch des Türkischen	\N	\N	\N	book	Kubiyak, Yel	2004	Rückläufiges Wörterbuch des Türkischen	\N	\N	\N	\N	\N	\N	\N	Frankfurt am Main	\N	\N	\N	\N	\N	Landeck	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
174	{"key": "Laanest 1982"}	base	laanest1982a	Laanest 1982	Einführung in die ostseefinnischen Sprachen	\N	\N	\N	book	Laanest, Arvo	1982	Einführung in die ostseefinnischen Sprachen	\N	\N	\N	\N	\N	\N	\N	Hamburg	\N	\N	\N	\N	\N	Buske	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
175	{"key": "L\\u00ea 2002"}	base	l2002a	Lê 2002	Từ Vựng Gốc Hán Trong Tiếng Việt	\N	\N	\N	misc	Lê, Đình Khẩn	2002	Từ Vựng Gốc Hán Trong Tiếng Việt	\N	\N	\N	\N	\N	\N	\N	\N	\N	Ho Chi Minh City: Đại Học Quốc Gia.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
176	{"key": "Lee-Smith 1996"}	base	lee_smith1996a	Lee-Smith 1996	The Hezhou language	\N	\N	\N	book	Lee-Smith, Mei W.	1996	The Hezhou language	\N	\N	Wurm, Stephen A. and Mühlhäusler, Peter and Tryon, Darrell T.	865–874	\N	\N	\N	Berlin, New York	\N	\N	\N	Trends in Linguistics, Documentation Series	2, Part 1	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
177	{"key": "Lee-Smith and Wurm 1996"}	base	lee_smith1996b	Lee-Smith and Wurm 1996	The Wutun language	\N	\N	\N	book	Lee-Smith, Mei W. and Wurm, Stephen A.	1996	The Wutun language	\N	\N	Wurm, Stephen A. and Mühlhäusler, Peter and Tryon, Darrell T.	883–897	\N	\N	\N	Berlin, New York	\N	\N	\N	Trends in Linguistics, Documentation Series	2, Part 1	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
178	{"key": "Lewis 2007"}	base	lewis2007a	Lewis 2007	The -ing suffix in French. University of North Dakota MA thesis	\N	\N	\N	misc	Lewis, Joëlle	2007	The -ing suffix in French. University of North Dakota MA thesis	\N	\N	\N	\N	\N	\N	\N	\N	https://commons.und.edu/cgi/viewcontent.cgi?article=5480&context=theses	accessed: 02.04.2024).	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
179	{"key": "Li 1984"}	base	li1984a	Li 1984	From verb-medial analytic language to verb-final synthetic language: A case of typological change	\N	\N	\N	inproceedings	Li, Charles N.	1984	From verb-medial analytic language to verb-final synthetic language: A case of typological change	\N	Proceedings of the Tenth Annual Meeting of the Berkeley Linguistics Society	Brugman, Claudia and Macauley, Monica and Dahlstrom, Amy and Emanatian, Michele and Moonwomon, Birch and O’Connor, Catherine	307–323	\N	\N	\N	Berkeley	\N	\N	\N	\N	\N	Berkeley Linguistics Society	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
180	{"key": "Lipi\\u0144ski 1997"}	base	lipi1997a	Lipiński 1997	Semitic languages. Outline of a comparative grammar	\N	\N	\N	book	Lipiński, Edward	1997	Semitic languages. Outline of a comparative grammar	\N	\N	\N	\N	\N	\N	\N	Leuven	\N	\N	\N	Orientalia Lovaniensia Analecta 80	\N	Peeters, Departement Oosterse Studies	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
181	{"key": "Loporcaro 2018"}	base	loporcaro2018a	Loporcaro 2018	Gender from Latin to Romance: History, geography, typology	\N	\N	\N	book	Loporcaro, Michele	2018	Gender from Latin to Romance: History, geography, typology	\N	\N	\N	\N	\N	\N	\N	Oxford	\N	\N	\N	\N	\N	Oxford University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
182	{"key": "Loporcaro, Gardani and Giudici 2021"}	base	loporcaro2021a	Loporcaro et al. 2021	Contact-induced complexification in the gender system of Istro-Romanian	\N	\N	\N	article	Loporcaro, Michele and Gardani, Francesco and Giudici, Alberto	2021	Contact-induced complexification in the gender system of Istro-Romanian	\N	\N	\N	72–126	\N	Journal of Language Contact	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
183	{"key": "Lorenzo 1996"}	base	lorenzo1996a	Lorenzo 1996	Anglicismos hispánicos	\N	\N	\N	book	Lorenzo, Emilio	1996	Anglicismos hispánicos	\N	\N	\N	\N	\N	\N	\N	Madrid	\N	\N	\N	\N	\N	Gredos	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
184	{"key": "M\\u00e4giste 1968"}	base	maegiste1968a	Mägiste 1968	Suffixentlehnung in den finnisch-ugrischen Sprachen, insbesondere aus dem Russischen	\N	\N	\N	article	Mägiste, Julius	1968	Suffixentlehnung in den finnisch-ugrischen Sprachen, insbesondere aus dem Russischen	\N	\N	\N	1–30	\N	Journal de la Societé Finno-Ougrienne/Suomalais-ugrilaisen Seuran Aikakauskirja	\N	\N	\N	\N	\N	\N	69	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
185	{"key": "Magni 2017"}	base	magni2017a	Magni 2017	Suffix borrowing and conflict through Latin-Greek hybrid formations	\N	\N	\N	article	Magni, Elisabetta	2017	Suffix borrowing and conflict through Latin-Greek hybrid formations	\N	\N	\N	283–292	\N	Pallas. Revue d’études antiques	\N	\N	\N	\N	\N	\N	103	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
186	{"key": "Maisak 2019"}	base	maisak2019a	Maisak 2019	Borrowing from an unrelated language in support of intragenetic tendencies. The case of the conditional clitic =sa in Udi	\N	\N	\N	article	Maisak, Timur	2019	Borrowing from an unrelated language in support of intragenetic tendencies. The case of the conditional clitic =sa in Udi	\N	\N	\N	337–383	\N	Diachronica	\N	\N	\N	\N	3	\N	36	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
187	{"key": "Maisak 2023"}	base	maisak2023a	Maisak 2023	The Udi language: Its history and modern development	\N	\N	\N	article	Maisak, Timur	2023	The Udi language: Its history and modern development	\N	\N	\N	55–72	\N	Tehlikedeki Diller Dergisi	\N	\N	\N	\N	22	\N	13	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
188	{"key": "Majt\\u00e9nyi 2012"}	base	majt2012a	Majtényi 2012	The productivity of the prefix über- in English and Hungarian: A cross-linguistic, corpus-based study	\N	\N	\N	article	Majtényi, Melinda	2012	The productivity of the prefix über- in English and Hungarian: A cross-linguistic, corpus-based study	\N	\N	\N	244–261	\N	Argumentum	\N	\N	\N	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
189	{"key": "Malchukov 2003"}	base	malchukov2003a	Malchukov 2003	Russian interference in Tungusic languages in an areal-typological perspective	\N	\N	\N	incollection	Malchukov, Andrej L.	2003	Russian interference in Tungusic languages in an areal-typological perspective	\N	Convergence and divergence of European languages	Ureland, Sture	235–251	\N	\N	\N	Berlin	\N	\N	\N	Studies in Eurolinguistics	1	Logos Verlag	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
190	{"key": "Malchukov 2006"}	base	malchukov2006a	Malchukov 2006	Yakut interference in North Tungusic languages	\N	\N	\N	incollection	Malchukov, Andrej L.	2006	Yakut interference in North Tungusic languages	\N	Turkic languages in contact	Boeschoten, Hendrik and Johanson, Lars	122–138	\N	\N	\N	Wiesbaden	\N	\N	\N	\N	Turcologica 61	Harrassowitz	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
191	{"key": "Mart\\u00ednez Cruz 2007"}	base	cruz2007a	Martínez Cruz 2007	Los adjetivos y los conceptos de propiedad en chol. México: CIESAS MA thesis	\N	\N	\N	misc	Martínez Cruz, Victoriano	2007	Los adjetivos y los conceptos de propiedad en chol. México: CIESAS MA thesis	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
192	{"key": "Masica 1991"}	base	masica1991a	Masica 1991	The Indo-Aryan languages	\N	\N	\N	book	Masica, Colin P.	1991	The Indo-Aryan languages	\N	\N	\N	\N	\N	\N	\N	Cambridge	\N	\N	\N	\N	\N	Cambridge University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
193	{"key": "Masliyah 1996"}	base	masliyah1996a	Masliyah 1996	Four Turkish affixes in Iraqi Arabic: -li, -lik, -siz and -çi	\N	\N	\N	article	Masliyah, Sadok	1996	Four Turkish affixes in Iraqi Arabic: -li, -lik, -siz and -çi	\N	\N	\N	291–300	\N	Journal of Semitic Studies	\N	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
194	{"key": "Matras 2007"}	base	matras2007a	Matras 2007	The borrowability of structural categories	\N	\N	\N	incollection	Matras, Yaron	2007	The borrowability of structural categories	\N	Grammatical borrowing in cross-linguistic perspective	Matras, Yaron and Sakel, Jeanette	31–73	\N	\N	\N	Berlin, New York	\N	\N	\N	Empirical Approaches to Language Typology	38	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
195	{"key": "Matras 2009"}	base	matras2009a	Matras 2009	Language contact	\N	\N	\N	book	Matras, Yaron	2009	Language contact	\N	\N	\N	\N	\N	\N	\N	Cambridge	\N	\N	\N	\N	\N	Cambridge University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
196	{"key": "Matushansky 2023"}	base	matushansky2023a	Matushansky 2023	Three puzzles in Russian feminine formation	\N	\N	\N	incollection	Matushansky, Ora	2023	Three puzzles in Russian feminine formation	\N	Zentrum Allgemeine Sprachwissenschaft (ZAS)	\N	\N	\N	\N	\N	Berlin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
197	{"key": "McConvell and Meakins 2005"}	base	mcconvell2005a	McConvell and Meakins 2005	Gurindji Kriol: A mixed language emerges from code-switching	\N	\N	\N	article	McConvell, Patrick and Meakins, Felicity	2005	Gurindji Kriol: A mixed language emerges from code-switching	\N	\N	\N	9–30	\N	Australian Journal of Linguistics	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
198	{"key": "Meakins 2007"}	base	meakins2007a	Meakins 2007	Case-marking in contact: the development and function of case morphology in Gurindji Kriol, an Australian mixed language	\N	\N	\N	book	Meakins, Felicity	2007	Case-marking in contact: the development and function of case morphology in Gurindji Kriol, an Australian mixed language	\N	\N	\N	\N	\N	\N	\N	Melbourne	\N	\N	\N	\N	\N	University of Melbourne PhD thesis	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
199	{"key": "Meakins 2011"}	base	meakins2011a	Meakins 2011	Borrowing contextual inflection: evidence from northern Australia	\N	\N	\N	article	Meakins, Felicity	2011	Borrowing contextual inflection: evidence from northern Australia	\N	\N	\N	57–87	\N	Morphology	\N	\N	\N	\N	1	\N	21	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
200	{"key": "Memoglu-S\\u00fcleymanoglu 2006"}	base	memoglu_sueleymanoglu2006a	Memoglu-Süleymanoglu 2006	Türkçenin ters siklik sözlügü	\N	\N	\N	book	Memoglu-Süleymanoglu, Hayriye	2006	Türkçenin ters siklik sözlügü	\N	\N	\N	\N	\N	\N	\N	Ankara	\N	\N	\N	\N	\N	Kurmay	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
201	{"key": "M\\u00e9traux 1935"}	base	m1935a	Métraux 1935	Contribution à l’ethnographie et à la linguistique des indiens Uro d’Ancoaqui (Bolivie)	\N	\N	\N	article	Métraux, Alfred	1935	Contribution à l’ethnographie et à la linguistique des indiens Uro d’Ancoaqui (Bolivie)	\N	\N	\N	75–110	\N	Journal de la Société des Américanistes	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
202	{"key": "Metzger 1998"}	base	metzger1998a	Metzger 1998	The morpheme KA- of Carapana (Tucanoan). SIL Electronic Working Papers	\N	\N	\N	misc	Metzger, Ronald G.	1998	The morpheme KA- of Carapana (Tucanoan). SIL Electronic Working Papers	\N	\N	\N	\N	\N	\N	\N	\N	https://www.sil.org/system/files/reapdata/15/16/32/151632814343326471746034728483510272797/SILEWP1998_003.pdf	accessed: 08.07.2025).	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
203	{"key": "Mishra 1996"}	base	mishra1996a	Mishra 1996	Word formation and language change in Kuṛux	\N	\N	\N	book	Mishra, Awadhesh K.	1996	Word formation and language change in Kuṛux	\N	\N	\N	\N	\N	\N	\N	Varanasi	\N	\N	\N	\N	\N	Tara Book Agency	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
204	{"key": "Mithun 2000"}	base	mithun2000a	Mithun 2000	Ergativity and language contact on the Oregon coast: Alsea, Siuslaw & Coos	\N	\N	\N	inproceedings	Mithun, Marianne	2000	Ergativity and language contact on the Oregon coast: Alsea, Siuslaw & Coos	\N	Proceedings of the Berkeley Linguistics Society	\N	77–95	\N	\N	\N	Berkeley	\N	\N	\N	\N	\N	Berkeley Linguistics Society	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
205	{"key": "Miyaoka 2012"}	base	miyaoka2012a	Miyaoka 2012	A grammar of central Alaskan Yupik (CAY)	\N	\N	\N	book	Miyaoka, Osahito	2012	A grammar of central Alaskan Yupik (CAY)	\N	\N	\N	\N	\N	\N	\N	Berlin, New York	\N	\N	\N	Mouton Grammar Library 58	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
206	{"key": "M\\u00f6hlig 1986"}	base	moehlig1986a	Möhlig 1986	Aspects of the language history of the Ilwana: Former hunter-gatherers of the Central Tana Valley in Kenya	\N	\N	\N	article	Möhlig, Wilhelm Johann Georg	1986	Aspects of the language history of the Ilwana: Former hunter-gatherers of the Central Tana Valley in Kenya	\N	\N	\N	273–293	\N	Sprache und Geschichte in Afrika	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
207	{"key": "Mott 2015"}	base	mott2015a	Mott 2015	The rise of the English -ing form in Modern Spanish: A source of pseudo-Anglicisms	\N	\N	\N	book	Mott, Brian	2015	The rise of the English -ing form in Modern Spanish: A source of pseudo-Anglicisms	\N	\N	Furiassi, Cristiano and Gottlieb, Henrik and Pseudo-English	175–196	\N	\N	\N	Berlin	\N	\N	\N	\N	\N	De Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
208	{"key": "Mueller 2007"}	base	mueller2007a	Mueller 2007	Indonesian morphology	\N	\N	\N	incollection	Mueller, Franz	2007	Indonesian morphology	\N	Morphologies of Asia and Africa, 1207–1233	Kaye, Alan S.	\N	\N	\N	\N	Winona Lake	\N	\N	\N	\N	\N	Eisenbrauns	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
209	{"key": "Mujika 1982"}	base	mujika1982a	Mujika 1982	Latina eta erromanikoaren eragina euskaran. Euskal lexikoaren azterketa bideetan	\N	\N	\N	book	Mujika, Luis Mari	1982	Latina eta erromanikoaren eragina euskaran. Euskal lexikoaren azterketa bideetan	\N	\N	\N	\N	\N	\N	\N	Donostia	\N	\N	\N	\N	\N	Sendoa Argitaldaria	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
210	{"key": "Muysken 2005"}	base	muysken2005a	Muysken 2005	El idioma Uchumataqu. Irohito: Distrito Nacionalidad Indígena	\N	\N	\N	book	Muysken, Pieter	2005	El idioma Uchumataqu. Irohito: Distrito Nacionalidad Indígena	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Urus de Irohito	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
211	{"key": "Muysken 2012"}	base	muysken2012a	Muysken 2012	Spanish affixes in the Quechua languages: A multidimensional perspective	\N	\N	\N	article	Muysken, Pieter	2012	Spanish affixes in the Quechua languages: A multidimensional perspective	\N	\N	\N	481–493	\N	Lingua	\N	\N	\N	\N	\N	\N	122	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
212	{"key": "Myers-Scotton 2002"}	base	myers_scotton2002a	Myers-Scotton 2002	Contact Linguistics. Bilingual Encounters and Grammatical Outcomes	\N	\N	\N	book	Myers-Scotton, Carol	2002	Contact Linguistics. Bilingual Encounters and Grammatical Outcomes	\N	\N	\N	\N	\N	\N	\N	Oxford	\N	\N	\N	\N	\N	Oxford University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
213	{"key": "Myers-Scotton 2007"}	base	myers_scotton2007a	Myers-Scotton 2007	Language Contact: Why Outsider System Morphemes Resist Transfer	\N	\N	\N	article	Myers-Scotton, Carol	2007	Language Contact: Why Outsider System Morphemes Resist Transfer	\N	\N	\N	21–41	\N	Journal of Language Contact - THEMA	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
214	{"key": "Myreeva 1964"}	base	myreeva1964a	Myreeva 1964	Očerk govora učurskix ėvenkov	\N	\N	\N	incollection	Myreeva, Anna N.	1964	Očerk govora učurskix ėvenkov	\N	Očerki učurskogo, majskogo i tottinskogo govorov	Romanova, Angnija V. and Myreeva, Anna N.	6–74	\N	\N	\N	Moscow, Leningrad	\N	\N	\N	\N	\N	Izdatel’stvo “Nauka.”	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
215	{"key": "Nagano and Shimada 2018"}	base	nagano2018a	Nagano and Shimada 2018	Affix borrowing and structural borrowing in Japanese word-formation	\N	\N	\N	article	Nagano, Akiko and Shimada, Masaharu	2018	Affix borrowing and structural borrowing in Japanese word-formation	\N	\N	\N	60–84	\N	SKASE Journal of Theoretical Linguistics	\N	\N	http://www.skase.sk/Volumes/JTL37/pdf_doc/04.pdf	accessed: 10.06.2024).	2	\N	15	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
216	{"key": "Nater 2000"}	base	nater2000a	Nater 2000	On the origin of Bella Coola /-uks/	\N	\N	\N	article	Nater, Hank	2000	On the origin of Bella Coola /-uks/	\N	\N	\N	137–139	\N	International Journal of American Linguistics	\N	\N	\N	\N	1	\N	66	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
217	{"key": "Nater 2010"}	base	nater2010a	Nater 2010	Bella Coola /-uks/: Diffusion from distant sources	\N	\N	\N	book	Nater, Hank	2010	Bella Coola /-uks/: Diffusion from distant sources	\N	\N	Beck, David	72–78	\N	\N	\N	Bellingham, WA	\N	\N	\N	Whatcom Museum Publications	21	Whatcom Museum Publications	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
218	{"key": "Nau and Arkadiev 2015"}	base	nau2015a	Nau and Arkadiev 2015	Towards a standard of glossing Baltic languages: The Salos glossing rules	\N	\N	\N	article	Nau, Nicole and Arkadiev, Peter	2015	Towards a standard of glossing Baltic languages: The Salos glossing rules	\N	\N	\N	195–241	\N	Baltic Linguistics	\N	\N	\N	\N	\N	\N	6	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
219	{"key": "Newton 1964"}	base	newton1964a	Newton 1964	An Arabic-Greek Dialect	\N	\N	\N	article	Newton, Brian	1964	An Arabic-Greek Dialect	\N	\N	Austerlitz, Robert	43–52	\N	Papers in memory of George	\N	New York	\N	\N	3)	\N	20	Linguistic Circle of New York	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
220	{"key": "Ni\\u015fanyan 2009"}	base	ni2009a	Nişanyan 2009	Sözlerin soyagaci. Çagdas Türkçenin etimolojik sözlügü	\N	\N	\N	misc	Nişanyan, Sevan	2009	Sözlerin soyagaci. Çagdas Türkçenin etimolojik sözlügü	\N	\N	\N	\N	\N	\N	\N	Cagaloglu, Istanbul	http://www.nisanyansozluk.com/	accessed: 14.10.2025).	\N	\N	\N	Everest Yayinlari	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
221	{"key": "Noonan and Bhulanja 2005"}	base	noonan2005a	Noonan and Bhulanja 2005	Chantyal discourses	\N	\N	\N	article	Noonan, Michael and Bhulanja, Ram Prasad	2005	Chantyal discourses	\N	\N	\N	1–254	\N	Himalayan Linguistics Archive	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
222	{"key": "Noonan 1996"}	base	noonan1996a	Noonan 1996	The rise and fall of the Chantyal language	\N	\N	\N	article	Noonan, Michael	1996	The rise and fall of the Chantyal language	\N	\N	\N	121–136	\N	Southwest Journal of Linguistics	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
223	{"key": "Noonan 2003"}	base	noonan2003a	Noonan 2003	Chantyal	\N	\N	\N	incollection	Noonan, Michael	2003	Chantyal	\N	The Sino-Tibetan languages	Thurgood, Graham and LaPolla, Randy J.	315–335	\N	\N	\N	London	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
224	{"key": "Noonan 2008"}	base	noonan2008a	Noonan 2008	Contact-induced change. The case of Tamangic languages	\N	\N	\N	incollection	Noonan, Michael	2008	Contact-induced change. The case of Tamangic languages	\N	Language contact and contact languages	Siemund, Peter and Kintana, Noemi	81–106	\N	\N	\N	Amsterdam, Philadelphia	\N	\N	\N	Hamburg Studies on Multilingualism 7	\N	John Benjamins	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
225	{"key": "Nordhoff 2013"}	base	nordhoff2013a	Nordhoff 2013	The current state of Sri Lanka Portuguese	\N	\N	\N	article	Nordhoff, Sebastian	2013	The current state of Sri Lanka Portuguese	\N	\N	\N	425–434	\N	Journal of Pidgin and Creole Languages	\N	\N	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
226	{"key": "O\\u2019Hagan 2011"}	base	o2011a	O’Hagan 2011	Proto-Omagua-Kokama: grammatical sketch and prehistory	\N	\N	\N	misc	O’Hagan, Zachary J.	2011	Proto-Omagua-Kokama: grammatical sketch and prehistory	\N	\N	\N	\N	\N	\N	\N	Berkeley	http://www.escholarship.org/uc/item/1vx978rq	accessed: 14.10.2025).	\N	\N	\N	University of California Honors thesis	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
227	{"key": "O\\u2019Hagan 2022"}	base	o2022a	O’Hagan 2022	Nominalizers in Caquinte	\N	\N	\N	incollection	O’Hagan, Zachary	2022	Nominalizers in Caquinte	\N	Societas Linguistica Europaea	\N	\N	\N	\N	\N	Bucharest	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
228	{"key": "Orel 1998"}	base	orel1998a	Orel 1998	Albanian etymological dictionary	\N	\N	\N	book	Orel, Vladimir E.	1998	Albanian etymological dictionary	\N	\N	\N	\N	\N	\N	\N	Leiden	\N	\N	\N	\N	\N	Brill	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
229	{"key": "Pakendorf 2009"}	base	pakendorf2009a	Pakendorf 2009	Intensive contact and the copying of paradigms. An Ėven dialect in contact with Sakha (Yakut)	\N	\N	\N	article	Pakendorf, Brigitte	2009	Intensive contact and the copying of paradigms. An Ėven dialect in contact with Sakha (Yakut)	\N	\N	\N	85–110	\N	Journal of Language Contact – VARIA	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
230	{"key": "Pakendorf 2010"}	base	pakendorf2010a	Pakendorf 2010	Copied morphemes in Sakha and Ėven – a comparison	\N	\N	\N	inproceedings	Pakendorf, Brigitte	2010	Copied morphemes in Sakha and Ėven – a comparison	\N	workshop Bound morphology in common: copy or cognate?, 43rd Annual Meeting of the Societas Linguistica Europaea	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Vilnius University	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
231	{"key": "Pakendorf 2012"}	base	pakendorf2012a	Pakendorf 2012	A comparison of copied morphemes in Sakha (Yakut) and Ėven	\N	\N	\N	misc	Pakendorf, Brigitte	2012	A comparison of copied morphemes in Sakha (Yakut) and Ėven	\N	\N	\N	\N	\N	\N	\N	Lyon, ms	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
232	{"key": "Palmer 2009"}	base	palmer2009a	Palmer 2009	Borrowings, derivational morphology, and perceived productivity in English, 1300-1600	\N	\N	\N	book	Palmer, Chris C.	2009	Borrowings, derivational morphology, and perceived productivity in English, 1300-1600	\N	\N	\N	\N	\N	\N	\N	Ann Arbor	\N	\N	\N	\N	\N	University of Michigan PhD thesis	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
233	{"key": "Parker Jones 2009"}	base	parker2009a	Parker Jones 2009	Loanwords in Hawaiian	\N	\N	\N	incollection	Parker Jones, ‘Ōiwi.	2009	Loanwords in Hawaiian	\N	Loanwords in the world’s languages. A comparative handbook	Haspelmath, Martin and Tadmor, Uri	771–789	\N	\N	\N	Berlin	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
234	{"key": "Pasch 1988"}	base	pasch1988a	Pasch 1988	Die Entlehnung von Bantu-Präfixen in eine Nichtbantu-Sprache	\N	\N	\N	article	Pasch, Helma	1988	Die Entlehnung von Bantu-Präfixen in eine Nichtbantu-Sprache	\N	\N	\N	48–63	\N	Zeitschrift für Phonetik, Sprachwissenschaft und Kommunikationsforschung	\N	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
235	{"key": "Pet 2011"}	base	pet2011a	Pet 2011	A grammar sketch and lexicon of Arawak (Lokono Dian)	\N	\N	\N	misc	Pet, Willem J.A.	2011	A grammar sketch and lexicon of Arawak (Lokono Dian)	(SIL e-Books 30).	\N	\N	\N	\N	\N	\N	Dallas, Texas	https://www.sil.org/resources/archives/43236	accessed: 14.10.2025).	\N	\N	\N	SIL International	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
236	{"key": "Peters 1983"}	base	peters1983a	Peters 1983	Mittelniederdeutsche Sprache	\N	\N	\N	incollection	Peters, Robert	1983	Mittelniederdeutsche Sprache	\N	Niederdeutsch. Sprache und Literatur I	Goossens, Jan	66–115	\N	\N	\N	Neumünster	\N	\N	\N	\N	\N	Karl-Wachholtz Verlag	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
237	{"key": "Peterson 2011"}	base	peterson2011a	Peterson 2011	A grammar of Kharia: A South Munda language	\N	\N	\N	book	Peterson, John	2011	A grammar of Kharia: A South Munda language	\N	\N	\N	\N	\N	\N	\N	Leiden, Boston	\N	\N	\N	Brill’s Studies in South and Southwest Asian Languages 1	\N	Brill	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
238	{"key": "Phan 2013"}	base	phan2013a	Phan 2013	Lacquered words: The evolution of Vietnamese under Sinitic influences from the 1st century BCE through the 17th century CE	\N	\N	\N	misc	Phan, John Duong	2013	Lacquered words: The evolution of Vietnamese under Sinitic influences from the 1st century BCE through the 17th century CE	Cornell University PhD thesis.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
239	{"key": "Polanska 2002"}	base	polanska2002a	Polanska 2002	Zum Einfluss des Lettischen auf das Deutsche im Baltikum	\N	\N	\N	book	Polanska, Ineta	2002	Zum Einfluss des Lettischen auf das Deutsche im Baltikum	\N	\N	\N	\N	\N	\N	\N	Bamberg	\N	\N	\N	\N	\N	Otto-Friedrich-Universität Bamberg PhD thesis	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
240	{"key": "Post 2006"}	base	post2006a	Post 2006	The Northern Russian pragmatic particle dak in the dialect of Varzuga (Kola Peninsula). An information structuring device in informal spontaneous speech	\N	\N	\N	phdthesis	Post, Margje	2006	The Northern Russian pragmatic particle dak in the dialect of Varzuga (Kola Peninsula). An information structuring device in informal spontaneous speech	\N	\N	\N	\N	\N	\N	University of Tromsø	Tromsø	http://www.ub.uit.no/munin/handle/10037/246	accessed: 14.10.2025).	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
241	{"key": "Pu\\u0219cariu 1905"}	base	pu1905a	Pușcariu 1905	Etymologisches Wörterbuch der rumänischen Sprache: lateinisches Element mit Berücksichtigung aller romanischen Sprachen	\N	\N	\N	article	Pușcariu, Sextil	1905	Etymologisches Wörterbuch der rumänischen Sprache: lateinisches Element mit Berücksichtigung aller romanischen Sprachen	\N	\N	\N	\N	\N	Reihe	\N	Heidelberg	\N	\N	er 1)	Sammlung romanischer Elementar- und Handbücher		C. Winter Universitätsverlag	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
242	{"key": "Pu\\u0219cariu 1943"}	base	pu1943a	Pușcariu 1943	Die rumänische Sprache, ihr Wesen und ihre volkliche Prägung [translated into German and revised by Heinrich Kuen	\N	\N	\N	book	Pușcariu, Sextil	1943	Die rumänische Sprache, ihr Wesen und ihre volkliche Prägung [translated into German and revised by Heinrich Kuen	\N	\N	\N	\N	\N	\N	\N	Leipzig	\N	\N	\N	\N	\N	Otto Harrassowitz	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
243	{"key": "Quesada Castillo 1976a"}	base	castillo1976a	Quesada Castillo 1976	Diccionario quechua Cajamarca-Cañaris	\N	\N	\N	book	Quesada Castillo, Félix	1976	Diccionario quechua Cajamarca-Cañaris	\N	\N	\N	\N	\N	\N	\N	Lima	\N	\N	\N	\N	\N	Ministerio de Educación	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
244	{"key": "Quesada Castillo 1976b"}	base	castillo1976b	Quesada Castillo 1976	Grammática quechua Cajamarca-Cañaris	\N	\N	\N	book	Quesada Castillo, Félix	1976	Grammática quechua Cajamarca-Cañaris	\N	\N	\N	\N	\N	\N	\N	Lima	\N	\N	\N	\N	\N	Instituto de estudios peruanos	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
245	{"key": "Rachkov 2012"}	base	rachkov2012a	Rachkov 2012	Noviy Tagalsko-Russkiy Slovar	\N	\N	\N	incollection	Rachkov, E.G.	2012	Noviy Tagalsko-Russkiy Slovar	\N	New Tagalog-Russian dictionary	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I	II. St Petersburg University	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
246	{"key": "Rankin 1988"}	base	rankin1988a	Rankin 1988	Quapaw: genetic and areal affiliations	\N	\N	\N	inproceedings	Rankin, Robert L.	1988	Quapaw: genetic and areal affiliations	\N	In honor of Mary Haas. From the Haas festival conference on Native American linguistics	Shipley, William and Haas, Mary Rosamond	629–650	\N	\N	\N	Berlin, New York	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
247	{"key": "Rastorgueva 1964"}	base	rastorgueva1964a	Rastorgueva 1964	Opyt sravnitel’nogo izučenija tadžikskich govorov	\N	\N	\N	book	Rastorgueva, Vera Sergeevna	1964	Opyt sravnitel’nogo izučenija tadžikskich govorov	\N	\N	\N	\N	\N	\N	\N	Moscow	\N	\N	\N	\N	\N	Nauka	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
248	{"key": "Raun 1964"}	base	raun1964a	Raun 1964	Karelian Survey	\N	\N	\N	book	Raun, Alo	1964	Karelian Survey	\N	\N	\N	\N	\N	\N	\N	Cleveland, Ohio	\N	\N	\N	Research and Studies in Uralic and Altaic Languages 9	\N	Bell and Howell	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
249	{"key": "Raun 1971"}	base	raun1971a	Raun 1971	Essays in Finno-Ugric and Finnic linguistics	\N	\N	\N	book	Raun, Alo	1971	Essays in Finno-Ugric and Finnic linguistics	\N	\N	\N	\N	\N	\N	\N	Bloomington, The Hague	\N	\N	\N	Uralic and Altaic Series 107	\N	Indiana University Publications	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
250	{"key": "Reershemius 2007"}	base	reershemius2007a	Reershemius 2007	Grammatical borrowing in Yiddish	\N	\N	\N	incollection	Reershemius, Gertrud	2007	Grammatical borrowing in Yiddish	\N	Grammatical borrowing in cross-linguistic perspective	Matras, Yaron and Sakel, Jeanette	246–259	\N	\N	\N	Berlin, New York	\N	\N	\N	Empirical Approaches to Language Typology	38	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
251	{"key": "Reinisch 1882"}	base	reinisch1882a	Reinisch 1882	Die Bilīn-Sprache in Nordost-Afrika	\N	\N	\N	book	Reinisch, Leo	1882	Die Bilīn-Sprache in Nordost-Afrika	\N	\N	\N	\N	\N	\N	\N	Wien	\N	\N	\N	\N	\N	F. Tempsky	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
252	{"key": "Rie\\u00dfler 2007"}	base	riessler2007a	Rießler 2007	Grammatical borrowing in Kildin Saami	\N	\N	\N	incollection	Rießler, Michael	2007	Grammatical borrowing in Kildin Saami	\N	Grammatical borrowing in cross-linguistic perspective	Matras, Yaron and Sakel, Jeanette	229–244	\N	\N	\N	Berlin, New York	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
253	{"key": "Rie\\u00dfler 2009"}	base	riessler2009a	Rießler 2009	Loanwords in Kildin Saami	\N	\N	\N	incollection	Rießler, Michael	2009	Loanwords in Kildin Saami	\N	Loanwords in the world’s languages. A comparative handbook	Haspelmath, Martin and Tadmor, Uri	384–413	\N	\N	\N	Berlin	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
254	{"key": "Riionheimo 2002"}	base	riionheimo2002a	Riionheimo 2002	How to borrow a bound morpheme? Evaluating the status of structural interference in a contact between closely-related languages	\N	\N	\N	article	Riionheimo, Helka	2002	How to borrow a bound morpheme? Evaluating the status of structural interference in a contact between closely-related languages	\N	\N	\N	187–217	\N	SKY Journal of Linguistics	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
255	{"key": "Riionheimo 2010"}	base	riionheimo2010a	Riionheimo 2010	Morfologinen limittyminen suomen ja viron kontaktissa	\N	\N	\N	article	Riionheimo, Helka	2010	Morfologinen limittyminen suomen ja viron kontaktissa	\N	\N	\N	218–239	\N	Lähivõrdlusi. Lähivertailuja	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
256	{"key": "Rose 2012"}	base	rose2012a	Rose 2012	Borrowing of a Cariban number marker into three Tupi-Guarani languages	\N	\N	\N	incollection	Rose, Françoise	2012	Borrowing of a Cariban number marker into three Tupi-Guarani languages	\N	Morphologies in contact	Vanhove, Martine and Stolz, Thomas and Urdze, Aina and Otsuka, Hitomi	37–69	\N	\N	\N	Berlin	\N	\N	\N	\N	\N	Akademie Verlag	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
257	{"key": "Roth 1979"}	base	roth1979a	Roth 1979	Le verbe dans le parler arabe de Kormakiti (Chypre): Morphologie et elements de syntaxe	\N	\N	\N	book	Roth, Arlette	1979	Le verbe dans le parler arabe de Kormakiti (Chypre): Morphologie et elements de syntaxe	\N	\N	\N	\N	\N	\N	\N	Paris	\N	\N	\N	Études chamito-sémitiques G.L.E.C.S	\N	Librairie orientaliste P. Geuthner	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
258	{"key": "Roth 2003"}	base	roth2003a	Roth 2003	Oppositions aspectives dans le parler arabe de Kormakiti (Chypre). Conservations, tâtonnements, innovations	\N	\N	\N	book	Roth, Arlette	2003	Oppositions aspectives dans le parler arabe de Kormakiti (Chypre). Conservations, tâtonnements, innovations	\N	\N	Lentin, Jérôme and Lonnet, Antoine and Cohen, Mélanges David	\N	\N	\N	\N	Paris	\N	\N	\N	\N	\N	Maisonneuve & Larose	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
259	{"key": "Round 2010"}	base	round2010a	Round 2010	Kayardild morphology, phonology and morphosyntax	\N	\N	\N	book	Round, Erich Ross	2010	Kayardild morphology, phonology and morphosyntax	\N	\N	\N	\N	\N	\N	\N	New Haven	\N	\N	\N	\N	\N	Yale University PhD thesis	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
260	{"key": "Rozencvejg 1976"}	base	rozencvejg1976a	Rozencvejg 1976	Interference and convergent change	\N	\N	\N	article	Rozencvejg, Victor Ju	1976	Interference and convergent change	\N	\N	\N	\N	\N	The Hague	\N	Paris	\N	\N	\N	\N	\N	Mouton	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
261	{"key": "Saade 2020"}	base	saade2020a	Saade 2020	Quantitative approaches to productivity and borrowing in Maltese derivation	\N	\N	\N	article	Saade, Benjamin	2020	Quantitative approaches to productivity and borrowing in Maltese derivation	\N	\N	\N	447–467	\N	Morphology	\N	\N	\N	\N	\N	\N	30	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
262	{"key": "Sala 1988"}	base	sala1988a	Sala 1988	El problema de las lenguas en contacto	\N	\N	\N	book	Sala, Marius	1988	El problema de las lenguas en contacto	\N	\N	\N	\N	\N	\N	\N	México	\N	\N	\N	\N	\N	Universidad de México	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
263	{"key": "Torres et al. 2019"}	base	torres2019a	Torres et al. 2019	Tsabetsatsarentsipae itionkantajitakaroka igenketsatsare kakinte	\N	\N	\N	misc	Torres, Salazar and Antonian, Joy Salazar Torres and Salazar, Emilia Sergio and Salazar, Miguel Sergio and O’Hagan, Zachary	2019	Tsabetsatsarentsipae itionkantajitakaroka igenketsatsare kakinte	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
264	{"key": "Sandalo 1995"}	base	sandalo1995a	Sandalo 1995	A Grammar of Kadiweu	\N	\N	\N	misc	Sandalo, Maria Filomena	1995	A Grammar of Kadiweu	PhD thesis.	\N	\N	\N	\N	\N	University of Pittsburgh	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
265	{"key": "Sandfeld 1938"}	base	sandfeld1938a	Sandfeld 1938	Problèmes d’interferences linguistiques. Actes du Quatrième Congrès Internationale des Linguistes, 59–61	\N	\N	\N	book	Sandfeld, Kristian	1938	Problèmes d’interferences linguistiques. Actes du Quatrième Congrès Internationale des Linguistes, 59–61	\N	\N	\N	\N	\N	\N	\N	Copenhagen	\N	\N	\N	\N	\N	Einar Munksgaard	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
266	{"key": "Sapir 1907"}	base	sapir1907a	Sapir 1907	Preliminary report on the language and mythology of the Upper Chinook	\N	\N	\N	article	Sapir, Edward	1907	Preliminary report on the language and mythology of the Upper Chinook	\N	\N	\N	533–544	\N	American Anthropologist	\N	\N	\N	\N	3	\N	9	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
267	{"key": "Sasse 1985"}	base	sasse1985a	Sasse 1985	Sprachkontakt und Sprachwandel. Die Gräzisierung der Albanischen Mundarten Griechenlands	\N	\N	\N	article	Sasse, Hans-Jürgen	1985	Sprachkontakt und Sprachwandel. Die Gräzisierung der Albanischen Mundarten Griechenlands	\N	\N	\N	37–95	\N	Papiere zur Linguistik	\N	\N	\N	\N	1	\N	32	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
268	{"key": "Sasse 1991"}	base	sasse1991a	Sasse 1991	Arvanitika. Die albanischen Sprachreste in Griechenland	\N	\N	\N	article	Sasse, Hans-Jürgen	1991	Arvanitika. Die albanischen Sprachreste in Griechenland	\N	\N	\N	\N	\N	Teil	\N	Wiesbaden	\N	\N	\N	\N	1	Harrassowitz	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
269	{"key": "Sauer 1963"}	base	sauer1963a	Sauer 1963	Die syrjänischen Lehnsuffixe im Ostjakischen	\N	\N	\N	incollection	Sauer, Gert	1963	Die syrjänischen Lehnsuffixe im Ostjakischen	\N	Congressus Internationalis fenno-ugristarum. Budapestani habitus 20-24. IX	Gábor Bereczki, P.Hajdú and Képes, G. and László, Gy	193–196	\N	\N	\N	Budapest	\N	\N	\N	\N	\N	Akadémiai Kiadó	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
270	{"key": "Sauer 1967"}	base	sauer1967a	Sauer 1967	Die Nominalbildung im Ostjakischen	\N	\N	\N	book	Sauer, Gert	1967	Die Nominalbildung im Ostjakischen	\N	\N	\N	\N	\N	\N	\N	Berlin	\N	\N	\N	Finnisch-Ugrische Studien 5	\N	Akademie Verlag	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
271	{"key": "Schl\\u00fccker 2024"}	base	schluecker2024a	Schlücker 2024	Sportschau-like, raststättenlike, Claudialike. Like-Adjektive als neues Wortbildungsmuster im Deutschen	\N	\N	\N	article	Schlücker, Barbara	2024	Sportschau-like, raststättenlike, Claudialike. Like-Adjektive als neues Wortbildungsmuster im Deutschen	\N	\N	\N	545–574	\N	Zeitschrift für germanistische Linguistik	\N	\N	\N	\N	3	\N	52	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
272	{"key": "Sch\\u00f6nig 2003"}	base	schoenig2003a	Schönig 2003	Turco-Mongolic relations	\N	\N	\N	incollection	Schönig, Claus	2003	Turco-Mongolic relations	\N	The Mongolic languages	Janhunen, Juha	403–419	\N	\N	\N	London	\N	\N	\N	Routledge Language Family Series	5	Routledge Curzon	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
273	{"key": "Schulze 2002"}	base	schulze2002a	Schulze 2002	The loan layers of Udi: Armenian	\N	\N	\N	incollection	Schulze, Wolfgang	2002	The loan layers of Udi: Armenian	\N	Philology, Typology and Language Structure. Festschrift for Winfried Boeder on the Occasion of his 65th Birthday	Bublitz, Wolfram and Roncador, Manfred and Vater, Heinz	211–223	\N	\N	\N	Frankfurt am Main	\N	\N	\N	\N	\N	Peter Lang	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
274	{"key": "Schulze 2016"}	base	schulze2016a	Schulze 2016	How much Udi is Udi?	\N	\N	\N	incollection	Schulze, Wolfgang	2016	How much Udi is Udi?	\N	Endangered languages of the Caucasus and beyond	Korkmaz, Ramazan and Doğan, Gürkan	187–208	\N	\N	\N	Leiden	\N	\N	\N	\N	\N	Brill	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
275	{"key": "Schwarzwald 1998"}	base	schwarzwald1998a	Schwarzwald 1998	Inflection and derivation in Hebrew linear word formation	\N	\N	\N	article	Schwarzwald, Ora	1998	Inflection and derivation in Hebrew linear word formation	\N	\N	\N	265–288	\N	Folia Linguistica	\N	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
276	{"key": "Segura Mungu\\u00eda and Etxebarria Ayesta 1996"}	base	mungu1996a	Segura Munguía and Etxebarria Ayesta 1996	Del latín al euskara = Latinetik euskarara	\N	\N	\N	book	Segura Munguía, Santiago and Etxebarria Ayesta, Juan Manuel	1996	Del latín al euskara = Latinetik euskarara	\N	\N	\N	\N	\N	\N	\N	Bilbao	\N	\N	\N	\N	\N	Universidad de Deusto	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
277	{"key": "Seifart 2009"}	base	seifart2009a	Seifart 2009	Resígaro documentation	\N	\N	\N	misc	Seifart, Frank	2009	Resígaro documentation	\N	\N	Seifart, Frank and Fagua, Doris and Gasché, Jürg and Echeverri, Juan Alvaro	\N	\N	\N	\N	Nijmegen	https://hdl.handle.net/1839/00-0000-0000-001C-7D64-2@view.	\N	\N	\N	\N	DOBES-MPI	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
278	{"key": "Seifart 2011"}	base	seifart2011a	Seifart 2011	Bora loans in Resígaro: Massive morphological and little lexical borrowing in a moribund Arawakan language	\N	\N	\N	book	Seifart, Frank	2011	Bora loans in Resígaro: Massive morphological and little lexical borrowing in a moribund Arawakan language	\N	\N	\N	\N	\N	Cadernos de Etnolingüística	\N	\N	http://www.etnolinguistica.org/mono:2	accessed: 14.10.2025).	\N	Série Monografias	2	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
279	{"key": "Seifart 2012"}	base	seifart2012a	Seifart 2012	The Principle of Morphosyntactic Subsystem Integrity in language contact: Evidence from morphological borrowing in Resígaro (Arawakan)	\N	\N	\N	article	Seifart, Frank	2012	The Principle of Morphosyntactic Subsystem Integrity in language contact: Evidence from morphological borrowing in Resígaro (Arawakan)	\N	\N	\N	471–504	\N	Diachronica	\N	\N	\N	\N	4	\N	29	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
280	{"key": "Seifart 2015"}	base	seifart2015a	Seifart 2015	Direct and indirect affix borrowing	\N	\N	\N	article	Seifart, Frank	2015	Direct and indirect affix borrowing	\N	\N	\N	511–532	\N	Language	\N	\N	\N	\N	3	\N	91	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
281	{"key": "Sekerina 1994"}	base	sekerina1994a	Sekerina 1994	Copper Island (Mednyi) Aleut (CIA): A mixed language	\N	\N	\N	article	Sekerina, Irina A.	1994	Copper Island (Mednyi) Aleut (CIA): A mixed language	\N	\N	\N	14–31	\N	Languages of the World	\N	\N	\N	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
282	{"key": "Silverstein 1974"}	base	silverstein1974a	Silverstein 1974	Dialectal developments in Chinookan tense-aspect systems: an areal-historical analysis	\N	\N	\N	article	Silverstein, Michael	1974	Dialectal developments in Chinookan tense-aspect systems: an areal-historical analysis	\N	\N	\N	45– 99	\N	International Journal of American Linguistics	\N	\N	\N	\N	4(2)	\N	40	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
283	{"key": "Skancke 2001"}	base	skancke2001a	Skancke 2001	Mellomnedertysk påvirkning på nordnorske dialekter	\N	\N	\N	book	Skancke, Kaja	2001	Mellomnedertysk påvirkning på nordnorske dialekter	\N	\N	\N	\N	\N	\N	\N	Copenhagen	\N	\N	\N	\N	\N	Nordisk Ministerråd	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
284	{"key": "Slater 2003"}	base	slater2003a	Slater 2003	A grammar of Mangghuer. A Mongolic language of China’s Qinghai-Gansu Sprachbund	\N	\N	\N	book	Slater, Keith W.	2003	A grammar of Mangghuer. A Mongolic language of China’s Qinghai-Gansu Sprachbund	\N	\N	\N	\N	\N	\N	\N	London, New York	\N	\N	\N	\N	\N	Routledge	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
285	{"key": "Smith 2013"}	base	smith2013a	Smith 2013	Sri Lanka Portuguese	\N	\N	\N	incollection	Smith, Ian	2013	Sri Lanka Portuguese	\N	The survey of Pidgin and Creole languages. Volume II: Portuguese-based, Spanish-based, and French-based languages	Michaelis, Susanne Maria and Maurer, Philippe and Haspelmath, Martin and Huber, Magnus and Revis, Melanie	111–121	\N	\N	\N	Oxford	\N	\N	\N	\N	\N	Oxford University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
286	{"key": "S\\u00f5naveeb 2024a"}	base	s2024a	Sõnaveeb 2024	Naakmann. EKI ühendsõnastik 2024 [Estonian Language Institute Common Dictionary 2024	\N	\N	\N	misc	Sõnaveeb	2024	Naakmann. EKI ühendsõnastik 2024 [Estonian Language Institute Common Dictionary 2024	\N	\N	\N	\N	\N	Eesti Keele Instituut, Sõnaveeb	\N	\N	https://sonaveeb.ee/search/unif/dlall/dsall/naakmann/est	accessed: 15.06.2024).	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
287	{"key": "S\\u00f5naveeb 2024b"}	base	s2024b	Sõnaveeb 2024	Naga. EKI ühendsõnastik 2024 [Estonian Language Institute Common Dictionary 2024	\N	\N	\N	misc	Sõnaveeb	2024	Naga. EKI ühendsõnastik 2024 [Estonian Language Institute Common Dictionary 2024	\N	\N	\N	\N	\N	Eesti Keele Instituut, Sõnaveeb	\N	\N	https://sonaveeb.ee/search/unif/dlall/dsall/naga/est	accessed: 15.06.2024).	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
288	{"key": "S\\u00f8rensen and S\\u00f8rensen 2024"}	base	s2024c	Sørensen and Sørensen 2024	Den Danske Ordbog. Det Danske Sprog- og Litteraturselskab	\N	\N	\N	misc	Sørensen, Nathalie Hau and Sørensen, Nicolai Hartvig	2024	Den Danske Ordbog. Det Danske Sprog- og Litteraturselskab	\N	\N	\N	\N	\N	\N	\N	\N	https://ordnet.dk/ddo	accessed: 03.07.2025).	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
289	{"key": "Souag 2009"}	base	souag2009a	Souag 2009	Siwa and its significance for Arabic dialectology	\N	\N	\N	article	Souag, Lameen	2009	Siwa and its significance for Arabic dialectology	\N	\N	\N	51–75	\N	Zeitschrift für Arabische Linguistik	\N	\N	\N	\N	\N	\N	51	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
290	{"key": "Souag 2010"}	base	souag2010a	Souag 2010	Grammatical contact in the Sahara. Arabic, Berber, and Songhay in Tabelbala and Siwa	\N	\N	\N	book	Souag, Lameen	2010	Grammatical contact in the Sahara. Arabic, Berber, and Songhay in Tabelbala and Siwa	\N	\N	\N	\N	\N	\N	\N	London	\N	\N	\N	\N	\N	University of London PhD thesis	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
291	{"key": "Souag 2020"}	base	souag2020a	Souag 2020	When is templatic morphology borrowed? On the spread of the Arabic elative	\N	\N	\N	article	Souag, Lameen	2020	When is templatic morphology borrowed? On the spread of the Arabic elative	\N	\N	\N	469–500	\N	Morphology	\N	\N	\N	\N	4	\N	30	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
292	{"key": "Souag and Eddyshaw 2023"}	base	souag2023a	Souag and Eddyshaw 2023	A morphological borrowing from Central Gur into Songhay	\N	\N	\N	article	Souag, Lameen and Eddyshaw, David	2023	A morphological borrowing from Central Gur into Songhay	\N	\N	\N	125–155	\N	Africana Linguistica	\N	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
293	{"key": "Steinkr\\u00fcger and Seifart 2009"}	base	steinkrueger2009a	Steinkrüger and Seifart 2009	Transfer of derivational morphology without borrowing of stems	\N	\N	\N	misc	Steinkrüger, Patrick O. and Seifart, Frank	2009	Transfer of derivational morphology without borrowing of stems	\N	\N	\N	\N	\N	\N	\N	\N	\N	Resígaro (Arawakan, Peru) and Chabacano (Creole, Philippines). Paper presented at Morphologies in Contact,	\N	\N	\N	University of Bremen	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
294	{"key": "Steinkr\\u00fcger 2003"}	base	steinkrueger2003a	Steinkrüger 2003	Morphological processes of word formation in Chabacano (Philippine Spanish Creole)	\N	\N	\N	incollection	Steinkrüger, Patrick	2003	Morphological processes of word formation in Chabacano (Philippine Spanish Creole)	\N	Phonology and morphology of creole languages	Plag, Ingo	253–268	\N	\N	\N	Tübingen	\N	\N	\N	Linguistische Arbeiten 478	\N	Niemeyer	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
295	{"key": "Su\\u00e1rez 1977"}	base	su1977a	Suárez 1977	La influencia del español en la estructura gramatical del náhuatl	\N	\N	\N	article	Suárez, Jorge	1977	La influencia del español en la estructura gramatical del náhuatl	\N	\N	\N	115–164	\N	Anuarios de letras	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
296	{"key": "Svane 1992"}	base	svane1992a	Svane 1992	Slavische Lehnwörter im Albanischen	\N	\N	\N	book	Svane, Gunnar	1992	Slavische Lehnwörter im Albanischen	\N	\N	\N	\N	\N	\N	\N	Aarhus	\N	\N	\N	\N	\N	Aarhus University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
297	{"key": "Tadmor 2009"}	base	tadmor2009a	Tadmor 2009	Loanwords in Indonesian	\N	\N	\N	incollection	Tadmor, Uri	2009	Loanwords in Indonesian	\N	Loanwords in the world’s languages. A comparative handbook	Haspelmath, Martin and Tadmor, Uri	686–716	\N	\N	\N	Berlin	\N	\N	\N	\N	\N	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
298	{"key": "Taylor and Hoff 1980"}	base	taylor1980a	Taylor and Hoff 1980	The linguistic repertory of the Island-Carib in the seventeenth century: The men’s language: A Carib pidgin?	\N	\N	\N	article	Taylor, Douglas and Hoff, Berend J.	1980	The linguistic repertory of the Island-Carib in the seventeenth century: The men’s language: A Carib pidgin?	\N	\N	\N	301–312	\N	International Journal of American Linguistics	\N	\N	\N	\N	\N	\N	46	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
299	{"key": "Taylor 1954"}	base	taylor1954a	Taylor 1954	Diachronic note on the Carib contribution to Island Carib	\N	\N	\N	article	Taylor, Douglas	1954	Diachronic note on the Carib contribution to Island Carib	\N	\N	\N	28–33	\N	International Journal of American Linguistics	\N	\N	\N	\N	\N	\N	20	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
300	{"key": "Taylor 1956"}	base	taylor1956a	Taylor 1956	Island Carib II: Word-classes, affixes, nouns, and verbs	\N	\N	\N	article	Taylor, Douglas	1956	Island Carib II: Word-classes, affixes, nouns, and verbs	\N	\N	\N	1–44	\N	International Journal of American Linguistics	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
301	{"key": "Taylor 1959"}	base	taylor1959a	Taylor 1959	Morpheme mergers in Island Carib	\N	\N	\N	article	Taylor, Douglas	1959	Morpheme mergers in Island Carib	\N	\N	\N	190–195	\N	International Journal of American Linguistics	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
302	{"key": "Taylor 1977"}	base	taylor1977a	Taylor 1977	Languages of the West Indies	\N	\N	\N	book	Taylor, Douglas	1977	Languages of the West Indies	\N	\N	\N	\N	\N	\N	\N	Baltimore	\N	\N	\N	Johns Hopkins Studies in Atlantic History and Culture	\N	Johns Hopkins University Press	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
303	{"key": "Tenser 2005"}	base	tenser2005a	Tenser 2005	Lithuanian Romani	\N	\N	\N	book	Tenser, Anton	2005	Lithuanian Romani	\N	\N	\N	\N	\N	\N	\N	Munich	\N	\N	\N	Languages of the World	\N	Lincom	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
304	{"key": "Thomason 1997"}	base	thomason1997a	Thomason 1997	Mednyj Aleut	\N	\N	\N	incollection	Thomason, Sarah G.	1997	Mednyj Aleut	\N	Contact languages. A wider perspective	Thomason, Sarah G.	449–468	\N	\N	\N	Amsterdam, Philadelphia	\N	\N	\N	\N	\N	John Benjamins	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
305	{"key": "Torchia and Djuhari 2011"}	base	torchia2011a	Torchia and Djuhari 2011	Indonesian idioms and expressions: Colloquial Indonesian at work	\N	\N	\N	book	Torchia, Christopher and Djuhari, Lely	2011	Indonesian idioms and expressions: Colloquial Indonesian at work	\N	\N	\N	\N	\N	\N	\N	Rutland	\N	\N	\N	\N	\N	Tuttle Publishing	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
306	{"key": "Trask 1995"}	base	trask1995a	Trask 1995	On the history of the non-finite verb forms in Basque	\N	\N	\N	incollection	Trask, R.L.	1995	On the history of the non-finite verb forms in Basque	\N	Towards a History of the Basque Language	Hualde, José Ignacio and Lakarra, Joseba A. and Trask, R.L.	207–234	\N	\N	\N	Amsterdam and Philadelphia	\N	\N	\N	\N	\N	John Benjamins	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
307	{"key": "Trask 2003"}	base	trask2003a	Trask 2003	The noun phrase: nouns, determiners and modifiers; pronouns and names	\N	\N	\N	incollection	Trask, R.L.	2003	The noun phrase: nouns, determiners and modifiers; pronouns and names	\N	A grammar of Basque	Hualde, José Ignacio and Urbina, Jon Ortiz	113–171	\N	\N	\N	Berlin, New York	\N	\N	\N	Mouton Grammar Library	26	Mouton de Gruyter	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
308	{"key": "Tsai 2007"}	base	tsai2007a	Tsai 2007	Language change through language contact in computer-mediated communication in Taiwan	\N	\N	\N	book	Tsai, Ni-Yen	2007	Language change through language contact in computer-mediated communication in Taiwan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	University of Edinburgh MA thesis	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
309	{"key": "Tsiapera 1964"}	base	tsiapera1964a	Tsiapera 1964	Greek borrowings in the Arabic dialect of Cyprus	\N	\N	\N	article	Tsiapera, Maria	1964	Greek borrowings in the Arabic dialect of Cyprus	\N	\N	\N	124–126	\N	Journal of the American Oriental Society	\N	\N	\N	\N	\N	\N	84	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
310	{"key": "Tsumagari 2003"}	base	tsumagari2003a	Tsumagari 2003	Dagur	\N	\N	\N	incollection	Tsumagari, Toshiro	2003	Dagur	\N	The Mongolic languages	Janhunen, Juha	129–153	\N	\N	\N	London	\N	\N	\N	Routledge Language Family Series	5	Routledge Curzon	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
311	{"key": "Tuomien\\u0117 2020"}	base	tuomien2020a	Tuomienė 2020	Skolinimosi erdvė pietrytiniame lietuvių kalbos paribyje [The borrowing domain in the south-eastern border regions of the Lithuanian language	\N	\N	\N	incollection	Tuomienė, Nijolė	2020	Skolinimosi erdvė pietrytiniame lietuvių kalbos paribyje [The borrowing domain in the south-eastern border regions of the Lithuanian language	\N	Lithuanian dialectology profiles: Problems and findings	Mikulėnienė, Danguolė	193–207	\N	\N	\N	Vilnius	\N	\N	\N	\N	\N	Institute of the Lithuanian Language	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
312	{"key": "Varol-Bornes 2008"}	base	varol_bornes2008a	Varol-Bornes 2008	Le judéo-espagnol vernaculaire d’Istanbul	\N	\N	\N	book	Varol-Bornes, Marie-Christine	2008	Le judéo-espagnol vernaculaire d’Istanbul	\N	\N	\N	\N	\N	\N	\N	Bern	\N	\N	\N	Sephardica 4	\N	Peter Lang	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
313	{"key": "V\\u00e1squez \\u00c1lvarez 2011"}	base	lvarez2011a	Vásquez Álvarez 2011	A grammar of Chol, a Mayan language	\N	\N	\N	phdthesis	Vásquez Álvarez, Juan Jesús	2011	A grammar of Chol, a Mayan language	\N	\N	\N	\N	\N	\N	University of Texas	Austin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
314	{"key": "Vellard 1967"}	base	vellard1967a	Vellard 1967	Contribución al estudio de la lengua uru	\N	\N	\N	book	Vellard, Jean A.	1967	Contribución al estudio de la lengua uru	\N	\N	\N	\N	\N	\N	\N	Buenos Aires	\N	\N	\N	Cuadernos de Lingüística Indígena 4	\N	Universidad de Buenos Aires	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
315	{"key": "Verhaar 1984"}	base	verhaar1984a	Verhaar 1984	Affixation in contemporary Indonesian	\N	\N	\N	incollection	Verhaar, John W.M.	1984	Affixation in contemporary Indonesian	\N	Towards a description of contemporary Indonesian. Preliminary studies, Part I	Purwo, Bambang Kaswanti	1–26	\N	\N	\N	Jakarta	\N	\N	\N	NUSA Linguistic Studies of Indonesian and Other Languages of Indonesia	18	Universitas Atma Jaya	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
316	{"key": "Vietze, Zenker, and Warnke 1975"}	base	vietze1975a	Vietze et al. 1975	Rückläufiges Wörterbuch der türkischen Sprache	\N	\N	\N	book	Vietze, Hans Peter and Zenker, Ludwig and Warnke, Ingrid	1975	Rückläufiges Wörterbuch der türkischen Sprache	\N	\N	\N	\N	\N	\N	\N	Leipzig	\N	\N	\N	\N	\N	Verlag Enzyklopädie	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
317	{"key": "Wali and Koul 1996"}	base	wali1996a	Wali and Koul 1996	Kashmiri. A cognitive-descriptive grammar	\N	\N	\N	book	Wali, Kashi and Koul, Omkar N.	1996	Kashmiri. A cognitive-descriptive grammar	\N	\N	\N	\N	\N	\N	\N	London, New York	\N	\N	\N	Routledge Descriptive Grammars	\N	Routledge	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
318	{"key": "Weiers 2003"}	base	weiers2003a	Weiers 2003	Moghol	\N	\N	\N	incollection	Weiers, Michael	2003	Moghol	\N	The Mongolic languages	Janhunen, Juha	248–264	\N	\N	\N	London	\N	\N	\N	Routledge Language Family Series	5	Routledge Curzon	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
319	{"key": "Weinreich 1953"}	base	weinreich1953a	Weinreich 1953	Languages in contact. Findings and problems	\N	\N	\N	book	Weinreich, Uriel	1953	Languages in contact. Findings and problems	\N	\N	\N	\N	\N	\N	\N	New York	\N	\N	\N	\N	\N	Linguistic Circle of New York	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
320	{"key": "Weinreich 1958"}	base	weinreich1958a	Weinreich 1958	Yiddish and Colonial German in Eastern Europe. American contributions to the Fourth International Congress of Slavicists, Moscow, September 1958	\N	\N	\N	book	Weinreich, Uriel	1958	Yiddish and Colonial German in Eastern Europe. American contributions to the Fourth International Congress of Slavicists, Moscow, September 1958	\N	\N	\N	369–419	\N	\N	\N	s-Gravenhage	\N	\N	\N	Slavistic Printings and Reprintings	21	Mouton	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
321	{"key": "Wiedemann 1847"}	base	wiedemann1847a	Wiedemann 1847	Versuch einer Grammatik der tscheremissischen Sprache nach dem in der Evangelienübersetzung von 1821 gebrauchten Dialekte	\N	\N	\N	book	Wiedemann, Ferdinand Joh	1847	Versuch einer Grammatik der tscheremissischen Sprache nach dem in der Evangelienübersetzung von 1821 gebrauchten Dialekte	\N	\N	\N	\N	\N	\N	\N	Reval	\N	\N	\N	\N	\N	Verlag Franz Kluge	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
322	{"key": "Wiemer 2009"}	base	wiemer2009a	Wiemer 2009	Zu entlehnten Verbpräfixen und anderen morphosyntaktischen Slavismen in litauischen Insel- und Grenzmundarten	\N	\N	\N	incollection	Wiemer, Björn	2009	Zu entlehnten Verbpräfixen und anderen morphosyntaktischen Slavismen in litauischen Insel- und Grenzmundarten	\N	Von Zuständen, Dynamik und Veränderung bei Pygmäen und Giganten: Festschrift für Walter Breu zu seinem 60. Geburtstag	Scholze, Lenka and Wiemer, Björn	347–390	\N	\N	\N	Bochum	\N	\N	\N	\N	\N	Brockmeyer	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
323	{"key": "Witkowski 1981"}	base	witkowski1981a	Witkowski 1981	Ещё Раз о Происхождении Русского Агентивного Суффикса -Щик/-Чик [Once more about the origin of the Russian agentive suffix -ščik	\N	\N	\N	article	Witkowski, Wieslaw	1981	Ещё Раз о Происхождении Русского Агентивного Суффикса -Щик/-Чик [Once more about the origin of the Russian agentive suffix -ščik	\N	\N	\N	211–216	\N	Russian Linguistics	\N	\N	\N	\N	3	\N	5	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
324	{"key": "Wolff 2001"}	base	wolff2001a	Wolff 2001	The influence of Spanish on Tagalog	\N	\N	\N	incollection	Wolff, John	2001	The influence of Spanish on Tagalog	\N	Lo propio y lo ajeno en las lenguas austronésicas y ameríndias. Procesos interculturales en el contacto de lenguas indígenas con el español en el Pacífico e Hispanoamérica	Zimmermann, Klaus and Stolz, Thomas	233–252	\N	\N	\N	Frankfurt a. M	\N	\N	\N	\N	\N	Vervuert	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
325	{"key": "Xhuvani and \\u00c7abej 1962"}	base	xhuvani1962a	Xhuvani and Çabej 1962	Prapashtesat e gjuhës shqipe	\N	\N	\N	book	Xhuvani, Aleksandër and Çabej, Eqrem	1962	Prapashtesat e gjuhës shqipe	\N	\N	\N	\N	\N	\N	\N	Tiranë	\N	\N	\N	\N	\N	Universiteti Shtetëror	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
326	{"key": "Yang and Ouyang 2013"}	base	yang2013a	Yang and Ouyang 2013	Hànyǔ wǎngluò yǔyán de ōuhuà tèzhēng jí jiàoshī kètáng yìngduì [The Englishization of cyber Chinese and teachers	\N	\N	\N	inproceedings	Yang, Xiaodong and Ouyang, Yan	2013	Hànyǔ wǎngluò yǔyán de ōuhuà tèzhēng jí jiàoshī kètáng yìngduì [The Englishization of cyber Chinese and teachers	\N	reply]. Dì shíyī jiè guójì hànyǔ jiàoxué xuéshù yántǎo huì lùnwén jí [Proceedings of the 11th International Conference on Chinese Language Pedagogy]. Sìchuān Chūbǎn Jítuán Bāshǔ Shūshè	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
327	{"key": "Yepishkin 2010"}	base	yepishkin2010a	Yepishkin 2010	Исторический словарь галлицизмов русского языка. [Historical dictionary of hallicisms of the Russian language	\N	\N	\N	misc	Yepishkin, Nikolay Ivanovich	2010	Исторический словарь галлицизмов русского языка. [Historical dictionary of hallicisms of the Russian language	\N	\N	\N	\N	\N	\N	\N	Moscow	https://gufo.me/dict/gallicisms/-	accessed on 10.05.2024	\N	\N	\N	Словарное издательство ЭТС	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
328	{"key": "Zavala Maldonado 2007"}	base	zavala2007a	Zavala Maldonado 2007	Las oraciones de relativo en lenguas cholanas, un calque zoqueano	\N	\N	\N	inproceedings	Zavala Maldonado, Roberto	2007	Las oraciones de relativo en lenguas cholanas, un calque zoqueano	\N	Conference on Indigenous Languages of Latin America (CILLA) III	\N	\N	\N	\N	\N	Austin, TX	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
329	{"key": "Zellou 2011"}	base	zellou2011a	Zellou 2011	Moroccan Arabic borrowed circumfix from Berber: investigating morphological categories in a language contact situation	\N	\N	\N	article	Zellou, Georgia	2011	Moroccan Arabic borrowed circumfix from Berber: investigating morphological categories in a language contact situation	\N	\N	Perko, Gregor	231–244	\N	Les frontières internes et externes de la morphologie	\N	Ljubljana	\N	\N	tica 51)	\N		Znanstvena založba Filozofske fakultete	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
330	{"key": "Zengin 2009"}	base	zengin2009a	Zengin 2009	Türkçenin tersine sözlügü	\N	\N	\N	book	Zengin, Dursun	2009	Türkçenin tersine sözlügü	\N	\N	\N	\N	\N	\N	\N	Ankara	\N	\N	\N	\N	\N	Kurmay	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
331	{"key": "Zinkevi\\u010dius 1966"}	base	zinkevi1966a	Zinkevičius 1966	Lietuvių Dialektologija. Lyginamoji tarmių fonetika ir morfologija [Lithuanian dialectology	\N	\N	\N	incollection	Zinkevičius, Zigmas	1966	Lietuvių Dialektologija. Lyginamoji tarmių fonetika ir morfologija [Lithuanian dialectology	\N	Comparative phonetics and morphology of dialects	\N	\N	\N	\N	\N	Vilnius	\N	\N	\N	\N	\N	Mintis	\N	\N	\N	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
\.


--
-- Data for Name: source_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.source_data (pk, jsondata, key, value, ord, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: source_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.source_files (pk, jsondata, id, name, description, markup_description, ord, mime_type, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unit (pk, jsondata, polymorphic_type, id, name, description, markup_description, language_pk, created, updated, active) FROM stdin;
\.


--
-- Data for Name: unit_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unit_data (pk, jsondata, key, value, ord, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: unit_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unit_files (pk, jsondata, id, name, description, markup_description, ord, mime_type, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: unitdomainelement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unitdomainelement (pk, jsondata, polymorphic_type, id, name, description, markup_description, unitparameter_pk, ord, created, updated, active) FROM stdin;
\.


--
-- Data for Name: unitdomainelement_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unitdomainelement_data (pk, jsondata, key, value, ord, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: unitdomainelement_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unitdomainelement_files (pk, jsondata, id, name, description, markup_description, ord, mime_type, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: unitparameter; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unitparameter (pk, jsondata, polymorphic_type, id, name, description, markup_description, created, updated, active) FROM stdin;
\.


--
-- Data for Name: unitparameter_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unitparameter_data (pk, jsondata, key, value, ord, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: unitparameter_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unitparameter_files (pk, jsondata, id, name, description, markup_description, ord, mime_type, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: unitvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unitvalue (pk, jsondata, polymorphic_type, id, name, description, markup_description, unit_pk, unitparameter_pk, contribution_pk, unitdomainelement_pk, frequency, created, updated, active) FROM stdin;
\.


--
-- Data for Name: unitvalue_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unitvalue_data (pk, jsondata, key, value, ord, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: unitvalue_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unitvalue_files (pk, jsondata, id, name, description, markup_description, ord, mime_type, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: value; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.value (jsondata, polymorphic_type, id, name, description, markup_description, pk, valueset_pk, domainelement_pk, frequency, confidence, created, updated, active) FROM stdin;
{}	custom	1-casedative	1	\N	\N	1	1	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	1-genderhuman	2	\N	\N	2	2	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	1-nounclassinanimate	38	\N	\N	3	3	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	1-augmentative	1	\N	\N	4	4	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	1-numberplural	3	\N	\N	5	5	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	1-numberdual	3	\N	\N	6	6	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	1-verbalderivationmiscellaneous	2	\N	\N	7	7	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	2-adjectivizerprivative	1	\N	\N	8	8	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	2-casedative	1	\N	\N	9	9	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	2-caseergative	1	\N	\N	10	10	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	2-caselocative	3	\N	\N	11	11	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	2-topic	1	\N	\N	12	12	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	2-focus	2	\N	\N	13	13	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	2-nominalizermiscellaneous	1	\N	\N	14	14	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	2-nominalizeragent	1	\N	\N	15	15	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	2-numberplural	2	\N	\N	16	16	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	2-numberdual	1	\N	\N	17	17	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	2-nominalderivationmiscellaneous	4	\N	\N	18	18	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	4-verbalderivationmiscellaneous	1	\N	\N	19	19	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	4-subjectobjectindexing	13	\N	\N	20	20	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	4-verbalnegation	1	\N	\N	21	21	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	5-adjectivizermiscellaneous	4	\N	\N	22	22	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	5-adverbializer	1	\N	\N	23	23	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	5-nominalizermiscellaneous	1	\N	\N	24	24	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	5-nominalizeragent	1	\N	\N	25	25	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	5-nominalizerabstract	3	\N	\N	26	26	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	5-numberplural	1	\N	\N	27	27	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	5-numeralandquantifierderivation	1	\N	\N	28	28	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	5-verbaltam	1	\N	\N	29	29	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	5-verbalizer	1	\N	\N	30	30	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	6-adjectivizermiscellaneous	1	\N	\N	31	31	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	6-adjectivizerprivative	1	\N	\N	32	32	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	6-diminutive	1	\N	\N	33	33	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	6-definiteindefinite	1	\N	\N	34	34	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	6-nominalizeragent	6	\N	\N	35	35	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	6-numeralderivationordinals	1	\N	\N	36	36	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	7-numeralderivationordinals	1	\N	\N	37	37	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	7-subjectobjectindexing	21	\N	\N	38	38	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	8-comparative	1	\N	\N	39	39	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	8-adverbializer	1	\N	\N	40	40	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	8-casedative	1	\N	\N	41	41	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	8-casenonlocativeperipheralcase	2	\N	\N	42	42	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	8-caselocative	2	\N	\N	43	43	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	8-nominalizeragent	1	\N	\N	44	44	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	8-nominalizerabstract	1	\N	\N	45	45	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	8-numeralandquantifierderivation	2	\N	\N	46	46	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	10-adjectivizerprivative	1	\N	\N	47	47	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	10-nominalizeragent	2	\N	\N	48	48	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	10-nominalderivationmiscellaneous	15	\N	\N	49	49	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	11-numeralderivationordinals	1	\N	\N	50	50	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	11-verbaltam	1	\N	\N	51	51	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	11-subjectobjectindexing	6	\N	\N	52	52	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	12-adjectivizermiscellaneous	1	\N	\N	53	53	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	12-nominalizermiscellaneous	3	\N	\N	54	54	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	12-nominalizerabstract	4	\N	\N	55	55	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	13-adjectivizermiscellaneous	3	\N	\N	56	56	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	13-nominalizermiscellaneous	1	\N	\N	57	57	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	13-numeralderivationordinals	1	\N	\N	58	58	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	13-valencyreciprocal	1	\N	\N	59	59	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	13-verbalizer	2	\N	\N	60	60	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	14-subjectobjectindexing	8	\N	\N	61	61	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	15-adjectivizermiscellaneous	4	\N	\N	62	62	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	15-nominalizermiscellaneous	6	\N	\N	63	63	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	15-nominalizeragent	1	\N	\N	64	64	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	15-nominalizerplacename	2	\N	\N	65	65	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	15-verbalizer	1	\N	\N	66	66	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	16-adjectivizermiscellaneous	3	\N	\N	67	67	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	16-diminutive	1	\N	\N	68	68	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	16-nominalizermiscellaneous	1	\N	\N	69	69	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	16-nominalizeragent	2	\N	\N	70	70	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	17-clauseleveltam	2	\N	\N	71	71	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	17-casenonlocativeperipheralcase	2	\N	\N	72	72	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	17-caselocative	1	\N	\N	73	73	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	17-numberplural	1	\N	\N	74	74	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	18-diminutive	1	\N	\N	75	75	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	18-nominalizeragent	3	\N	\N	76	76	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	18-nominalizerabstract	2	\N	\N	77	77	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	19-adjectivizermiscellaneous	2	\N	\N	78	78	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	19-adjectivizerprivative	1	\N	\N	79	47	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	19-nominalizerabstract	3	\N	\N	80	79	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	19-nominalderivationmiscellaneous	5	\N	\N	81	49	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	20-nominalizermiscellaneous	1	\N	\N	82	80	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	20-valencycausative	1	\N	\N	83	81	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	20-subjectobjectindexing	2	\N	\N	84	82	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	20-verbalizer	1	\N	\N	85	83	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	21-genderhuman	2	\N	\N	86	84	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	21-diminutive	1	\N	\N	87	85	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	21-numberplural	2	\N	\N	88	86	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	22-comparative	1	\N	\N	89	87	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	22-superlative	1	\N	\N	90	88	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	22-nominalizermiscellaneous	1	\N	\N	91	89	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	22-nominalizeragent	1	\N	\N	92	90	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	22-verbaltam	1	\N	\N	93	91	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	23-casenonlocativeperipheralcase	2	\N	\N	94	92	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	23-nounclassinanimate	3	\N	\N	95	93	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	25-adjectivizermiscellaneous	1	\N	\N	96	62	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	25-nominalizeragent	2	\N	\N	97	64	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	25-nominalizerabstract	1	\N	\N	98	94	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	25-nominalizersocialgroup	1	\N	\N	99	95	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	25-numberplural	1	\N	\N	100	96	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	26-numberplural	1	\N	\N	101	97	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	26-possessorindexing	1	\N	\N	102	98	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	27-comparative	1	\N	\N	103	99	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	27-adjectivizermiscellaneous	1	\N	\N	104	100	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	27-casenonlocativeperipheralcase	4	\N	\N	105	101	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	27-definiteindefinite	1	\N	\N	106	102	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	27-nominalizerabstract	1	\N	\N	107	103	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	27-numeralderivationordinals	1	\N	\N	108	104	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	27-valencycausative	1	\N	\N	109	105	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	27-valencyreflexive	1	\N	\N	110	106	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	27-verbaltam	1	\N	\N	111	107	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	28-casenonlocativeperipheralcase	4	\N	\N	112	108	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	28-relativizersubordinator	2	\N	\N	113	109	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	29-casenonlocativeperipheralcase	1	\N	\N	114	110	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	29-numberdual	1	\N	\N	115	111	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	29-nominalderivationmiscellaneous	1	\N	\N	116	112	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	29-verbalnegation	1	\N	\N	117	113	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	31-nominalizersocialgroup	1	\N	\N	118	114	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	31-verbaltam	2	\N	\N	119	115	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	33-comparative	1	\N	\N	120	116	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	33-clauseleveltam	1	\N	\N	121	117	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	33-definiteindefinite	1	\N	\N	122	118	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	33-subjectobjectindexing	2	\N	\N	123	119	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	34-casedative	1	\N	\N	124	120	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	34-caseergative	1	\N	\N	125	121	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	37-nounclassinanimate	2	\N	\N	126	122	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	37-verbaltam	7	\N	\N	127	123	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	39-numeralandquantifierderivation	1	\N	\N	128	124	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	40-numberplural	1	\N	\N	129	125	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	40-verbaltam	1	\N	\N	130	126	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	41-verbaltam	1	\N	\N	131	127	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	41-relativizersubordinator	1	\N	\N	132	128	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	42-adjectivizermiscellaneous	1	\N	\N	133	129	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	46-adjectivizermiscellaneous	1	\N	\N	134	130	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	67-adjectivizermiscellaneous	1	\N	\N	135	131	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	67-augmentative	1	\N	\N	136	132	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	67-nominalizeragent	1	\N	\N	137	133	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	67-nominalizerabstract	1	\N	\N	138	134	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	67-nominalizersocialgroup	1	\N	\N	139	135	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	67-numbersingular	3	\N	\N	140	136	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	68-relativizersubordinator	2	\N	\N	141	137	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	70-subjectobjectindexing	2	\N	\N	142	138	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	72-diminutive	1	\N	\N	143	139	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	72-verbaltam	1	\N	\N	144	140	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	73-nominalizermiscellaneous	1	\N	\N	145	141	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	73-nominalizersocialgroup	1	\N	\N	146	142	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	73-valencypassive	1	\N	\N	147	143	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	73-verbaltam	1	\N	\N	148	140	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	75-numberplural	1	\N	\N	149	144	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	77-nominalderivationmiscellaneous	1	\N	\N	150	145	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	78-definiteindefinite	1	\N	\N	151	146	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	78-topic	2	\N	\N	152	147	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	78-nominalizeragent	1	\N	\N	153	148	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	78-verbaltam	1	\N	\N	154	149	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	82-clauselinking	1	\N	\N	155	150	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	83-numeralclassifier	1	\N	\N	156	151	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	85-adjectivizermiscellaneous	2	\N	\N	157	152	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	85-adjectivizerprivative	1	\N	\N	158	153	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	85-genderhuman	3	\N	\N	159	154	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	85-diminutive	3	\N	\N	160	155	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	85-nominalizeragent	2	\N	\N	161	156	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	85-nominalizerplacename	1	\N	\N	162	157	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	85-verbalizer	1	\N	\N	163	158	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	87-adjectivizermiscellaneous	2	\N	\N	164	159	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	87-adjectivizerprivative	1	\N	\N	165	160	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	87-diminutive	11	\N	\N	166	161	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	87-nominalizermiscellaneous	1	\N	\N	167	162	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	87-nominalizerabstract	4	\N	\N	168	163	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	87-nominalizersocialgroup	2	\N	\N	169	164	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	87-nominalizerplacename	2	\N	\N	170	165	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	87-verbaltam	9	\N	\N	171	166	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	87-subjectobjectindexing	2	\N	\N	172	167	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	88-diminutive	4	\N	\N	173	168	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	88-nominalizeragent	1	\N	\N	174	169	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	88-nominalizersocialgroup	1	\N	\N	175	170	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	88-nominalderivationmiscellaneous	13	\N	\N	176	171	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	88-verbalderivationmiscellaneous	9	\N	\N	177	172	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	88-verbalizer	4	\N	\N	178	173	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	92-superlative	1	\N	\N	179	174	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	92-verbaltam	5	\N	\N	180	175	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	93-nominalizeragent	1	\N	\N	181	176	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	94-comparative	1	\N	\N	182	177	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	94-adjectivizermiscellaneous	1	\N	\N	183	178	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	94-verbaltam	1	\N	\N	184	179	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	95-nominalizermiscellaneous	1	\N	\N	185	180	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	95-valencypassive	1	\N	\N	186	181	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	95-valencycausative	1	\N	\N	187	182	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	95-valencyapplicative	1	\N	\N	188	183	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	95-verbaltam	4	\N	\N	189	184	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	96-valencypassive	1	\N	\N	190	185	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	98-nominalizermiscellaneous	1	\N	\N	191	186	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	98-nominalizeragent	2	\N	\N	192	187	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	100-clauseleveltam	3	\N	\N	193	188	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	101-nominalderivationmiscellaneous	1	\N	\N	194	189	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	102-adjectivizermiscellaneous	4	\N	\N	195	190	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	102-genderhuman	1	\N	\N	196	191	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	102-numeralandquantifierderivation	2	\N	\N	197	192	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	102-valencypassive	1	\N	\N	198	193	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	107-adjectivizermiscellaneous	1	\N	\N	199	194	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	107-nominalizermiscellaneous	1	\N	\N	200	195	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	107-nominalizeragent	3	\N	\N	201	196	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	107-nominalizerplacename	1	\N	\N	202	197	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	107-nominalderivationmiscellaneous	1	\N	\N	203	198	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	108-adjectivizermiscellaneous	3	\N	\N	204	199	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	108-diminutive	1	\N	\N	205	200	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	108-nominalizeragent	4	\N	\N	206	201	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	108-nominalizerplacename	1	\N	\N	207	202	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	108-nominalderivationmiscellaneous	1	\N	\N	208	203	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	109-adjectivizermiscellaneous	4	\N	\N	209	204	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	109-adjectivizerprivative	1	\N	\N	210	205	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	109-nominalizeragent	2	\N	\N	211	206	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	109-nominalizerabstract	2	\N	\N	212	207	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	109-nominalderivationmiscellaneous	4	\N	\N	213	208	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	110-comparative	1	\N	\N	214	209	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	110-superlative	1	\N	\N	215	210	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	110-adjectivizermiscellaneous	4	\N	\N	216	211	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	110-adjectivizerprivative	1	\N	\N	217	212	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	110-diminutive	1	\N	\N	218	213	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	110-nominalderivationmiscellaneous	1	\N	\N	219	214	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	110-valencycausative	1	\N	\N	220	215	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	110-valencyreflexive	3	\N	\N	221	216	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	110-verbalderivationmiscellaneous	1	\N	\N	222	217	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	110-verbalizer	1	\N	\N	223	218	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	111-genderhuman	2	\N	\N	224	219	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	111-nominalizeragent	1	\N	\N	225	220	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	112-verbalderivationmiscellaneous	1	\N	\N	226	221	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	113-adjectivizermiscellaneous	2	\N	\N	227	222	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	113-adjectivizerprivative	1	\N	\N	228	223	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	113-genderhuman	1	\N	\N	229	224	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	113-diminutive	2	\N	\N	230	225	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	113-augmentative	2	\N	\N	231	226	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	113-nominalizeragent	4	\N	\N	232	227	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	113-nominalizerabstract	17	\N	\N	233	228	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	113-nominalizersocialgroup	2	\N	\N	234	229	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	113-nominalderivationmiscellaneous	4	\N	\N	235	230	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	113-verbalderivationmiscellaneous	1	\N	\N	236	231	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	114-nominalizerabstract	1	\N	\N	237	232	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	116-casenonlocativeperipheralcase	1	\N	\N	238	233	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	116-caselocative	1	\N	\N	239	234	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	116-valencyapplicative	1	\N	\N	240	235	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	116-verbaltam	2	\N	\N	241	236	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	116-relativizersubordinator	2	\N	\N	242	237	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	117-verbaltam	8	\N	\N	243	238	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	117-verbalderivationmiscellaneous	1	\N	\N	244	239	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	118-casenonlocativeperipheralcase	1	\N	\N	245	240	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	119-adjectivizerprivative	1	\N	\N	246	241	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	119-diminutive	1	\N	\N	247	242	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	119-nominalizermiscellaneous	1	\N	\N	248	243	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	119-nominalizerplacename	1	\N	\N	249	244	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	119-nominalderivationmiscellaneous	2	\N	\N	250	245	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	124-definiteindefinite	6	\N	\N	251	246	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	125-clauseleveltam	1	\N	\N	252	247	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	125-verbalderivationmiscellaneous	2	\N	\N	253	248	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	126-adjectivizermiscellaneous	1	\N	\N	254	31	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	126-diminutive	1	\N	\N	255	33	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	126-nominalizerabstract	2	\N	\N	256	249	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	126-numeralderivationordinals	1	\N	\N	257	36	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	127-verbalderivationmiscellaneous	3	\N	\N	258	250	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	128-relativizersubordinator	1	\N	\N	259	251	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	130-comparative	1	\N	\N	260	252	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	132-numeralclassifier	15	\N	\N	261	253	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	133-nominalizeragent	1	\N	\N	262	254	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	134-diminutive	1	\N	\N	263	255	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	135-diminutive	1	\N	\N	264	256	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	136-diminutive	1	\N	\N	265	257	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	138-adjectivizerprivative	1	\N	\N	266	258	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	138-nominalizeragent	1	\N	\N	267	259	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	138-nominalizerabstract	1	\N	\N	268	260	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	138-nominalizersocialgroup	1	\N	\N	269	261	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	139-numeralderivationordinals	1	\N	\N	270	262	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	140-relativizersubordinator	1	\N	\N	271	137	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	142-nominalizeragent	1	\N	\N	272	263	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	143-clauseleveltam	2	\N	\N	273	264	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	143-casenonlocativeperipheralcase	1	\N	\N	274	265	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	144-comparative	1	\N	\N	275	266	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	144-superlative	1	\N	\N	276	267	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	144-caselocative	1	\N	\N	277	268	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	144-numberplural	4	\N	\N	278	269	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	145-numberplural	1	\N	\N	279	270	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	146-superlative	1	\N	\N	280	271	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	147-numberplural	3	\N	\N	281	270	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	148-nominalizermiscellaneous	1	\N	\N	282	272	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	148-nominalizeragent	4	\N	\N	283	273	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	148-numberplural	1	\N	\N	284	274	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	148-valencypassive	1	\N	\N	285	275	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	149-casenonlocativeperipheralcase	3	\N	\N	286	276	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	149-nominalizeragent	1	\N	\N	287	277	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	149-numberplural	1	\N	\N	288	278	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	149-verbalizer	1	\N	\N	289	279	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	150-nounclassinanimate	4	\N	\N	290	280	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	151-numberplural	4	\N	\N	291	281	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	152-verbaltam	2	\N	\N	292	282	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	153-diminutive	1	\N	\N	293	283	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	153-augmentative	1	\N	\N	294	284	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	153-nominalizeragent	1	\N	\N	295	285	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	154-nominalizeragent	1	\N	\N	296	286	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	155-nominalizeragent	3	\N	\N	297	286	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	156-verbaltam	3	\N	\N	298	287	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	156-verbalizer	1	\N	\N	299	288	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	157-nominalizeragent	1	\N	\N	300	286	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	158-clauselinking	1	\N	\N	301	289	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	159-adjectivizermiscellaneous	1	\N	\N	302	290	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	160-verbalizer	1	\N	\N	303	291	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	161-subjectobjectindexing	1	\N	\N	304	292	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	162-possessorindexing	1	\N	\N	305	293	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	163-superlative	1	\N	\N	306	294	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	163-adjectivizermiscellaneous	3	\N	\N	307	295	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	163-clauseleveltam	1	\N	\N	308	296	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	163-diminutive	1	\N	\N	309	297	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	163-nominalizeragent	2	\N	\N	310	298	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	163-nominalizerplacename	1	\N	\N	311	299	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	164-possessorindexing	1	\N	\N	312	300	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	165-definiteindefinite	1	\N	\N	313	301	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	165-focus	1	\N	\N	314	302	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	165-verbaltam	1	\N	\N	315	303	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	166-adjectivizermiscellaneous	1	\N	\N	316	295	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	166-nominalizermiscellaneous	1	\N	\N	317	304	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	166-nominalizeragent	1	\N	\N	318	298	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	167-adjectivizerprivative	1	\N	\N	319	305	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	167-clauselinking	1	\N	\N	320	306	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	167-nominalizeragent	1	\N	\N	321	307	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	167-nominalizerabstract	1	\N	\N	322	308	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	167-nominalizersocialgroup	1	\N	\N	323	309	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	167-numeralderivationordinals	1	\N	\N	324	310	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	168-numberplural	1	\N	\N	325	311	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	169-adverbializer	1	\N	\N	326	312	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	169-numberplural	1	\N	\N	327	313	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	170-numberplural	1	\N	\N	328	314	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	171-adjectivizermiscellaneous	1	\N	\N	329	315	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	171-numberplural	1	\N	\N	330	316	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	172-nominalizermiscellaneous	1	\N	\N	331	317	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	173-nominalizermiscellaneous	1	\N	\N	332	318	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	174-adjectivizermiscellaneous	3	\N	\N	333	319	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	174-diminutive	2	\N	\N	334	320	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	174-nominalizermiscellaneous	1	\N	\N	335	321	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	174-nominalizeragent	2	\N	\N	336	322	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	175-adjectivizermiscellaneous	5	\N	\N	337	323	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	175-nominalizermiscellaneous	1	\N	\N	338	324	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	175-nominalizeragent	1	\N	\N	339	325	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	175-nominalizerabstract	3	\N	\N	340	326	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	175-verbalderivationmiscellaneous	1	\N	\N	341	327	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	175-verbalizer	1	\N	\N	342	328	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	176-caseergative	1	\N	\N	343	329	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	177-verbaltam	1	\N	\N	344	330	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	178-adjectivizermiscellaneous	1	\N	\N	345	319	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	179-nominalizerabstract	1	\N	\N	346	331	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	179-nominalderivationmiscellaneous	1	\N	\N	347	198	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	180-adjectivizermiscellaneous	6	\N	\N	348	332	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	180-nominalizermiscellaneous	5	\N	\N	349	333	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	180-nominalizeragent	1	\N	\N	350	334	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	180-nominalizerabstract	1	\N	\N	351	335	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	180-numeralderivationordinals	1	\N	\N	352	336	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	180-verbalizer	1	\N	\N	353	337	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	181-adjectivizerprivative	1	\N	\N	354	338	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	181-nominalizerabstract	1	\N	\N	355	339	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	181-verbalderivationmiscellaneous	1	\N	\N	356	340	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	182-adjectivizermiscellaneous	1	\N	\N	357	341	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	182-nominalderivationmiscellaneous	2	\N	\N	358	342	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	183-adverbializer	1	\N	\N	359	343	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	184-adjectivizermiscellaneous	1	\N	\N	360	344	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	184-casenonlocativeperipheralcase	2	\N	\N	361	345	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	184-caselocative	2	\N	\N	362	346	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	184-relativizersubordinator	1	\N	\N	363	347	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	185-clauseleveltam	1	\N	\N	364	348	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	185-numberplural	1	\N	\N	365	349	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	185-possessorindexing	1	\N	\N	366	350	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	185-numeralclassifier	2	\N	\N	367	351	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	186-adjectivizermiscellaneous	1	\N	\N	368	352	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	187-nominalizerabstract	1	\N	\N	369	353	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	188-nominalderivationmiscellaneous	1	\N	\N	370	354	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	189-nominalderivationmiscellaneous	1	\N	\N	371	355	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	190-nominalizermiscellaneous	1	\N	\N	372	356	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
{}	custom	190-nominalizerabstract	1	\N	\N	373	357	\N	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
\.


--
-- Data for Name: value_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.value_data (pk, jsondata, key, value, ord, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: value_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.value_files (pk, jsondata, id, name, description, markup_description, ord, mime_type, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: valuesentence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.valuesentence (pk, jsondata, polymorphic_type, value_pk, sentence_pk, description, created, updated, active) FROM stdin;
\.


--
-- Data for Name: valueset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.valueset (pk, jsondata, polymorphic_type, id, description, markup_description, language_pk, parameter_pk, contribution_pk, source, created, updated, active) FROM stdin;
1	{}	base	resigarorgr-casedative	\N	\N	2	8	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
2	{}	base	resigarorgr-genderhuman	\N	\N	2	12	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
3	{}	base	resigarorgr-nounclassinanimate	\N	\N	2	13	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
4	{}	base	resigarorgr-augmentative	\N	\N	2	15	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
5	{}	base	resigarorgr-numberplural	\N	\N	2	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
6	{}	base	resigarorgr-numberdual	\N	\N	2	25	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
7	{}	base	resigarorgr-verbalderivationmiscellaneous	\N	\N	2	38	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
8	{}	base	gurindjikriolrop-adjectivizerprivative	\N	\N	4	4	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
9	{}	base	gurindjikriolrop-casedative	\N	\N	4	8	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
10	{}	base	gurindjikriolrop-caseergative	\N	\N	4	9	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
11	{}	base	gurindjikriolrop-caselocative	\N	\N	4	11	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
12	{}	base	gurindjikriolrop-topic	\N	\N	4	17	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
13	{}	base	gurindjikriolrop-focus	\N	\N	4	18	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
14	{}	base	gurindjikriolrop-nominalizermiscellaneous	\N	\N	4	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
15	{}	base	gurindjikriolrop-nominalizeragent	\N	\N	4	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
16	{}	base	gurindjikriolrop-numberplural	\N	\N	4	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
17	{}	base	gurindjikriolrop-numberdual	\N	\N	4	25	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
18	{}	base	gurindjikriolrop-nominalderivationmiscellaneous	\N	\N	4	27	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
19	{}	base	copperislandaleutale-verbalderivationmiscellaneous	\N	\N	6	38	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
20	{}	base	copperislandaleutale-subjectobjectindexing	\N	\N	6	39	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
21	{}	base	copperislandaleutale-verbalnegation	\N	\N	6	42	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
22	{}	base	sakhasah-adjectivizermiscellaneous	\N	\N	8	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
23	{}	base	sakhasah-adverbializer	\N	\N	8	5	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
24	{}	base	sakhasah-nominalizermiscellaneous	\N	\N	8	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
25	{}	base	sakhasah-nominalizeragent	\N	\N	8	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
26	{}	base	sakhasah-nominalizerabstract	\N	\N	8	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
27	{}	base	sakhasah-numberplural	\N	\N	8	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
28	{}	base	sakhasah-numeralandquantifierderivation	\N	\N	8	31	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
29	{}	base	sakhasah-verbaltam	\N	\N	8	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
30	{}	base	sakhasah-verbalizer	\N	\N	8	40	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
31	{}	base	kalderashromanirmy-adjectivizermiscellaneous	\N	\N	10	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
32	{}	base	kalderashromanirmy-adjectivizerprivative	\N	\N	10	4	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
33	{}	base	kalderashromanirmy-diminutive	\N	\N	10	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
34	{}	base	kalderashromanirmy-definiteindefinite	\N	\N	10	16	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
35	{}	base	kalderashromanirmy-nominalizeragent	\N	\N	10	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
36	{}	base	kalderashromanirmy-numeralderivationordinals	\N	\N	10	30	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
37	{}	base	sebjankuoleveneve-numeralderivationordinals	\N	\N	11	30	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
38	{}	base	sebjankuoleveneve-subjectobjectindexing	\N	\N	11	39	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
39	{}	base	northerntajiktgk-comparative	\N	\N	13	1	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
40	{}	base	northerntajiktgk-adverbializer	\N	\N	13	5	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
41	{}	base	northerntajiktgk-casedative	\N	\N	13	8	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
42	{}	base	northerntajiktgk-casenonlocativeperipheralcase	\N	\N	13	10	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
43	{}	base	northerntajiktgk-caselocative	\N	\N	13	11	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
44	{}	base	northerntajiktgk-nominalizeragent	\N	\N	13	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
45	{}	base	northerntajiktgk-nominalizerabstract	\N	\N	13	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
46	{}	base	northerntajiktgk-numeralandquantifierderivation	\N	\N	13	31	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
47	{}	base	indonesianind-adjectivizerprivative	\N	\N	15	4	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
48	{}	base	indonesianind-nominalizeragent	\N	\N	15	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
49	{}	base	indonesianind-nominalderivationmiscellaneous	\N	\N	15	27	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
50	{}	base	uchurevenkievn-numeralderivationordinals	\N	\N	16	30	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
51	{}	base	uchurevenkievn-verbaltam	\N	\N	16	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
52	{}	base	uchurevenkievn-subjectobjectindexing	\N	\N	16	39	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
53	{}	base	middleenglishenm-adjectivizermiscellaneous	\N	\N	18	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
54	{}	base	middleenglishenm-nominalizermiscellaneous	\N	\N	18	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
55	{}	base	middleenglishenm-nominalizerabstract	\N	\N	18	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
56	{}	base	chabacanocbk-adjectivizermiscellaneous	\N	\N	20	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
57	{}	base	chabacanocbk-nominalizermiscellaneous	\N	\N	20	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
58	{}	base	chabacanocbk-numeralderivationordinals	\N	\N	20	30	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
59	{}	base	chabacanocbk-valencyreciprocal	\N	\N	20	36	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
60	{}	base	chabacanocbk-verbalizer	\N	\N	20	40	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
61	{}	base	bilinbyn-subjectobjectindexing	\N	\N	22	39	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
62	{}	base	albanianaln-adjectivizermiscellaneous	\N	\N	24	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
63	{}	base	albanianaln-nominalizermiscellaneous	\N	\N	24	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
64	{}	base	albanianaln-nominalizeragent	\N	\N	24	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
65	{}	base	albanianaln-nominalizerplacename	\N	\N	24	23	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
66	{}	base	albanianaln-verbalizer	\N	\N	24	40	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
67	{}	base	cajamarcaquechuaqvc-adjectivizermiscellaneous	\N	\N	26	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
68	{}	base	cajamarcaquechuaqvc-diminutive	\N	\N	26	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
69	{}	base	cajamarcaquechuaqvc-nominalizermiscellaneous	\N	\N	26	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
70	{}	base	cajamarcaquechuaqvc-nominalizeragent	\N	\N	26	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
71	{}	base	uruure-clauseleveltam	\N	\N	28	6	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
72	{}	base	uruure-casenonlocativeperipheralcase	\N	\N	28	10	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
73	{}	base	uruure-caselocative	\N	\N	28	11	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
74	{}	base	uruure-numberplural	\N	\N	28	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
75	{}	base	israelihebrewheb-diminutive	\N	\N	29	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
76	{}	base	israelihebrewheb-nominalizeragent	\N	\N	29	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
77	{}	base	israelihebrewheb-nominalizerabstract	\N	\N	29	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
78	{}	base	indonesianind-adjectivizermiscellaneous	\N	\N	15	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
79	{}	base	indonesianind-nominalizerabstract	\N	\N	15	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
80	{}	base	cappadociangreekell-nominalizermiscellaneous	\N	\N	32	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
81	{}	base	cappadociangreekell-valencycausative	\N	\N	32	33	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
82	{}	base	cappadociangreekell-subjectobjectindexing	\N	\N	32	39	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
83	{}	base	cappadociangreekell-verbalizer	\N	\N	32	40	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
84	{}	base	cypriotarabicacy-genderhuman	\N	\N	34	12	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
85	{}	base	cypriotarabicacy-diminutive	\N	\N	34	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
86	{}	base	cypriotarabicacy-numberplural	\N	\N	34	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
87	{}	base	siwisiz-comparative	\N	\N	36	1	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
88	{}	base	siwisiz-superlative	\N	\N	36	2	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
89	{}	base	siwisiz-nominalizermiscellaneous	\N	\N	36	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
90	{}	base	siwisiz-nominalizeragent	\N	\N	36	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
91	{}	base	siwisiz-verbaltam	\N	\N	36	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
92	{}	base	warndarangwnd-casenonlocativeperipheralcase	\N	\N	38	10	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
93	{}	base	warndarangwnd-nounclassinanimate	\N	\N	38	13	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
94	{}	base	albanianaln-nominalizerabstract	\N	\N	24	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
95	{}	base	albanianaln-nominalizersocialgroup	\N	\N	24	22	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
96	{}	base	albanianaln-numberplural	\N	\N	24	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
97	{}	base	garifunacab-numberplural	\N	\N	40	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
98	{}	base	garifunacab-possessorindexing	\N	\N	40	28	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
99	{}	base	marimhr-comparative	\N	\N	42	1	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
100	{}	base	marimhr-adjectivizermiscellaneous	\N	\N	42	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
101	{}	base	marimhr-casenonlocativeperipheralcase	\N	\N	42	10	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
102	{}	base	marimhr-definiteindefinite	\N	\N	42	16	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
103	{}	base	marimhr-nominalizerabstract	\N	\N	42	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
104	{}	base	marimhr-numeralderivationordinals	\N	\N	42	30	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
105	{}	base	marimhr-valencycausative	\N	\N	42	33	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
106	{}	base	marimhr-valencyreflexive	\N	\N	42	34	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
107	{}	base	marimhr-verbaltam	\N	\N	42	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
108	{}	base	chantyalchx-casenonlocativeperipheralcase	\N	\N	44	10	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
109	{}	base	chantyalchx-relativizersubordinator	\N	\N	44	41	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
110	{}	base	ritharngurit-casenonlocativeperipheralcase	\N	\N	46	10	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
111	{}	base	ritharngurit-numberdual	\N	\N	46	25	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
112	{}	base	ritharngurit-nominalderivationmiscellaneous	\N	\N	46	27	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
113	{}	base	ritharngurit-verbalnegation	\N	\N	46	42	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
114	{}	base	guinaangbontokbnc-nominalizersocialgroup	\N	\N	48	22	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
115	{}	base	guinaangbontokbnc-verbaltam	\N	\N	48	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
116	{}	base	sonqorturkictur-comparative	\N	\N	50	1	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
117	{}	base	sonqorturkictur-clauseleveltam	\N	\N	50	6	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
118	{}	base	sonqorturkictur-definiteindefinite	\N	\N	50	16	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
119	{}	base	sonqorturkictur-subjectobjectindexing	\N	\N	50	39	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
120	{}	base	ngandinid-casedative	\N	\N	45	8	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
121	{}	base	ngandinid-caseergative	\N	\N	45	9	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
122	{}	base	istroromanianruo-nounclassinanimate	\N	\N	52	13	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
123	{}	base	istroromanianruo-verbaltam	\N	\N	52	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
124	{}	base	koasaticku-numeralandquantifierderivation	\N	\N	54	31	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
125	{}	base	hasankeyfarabicapc-numberplural	\N	\N	56	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
126	{}	base	hasankeyfarabicapc-verbaltam	\N	\N	56	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
127	{}	base	srilankaportuguesepor-verbaltam	\N	\N	58	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
128	{}	base	srilankaportuguesepor-relativizersubordinator	\N	\N	58	41	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
129	{}	base	kayardildgyd-adjectivizermiscellaneous	\N	\N	60	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
130	{}	base	indonesianstandardind-adjectivizermiscellaneous	\N	\N	62	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
131	{}	base	maltesemlt-adjectivizermiscellaneous	\N	\N	64	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
132	{}	base	maltesemlt-augmentative	\N	\N	64	15	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
133	{}	base	maltesemlt-nominalizeragent	\N	\N	64	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
134	{}	base	maltesemlt-nominalizerabstract	\N	\N	64	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
135	{}	base	maltesemlt-nominalizersocialgroup	\N	\N	64	22	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
136	{}	base	maltesemlt-numbersingular	\N	\N	64	26	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
137	{}	base	khariakhr-relativizersubordinator	\N	\N	66	41	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
138	{}	base	ingrianfinnishfin-subjectobjectindexing	\N	\N	68	39	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
139	{}	base	malagasyplt-diminutive	\N	\N	70	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
140	{}	base	malagasyplt-verbaltam	\N	\N	70	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
141	{}	base	malagasyplt-nominalizermiscellaneous	\N	\N	70	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
142	{}	base	malagasyplt-nominalizersocialgroup	\N	\N	70	22	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
143	{}	base	malagasyplt-valencypassive	\N	\N	70	32	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
144	{}	base	protowayampiemerillonzoeeme-numberplural	\N	\N	73	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
145	{}	base	hawaiianhaw-nominalderivationmiscellaneous	\N	\N	75	27	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
146	{}	base	kolasaamisjd-definiteindefinite	\N	\N	76	16	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
147	{}	base	kolasaamisjd-topic	\N	\N	76	17	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
148	{}	base	kolasaamisjd-nominalizeragent	\N	\N	76	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
149	{}	base	kolasaamisjd-verbaltam	\N	\N	76	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
150	{}	base	kurmanjikmr-clauselinking	\N	\N	77	7	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
151	{}	base	manangenmm-numeralclassifier	\N	\N	78	29	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
152	{}	base	yiddishydd-adjectivizermiscellaneous	\N	\N	79	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
153	{}	base	yiddishydd-adjectivizerprivative	\N	\N	79	4	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
154	{}	base	yiddishydd-genderhuman	\N	\N	79	12	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
155	{}	base	yiddishydd-diminutive	\N	\N	79	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
156	{}	base	yiddishydd-nominalizeragent	\N	\N	79	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
157	{}	base	yiddishydd-nominalizerplacename	\N	\N	79	23	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
158	{}	base	yiddishydd-verbalizer	\N	\N	79	40	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
159	{}	base	meglenoromanianruq-adjectivizermiscellaneous	\N	\N	81	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
160	{}	base	meglenoromanianruq-adjectivizerprivative	\N	\N	81	4	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
161	{}	base	meglenoromanianruq-diminutive	\N	\N	81	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
162	{}	base	meglenoromanianruq-nominalizermiscellaneous	\N	\N	81	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
163	{}	base	meglenoromanianruq-nominalizerabstract	\N	\N	81	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
164	{}	base	meglenoromanianruq-nominalizersocialgroup	\N	\N	81	22	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
165	{}	base	meglenoromanianruq-nominalizerplacename	\N	\N	81	23	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
166	{}	base	meglenoromanianruq-verbaltam	\N	\N	81	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
167	{}	base	meglenoromanianruq-subjectobjectindexing	\N	\N	81	39	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
168	{}	base	arvaniticalbanianaat-diminutive	\N	\N	82	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
169	{}	base	arvaniticalbanianaat-nominalizeragent	\N	\N	82	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
170	{}	base	arvaniticalbanianaat-nominalizersocialgroup	\N	\N	82	22	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
171	{}	base	arvaniticalbanianaat-nominalderivationmiscellaneous	\N	\N	82	27	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
172	{}	base	arvaniticalbanianaat-verbalderivationmiscellaneous	\N	\N	82	38	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
173	{}	base	arvaniticalbanianaat-verbalizer	\N	\N	82	40	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
174	{}	base	lithuanianromanirml-superlative	\N	\N	83	2	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
175	{}	base	lithuanianromanirml-verbaltam	\N	\N	83	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
176	{}	base	sierrapopolucapoi-nominalizeragent	\N	\N	84	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
177	{}	base	brahuibrh-comparative	\N	\N	86	1	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
178	{}	base	brahuibrh-adjectivizermiscellaneous	\N	\N	86	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
179	{}	base	brahuibrh-verbaltam	\N	\N	86	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
180	{}	base	semelaisza-nominalizermiscellaneous	\N	\N	88	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
181	{}	base	semelaisza-valencypassive	\N	\N	88	32	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
182	{}	base	semelaisza-valencycausative	\N	\N	88	33	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
183	{}	base	semelaisza-valencyapplicative	\N	\N	88	35	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
184	{}	base	semelaisza-verbaltam	\N	\N	88	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
185	{}	base	tukangbesikhc-valencypassive	\N	\N	89	32	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
186	{}	base	lezgianlez-nominalizermiscellaneous	\N	\N	91	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
187	{}	base	lezgianlez-nominalizeragent	\N	\N	91	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
188	{}	base	centralsiberianyupikeskimoess-clauseleveltam	\N	\N	93	6	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
189	{}	base	kayardildgyd-nominalderivationmiscellaneous	\N	\N	60	27	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
190	{}	base	kuruxkru-adjectivizermiscellaneous	\N	\N	96	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
191	{}	base	kuruxkru-genderhuman	\N	\N	96	12	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
192	{}	base	kuruxkru-numeralandquantifierderivation	\N	\N	96	31	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
193	{}	base	kuruxkru-valencypassive	\N	\N	96	32	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
194	{}	base	turkishtur-adjectivizermiscellaneous	\N	\N	31	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
195	{}	base	turkishtur-nominalizermiscellaneous	\N	\N	31	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
196	{}	base	turkishtur-nominalizeragent	\N	\N	31	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
197	{}	base	turkishtur-nominalizerplacename	\N	\N	31	23	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
198	{}	base	turkishtur-nominalderivationmiscellaneous	\N	\N	31	27	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
199	{}	base	azariazb-adjectivizermiscellaneous	\N	\N	97	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
200	{}	base	azariazb-diminutive	\N	\N	97	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
201	{}	base	azariazb-nominalizeragent	\N	\N	97	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
202	{}	base	azariazb-nominalizerplacename	\N	\N	97	23	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
203	{}	base	azariazb-nominalderivationmiscellaneous	\N	\N	97	27	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
204	{}	base	kashmirikas-adjectivizermiscellaneous	\N	\N	98	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
205	{}	base	kashmirikas-adjectivizerprivative	\N	\N	98	4	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
206	{}	base	kashmirikas-nominalizeragent	\N	\N	98	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
207	{}	base	kashmirikas-nominalizerabstract	\N	\N	98	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
208	{}	base	kashmirikas-nominalderivationmiscellaneous	\N	\N	98	27	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
209	{}	base	khantykca-comparative	\N	\N	100	1	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
210	{}	base	khantykca-superlative	\N	\N	100	2	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
211	{}	base	khantykca-adjectivizermiscellaneous	\N	\N	100	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
212	{}	base	khantykca-adjectivizerprivative	\N	\N	100	4	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
213	{}	base	khantykca-diminutive	\N	\N	100	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
214	{}	base	khantykca-nominalderivationmiscellaneous	\N	\N	100	27	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
215	{}	base	khantykca-valencycausative	\N	\N	100	33	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
216	{}	base	khantykca-valencyreflexive	\N	\N	100	34	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
217	{}	base	khantykca-verbalderivationmiscellaneous	\N	\N	100	38	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
218	{}	base	khantykca-verbalizer	\N	\N	100	40	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
219	{}	base	finnishfin-genderhuman	\N	\N	102	12	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
220	{}	base	finnishfin-nominalizeragent	\N	\N	102	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
221	{}	base	carapanatatuyowaimajaandyurutitav-verbalderivationmiscellaneous	\N	\N	104	38	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
222	{}	base	basqueeus-adjectivizermiscellaneous	\N	\N	106	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
223	{}	base	basqueeus-adjectivizerprivative	\N	\N	106	4	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
224	{}	base	basqueeus-genderhuman	\N	\N	106	12	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
225	{}	base	basqueeus-diminutive	\N	\N	106	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
226	{}	base	basqueeus-augmentative	\N	\N	106	15	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
227	{}	base	basqueeus-nominalizeragent	\N	\N	106	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
228	{}	base	basqueeus-nominalizerabstract	\N	\N	106	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
229	{}	base	basqueeus-nominalizersocialgroup	\N	\N	106	22	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
230	{}	base	basqueeus-nominalderivationmiscellaneous	\N	\N	106	27	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
231	{}	base	basqueeus-verbalderivationmiscellaneous	\N	\N	106	38	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
232	{}	base	moroccanarabicary-nominalizerabstract	\N	\N	108	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
233	{}	base	wutunwuh-casenonlocativeperipheralcase	\N	\N	110	10	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
234	{}	base	wutunwuh-caselocative	\N	\N	110	11	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
235	{}	base	wutunwuh-valencyapplicative	\N	\N	110	35	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
236	{}	base	wutunwuh-verbaltam	\N	\N	110	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
237	{}	base	wutunwuh-relativizersubordinator	\N	\N	110	41	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
238	{}	base	quechuadepunoqxp-verbaltam	\N	\N	111	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
239	{}	base	quechuadepunoqxp-verbalderivationmiscellaneous	\N	\N	111	38	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
240	{}	base	chineseoflinxiahezoucmn-casenonlocativeperipheralcase	\N	\N	113	10	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
241	{}	base	judeospanishlad-adjectivizerprivative	\N	\N	114	4	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
242	{}	base	judeospanishlad-diminutive	\N	\N	114	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
243	{}	base	judeospanishlad-nominalizermiscellaneous	\N	\N	114	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
244	{}	base	judeospanishlad-nominalizerplacename	\N	\N	114	23	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
245	{}	base	judeospanishlad-nominalderivationmiscellaneous	\N	\N	114	27	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
246	{}	base	kareliankrl-definiteindefinite	\N	\N	115	16	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
247	{}	base	tarianatae-clauseleveltam	\N	\N	117	6	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
248	{}	base	tarianatae-verbalderivationmiscellaneous	\N	\N	117	38	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
249	{}	base	kalderashromanirmy-nominalizerabstract	\N	\N	10	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
250	{}	base	choolchf-verbalderivationmiscellaneous	\N	\N	118	38	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
251	{}	base	choolchf-relativizersubordinator	\N	\N	118	41	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
252	{}	base	westernneoaramaicofmalulaamw-comparative	\N	\N	121	1	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
253	{}	base	assameseasm-numeralclassifier	\N	\N	123	29	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
254	{}	base	tetundilitdt-nominalizeragent	\N	\N	125	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
255	{}	base	purepechatarascantsz-diminutive	\N	\N	126	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
256	{}	base	mexicanerodelasierramadreoccidentalnln-diminutive	\N	\N	127	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
257	{}	base	yucatecmayayua-diminutive	\N	\N	128	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
258	{}	base	iraqiarabicacm-adjectivizerprivative	\N	\N	129	4	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
259	{}	base	iraqiarabicacm-nominalizeragent	\N	\N	129	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
260	{}	base	iraqiarabicacm-nominalizerabstract	\N	\N	129	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
261	{}	base	iraqiarabicacm-nominalizersocialgroup	\N	\N	129	22	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
262	{}	base	alabamaandchoctawchickasawakzciccho-numeralderivationordinals	\N	\N	130	30	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
263	{}	base	germandeu-nominalizeragent	\N	\N	132	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
264	{}	base	amueshaame-clauseleveltam	\N	\N	134	6	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
265	{}	base	amueshaame-casenonlocativeperipheralcase	\N	\N	134	10	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
266	{}	base	mogholmhj-comparative	\N	\N	136	1	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
267	{}	base	mogholmhj-superlative	\N	\N	136	2	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
268	{}	base	mogholmhj-caselocative	\N	\N	136	11	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
269	{}	base	mogholmhj-numberplural	\N	\N	136	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
270	{}	base	dagurdta-numberplural	\N	\N	138	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
271	{}	base	hungarianhun-superlative	\N	\N	139	2	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
272	{}	base	santasce-nominalizermiscellaneous	\N	\N	112	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
273	{}	base	santasce-nominalizeragent	\N	\N	112	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
274	{}	base	santasce-numberplural	\N	\N	112	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
275	{}	base	santasce-valencypassive	\N	\N	112	32	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
276	{}	base	middlemongolicmon-casenonlocativeperipheralcase	\N	\N	142	10	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
277	{}	base	middlemongolicmon-nominalizeragent	\N	\N	142	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
278	{}	base	middlemongolicmon-numberplural	\N	\N	142	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
279	{}	base	middlemongolicmon-verbalizer	\N	\N	142	40	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
280	{}	base	ndungalendt-nounclassinanimate	\N	\N	144	13	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
281	{}	base	ilwanamlk-numberplural	\N	\N	146	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
282	{}	base	southswahiliswh-verbaltam	\N	\N	148	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
283	{}	base	nahuatlnhn-diminutive	\N	\N	149	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
284	{}	base	nahuatlnhn-augmentative	\N	\N	149	15	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
285	{}	base	nahuatlnhn-nominalizeragent	\N	\N	149	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
286	{}	base	russianrus-nominalizeragent	\N	\N	5	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
287	{}	base	lithuanianlit-verbaltam	\N	\N	153	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
288	{}	base	lithuanianlit-verbalizer	\N	\N	153	40	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
289	{}	base	slavomolisanosvm-clauselinking	\N	\N	156	7	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
290	{}	base	tuscanitalianita-adjectivizermiscellaneous	\N	\N	158	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
291	{}	base	arbereshalbanianaae-verbalizer	\N	\N	160	40	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
292	{}	base	kadiweukbc-subjectobjectindexing	\N	\N	162	39	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
293	{}	base	zamucoanayo-possessorindexing	\N	\N	164	28	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
294	{}	base	estonianekk-superlative	\N	\N	67	2	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
295	{}	base	estonianekk-adjectivizermiscellaneous	\N	\N	67	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
296	{}	base	estonianekk-clauseleveltam	\N	\N	67	6	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
297	{}	base	estonianekk-diminutive	\N	\N	67	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
298	{}	base	estonianekk-nominalizeragent	\N	\N	67	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
299	{}	base	estonianekk-nominalizerplacename	\N	\N	67	23	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
300	{}	base	chaldeanneoaramaiccld-possessorindexing	\N	\N	166	28	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
301	{}	base	suleimaniyajewishneoaramaichuy-definiteindefinite	\N	\N	167	16	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
302	{}	base	suleimaniyajewishneoaramaichuy-focus	\N	\N	167	18	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
303	{}	base	suleimaniyajewishneoaramaichuy-verbaltam	\N	\N	167	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
304	{}	base	estonianekk-nominalizermiscellaneous	\N	\N	67	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
305	{}	base	udiudi-adjectivizerprivative	\N	\N	169	4	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
306	{}	base	udiudi-clauselinking	\N	\N	169	7	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
307	{}	base	udiudi-nominalizeragent	\N	\N	169	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
308	{}	base	udiudi-nominalizerabstract	\N	\N	169	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
309	{}	base	udiudi-nominalizersocialgroup	\N	\N	169	22	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
310	{}	base	udiudi-numeralderivationordinals	\N	\N	169	30	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
311	{}	base	bellacoolablc-numberplural	\N	\N	171	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
312	{}	base	yiddishydd-adverbializer	\N	\N	79	5	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
313	{}	base	yiddishydd-numberplural	\N	\N	79	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
314	{}	base	welshcym-numberplural	\N	\N	173	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
315	{}	base	tamajeqtuaregthz-adjectivizermiscellaneous	\N	\N	175	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
316	{}	base	tamajeqtuaregthz-numberplural	\N	\N	175	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
317	{}	base	polishpol-nominalizermiscellaneous	\N	\N	176	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
318	{}	base	spanishspa-nominalizermiscellaneous	\N	\N	25	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
319	{}	base	tagalogtgl-adjectivizermiscellaneous	\N	\N	177	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
320	{}	base	tagalogtgl-diminutive	\N	\N	177	14	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
321	{}	base	tagalogtgl-nominalizermiscellaneous	\N	\N	177	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
322	{}	base	tagalogtgl-nominalizeragent	\N	\N	177	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
323	{}	base	danishdan-adjectivizermiscellaneous	\N	\N	178	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
324	{}	base	danishdan-nominalizermiscellaneous	\N	\N	178	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
325	{}	base	danishdan-nominalizeragent	\N	\N	178	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
326	{}	base	danishdan-nominalizerabstract	\N	\N	178	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
327	{}	base	danishdan-verbalderivationmiscellaneous	\N	\N	178	38	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
328	{}	base	danishdan-verbalizer	\N	\N	178	40	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
329	{}	base	alseaaes-caseergative	\N	\N	180	9	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
330	{}	base	mandarincmn-verbaltam	\N	\N	181	37	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
331	{}	base	turkishtur-nominalizerabstract	\N	\N	31	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
332	{}	base	vietnamesevie-adjectivizermiscellaneous	\N	\N	183	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
333	{}	base	vietnamesevie-nominalizermiscellaneous	\N	\N	183	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
334	{}	base	vietnamesevie-nominalizeragent	\N	\N	183	20	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
335	{}	base	vietnamesevie-nominalizerabstract	\N	\N	183	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
336	{}	base	vietnamesevie-numeralderivationordinals	\N	\N	183	30	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
337	{}	base	vietnamesevie-verbalizer	\N	\N	183	40	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
338	{}	base	japanesejpn-adjectivizerprivative	\N	\N	184	4	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
339	{}	base	japanesejpn-nominalizerabstract	\N	\N	184	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
340	{}	base	japanesejpn-verbalderivationmiscellaneous	\N	\N	184	38	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
341	{}	base	japanesejpn-adjectivizermiscellaneous	\N	\N	184	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
342	{}	base	japanesejpn-nominalderivationmiscellaneous	\N	\N	184	27	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
343	{}	base	latinlat-adverbializer	\N	\N	105	5	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
344	{}	base	upperchinookwac-adjectivizermiscellaneous	\N	\N	170	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
345	{}	base	upperchinookwac-casenonlocativeperipheralcase	\N	\N	170	10	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
346	{}	base	upperchinookwac-caselocative	\N	\N	170	11	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
347	{}	base	upperchinookwac-relativizersubordinator	\N	\N	170	41	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
348	{}	base	barambrd-clauseleveltam	\N	\N	188	6	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
349	{}	base	barambrd-numberplural	\N	\N	188	24	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
350	{}	base	barambrd-possessorindexing	\N	\N	188	28	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
351	{}	base	barambrd-numeralclassifier	\N	\N	188	29	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
352	{}	base	germandeu-adjectivizermiscellaneous	\N	\N	132	3	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
353	{}	base	songhayciinedje-nominalizerabstract	\N	\N	190	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
354	{}	base	englisheng-nominalderivationmiscellaneous	\N	\N	74	27	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
355	{}	base	hungarianhun-nominalderivationmiscellaneous	\N	\N	139	27	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
356	{}	base	caquintecot-nominalizermiscellaneous	\N	\N	191	19	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
357	{}	base	caquintecot-nominalizerabstract	\N	\N	191	21	\N	\N	2026-09-26 15:17:08.013501+02	2026-09-26 15:17:08.013501+02	t
\.


--
-- Data for Name: valueset_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.valueset_data (pk, jsondata, key, value, ord, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: valueset_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.valueset_files (pk, jsondata, id, name, description, markup_description, ord, mime_type, created, updated, active, object_pk) FROM stdin;
\.


--
-- Data for Name: valuesetreference; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.valuesetreference (pk, jsondata, key, description, valueset_pk, created, updated, active, source_pk) FROM stdin;
\.


--
-- Name: config_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.config_pk_seq', 1, false);


--
-- Name: contribution_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contribution_data_pk_seq', 1, false);


--
-- Name: contribution_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contribution_files_pk_seq', 1, false);


--
-- Name: contribution_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contribution_pk_seq', 1, false);


--
-- Name: contributioncontributor_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contributioncontributor_pk_seq', 1, false);


--
-- Name: contributionreference_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contributionreference_pk_seq', 1, false);


--
-- Name: contributor_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contributor_data_pk_seq', 1, false);


--
-- Name: contributor_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contributor_files_pk_seq', 1, false);


--
-- Name: contributor_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contributor_pk_seq', 2, true);


--
-- Name: dataset_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dataset_data_pk_seq', 1, false);


--
-- Name: dataset_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dataset_files_pk_seq', 1, false);


--
-- Name: dataset_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dataset_pk_seq', 1, true);


--
-- Name: domainelement_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.domainelement_data_pk_seq', 1, false);


--
-- Name: domainelement_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.domainelement_files_pk_seq', 1, false);


--
-- Name: domainelement_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.domainelement_pk_seq', 1, false);


--
-- Name: editor_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.editor_pk_seq', 2, true);


--
-- Name: glossabbreviation_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.glossabbreviation_pk_seq', 1, false);


--
-- Name: identifier_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.identifier_pk_seq', 352, true);


--
-- Name: language_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.language_data_pk_seq', 1, false);


--
-- Name: language_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.language_files_pk_seq', 1, false);


--
-- Name: language_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.language_pk_seq', 191, true);


--
-- Name: languageidentifier_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.languageidentifier_pk_seq', 385, true);


--
-- Name: languagesource_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.languagesource_pk_seq', 1, false);


--
-- Name: pair_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pair_pk_seq', 132, true);


--
-- Name: pairsource_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pairsource_pk_seq', 381, true);


--
-- Name: parameter_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.parameter_data_pk_seq', 1, false);


--
-- Name: parameter_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.parameter_files_pk_seq', 1, false);


--
-- Name: parameter_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.parameter_pk_seq', 42, true);


--
-- Name: sentence_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sentence_data_pk_seq', 1, false);


--
-- Name: sentence_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sentence_files_pk_seq', 1, false);


--
-- Name: sentence_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sentence_pk_seq', 1, false);


--
-- Name: sentencereference_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sentencereference_pk_seq', 1, false);


--
-- Name: source_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.source_data_pk_seq', 1, false);


--
-- Name: source_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.source_files_pk_seq', 1, false);


--
-- Name: source_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.source_pk_seq', 331, true);


--
-- Name: unit_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.unit_data_pk_seq', 1, false);


--
-- Name: unit_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.unit_files_pk_seq', 1, false);


--
-- Name: unit_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.unit_pk_seq', 1, false);


--
-- Name: unitdomainelement_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.unitdomainelement_data_pk_seq', 1, false);


--
-- Name: unitdomainelement_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.unitdomainelement_files_pk_seq', 1, false);


--
-- Name: unitdomainelement_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.unitdomainelement_pk_seq', 1, false);


--
-- Name: unitparameter_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.unitparameter_data_pk_seq', 1, false);


--
-- Name: unitparameter_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.unitparameter_files_pk_seq', 1, false);


--
-- Name: unitparameter_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.unitparameter_pk_seq', 1, false);


--
-- Name: unitvalue_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.unitvalue_data_pk_seq', 1, false);


--
-- Name: unitvalue_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.unitvalue_files_pk_seq', 1, false);


--
-- Name: unitvalue_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.unitvalue_pk_seq', 1, false);


--
-- Name: value_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.value_data_pk_seq', 1, false);


--
-- Name: value_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.value_files_pk_seq', 1, false);


--
-- Name: value_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.value_pk_seq', 373, true);


--
-- Name: valuesentence_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.valuesentence_pk_seq', 1, false);


--
-- Name: valueset_data_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.valueset_data_pk_seq', 1, false);


--
-- Name: valueset_files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.valueset_files_pk_seq', 1, false);


--
-- Name: valueset_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.valueset_pk_seq', 357, true);


--
-- Name: valuesetreference_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.valuesetreference_pk_seq', 1, false);


--
-- Name: afbolanguage afbolanguage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.afbolanguage
    ADD CONSTRAINT afbolanguage_pkey PRIMARY KEY (pk);


--
-- Name: afbovalue afbovalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.afbovalue
    ADD CONSTRAINT afbovalue_pkey PRIMARY KEY (pk);


--
-- Name: affixfunction affixfunction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affixfunction
    ADD CONSTRAINT affixfunction_pkey PRIMARY KEY (pk);


--
-- Name: config config_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (pk);


--
-- Name: contribution_data contribution_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribution_data
    ADD CONSTRAINT contribution_data_pkey PRIMARY KEY (pk);


--
-- Name: contribution_files contribution_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribution_files
    ADD CONSTRAINT contribution_files_id_key UNIQUE (id);


--
-- Name: contribution_files contribution_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribution_files
    ADD CONSTRAINT contribution_files_pkey PRIMARY KEY (pk);


--
-- Name: contribution contribution_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribution
    ADD CONSTRAINT contribution_id_key UNIQUE (id);


--
-- Name: contribution contribution_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribution
    ADD CONSTRAINT contribution_name_key UNIQUE (name);


--
-- Name: contribution contribution_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribution
    ADD CONSTRAINT contribution_pkey PRIMARY KEY (pk);


--
-- Name: contributioncontributor contributioncontributor_contribution_pk_contributor_pk_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributioncontributor
    ADD CONSTRAINT contributioncontributor_contribution_pk_contributor_pk_key UNIQUE (contribution_pk, contributor_pk);


--
-- Name: contributioncontributor contributioncontributor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributioncontributor
    ADD CONSTRAINT contributioncontributor_pkey PRIMARY KEY (pk);


--
-- Name: contributionreference contributionreference_contribution_pk_source_pk_description_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributionreference
    ADD CONSTRAINT contributionreference_contribution_pk_source_pk_description_key UNIQUE (contribution_pk, source_pk, description);


--
-- Name: contributionreference contributionreference_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributionreference
    ADD CONSTRAINT contributionreference_pkey PRIMARY KEY (pk);


--
-- Name: contributor_data contributor_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributor_data
    ADD CONSTRAINT contributor_data_pkey PRIMARY KEY (pk);


--
-- Name: contributor_files contributor_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributor_files
    ADD CONSTRAINT contributor_files_id_key UNIQUE (id);


--
-- Name: contributor_files contributor_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributor_files
    ADD CONSTRAINT contributor_files_pkey PRIMARY KEY (pk);


--
-- Name: contributor contributor_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributor
    ADD CONSTRAINT contributor_id_key UNIQUE (id);


--
-- Name: contributor contributor_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributor
    ADD CONSTRAINT contributor_name_key UNIQUE (name);


--
-- Name: contributor contributor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributor
    ADD CONSTRAINT contributor_pkey PRIMARY KEY (pk);


--
-- Name: dataset_data dataset_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_data
    ADD CONSTRAINT dataset_data_pkey PRIMARY KEY (pk);


--
-- Name: dataset_files dataset_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_files
    ADD CONSTRAINT dataset_files_id_key UNIQUE (id);


--
-- Name: dataset_files dataset_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_files
    ADD CONSTRAINT dataset_files_pkey PRIMARY KEY (pk);


--
-- Name: dataset dataset_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset
    ADD CONSTRAINT dataset_id_key UNIQUE (id);


--
-- Name: dataset dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset
    ADD CONSTRAINT dataset_pkey PRIMARY KEY (pk);


--
-- Name: domainelement_data domainelement_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.domainelement_data
    ADD CONSTRAINT domainelement_data_pkey PRIMARY KEY (pk);


--
-- Name: domainelement_files domainelement_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.domainelement_files
    ADD CONSTRAINT domainelement_files_id_key UNIQUE (id);


--
-- Name: domainelement_files domainelement_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.domainelement_files
    ADD CONSTRAINT domainelement_files_pkey PRIMARY KEY (pk);


--
-- Name: domainelement domainelement_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.domainelement
    ADD CONSTRAINT domainelement_id_key UNIQUE (id);


--
-- Name: domainelement domainelement_parameter_pk_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.domainelement
    ADD CONSTRAINT domainelement_parameter_pk_name_key UNIQUE (parameter_pk, name);


--
-- Name: domainelement domainelement_parameter_pk_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.domainelement
    ADD CONSTRAINT domainelement_parameter_pk_number_key UNIQUE (parameter_pk, number);


--
-- Name: domainelement domainelement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.domainelement
    ADD CONSTRAINT domainelement_pkey PRIMARY KEY (pk);


--
-- Name: editor editor_dataset_pk_contributor_pk_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editor
    ADD CONSTRAINT editor_dataset_pk_contributor_pk_key UNIQUE (dataset_pk, contributor_pk);


--
-- Name: editor editor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editor
    ADD CONSTRAINT editor_pkey PRIMARY KEY (pk);


--
-- Name: glossabbreviation glossabbreviation_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.glossabbreviation
    ADD CONSTRAINT glossabbreviation_id_key UNIQUE (id);


--
-- Name: glossabbreviation glossabbreviation_id_language_pk_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.glossabbreviation
    ADD CONSTRAINT glossabbreviation_id_language_pk_key UNIQUE (id, language_pk);


--
-- Name: glossabbreviation glossabbreviation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.glossabbreviation
    ADD CONSTRAINT glossabbreviation_pkey PRIMARY KEY (pk);


--
-- Name: identifier identifier_name_type_description_lang_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.identifier
    ADD CONSTRAINT identifier_name_type_description_lang_key UNIQUE (name, type, description, lang);


--
-- Name: identifier identifier_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.identifier
    ADD CONSTRAINT identifier_pkey PRIMARY KEY (pk);


--
-- Name: language_data language_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language_data
    ADD CONSTRAINT language_data_pkey PRIMARY KEY (pk);


--
-- Name: language_files language_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language_files
    ADD CONSTRAINT language_files_id_key UNIQUE (id);


--
-- Name: language_files language_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language_files
    ADD CONSTRAINT language_files_pkey PRIMARY KEY (pk);


--
-- Name: language language_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_id_key UNIQUE (id);


--
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (pk);


--
-- Name: languageidentifier languageidentifier_language_pk_identifier_pk_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languageidentifier
    ADD CONSTRAINT languageidentifier_language_pk_identifier_pk_key UNIQUE (language_pk, identifier_pk);


--
-- Name: languageidentifier languageidentifier_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languageidentifier
    ADD CONSTRAINT languageidentifier_pkey PRIMARY KEY (pk);


--
-- Name: languagesource languagesource_language_pk_source_pk_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languagesource
    ADD CONSTRAINT languagesource_language_pk_source_pk_key UNIQUE (language_pk, source_pk);


--
-- Name: languagesource languagesource_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languagesource
    ADD CONSTRAINT languagesource_pkey PRIMARY KEY (pk);


--
-- Name: pair pair_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pair
    ADD CONSTRAINT pair_id_key UNIQUE (id);


--
-- Name: pair pair_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pair
    ADD CONSTRAINT pair_pkey PRIMARY KEY (pk);


--
-- Name: pairsource pairsource_pair_pk_source_pk_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pairsource
    ADD CONSTRAINT pairsource_pair_pk_source_pk_key UNIQUE (pair_pk, source_pk);


--
-- Name: pairsource pairsource_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pairsource
    ADD CONSTRAINT pairsource_pkey PRIMARY KEY (pk);


--
-- Name: parameter_data parameter_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameter_data
    ADD CONSTRAINT parameter_data_pkey PRIMARY KEY (pk);


--
-- Name: parameter_files parameter_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameter_files
    ADD CONSTRAINT parameter_files_id_key UNIQUE (id);


--
-- Name: parameter_files parameter_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameter_files
    ADD CONSTRAINT parameter_files_pkey PRIMARY KEY (pk);


--
-- Name: parameter parameter_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameter
    ADD CONSTRAINT parameter_id_key UNIQUE (id);


--
-- Name: parameter parameter_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameter
    ADD CONSTRAINT parameter_name_key UNIQUE (name);


--
-- Name: parameter parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameter
    ADD CONSTRAINT parameter_pkey PRIMARY KEY (pk);


--
-- Name: sentence_data sentence_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentence_data
    ADD CONSTRAINT sentence_data_pkey PRIMARY KEY (pk);


--
-- Name: sentence_files sentence_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentence_files
    ADD CONSTRAINT sentence_files_id_key UNIQUE (id);


--
-- Name: sentence_files sentence_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentence_files
    ADD CONSTRAINT sentence_files_pkey PRIMARY KEY (pk);


--
-- Name: sentence sentence_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentence
    ADD CONSTRAINT sentence_id_key UNIQUE (id);


--
-- Name: sentence sentence_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentence
    ADD CONSTRAINT sentence_pkey PRIMARY KEY (pk);


--
-- Name: sentencereference sentencereference_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentencereference
    ADD CONSTRAINT sentencereference_pkey PRIMARY KEY (pk);


--
-- Name: sentencereference sentencereference_sentence_pk_source_pk_description_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentencereference
    ADD CONSTRAINT sentencereference_sentence_pk_source_pk_description_key UNIQUE (sentence_pk, source_pk, description);


--
-- Name: source_data source_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.source_data
    ADD CONSTRAINT source_data_pkey PRIMARY KEY (pk);


--
-- Name: source_files source_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.source_files
    ADD CONSTRAINT source_files_id_key UNIQUE (id);


--
-- Name: source_files source_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.source_files
    ADD CONSTRAINT source_files_pkey PRIMARY KEY (pk);


--
-- Name: source source_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_id_key UNIQUE (id);


--
-- Name: source source_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_pkey PRIMARY KEY (pk);


--
-- Name: unit_data unit_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit_data
    ADD CONSTRAINT unit_data_pkey PRIMARY KEY (pk);


--
-- Name: unit_files unit_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit_files
    ADD CONSTRAINT unit_files_id_key UNIQUE (id);


--
-- Name: unit_files unit_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit_files
    ADD CONSTRAINT unit_files_pkey PRIMARY KEY (pk);


--
-- Name: unit unit_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_id_key UNIQUE (id);


--
-- Name: unit unit_language_pk_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_language_pk_id_key UNIQUE (language_pk, id);


--
-- Name: unit unit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (pk);


--
-- Name: unitdomainelement_data unitdomainelement_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitdomainelement_data
    ADD CONSTRAINT unitdomainelement_data_pkey PRIMARY KEY (pk);


--
-- Name: unitdomainelement_files unitdomainelement_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitdomainelement_files
    ADD CONSTRAINT unitdomainelement_files_id_key UNIQUE (id);


--
-- Name: unitdomainelement_files unitdomainelement_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitdomainelement_files
    ADD CONSTRAINT unitdomainelement_files_pkey PRIMARY KEY (pk);


--
-- Name: unitdomainelement unitdomainelement_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitdomainelement
    ADD CONSTRAINT unitdomainelement_id_key UNIQUE (id);


--
-- Name: unitdomainelement unitdomainelement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitdomainelement
    ADD CONSTRAINT unitdomainelement_pkey PRIMARY KEY (pk);


--
-- Name: unitdomainelement unitdomainelement_unitparameter_pk_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitdomainelement
    ADD CONSTRAINT unitdomainelement_unitparameter_pk_name_key UNIQUE (unitparameter_pk, name);


--
-- Name: unitdomainelement unitdomainelement_unitparameter_pk_ord_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitdomainelement
    ADD CONSTRAINT unitdomainelement_unitparameter_pk_ord_key UNIQUE (unitparameter_pk, ord);


--
-- Name: unitparameter_data unitparameter_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitparameter_data
    ADD CONSTRAINT unitparameter_data_pkey PRIMARY KEY (pk);


--
-- Name: unitparameter_files unitparameter_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitparameter_files
    ADD CONSTRAINT unitparameter_files_id_key UNIQUE (id);


--
-- Name: unitparameter_files unitparameter_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitparameter_files
    ADD CONSTRAINT unitparameter_files_pkey PRIMARY KEY (pk);


--
-- Name: unitparameter unitparameter_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitparameter
    ADD CONSTRAINT unitparameter_id_key UNIQUE (id);


--
-- Name: unitparameter unitparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitparameter
    ADD CONSTRAINT unitparameter_pkey PRIMARY KEY (pk);


--
-- Name: unitvalue_data unitvalue_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitvalue_data
    ADD CONSTRAINT unitvalue_data_pkey PRIMARY KEY (pk);


--
-- Name: unitvalue_files unitvalue_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitvalue_files
    ADD CONSTRAINT unitvalue_files_id_key UNIQUE (id);


--
-- Name: unitvalue_files unitvalue_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitvalue_files
    ADD CONSTRAINT unitvalue_files_pkey PRIMARY KEY (pk);


--
-- Name: unitvalue unitvalue_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitvalue
    ADD CONSTRAINT unitvalue_id_key UNIQUE (id);


--
-- Name: unitvalue unitvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitvalue
    ADD CONSTRAINT unitvalue_pkey PRIMARY KEY (pk);


--
-- Name: unitvalue unitvalue_unit_pk_unitparameter_pk_contribution_pk_name_uni_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitvalue
    ADD CONSTRAINT unitvalue_unit_pk_unitparameter_pk_contribution_pk_name_uni_key UNIQUE (unit_pk, unitparameter_pk, contribution_pk, name, unitdomainelement_pk);


--
-- Name: value_data value_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.value_data
    ADD CONSTRAINT value_data_pkey PRIMARY KEY (pk);


--
-- Name: value_files value_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.value_files
    ADD CONSTRAINT value_files_id_key UNIQUE (id);


--
-- Name: value_files value_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.value_files
    ADD CONSTRAINT value_files_pkey PRIMARY KEY (pk);


--
-- Name: value value_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.value
    ADD CONSTRAINT value_id_key UNIQUE (id);


--
-- Name: value value_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.value
    ADD CONSTRAINT value_pkey PRIMARY KEY (pk);


--
-- Name: value value_valueset_pk_name_domainelement_pk_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.value
    ADD CONSTRAINT value_valueset_pk_name_domainelement_pk_key UNIQUE (valueset_pk, name, domainelement_pk);


--
-- Name: valuesentence valuesentence_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valuesentence
    ADD CONSTRAINT valuesentence_pkey PRIMARY KEY (pk);


--
-- Name: valuesentence valuesentence_value_pk_sentence_pk_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valuesentence
    ADD CONSTRAINT valuesentence_value_pk_sentence_pk_key UNIQUE (value_pk, sentence_pk);


--
-- Name: valueset_data valueset_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valueset_data
    ADD CONSTRAINT valueset_data_pkey PRIMARY KEY (pk);


--
-- Name: valueset_files valueset_files_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valueset_files
    ADD CONSTRAINT valueset_files_id_key UNIQUE (id);


--
-- Name: valueset_files valueset_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valueset_files
    ADD CONSTRAINT valueset_files_pkey PRIMARY KEY (pk);


--
-- Name: valueset valueset_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valueset
    ADD CONSTRAINT valueset_id_key UNIQUE (id);


--
-- Name: valueset valueset_language_pk_parameter_pk_contribution_pk_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valueset
    ADD CONSTRAINT valueset_language_pk_parameter_pk_contribution_pk_key UNIQUE (language_pk, parameter_pk, contribution_pk);


--
-- Name: valueset valueset_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valueset
    ADD CONSTRAINT valueset_pkey PRIMARY KEY (pk);


--
-- Name: valuesetreference valuesetreference_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valuesetreference
    ADD CONSTRAINT valuesetreference_pkey PRIMARY KEY (pk);


--
-- Name: valuesetreference valuesetreference_valueset_pk_source_pk_description_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valuesetreference
    ADD CONSTRAINT valuesetreference_valueset_pk_source_pk_description_key UNIQUE (valueset_pk, source_pk, description);


--
-- Name: afbolanguage afbolanguage_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.afbolanguage
    ADD CONSTRAINT afbolanguage_pk_fkey FOREIGN KEY (pk) REFERENCES public.language(pk);


--
-- Name: afbovalue afbovalue_pair_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.afbovalue
    ADD CONSTRAINT afbovalue_pair_pk_fkey FOREIGN KEY (pair_pk) REFERENCES public.pair(pk);


--
-- Name: afbovalue afbovalue_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.afbovalue
    ADD CONSTRAINT afbovalue_pk_fkey FOREIGN KEY (pk) REFERENCES public.value(pk);


--
-- Name: affixfunction affixfunction_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affixfunction
    ADD CONSTRAINT affixfunction_pk_fkey FOREIGN KEY (pk) REFERENCES public.parameter(pk);


--
-- Name: contribution_data contribution_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribution_data
    ADD CONSTRAINT contribution_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.contribution(pk);


--
-- Name: contribution_files contribution_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribution_files
    ADD CONSTRAINT contribution_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.contribution(pk);


--
-- Name: contributioncontributor contributioncontributor_contribution_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributioncontributor
    ADD CONSTRAINT contributioncontributor_contribution_pk_fkey FOREIGN KEY (contribution_pk) REFERENCES public.contribution(pk);


--
-- Name: contributioncontributor contributioncontributor_contributor_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributioncontributor
    ADD CONSTRAINT contributioncontributor_contributor_pk_fkey FOREIGN KEY (contributor_pk) REFERENCES public.contributor(pk);


--
-- Name: contributionreference contributionreference_contribution_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributionreference
    ADD CONSTRAINT contributionreference_contribution_pk_fkey FOREIGN KEY (contribution_pk) REFERENCES public.contribution(pk);


--
-- Name: contributionreference contributionreference_source_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributionreference
    ADD CONSTRAINT contributionreference_source_pk_fkey FOREIGN KEY (source_pk) REFERENCES public.source(pk);


--
-- Name: contributor_data contributor_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributor_data
    ADD CONSTRAINT contributor_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.contributor(pk);


--
-- Name: contributor_files contributor_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributor_files
    ADD CONSTRAINT contributor_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.contributor(pk);


--
-- Name: dataset_data dataset_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_data
    ADD CONSTRAINT dataset_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.dataset(pk);


--
-- Name: dataset_files dataset_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_files
    ADD CONSTRAINT dataset_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.dataset(pk);


--
-- Name: domainelement_data domainelement_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.domainelement_data
    ADD CONSTRAINT domainelement_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.domainelement(pk);


--
-- Name: domainelement_files domainelement_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.domainelement_files
    ADD CONSTRAINT domainelement_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.domainelement(pk);


--
-- Name: domainelement domainelement_parameter_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.domainelement
    ADD CONSTRAINT domainelement_parameter_pk_fkey FOREIGN KEY (parameter_pk) REFERENCES public.parameter(pk);


--
-- Name: editor editor_contributor_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editor
    ADD CONSTRAINT editor_contributor_pk_fkey FOREIGN KEY (contributor_pk) REFERENCES public.contributor(pk);


--
-- Name: editor editor_dataset_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editor
    ADD CONSTRAINT editor_dataset_pk_fkey FOREIGN KEY (dataset_pk) REFERENCES public.dataset(pk);


--
-- Name: glossabbreviation glossabbreviation_language_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.glossabbreviation
    ADD CONSTRAINT glossabbreviation_language_pk_fkey FOREIGN KEY (language_pk) REFERENCES public.language(pk);


--
-- Name: language_data language_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language_data
    ADD CONSTRAINT language_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.language(pk);


--
-- Name: language_files language_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language_files
    ADD CONSTRAINT language_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.language(pk);


--
-- Name: languageidentifier languageidentifier_identifier_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languageidentifier
    ADD CONSTRAINT languageidentifier_identifier_pk_fkey FOREIGN KEY (identifier_pk) REFERENCES public.identifier(pk);


--
-- Name: languageidentifier languageidentifier_language_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languageidentifier
    ADD CONSTRAINT languageidentifier_language_pk_fkey FOREIGN KEY (language_pk) REFERENCES public.language(pk);


--
-- Name: languagesource languagesource_language_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languagesource
    ADD CONSTRAINT languagesource_language_pk_fkey FOREIGN KEY (language_pk) REFERENCES public.language(pk);


--
-- Name: languagesource languagesource_source_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languagesource
    ADD CONSTRAINT languagesource_source_pk_fkey FOREIGN KEY (source_pk) REFERENCES public.source(pk);


--
-- Name: pair pair_donor_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pair
    ADD CONSTRAINT pair_donor_pk_fkey FOREIGN KEY (donor_pk) REFERENCES public.language(pk);


--
-- Name: pair pair_recipient_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pair
    ADD CONSTRAINT pair_recipient_pk_fkey FOREIGN KEY (recipient_pk) REFERENCES public.language(pk);


--
-- Name: pairsource pairsource_pair_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pairsource
    ADD CONSTRAINT pairsource_pair_pk_fkey FOREIGN KEY (pair_pk) REFERENCES public.pair(pk);


--
-- Name: pairsource pairsource_source_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pairsource
    ADD CONSTRAINT pairsource_source_pk_fkey FOREIGN KEY (source_pk) REFERENCES public.source(pk);


--
-- Name: parameter_data parameter_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameter_data
    ADD CONSTRAINT parameter_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.parameter(pk);


--
-- Name: parameter_files parameter_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameter_files
    ADD CONSTRAINT parameter_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.parameter(pk);


--
-- Name: sentence_data sentence_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentence_data
    ADD CONSTRAINT sentence_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.sentence(pk);


--
-- Name: sentence_files sentence_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentence_files
    ADD CONSTRAINT sentence_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.sentence(pk);


--
-- Name: sentence sentence_language_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentence
    ADD CONSTRAINT sentence_language_pk_fkey FOREIGN KEY (language_pk) REFERENCES public.language(pk);


--
-- Name: sentencereference sentencereference_sentence_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentencereference
    ADD CONSTRAINT sentencereference_sentence_pk_fkey FOREIGN KEY (sentence_pk) REFERENCES public.sentence(pk);


--
-- Name: sentencereference sentencereference_source_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentencereference
    ADD CONSTRAINT sentencereference_source_pk_fkey FOREIGN KEY (source_pk) REFERENCES public.source(pk);


--
-- Name: source_data source_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.source_data
    ADD CONSTRAINT source_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.source(pk);


--
-- Name: source_files source_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.source_files
    ADD CONSTRAINT source_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.source(pk);


--
-- Name: unit_data unit_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit_data
    ADD CONSTRAINT unit_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.unit(pk);


--
-- Name: unit_files unit_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit_files
    ADD CONSTRAINT unit_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.unit(pk);


--
-- Name: unit unit_language_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_language_pk_fkey FOREIGN KEY (language_pk) REFERENCES public.language(pk);


--
-- Name: unitdomainelement_data unitdomainelement_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitdomainelement_data
    ADD CONSTRAINT unitdomainelement_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.unitdomainelement(pk);


--
-- Name: unitdomainelement_files unitdomainelement_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitdomainelement_files
    ADD CONSTRAINT unitdomainelement_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.unitdomainelement(pk);


--
-- Name: unitdomainelement unitdomainelement_unitparameter_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitdomainelement
    ADD CONSTRAINT unitdomainelement_unitparameter_pk_fkey FOREIGN KEY (unitparameter_pk) REFERENCES public.unitparameter(pk);


--
-- Name: unitparameter_data unitparameter_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitparameter_data
    ADD CONSTRAINT unitparameter_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.unitparameter(pk);


--
-- Name: unitparameter_files unitparameter_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitparameter_files
    ADD CONSTRAINT unitparameter_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.unitparameter(pk);


--
-- Name: unitvalue unitvalue_contribution_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitvalue
    ADD CONSTRAINT unitvalue_contribution_pk_fkey FOREIGN KEY (contribution_pk) REFERENCES public.contribution(pk);


--
-- Name: unitvalue_data unitvalue_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitvalue_data
    ADD CONSTRAINT unitvalue_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.unitvalue(pk);


--
-- Name: unitvalue_files unitvalue_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitvalue_files
    ADD CONSTRAINT unitvalue_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.unitvalue(pk);


--
-- Name: unitvalue unitvalue_unit_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitvalue
    ADD CONSTRAINT unitvalue_unit_pk_fkey FOREIGN KEY (unit_pk) REFERENCES public.unit(pk);


--
-- Name: unitvalue unitvalue_unitdomainelement_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitvalue
    ADD CONSTRAINT unitvalue_unitdomainelement_pk_fkey FOREIGN KEY (unitdomainelement_pk) REFERENCES public.unitdomainelement(pk);


--
-- Name: unitvalue unitvalue_unitparameter_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitvalue
    ADD CONSTRAINT unitvalue_unitparameter_pk_fkey FOREIGN KEY (unitparameter_pk) REFERENCES public.unitparameter(pk);


--
-- Name: value_data value_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.value_data
    ADD CONSTRAINT value_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.value(pk);


--
-- Name: value value_domainelement_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.value
    ADD CONSTRAINT value_domainelement_pk_fkey FOREIGN KEY (domainelement_pk) REFERENCES public.domainelement(pk);


--
-- Name: value_files value_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.value_files
    ADD CONSTRAINT value_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.value(pk);


--
-- Name: value value_valueset_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.value
    ADD CONSTRAINT value_valueset_pk_fkey FOREIGN KEY (valueset_pk) REFERENCES public.valueset(pk);


--
-- Name: valuesentence valuesentence_sentence_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valuesentence
    ADD CONSTRAINT valuesentence_sentence_pk_fkey FOREIGN KEY (sentence_pk) REFERENCES public.sentence(pk);


--
-- Name: valuesentence valuesentence_value_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valuesentence
    ADD CONSTRAINT valuesentence_value_pk_fkey FOREIGN KEY (value_pk) REFERENCES public.value(pk);


--
-- Name: valueset valueset_contribution_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valueset
    ADD CONSTRAINT valueset_contribution_pk_fkey FOREIGN KEY (contribution_pk) REFERENCES public.contribution(pk);


--
-- Name: valueset_data valueset_data_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valueset_data
    ADD CONSTRAINT valueset_data_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.valueset(pk);


--
-- Name: valueset_files valueset_files_object_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valueset_files
    ADD CONSTRAINT valueset_files_object_pk_fkey FOREIGN KEY (object_pk) REFERENCES public.valueset(pk);


--
-- Name: valueset valueset_language_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valueset
    ADD CONSTRAINT valueset_language_pk_fkey FOREIGN KEY (language_pk) REFERENCES public.language(pk);


--
-- Name: valueset valueset_parameter_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valueset
    ADD CONSTRAINT valueset_parameter_pk_fkey FOREIGN KEY (parameter_pk) REFERENCES public.parameter(pk);


--
-- Name: valuesetreference valuesetreference_source_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valuesetreference
    ADD CONSTRAINT valuesetreference_source_pk_fkey FOREIGN KEY (source_pk) REFERENCES public.source(pk);


--
-- Name: valuesetreference valuesetreference_valueset_pk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valuesetreference
    ADD CONSTRAINT valuesetreference_valueset_pk_fkey FOREIGN KEY (valueset_pk) REFERENCES public.valueset(pk);


--
-- PostgreSQL database dump complete
--

\unrestrict IUTm5aQuW3ryDGrCvi8gCe2V1rsUsJwtJsNbZebjYBm0PFG7hsHbHRgEIcIOzVc

