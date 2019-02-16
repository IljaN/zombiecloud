--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE owncloud;
--
-- Name: owncloud; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE owncloud WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE owncloud OWNER TO postgres;

\connect owncloud

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: oc_account_terms; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_account_terms (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    term character varying(191) NOT NULL
);


ALTER TABLE public.oc_account_terms OWNER TO oc_admin;

--
-- Name: oc_account_terms_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_account_terms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_account_terms_id_seq OWNER TO oc_admin;

--
-- Name: oc_account_terms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_account_terms_id_seq OWNED BY public.oc_account_terms.id;


--
-- Name: oc_accounts; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_accounts (
    id bigint NOT NULL,
    email character varying(255) DEFAULT NULL::character varying,
    user_id character varying(255) NOT NULL,
    lower_user_id character varying(255) NOT NULL,
    display_name character varying(255) DEFAULT NULL::character varying,
    quota character varying(32) DEFAULT NULL::character varying,
    last_login integer DEFAULT 0 NOT NULL,
    backend character varying(64) NOT NULL,
    home character varying(1024) NOT NULL,
    state smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_accounts OWNER TO oc_admin;

--
-- Name: COLUMN oc_accounts.state; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_accounts.state IS '0: initial, 1: enabled, 2: disabled, 3: deleted';


--
-- Name: oc_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_accounts_id_seq OWNER TO oc_admin;

--
-- Name: oc_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_accounts_id_seq OWNED BY public.oc_accounts.id;


--
-- Name: oc_addressbookchanges; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_addressbookchanges (
    id bigint NOT NULL,
    uri character varying(255) DEFAULT NULL::character varying,
    synctoken integer DEFAULT 1 NOT NULL,
    addressbookid integer NOT NULL,
    operation smallint NOT NULL
);


ALTER TABLE public.oc_addressbookchanges OWNER TO oc_admin;

--
-- Name: oc_addressbookchanges_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_addressbookchanges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_addressbookchanges_id_seq OWNER TO oc_admin;

--
-- Name: oc_addressbookchanges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_addressbookchanges_id_seq OWNED BY public.oc_addressbookchanges.id;


--
-- Name: oc_addressbooks; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_addressbooks (
    id bigint NOT NULL,
    principaluri character varying(255) DEFAULT NULL::character varying,
    displayname character varying(255) DEFAULT NULL::character varying,
    uri character varying(255) DEFAULT NULL::character varying,
    description character varying(255) DEFAULT NULL::character varying,
    synctoken integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.oc_addressbooks OWNER TO oc_admin;

--
-- Name: oc_addressbooks_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_addressbooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_addressbooks_id_seq OWNER TO oc_admin;

--
-- Name: oc_addressbooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_addressbooks_id_seq OWNED BY public.oc_addressbooks.id;


--
-- Name: oc_appconfig; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_appconfig (
    appid character varying(32) DEFAULT ''::character varying NOT NULL,
    configkey character varying(64) DEFAULT ''::character varying NOT NULL,
    configvalue text
);


ALTER TABLE public.oc_appconfig OWNER TO oc_admin;

--
-- Name: oc_authtoken; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_authtoken (
    id integer NOT NULL,
    uid character varying(64) DEFAULT ''::character varying NOT NULL,
    login_name character varying(64) DEFAULT ''::character varying NOT NULL,
    password text,
    name text DEFAULT ''::text NOT NULL,
    token character varying(200) DEFAULT ''::character varying NOT NULL,
    type smallint DEFAULT 0 NOT NULL,
    last_activity integer DEFAULT 0 NOT NULL,
    last_check integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_authtoken OWNER TO oc_admin;

--
-- Name: oc_authtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_authtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_authtoken_id_seq OWNER TO oc_admin;

--
-- Name: oc_authtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_authtoken_id_seq OWNED BY public.oc_authtoken.id;


--
-- Name: oc_calendarchanges; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_calendarchanges (
    id bigint NOT NULL,
    uri character varying(255) DEFAULT NULL::character varying,
    synctoken integer DEFAULT 1 NOT NULL,
    calendarid integer NOT NULL,
    operation smallint NOT NULL
);


ALTER TABLE public.oc_calendarchanges OWNER TO oc_admin;

--
-- Name: oc_calendarchanges_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_calendarchanges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_calendarchanges_id_seq OWNER TO oc_admin;

--
-- Name: oc_calendarchanges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_calendarchanges_id_seq OWNED BY public.oc_calendarchanges.id;


--
-- Name: oc_calendarobjects; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_calendarobjects (
    id bigint NOT NULL,
    calendardata bytea,
    uri character varying(255) DEFAULT NULL::character varying,
    calendarid integer NOT NULL,
    lastmodified integer,
    etag character varying(32) DEFAULT NULL::character varying,
    size bigint NOT NULL,
    componenttype character varying(8) DEFAULT NULL::character varying,
    firstoccurence bigint,
    lastoccurence bigint,
    uid character varying(255) DEFAULT NULL::character varying,
    classification integer DEFAULT 0
);


ALTER TABLE public.oc_calendarobjects OWNER TO oc_admin;

--
-- Name: oc_calendarobjects_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_calendarobjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_calendarobjects_id_seq OWNER TO oc_admin;

--
-- Name: oc_calendarobjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_calendarobjects_id_seq OWNED BY public.oc_calendarobjects.id;


--
-- Name: oc_calendars; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_calendars (
    id bigint NOT NULL,
    principaluri character varying(255) DEFAULT NULL::character varying,
    displayname character varying(255) DEFAULT NULL::character varying,
    uri character varying(255) DEFAULT NULL::character varying,
    synctoken integer DEFAULT 1 NOT NULL,
    description character varying(255) DEFAULT NULL::character varying,
    calendarorder integer DEFAULT 0 NOT NULL,
    calendarcolor character varying(255) DEFAULT NULL::character varying,
    timezone text,
    components character varying(20) DEFAULT NULL::character varying,
    transparent smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_calendars OWNER TO oc_admin;

--
-- Name: oc_calendars_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_calendars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_calendars_id_seq OWNER TO oc_admin;

--
-- Name: oc_calendars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_calendars_id_seq OWNED BY public.oc_calendars.id;


--
-- Name: oc_calendarsubscriptions; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_calendarsubscriptions (
    id bigint NOT NULL,
    uri character varying(255) DEFAULT NULL::character varying,
    principaluri character varying(255) DEFAULT NULL::character varying,
    source character varying(255) DEFAULT NULL::character varying,
    displayname character varying(100) DEFAULT NULL::character varying,
    refreshrate character varying(10) DEFAULT NULL::character varying,
    calendarorder integer DEFAULT 0 NOT NULL,
    calendarcolor character varying(255) DEFAULT NULL::character varying,
    striptodos smallint,
    stripalarms smallint,
    stripattachments smallint,
    lastmodified integer NOT NULL
);


ALTER TABLE public.oc_calendarsubscriptions OWNER TO oc_admin;

--
-- Name: oc_calendarsubscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_calendarsubscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_calendarsubscriptions_id_seq OWNER TO oc_admin;

--
-- Name: oc_calendarsubscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_calendarsubscriptions_id_seq OWNED BY public.oc_calendarsubscriptions.id;


--
-- Name: oc_cards; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_cards (
    id bigint NOT NULL,
    addressbookid integer DEFAULT 0 NOT NULL,
    carddata bytea,
    uri character varying(255) DEFAULT NULL::character varying,
    lastmodified bigint,
    etag character varying(32) DEFAULT NULL::character varying,
    size bigint NOT NULL
);


ALTER TABLE public.oc_cards OWNER TO oc_admin;

--
-- Name: oc_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_cards_id_seq OWNER TO oc_admin;

--
-- Name: oc_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_cards_id_seq OWNED BY public.oc_cards.id;


--
-- Name: oc_cards_properties; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_cards_properties (
    id bigint NOT NULL,
    addressbookid bigint DEFAULT 0 NOT NULL,
    cardid bigint DEFAULT 0 NOT NULL,
    name character varying(64) DEFAULT NULL::character varying,
    value character varying(255) DEFAULT NULL::character varying,
    preferred integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.oc_cards_properties OWNER TO oc_admin;

--
-- Name: oc_cards_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_cards_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_cards_properties_id_seq OWNER TO oc_admin;

--
-- Name: oc_cards_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_cards_properties_id_seq OWNED BY public.oc_cards_properties.id;


--
-- Name: oc_comments; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_comments (
    id integer NOT NULL,
    parent_id integer DEFAULT 0 NOT NULL,
    topmost_parent_id integer DEFAULT 0 NOT NULL,
    children_count integer DEFAULT 0 NOT NULL,
    actor_type character varying(64) DEFAULT ''::character varying NOT NULL,
    actor_id character varying(64) DEFAULT ''::character varying NOT NULL,
    message text,
    verb character varying(64) DEFAULT NULL::character varying,
    creation_timestamp timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    latest_child_timestamp timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    object_type character varying(64) DEFAULT ''::character varying NOT NULL,
    object_id character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_comments OWNER TO oc_admin;

--
-- Name: oc_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_comments_id_seq OWNER TO oc_admin;

--
-- Name: oc_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_comments_id_seq OWNED BY public.oc_comments.id;


--
-- Name: oc_comments_read_markers; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_comments_read_markers (
    user_id character varying(64) DEFAULT ''::character varying NOT NULL,
    marker_datetime timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    object_type character varying(64) DEFAULT ''::character varying NOT NULL,
    object_id character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_comments_read_markers OWNER TO oc_admin;

--
-- Name: oc_credentials; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_credentials (
    "user" character varying(64) NOT NULL,
    identifier character varying(64) NOT NULL,
    credentials text
);


ALTER TABLE public.oc_credentials OWNER TO oc_admin;

--
-- Name: oc_dav_job_status; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_dav_job_status (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    user_id character varying(64) NOT NULL,
    status_info character varying(4000) NOT NULL
);


ALTER TABLE public.oc_dav_job_status OWNER TO oc_admin;

--
-- Name: oc_dav_job_status_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_dav_job_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_dav_job_status_id_seq OWNER TO oc_admin;

--
-- Name: oc_dav_job_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_dav_job_status_id_seq OWNED BY public.oc_dav_job_status.id;


--
-- Name: oc_dav_properties; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_dav_properties (
    id bigint NOT NULL,
    propertypath character varying(255) DEFAULT ''::character varying NOT NULL,
    propertyname character varying(255) DEFAULT ''::character varying NOT NULL,
    propertyvalue character varying(255) NOT NULL
);


ALTER TABLE public.oc_dav_properties OWNER TO oc_admin;

--
-- Name: oc_dav_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_dav_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_dav_properties_id_seq OWNER TO oc_admin;

--
-- Name: oc_dav_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_dav_properties_id_seq OWNED BY public.oc_dav_properties.id;


--
-- Name: oc_dav_shares; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_dav_shares (
    id bigint NOT NULL,
    principaluri character varying(255) DEFAULT NULL::character varying,
    type character varying(255) DEFAULT NULL::character varying,
    access smallint,
    resourceid integer NOT NULL,
    publicuri character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_dav_shares OWNER TO oc_admin;

--
-- Name: oc_dav_shares_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_dav_shares_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_dav_shares_id_seq OWNER TO oc_admin;

--
-- Name: oc_dav_shares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_dav_shares_id_seq OWNED BY public.oc_dav_shares.id;


--
-- Name: oc_external_applicable; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_external_applicable (
    applicable_id bigint NOT NULL,
    mount_id bigint NOT NULL,
    type integer NOT NULL,
    value character varying(64) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_external_applicable OWNER TO oc_admin;

--
-- Name: oc_external_applicable_applicable_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_external_applicable_applicable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_external_applicable_applicable_id_seq OWNER TO oc_admin;

--
-- Name: oc_external_applicable_applicable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_external_applicable_applicable_id_seq OWNED BY public.oc_external_applicable.applicable_id;


--
-- Name: oc_external_config; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_external_config (
    config_id bigint NOT NULL,
    mount_id bigint NOT NULL,
    key character varying(64) NOT NULL,
    value character varying(4096) NOT NULL
);


ALTER TABLE public.oc_external_config OWNER TO oc_admin;

--
-- Name: oc_external_config_config_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_external_config_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_external_config_config_id_seq OWNER TO oc_admin;

--
-- Name: oc_external_config_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_external_config_config_id_seq OWNED BY public.oc_external_config.config_id;


--
-- Name: oc_external_mounts; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_external_mounts (
    mount_id bigint NOT NULL,
    mount_point character varying(128) NOT NULL,
    storage_backend character varying(64) NOT NULL,
    auth_backend character varying(64) NOT NULL,
    priority integer DEFAULT 100 NOT NULL,
    type integer NOT NULL
);


ALTER TABLE public.oc_external_mounts OWNER TO oc_admin;

--
-- Name: oc_external_mounts_mount_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_external_mounts_mount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_external_mounts_mount_id_seq OWNER TO oc_admin;

--
-- Name: oc_external_mounts_mount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_external_mounts_mount_id_seq OWNED BY public.oc_external_mounts.mount_id;


--
-- Name: oc_external_options; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_external_options (
    option_id bigint NOT NULL,
    mount_id bigint NOT NULL,
    key character varying(64) NOT NULL,
    value character varying(256) NOT NULL
);


ALTER TABLE public.oc_external_options OWNER TO oc_admin;

--
-- Name: oc_external_options_option_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_external_options_option_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_external_options_option_id_seq OWNER TO oc_admin;

--
-- Name: oc_external_options_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_external_options_option_id_seq OWNED BY public.oc_external_options.option_id;


--
-- Name: oc_federated_reshares; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_federated_reshares (
    share_id bigint NOT NULL,
    remote_id bigint NOT NULL
);


ALTER TABLE public.oc_federated_reshares OWNER TO oc_admin;

--
-- Name: COLUMN oc_federated_reshares.remote_id; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_federated_reshares.remote_id IS 'share ID at the remote server';


--
-- Name: oc_file_locks; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_file_locks (
    id integer NOT NULL,
    lock integer DEFAULT 0 NOT NULL,
    key character varying(64) NOT NULL,
    ttl integer DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.oc_file_locks OWNER TO oc_admin;

--
-- Name: oc_file_locks_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_file_locks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_file_locks_id_seq OWNER TO oc_admin;

--
-- Name: oc_file_locks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_file_locks_id_seq OWNED BY public.oc_file_locks.id;


--
-- Name: oc_filecache; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_filecache (
    fileid bigint NOT NULL,
    storage integer DEFAULT 0 NOT NULL,
    path character varying(4000) DEFAULT NULL::character varying,
    path_hash character varying(32) DEFAULT ''::character varying NOT NULL,
    parent bigint DEFAULT 0 NOT NULL,
    name character varying(250) DEFAULT NULL::character varying,
    mimetype integer DEFAULT 0 NOT NULL,
    mimepart integer DEFAULT 0 NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    mtime bigint DEFAULT 0 NOT NULL,
    storage_mtime bigint DEFAULT 0 NOT NULL,
    encrypted integer DEFAULT 0 NOT NULL,
    unencrypted_size bigint DEFAULT 0 NOT NULL,
    etag character varying(40) DEFAULT NULL::character varying,
    permissions integer DEFAULT 0,
    checksum character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_filecache OWNER TO oc_admin;

--
-- Name: oc_filecache_fileid_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_filecache_fileid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_filecache_fileid_seq OWNER TO oc_admin;

--
-- Name: oc_filecache_fileid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_filecache_fileid_seq OWNED BY public.oc_filecache.fileid;


--
-- Name: oc_files_trash; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_files_trash (
    auto_id bigint NOT NULL,
    id character varying(250) DEFAULT ''::character varying NOT NULL,
    "user" character varying(64) DEFAULT ''::character varying NOT NULL,
    "timestamp" character varying(12) DEFAULT ''::character varying NOT NULL,
    location character varying(512) DEFAULT ''::character varying NOT NULL,
    type character varying(4) DEFAULT NULL::character varying,
    mime character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_files_trash OWNER TO oc_admin;

--
-- Name: oc_files_trash_auto_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_files_trash_auto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_files_trash_auto_id_seq OWNER TO oc_admin;

--
-- Name: oc_files_trash_auto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_files_trash_auto_id_seq OWNED BY public.oc_files_trash.auto_id;


--
-- Name: oc_group_admin; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_group_admin (
    gid character varying(64) DEFAULT ''::character varying NOT NULL,
    uid character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_group_admin OWNER TO oc_admin;

--
-- Name: oc_group_user; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_group_user (
    gid character varying(64) DEFAULT ''::character varying NOT NULL,
    uid character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_group_user OWNER TO oc_admin;

--
-- Name: oc_groups; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_groups (
    gid character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_groups OWNER TO oc_admin;

--
-- Name: oc_jobs; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_jobs (
    id integer NOT NULL,
    class character varying(255) DEFAULT ''::character varying NOT NULL,
    argument character varying(4000) DEFAULT ''::character varying NOT NULL,
    last_run integer DEFAULT 0,
    last_checked integer DEFAULT 0,
    reserved_at integer DEFAULT 0,
    execution_duration integer DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.oc_jobs OWNER TO oc_admin;

--
-- Name: oc_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_jobs_id_seq OWNER TO oc_admin;

--
-- Name: oc_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_jobs_id_seq OWNED BY public.oc_jobs.id;


--
-- Name: oc_migrations; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_migrations (
    app character varying(177) NOT NULL,
    version character varying(14) NOT NULL
);


ALTER TABLE public.oc_migrations OWNER TO oc_admin;

--
-- Name: oc_mimetypes; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_mimetypes (
    id integer NOT NULL,
    mimetype character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_mimetypes OWNER TO oc_admin;

--
-- Name: oc_mimetypes_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_mimetypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_mimetypes_id_seq OWNER TO oc_admin;

--
-- Name: oc_mimetypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_mimetypes_id_seq OWNED BY public.oc_mimetypes.id;


--
-- Name: oc_mounts; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_mounts (
    id integer NOT NULL,
    storage_id integer NOT NULL,
    root_id bigint NOT NULL,
    user_id character varying(64) NOT NULL,
    mount_point character varying(4000) NOT NULL
);


ALTER TABLE public.oc_mounts OWNER TO oc_admin;

--
-- Name: oc_mounts_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_mounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_mounts_id_seq OWNER TO oc_admin;

--
-- Name: oc_mounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_mounts_id_seq OWNED BY public.oc_mounts.id;


--
-- Name: oc_persistent_locks; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_persistent_locks (
    id bigint NOT NULL,
    file_id bigint NOT NULL,
    owner_account_id bigint,
    owner character varying(100) DEFAULT NULL::character varying,
    timeout integer NOT NULL,
    created_at integer NOT NULL,
    token character varying(1024) NOT NULL,
    token_hash character varying(32) NOT NULL,
    scope smallint NOT NULL,
    depth smallint NOT NULL
);


ALTER TABLE public.oc_persistent_locks OWNER TO oc_admin;

--
-- Name: COLUMN oc_persistent_locks.file_id; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_persistent_locks.file_id IS 'FK to fileid in table oc_file_cache';


--
-- Name: COLUMN oc_persistent_locks.owner_account_id; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_persistent_locks.owner_account_id IS 'owner of the lock - FK to account table';


--
-- Name: COLUMN oc_persistent_locks.owner; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_persistent_locks.owner IS 'owner of the lock - just a human readable string';


--
-- Name: COLUMN oc_persistent_locks.timeout; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_persistent_locks.timeout IS 'timestamp when the lock expires';


--
-- Name: COLUMN oc_persistent_locks.created_at; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_persistent_locks.created_at IS 'timestamp when the lock was created';


--
-- Name: COLUMN oc_persistent_locks.token; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_persistent_locks.token IS 'uuid for webdav locks - 1024 random chars for WOPI locks';


--
-- Name: COLUMN oc_persistent_locks.token_hash; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_persistent_locks.token_hash IS 'md5(token)';


--
-- Name: COLUMN oc_persistent_locks.scope; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_persistent_locks.scope IS '1 - exclusive, 2 - shared';


--
-- Name: COLUMN oc_persistent_locks.depth; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_persistent_locks.depth IS '0, 1 or infinite';


--
-- Name: oc_persistent_locks_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_persistent_locks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_persistent_locks_id_seq OWNER TO oc_admin;

--
-- Name: oc_persistent_locks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_persistent_locks_id_seq OWNED BY public.oc_persistent_locks.id;


--
-- Name: oc_preferences; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_preferences (
    userid character varying(64) DEFAULT ''::character varying NOT NULL,
    appid character varying(32) DEFAULT ''::character varying NOT NULL,
    configkey character varying(64) DEFAULT ''::character varying NOT NULL,
    configvalue text
);


ALTER TABLE public.oc_preferences OWNER TO oc_admin;

--
-- Name: oc_privatedata; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_privatedata (
    keyid integer NOT NULL,
    "user" character varying(64) DEFAULT ''::character varying NOT NULL,
    app character varying(255) DEFAULT ''::character varying NOT NULL,
    key character varying(255) DEFAULT ''::character varying NOT NULL,
    value character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_privatedata OWNER TO oc_admin;

--
-- Name: oc_privatedata_keyid_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_privatedata_keyid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_privatedata_keyid_seq OWNER TO oc_admin;

--
-- Name: oc_privatedata_keyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_privatedata_keyid_seq OWNED BY public.oc_privatedata.keyid;


--
-- Name: oc_properties; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_properties (
    id bigint NOT NULL,
    fileid bigint,
    propertyname character varying(255) DEFAULT ''::character varying NOT NULL,
    propertyvalue character varying(255) NOT NULL
);


ALTER TABLE public.oc_properties OWNER TO oc_admin;

--
-- Name: oc_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_properties_id_seq OWNER TO oc_admin;

--
-- Name: oc_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_properties_id_seq OWNED BY public.oc_properties.id;


--
-- Name: oc_schedulingobjects; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_schedulingobjects (
    id bigint NOT NULL,
    principaluri character varying(255) DEFAULT NULL::character varying,
    calendardata bytea,
    uri character varying(255) DEFAULT NULL::character varying,
    lastmodified integer,
    etag character varying(32) DEFAULT NULL::character varying,
    size bigint NOT NULL
);


ALTER TABLE public.oc_schedulingobjects OWNER TO oc_admin;

--
-- Name: oc_schedulingobjects_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_schedulingobjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_schedulingobjects_id_seq OWNER TO oc_admin;

--
-- Name: oc_schedulingobjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_schedulingobjects_id_seq OWNED BY public.oc_schedulingobjects.id;


--
-- Name: oc_share; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_share (
    id integer NOT NULL,
    share_type smallint DEFAULT 0 NOT NULL,
    share_with character varying(255) DEFAULT NULL::character varying,
    uid_owner character varying(64) DEFAULT ''::character varying NOT NULL,
    uid_initiator character varying(64) DEFAULT NULL::character varying,
    parent integer,
    item_type character varying(64) DEFAULT ''::character varying NOT NULL,
    item_source character varying(255) DEFAULT NULL::character varying,
    item_target character varying(255) DEFAULT NULL::character varying,
    file_source bigint,
    file_target character varying(512) DEFAULT NULL::character varying,
    permissions smallint DEFAULT 0 NOT NULL,
    stime bigint DEFAULT 0 NOT NULL,
    accepted smallint DEFAULT 0 NOT NULL,
    expiration timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    token character varying(32) DEFAULT NULL::character varying,
    mail_send smallint DEFAULT 0 NOT NULL,
    share_name character varying(64) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_share OWNER TO oc_admin;

--
-- Name: oc_share_external; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_share_external (
    id bigint NOT NULL,
    remote character varying(512) NOT NULL,
    remote_id bigint DEFAULT '-1'::integer NOT NULL,
    share_token character varying(64) NOT NULL,
    password character varying(64) DEFAULT NULL::character varying,
    name character varying(64) NOT NULL,
    owner character varying(64) NOT NULL,
    "user" character varying(64) NOT NULL,
    mountpoint character varying(4000) NOT NULL,
    mountpoint_hash character varying(32) NOT NULL,
    accepted integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_share_external OWNER TO oc_admin;

--
-- Name: COLUMN oc_share_external.remote; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_share_external.remote IS 'Url of the remote owncloud instance';


--
-- Name: COLUMN oc_share_external.share_token; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_share_external.share_token IS 'Public share token';


--
-- Name: COLUMN oc_share_external.password; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_share_external.password IS 'Optional password for the public share';


--
-- Name: COLUMN oc_share_external.name; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_share_external.name IS 'Original name on the remote server';


--
-- Name: COLUMN oc_share_external.owner; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_share_external.owner IS 'User that owns the public share on the remote server';


--
-- Name: COLUMN oc_share_external."user"; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_share_external."user" IS 'Local user which added the external share';


--
-- Name: COLUMN oc_share_external.mountpoint; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_share_external.mountpoint IS 'Full path where the share is mounted';


--
-- Name: COLUMN oc_share_external.mountpoint_hash; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_share_external.mountpoint_hash IS 'md5 hash of the mountpoint';


--
-- Name: oc_share_external_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_share_external_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_share_external_id_seq OWNER TO oc_admin;

--
-- Name: oc_share_external_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_share_external_id_seq OWNED BY public.oc_share_external.id;


--
-- Name: oc_share_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_share_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_share_id_seq OWNER TO oc_admin;

--
-- Name: oc_share_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_share_id_seq OWNED BY public.oc_share.id;


--
-- Name: oc_storages; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_storages (
    id character varying(64) DEFAULT NULL::character varying,
    numeric_id integer NOT NULL,
    available integer DEFAULT 1 NOT NULL,
    last_checked integer
);


ALTER TABLE public.oc_storages OWNER TO oc_admin;

--
-- Name: oc_storages_numeric_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_storages_numeric_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_storages_numeric_id_seq OWNER TO oc_admin;

--
-- Name: oc_storages_numeric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_storages_numeric_id_seq OWNED BY public.oc_storages.numeric_id;


--
-- Name: oc_systemtag; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_systemtag (
    id integer NOT NULL,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    visibility smallint DEFAULT 1 NOT NULL,
    editable smallint DEFAULT 1 NOT NULL,
    assignable smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.oc_systemtag OWNER TO oc_admin;

--
-- Name: oc_systemtag_group; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_systemtag_group (
    systemtagid integer DEFAULT 0 NOT NULL,
    gid character varying(255) NOT NULL
);


ALTER TABLE public.oc_systemtag_group OWNER TO oc_admin;

--
-- Name: oc_systemtag_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_systemtag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_systemtag_id_seq OWNER TO oc_admin;

--
-- Name: oc_systemtag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_systemtag_id_seq OWNED BY public.oc_systemtag.id;


--
-- Name: oc_systemtag_object_mapping; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_systemtag_object_mapping (
    objectid character varying(64) DEFAULT ''::character varying NOT NULL,
    objecttype character varying(64) DEFAULT ''::character varying NOT NULL,
    systemtagid integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_systemtag_object_mapping OWNER TO oc_admin;

--
-- Name: oc_trusted_servers; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_trusted_servers (
    id integer NOT NULL,
    url character varying(512) NOT NULL,
    url_hash character varying(255) DEFAULT ''::character varying NOT NULL,
    token character varying(128) DEFAULT NULL::character varying,
    shared_secret character varying(256) DEFAULT NULL::character varying,
    status integer DEFAULT 2 NOT NULL,
    sync_token character varying(512) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_trusted_servers OWNER TO oc_admin;

--
-- Name: COLUMN oc_trusted_servers.url; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_trusted_servers.url IS 'Url of trusted server';


--
-- Name: COLUMN oc_trusted_servers.url_hash; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_trusted_servers.url_hash IS 'sha1 hash of the url without the protocol';


--
-- Name: COLUMN oc_trusted_servers.token; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_trusted_servers.token IS 'token used to exchange the shared secret';


--
-- Name: COLUMN oc_trusted_servers.shared_secret; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_trusted_servers.shared_secret IS 'shared secret used to authenticate';


--
-- Name: COLUMN oc_trusted_servers.status; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_trusted_servers.status IS 'current status of the connection';


--
-- Name: COLUMN oc_trusted_servers.sync_token; Type: COMMENT; Schema: public; Owner: oc_admin
--

COMMENT ON COLUMN public.oc_trusted_servers.sync_token IS 'cardDav sync token';


--
-- Name: oc_trusted_servers_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_trusted_servers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_trusted_servers_id_seq OWNER TO oc_admin;

--
-- Name: oc_trusted_servers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_trusted_servers_id_seq OWNED BY public.oc_trusted_servers.id;


--
-- Name: oc_users; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_users (
    uid character varying(64) DEFAULT ''::character varying NOT NULL,
    displayname character varying(64) DEFAULT NULL::character varying,
    password character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_users OWNER TO oc_admin;

--
-- Name: oc_vcategory; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_vcategory (
    id integer NOT NULL,
    uid character varying(64) DEFAULT ''::character varying NOT NULL,
    type character varying(64) DEFAULT ''::character varying NOT NULL,
    category character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_vcategory OWNER TO oc_admin;

--
-- Name: oc_vcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_vcategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_vcategory_id_seq OWNER TO oc_admin;

--
-- Name: oc_vcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_vcategory_id_seq OWNED BY public.oc_vcategory.id;


--
-- Name: oc_vcategory_to_object; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_vcategory_to_object (
    objid bigint DEFAULT 0 NOT NULL,
    categoryid integer DEFAULT 0 NOT NULL,
    type character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_vcategory_to_object OWNER TO oc_admin;

--
-- Name: oc_workflows; Type: TABLE; Schema: public; Owner: oc_admin
--

CREATE TABLE public.oc_workflows (
    id integer NOT NULL,
    workflow_name character varying(255) NOT NULL,
    workflow_type character varying(64) NOT NULL,
    workflow_conditions text NOT NULL,
    workflow_actions text NOT NULL
);


ALTER TABLE public.oc_workflows OWNER TO oc_admin;

--
-- Name: oc_workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_admin
--

CREATE SEQUENCE public.oc_workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_workflows_id_seq OWNER TO oc_admin;

--
-- Name: oc_workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_admin
--

ALTER SEQUENCE public.oc_workflows_id_seq OWNED BY public.oc_workflows.id;


--
-- Name: oc_account_terms id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_account_terms ALTER COLUMN id SET DEFAULT nextval('public.oc_account_terms_id_seq'::regclass);


--
-- Name: oc_accounts id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_accounts ALTER COLUMN id SET DEFAULT nextval('public.oc_accounts_id_seq'::regclass);


--
-- Name: oc_addressbookchanges id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_addressbookchanges ALTER COLUMN id SET DEFAULT nextval('public.oc_addressbookchanges_id_seq'::regclass);


--
-- Name: oc_addressbooks id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_addressbooks ALTER COLUMN id SET DEFAULT nextval('public.oc_addressbooks_id_seq'::regclass);


--
-- Name: oc_authtoken id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_authtoken ALTER COLUMN id SET DEFAULT nextval('public.oc_authtoken_id_seq'::regclass);


--
-- Name: oc_calendarchanges id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_calendarchanges ALTER COLUMN id SET DEFAULT nextval('public.oc_calendarchanges_id_seq'::regclass);


--
-- Name: oc_calendarobjects id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_calendarobjects ALTER COLUMN id SET DEFAULT nextval('public.oc_calendarobjects_id_seq'::regclass);


--
-- Name: oc_calendars id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_calendars ALTER COLUMN id SET DEFAULT nextval('public.oc_calendars_id_seq'::regclass);


--
-- Name: oc_calendarsubscriptions id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_calendarsubscriptions ALTER COLUMN id SET DEFAULT nextval('public.oc_calendarsubscriptions_id_seq'::regclass);


--
-- Name: oc_cards id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_cards ALTER COLUMN id SET DEFAULT nextval('public.oc_cards_id_seq'::regclass);


--
-- Name: oc_cards_properties id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_cards_properties ALTER COLUMN id SET DEFAULT nextval('public.oc_cards_properties_id_seq'::regclass);


--
-- Name: oc_comments id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_comments ALTER COLUMN id SET DEFAULT nextval('public.oc_comments_id_seq'::regclass);


--
-- Name: oc_dav_job_status id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_dav_job_status ALTER COLUMN id SET DEFAULT nextval('public.oc_dav_job_status_id_seq'::regclass);


--
-- Name: oc_dav_properties id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_dav_properties ALTER COLUMN id SET DEFAULT nextval('public.oc_dav_properties_id_seq'::regclass);


--
-- Name: oc_dav_shares id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_dav_shares ALTER COLUMN id SET DEFAULT nextval('public.oc_dav_shares_id_seq'::regclass);


--
-- Name: oc_external_applicable applicable_id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_external_applicable ALTER COLUMN applicable_id SET DEFAULT nextval('public.oc_external_applicable_applicable_id_seq'::regclass);


--
-- Name: oc_external_config config_id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_external_config ALTER COLUMN config_id SET DEFAULT nextval('public.oc_external_config_config_id_seq'::regclass);


--
-- Name: oc_external_mounts mount_id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_external_mounts ALTER COLUMN mount_id SET DEFAULT nextval('public.oc_external_mounts_mount_id_seq'::regclass);


--
-- Name: oc_external_options option_id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_external_options ALTER COLUMN option_id SET DEFAULT nextval('public.oc_external_options_option_id_seq'::regclass);


--
-- Name: oc_file_locks id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_file_locks ALTER COLUMN id SET DEFAULT nextval('public.oc_file_locks_id_seq'::regclass);


--
-- Name: oc_filecache fileid; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_filecache ALTER COLUMN fileid SET DEFAULT nextval('public.oc_filecache_fileid_seq'::regclass);


--
-- Name: oc_files_trash auto_id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_files_trash ALTER COLUMN auto_id SET DEFAULT nextval('public.oc_files_trash_auto_id_seq'::regclass);


--
-- Name: oc_jobs id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_jobs ALTER COLUMN id SET DEFAULT nextval('public.oc_jobs_id_seq'::regclass);


--
-- Name: oc_mimetypes id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_mimetypes ALTER COLUMN id SET DEFAULT nextval('public.oc_mimetypes_id_seq'::regclass);


--
-- Name: oc_mounts id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_mounts ALTER COLUMN id SET DEFAULT nextval('public.oc_mounts_id_seq'::regclass);


--
-- Name: oc_persistent_locks id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_persistent_locks ALTER COLUMN id SET DEFAULT nextval('public.oc_persistent_locks_id_seq'::regclass);


--
-- Name: oc_privatedata keyid; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_privatedata ALTER COLUMN keyid SET DEFAULT nextval('public.oc_privatedata_keyid_seq'::regclass);


--
-- Name: oc_properties id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_properties ALTER COLUMN id SET DEFAULT nextval('public.oc_properties_id_seq'::regclass);


--
-- Name: oc_schedulingobjects id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_schedulingobjects ALTER COLUMN id SET DEFAULT nextval('public.oc_schedulingobjects_id_seq'::regclass);


--
-- Name: oc_share id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_share ALTER COLUMN id SET DEFAULT nextval('public.oc_share_id_seq'::regclass);


--
-- Name: oc_share_external id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_share_external ALTER COLUMN id SET DEFAULT nextval('public.oc_share_external_id_seq'::regclass);


--
-- Name: oc_storages numeric_id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_storages ALTER COLUMN numeric_id SET DEFAULT nextval('public.oc_storages_numeric_id_seq'::regclass);


--
-- Name: oc_systemtag id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_systemtag ALTER COLUMN id SET DEFAULT nextval('public.oc_systemtag_id_seq'::regclass);


--
-- Name: oc_trusted_servers id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_trusted_servers ALTER COLUMN id SET DEFAULT nextval('public.oc_trusted_servers_id_seq'::regclass);


--
-- Name: oc_vcategory id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_vcategory ALTER COLUMN id SET DEFAULT nextval('public.oc_vcategory_id_seq'::regclass);


--
-- Name: oc_workflows id; Type: DEFAULT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_workflows ALTER COLUMN id SET DEFAULT nextval('public.oc_workflows_id_seq'::regclass);


--
-- Data for Name: oc_account_terms; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_account_terms (id, account_id, term) FROM stdin;
\.


--
-- Data for Name: oc_accounts; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_accounts (id, email, user_id, lower_user_id, display_name, quota, last_login, backend, home, state) FROM stdin;
1	\N	admin	admin	admin	\N	1548520639	OC\\User\\Database	/home/ilja/code/core2/data/admin	1
\.


--
-- Data for Name: oc_addressbookchanges; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_addressbookchanges (id, uri, synctoken, addressbookid, operation) FROM stdin;
\.


--
-- Data for Name: oc_addressbooks; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_addressbooks (id, principaluri, displayname, uri, description, synctoken) FROM stdin;
1	principals/users/admin	Contacts	contacts	\N	1
\.


--
-- Data for Name: oc_appconfig; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_appconfig (appid, configkey, configvalue) FROM stdin;
core	installedat	1548520432.8638
core	lastupdatedat	1548520432.8657
files	installed_version	1.5.2
files	types	filesystem
files	enabled	yes
dav	installed_version	0.4.0
core	public_webdav	dav/appinfo/v1/publicwebdav.php
dav	types	filesystem
dav	enabled	yes
comments	installed_version	0.3.0
comments	types	logging,dav
comments	enabled	yes
enterprise_key	installed_version	0.1.4
enterprise_key	types	filesystem
enterprise_key	enabled	yes
federatedfilesharing	installed_version	0.3.1
federatedfilesharing	types	filesystem
federatedfilesharing	enabled	yes
federation	installed_version	0.1.0
federation	types	authentication
federation	enabled	yes
files_external	installed_version	0.7.1
files_external	ocsid	166048
files_external	types	filesystem
files_external	enabled	yes
files_pdfviewer	installed_version	0.8.2
files_pdfviewer	ocsid	166049
files_pdfviewer	types	
files_pdfviewer	enabled	yes
files_sharing	installed_version	0.11.0
core	public_files	files_sharing/public.php
files_sharing	types	filesystem
files_sharing	enabled	yes
files_texteditor	installed_version	2.2
files_texteditor	ocsid	166051
files_texteditor	types	
files_texteditor	enabled	yes
files_trashbin	installed_version	0.9.1
files_trashbin	types	filesystem
files_trashbin	enabled	yes
files_versions	installed_version	1.3.0
files_versions	types	filesystem
files_versions	enabled	yes
market	installed_version	0.3.0
market	types	
market	enabled	yes
provisioning_api	installed_version	0.5.0
provisioning_api	types	prevent_group_restriction
provisioning_api	enabled	yes
systemtags	installed_version	0.3.0
systemtags	types	logging
systemtags	enabled	yes
systemtags_management	installed_version	0.2.0
systemtags_management	types	
updatenotification	installed_version	0.2.1
updatenotification	types	
updatenotification	enabled	yes
workflow	installed_version	0.2.6
workflow	types	filesystem
core	first_install_version	11.0.0.0
core	oc.integritycheck.checker	[]
systemtags_management	enabled	no
workflow	enabled	no
files	cronjob_scan_files	500
backgroundjob	lastjob	1
core	lastcron	1548520636
\.


--
-- Data for Name: oc_authtoken; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_authtoken (id, uid, login_name, password, name, token, type, last_activity, last_check) FROM stdin;
1	admin	admin	4ba232696a93d00342be2a2a4ef9372f|J7N5u1b3dgRfwTDx|854c4b791e0b7b540cfe11855fee5f911a5a923948cb65c998e366bb8d9a2c65d65849f6e92cfca8eadab8e392a7b39004b482e6f2b482768dc9be535a956121	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36	b9cf67cedbb956a3c53906eafe80d60cfeb4817071f8762bc6a8c4150c4fd949720a2d5140745d7120ebcb1173013f79da122ef4a13eef08f5d51fa0dd51b6cb	0	1548520639	1548520639
\.


--
-- Data for Name: oc_calendarchanges; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_calendarchanges (id, uri, synctoken, calendarid, operation) FROM stdin;
\.


--
-- Data for Name: oc_calendarobjects; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_calendarobjects (id, calendardata, uri, calendarid, lastmodified, etag, size, componenttype, firstoccurence, lastoccurence, uid, classification) FROM stdin;
\.


--
-- Data for Name: oc_calendars; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_calendars (id, principaluri, displayname, uri, synctoken, description, calendarorder, calendarcolor, timezone, components, transparent) FROM stdin;
1	principals/users/admin	Personal	personal	1	\N	0	#1d2d44	\N	VEVENT,VTODO	0
\.


--
-- Data for Name: oc_calendarsubscriptions; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_calendarsubscriptions (id, uri, principaluri, source, displayname, refreshrate, calendarorder, calendarcolor, striptodos, stripalarms, stripattachments, lastmodified) FROM stdin;
\.


--
-- Data for Name: oc_cards; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_cards (id, addressbookid, carddata, uri, lastmodified, etag, size) FROM stdin;
\.


--
-- Data for Name: oc_cards_properties; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_cards_properties (id, addressbookid, cardid, name, value, preferred) FROM stdin;
\.


--
-- Data for Name: oc_comments; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_comments (id, parent_id, topmost_parent_id, children_count, actor_type, actor_id, message, verb, creation_timestamp, latest_child_timestamp, object_type, object_id) FROM stdin;
\.


--
-- Data for Name: oc_comments_read_markers; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_comments_read_markers (user_id, marker_datetime, object_type, object_id) FROM stdin;
\.


--
-- Data for Name: oc_credentials; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_credentials ("user", identifier, credentials) FROM stdin;
\.


--
-- Data for Name: oc_dav_job_status; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_dav_job_status (id, uuid, user_id, status_info) FROM stdin;
\.


--
-- Data for Name: oc_dav_properties; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_dav_properties (id, propertypath, propertyname, propertyvalue) FROM stdin;
\.


--
-- Data for Name: oc_dav_shares; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_dav_shares (id, principaluri, type, access, resourceid, publicuri) FROM stdin;
\.


--
-- Data for Name: oc_external_applicable; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_external_applicable (applicable_id, mount_id, type, value) FROM stdin;
\.


--
-- Data for Name: oc_external_config; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_external_config (config_id, mount_id, key, value) FROM stdin;
\.


--
-- Data for Name: oc_external_mounts; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_external_mounts (mount_id, mount_point, storage_backend, auth_backend, priority, type) FROM stdin;
\.


--
-- Data for Name: oc_external_options; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_external_options (option_id, mount_id, key, value) FROM stdin;
\.


--
-- Data for Name: oc_federated_reshares; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_federated_reshares (share_id, remote_id) FROM stdin;
\.


--
-- Data for Name: oc_file_locks; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_file_locks (id, lock, key, ttl) FROM stdin;
3	0	files/e8482945c9011a1fad7f0293d9760c26	1548524239
1	0	files/b6ef755cfc70b5eb94f5d3aad8ba833d	1548524239
4	0	files/4d0a5085369fc0554c67b8420144d947	1548524239
5	0	files/1cf520301bfd6b1431a1dda00793d73b	1548524239
6	0	files/a3594fd4eca7119cb937772e1f8f5415	1548524239
7	0	files/874f77ba6a24289bca60fa1bef3318c0	1548524240
2	0	files/affed89695d450aeabd54ccd462480bf	1548524240
\.


--
-- Data for Name: oc_filecache; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_filecache (fileid, storage, path, path_hash, parent, name, mimetype, mimepart, size, mtime, storage_mtime, encrypted, unencrypted_size, etag, permissions, checksum) FROM stdin;
2	1	cache	0fea6a13c52b4d4725368f24b045ca84	1	cache	2	1	0	1548520639	1548520639	0	0	5c4c8cbf840bf	31	
4	1	files/welcome.txt	c49a144e772727f51b75705170e88a43	3	welcome.txt	4	3	163	1548520639	1548520639	0	0	11f890c90834b3c230e3938066162dc3	27	SHA1:eeb2c08011374d8ad4e483a4938e1aa1007c089d MD5:368e3a6cb99f88c3543123931d786e21 ADLER32:c5ad3a63
3	1	files	45b963397aa40d4a0063e0d85e4fe7a1	1	files	2	1	163	1548520639	1548520639	0	0	5c4c8cbfc12c1	31	
1	1		d41d8cd98f00b204e9800998ecf8427e	-1		2	1	163	1548520639	1548520639	0	0	5c4c8cbfc8a90	23	
9	2	avatars/21/23/2f297a57a5a743894a0e4a801fc3	529dc0f71e29aa0491601dcd32bdd56d	8	2f297a57a5a743894a0e4a801fc3	2	1	0	1548520640	1548520640	0	0	5c4c8cc09e192	31	
5	2		d41d8cd98f00b204e9800998ecf8427e	-1		2	1	-1	1548520640	1548520640	0	0	5c4c8cc0a2bc7	23	
6	2	avatars	aec9f4efc5a055bbd053f220538c61e0	5	avatars	2	1	0	1548520640	1548520640	0	0	5c4c8cc0a2bc7	31	
7	2	avatars/21	ad6861de6e7fc46a455df0acc3655dec	6	21	2	1	0	1548520640	1548520640	0	0	5c4c8cc0a2bc7	31	
8	2	avatars/21/23	cb64392e5da27306a608dc0195e783f7	7	23	2	1	0	1548520640	1548520640	0	0	5c4c8cc0a2bc7	31	
\.


--
-- Data for Name: oc_files_trash; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_files_trash (auto_id, id, "user", "timestamp", location, type, mime) FROM stdin;
\.


--
-- Data for Name: oc_group_admin; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_group_admin (gid, uid) FROM stdin;
\.


--
-- Data for Name: oc_group_user; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_group_user (gid, uid) FROM stdin;
admin	admin
\.


--
-- Data for Name: oc_groups; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_groups (gid) FROM stdin;
admin
\.


--
-- Data for Name: oc_jobs; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_jobs (id, class, argument, last_run, last_checked, reserved_at, execution_duration) FROM stdin;
2	OCA\\Files\\BackgroundJob\\DeleteOrphanedItems	null	0	1548520432	0	-1
3	OCA\\Files\\BackgroundJob\\CleanupFileLocks	null	0	1548520432	0	-1
4	OCA\\Files\\BackgroundJob\\CleanupPersistentFileLocks	null	0	1548520432	0	-1
5	OCA\\DAV\\CardDAV\\SyncJob	null	0	1548520443	0	-1
6	OCA\\DAV\\BackgroundJob\\CleanProperties	null	0	1548520443	0	-1
7	OCA\\Federation\\SyncJob	null	0	1548520445	0	-1
8	OCA\\Files_Sharing\\DeleteOrphanedSharesJob	null	0	1548520449	0	-1
9	OCA\\Files_Sharing\\ExpireSharesJob	null	0	1548520449	0	-1
10	OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash	null	0	1548520451	0	-1
11	OCA\\Files_Versions\\BackgroundJob\\ExpireVersions	null	0	1548520451	0	-1
12	OCA\\Market\\CheckUpdateBackgroundJob	null	0	1548520451	0	-1
13	OCA\\UpdateNotification\\Notification\\BackgroundJob	null	0	1548520451	0	-1
14	OCA\\Workflow\\Retention\\MetaBackgroundJob	null	0	1548520451	0	-1
15	\\OC\\Authentication\\Token\\DefaultTokenCleanupJob	null	0	1548520451	0	-1
1	OCA\\Files\\BackgroundJob\\ScanFiles	null	1548520636	1548520636	0	0
\.


--
-- Data for Name: oc_migrations; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_migrations (app, version) FROM stdin;
core	20170101010100
core	20170101215145
core	20170111103310
core	20170213215145
core	20170214112458
core	20170221114437
core	20170221121536
core	20170315173825
core	20170320173955
core	20170418154659
core	20170516100103
core	20170526104128
core	20170605143658
core	20170711191432
core	20170804201253
core	20170928120000
core	20171026130750
core	20180123131835
core	20180302155233
core	20180319102121
core	20180607072706
core	20181017105216
core	20181017120818
core	20181113071753
dav	20170116150538
dav	20170116170538
dav	20170202213905
dav	20170202220512
dav	20170427182800
dav	20170519091921
dav	20170526100342
dav	20170711193427
dav	20170927201245
dav	20180622095921
dav	20181115210344
federatedfilesharing	20170804201125
federatedfilesharing	20170804201253
files_external	20170814051424
files_sharing	20170804201125
files_sharing	20170804201253
files_sharing	20170830112305
files_sharing	20171115154900
files_sharing	20171215103657
files_trashbin	20170804201125
files_trashbin	20170804201253
\.


--
-- Data for Name: oc_mimetypes; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_mimetypes (id, mimetype) FROM stdin;
1	httpd
2	httpd/unix-directory
3	text
4	text/plain
\.


--
-- Data for Name: oc_mounts; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_mounts (id, storage_id, root_id, user_id, mount_point) FROM stdin;
1	1	1	admin	/admin/
\.


--
-- Data for Name: oc_persistent_locks; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_persistent_locks (id, file_id, owner_account_id, owner, timeout, created_at, token, token_hash, scope, depth) FROM stdin;
\.


--
-- Data for Name: oc_preferences; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_preferences (userid, appid, configkey, configvalue) FROM stdin;
admin	core	timezone	Europe/Berlin
admin	core	lang	en
\.


--
-- Data for Name: oc_privatedata; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_privatedata (keyid, "user", app, key, value) FROM stdin;
\.


--
-- Data for Name: oc_properties; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_properties (id, fileid, propertyname, propertyvalue) FROM stdin;
\.


--
-- Data for Name: oc_schedulingobjects; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_schedulingobjects (id, principaluri, calendardata, uri, lastmodified, etag, size) FROM stdin;
\.


--
-- Data for Name: oc_share; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_share (id, share_type, share_with, uid_owner, uid_initiator, parent, item_type, item_source, item_target, file_source, file_target, permissions, stime, accepted, expiration, token, mail_send, share_name) FROM stdin;
\.


--
-- Data for Name: oc_share_external; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_share_external (id, remote, remote_id, share_token, password, name, owner, "user", mountpoint, mountpoint_hash, accepted) FROM stdin;
\.


--
-- Data for Name: oc_storages; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_storages (id, numeric_id, available, last_checked) FROM stdin;
home::admin	1	1	\N
local::/home/ilja/code/core2/data/	2	1	\N
\.


--
-- Data for Name: oc_systemtag; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_systemtag (id, name, visibility, editable, assignable) FROM stdin;
\.


--
-- Data for Name: oc_systemtag_group; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_systemtag_group (systemtagid, gid) FROM stdin;
\.


--
-- Data for Name: oc_systemtag_object_mapping; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_systemtag_object_mapping (objectid, objecttype, systemtagid) FROM stdin;
\.


--
-- Data for Name: oc_trusted_servers; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_trusted_servers (id, url, url_hash, token, shared_secret, status, sync_token) FROM stdin;
\.


--
-- Data for Name: oc_users; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_users (uid, displayname, password) FROM stdin;
admin	\N	1|$2y$10$IuOzBHnORvBjlKceCIyTi.Fu5pKA42JO1HhmX2gEfly6.eqCrgLJC
\.


--
-- Data for Name: oc_vcategory; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_vcategory (id, uid, type, category) FROM stdin;
\.


--
-- Data for Name: oc_vcategory_to_object; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_vcategory_to_object (objid, categoryid, type) FROM stdin;
\.


--
-- Data for Name: oc_workflows; Type: TABLE DATA; Schema: public; Owner: oc_admin
--

COPY public.oc_workflows (id, workflow_name, workflow_type, workflow_conditions, workflow_actions) FROM stdin;
\.


--
-- Name: oc_account_terms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_account_terms_id_seq', 1, false);


--
-- Name: oc_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_accounts_id_seq', 1, true);


--
-- Name: oc_addressbookchanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_addressbookchanges_id_seq', 1, false);


--
-- Name: oc_addressbooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_addressbooks_id_seq', 1, true);


--
-- Name: oc_authtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_authtoken_id_seq', 1, true);


--
-- Name: oc_calendarchanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_calendarchanges_id_seq', 1, false);


--
-- Name: oc_calendarobjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_calendarobjects_id_seq', 1, false);


--
-- Name: oc_calendars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_calendars_id_seq', 1, true);


--
-- Name: oc_calendarsubscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_calendarsubscriptions_id_seq', 1, false);


--
-- Name: oc_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_cards_id_seq', 1, false);


--
-- Name: oc_cards_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_cards_properties_id_seq', 1, false);


--
-- Name: oc_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_comments_id_seq', 1, false);


--
-- Name: oc_dav_job_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_dav_job_status_id_seq', 1, false);


--
-- Name: oc_dav_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_dav_properties_id_seq', 1, false);


--
-- Name: oc_dav_shares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_dav_shares_id_seq', 1, false);


--
-- Name: oc_external_applicable_applicable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_external_applicable_applicable_id_seq', 1, false);


--
-- Name: oc_external_config_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_external_config_config_id_seq', 1, false);


--
-- Name: oc_external_mounts_mount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_external_mounts_mount_id_seq', 1, false);


--
-- Name: oc_external_options_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_external_options_option_id_seq', 1, false);


--
-- Name: oc_file_locks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_file_locks_id_seq', 7, true);


--
-- Name: oc_filecache_fileid_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_filecache_fileid_seq', 9, true);


--
-- Name: oc_files_trash_auto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_files_trash_auto_id_seq', 1, false);


--
-- Name: oc_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_jobs_id_seq', 15, true);


--
-- Name: oc_mimetypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_mimetypes_id_seq', 4, true);


--
-- Name: oc_mounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_mounts_id_seq', 1, true);


--
-- Name: oc_persistent_locks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_persistent_locks_id_seq', 1, false);


--
-- Name: oc_privatedata_keyid_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_privatedata_keyid_seq', 1, false);


--
-- Name: oc_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_properties_id_seq', 1, false);


--
-- Name: oc_schedulingobjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_schedulingobjects_id_seq', 1, false);


--
-- Name: oc_share_external_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_share_external_id_seq', 1, false);


--
-- Name: oc_share_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_share_id_seq', 1, false);


--
-- Name: oc_storages_numeric_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_storages_numeric_id_seq', 2, true);


--
-- Name: oc_systemtag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_systemtag_id_seq', 1, false);


--
-- Name: oc_trusted_servers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_trusted_servers_id_seq', 1, false);


--
-- Name: oc_vcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_vcategory_id_seq', 1, false);


--
-- Name: oc_workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_admin
--

SELECT pg_catalog.setval('public.oc_workflows_id_seq', 1, false);


--
-- Name: oc_account_terms oc_account_terms_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_account_terms
    ADD CONSTRAINT oc_account_terms_pkey PRIMARY KEY (id);


--
-- Name: oc_accounts oc_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_accounts
    ADD CONSTRAINT oc_accounts_pkey PRIMARY KEY (id);


--
-- Name: oc_addressbookchanges oc_addressbookchanges_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_addressbookchanges
    ADD CONSTRAINT oc_addressbookchanges_pkey PRIMARY KEY (id);


--
-- Name: oc_addressbooks oc_addressbooks_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_addressbooks
    ADD CONSTRAINT oc_addressbooks_pkey PRIMARY KEY (id);


--
-- Name: oc_appconfig oc_appconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_appconfig
    ADD CONSTRAINT oc_appconfig_pkey PRIMARY KEY (appid, configkey);


--
-- Name: oc_authtoken oc_authtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_authtoken
    ADD CONSTRAINT oc_authtoken_pkey PRIMARY KEY (id);


--
-- Name: oc_calendarchanges oc_calendarchanges_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_calendarchanges
    ADD CONSTRAINT oc_calendarchanges_pkey PRIMARY KEY (id);


--
-- Name: oc_calendarobjects oc_calendarobjects_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_calendarobjects
    ADD CONSTRAINT oc_calendarobjects_pkey PRIMARY KEY (id);


--
-- Name: oc_calendars oc_calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_calendars
    ADD CONSTRAINT oc_calendars_pkey PRIMARY KEY (id);


--
-- Name: oc_calendarsubscriptions oc_calendarsubscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_calendarsubscriptions
    ADD CONSTRAINT oc_calendarsubscriptions_pkey PRIMARY KEY (id);


--
-- Name: oc_cards oc_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_cards
    ADD CONSTRAINT oc_cards_pkey PRIMARY KEY (id);


--
-- Name: oc_cards_properties oc_cards_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_cards_properties
    ADD CONSTRAINT oc_cards_properties_pkey PRIMARY KEY (id);


--
-- Name: oc_comments oc_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_comments
    ADD CONSTRAINT oc_comments_pkey PRIMARY KEY (id);


--
-- Name: oc_credentials oc_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_credentials
    ADD CONSTRAINT oc_credentials_pkey PRIMARY KEY ("user", identifier);


--
-- Name: oc_dav_job_status oc_dav_job_status_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_dav_job_status
    ADD CONSTRAINT oc_dav_job_status_pkey PRIMARY KEY (id);


--
-- Name: oc_dav_properties oc_dav_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_dav_properties
    ADD CONSTRAINT oc_dav_properties_pkey PRIMARY KEY (id);


--
-- Name: oc_dav_shares oc_dav_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_dav_shares
    ADD CONSTRAINT oc_dav_shares_pkey PRIMARY KEY (id);


--
-- Name: oc_external_applicable oc_external_applicable_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_external_applicable
    ADD CONSTRAINT oc_external_applicable_pkey PRIMARY KEY (applicable_id);


--
-- Name: oc_external_config oc_external_config_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_external_config
    ADD CONSTRAINT oc_external_config_pkey PRIMARY KEY (config_id);


--
-- Name: oc_external_mounts oc_external_mounts_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_external_mounts
    ADD CONSTRAINT oc_external_mounts_pkey PRIMARY KEY (mount_id);


--
-- Name: oc_external_options oc_external_options_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_external_options
    ADD CONSTRAINT oc_external_options_pkey PRIMARY KEY (option_id);


--
-- Name: oc_file_locks oc_file_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_file_locks
    ADD CONSTRAINT oc_file_locks_pkey PRIMARY KEY (id);


--
-- Name: oc_filecache oc_filecache_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_filecache
    ADD CONSTRAINT oc_filecache_pkey PRIMARY KEY (fileid);


--
-- Name: oc_files_trash oc_files_trash_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_files_trash
    ADD CONSTRAINT oc_files_trash_pkey PRIMARY KEY (auto_id);


--
-- Name: oc_group_admin oc_group_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_group_admin
    ADD CONSTRAINT oc_group_admin_pkey PRIMARY KEY (gid, uid);


--
-- Name: oc_group_user oc_group_user_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_group_user
    ADD CONSTRAINT oc_group_user_pkey PRIMARY KEY (gid, uid);


--
-- Name: oc_groups oc_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_groups
    ADD CONSTRAINT oc_groups_pkey PRIMARY KEY (gid);


--
-- Name: oc_jobs oc_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_jobs
    ADD CONSTRAINT oc_jobs_pkey PRIMARY KEY (id);


--
-- Name: oc_migrations oc_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_migrations
    ADD CONSTRAINT oc_migrations_pkey PRIMARY KEY (app, version);


--
-- Name: oc_mimetypes oc_mimetypes_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_mimetypes
    ADD CONSTRAINT oc_mimetypes_pkey PRIMARY KEY (id);


--
-- Name: oc_mounts oc_mounts_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_mounts
    ADD CONSTRAINT oc_mounts_pkey PRIMARY KEY (id);


--
-- Name: oc_persistent_locks oc_persistent_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_persistent_locks
    ADD CONSTRAINT oc_persistent_locks_pkey PRIMARY KEY (id);


--
-- Name: oc_preferences oc_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_preferences
    ADD CONSTRAINT oc_preferences_pkey PRIMARY KEY (userid, appid, configkey);


--
-- Name: oc_privatedata oc_privatedata_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_privatedata
    ADD CONSTRAINT oc_privatedata_pkey PRIMARY KEY (keyid);


--
-- Name: oc_properties oc_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_properties
    ADD CONSTRAINT oc_properties_pkey PRIMARY KEY (id);


--
-- Name: oc_schedulingobjects oc_schedulingobjects_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_schedulingobjects
    ADD CONSTRAINT oc_schedulingobjects_pkey PRIMARY KEY (id);


--
-- Name: oc_share_external oc_share_external_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_share_external
    ADD CONSTRAINT oc_share_external_pkey PRIMARY KEY (id);


--
-- Name: oc_share oc_share_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_share
    ADD CONSTRAINT oc_share_pkey PRIMARY KEY (id);


--
-- Name: oc_storages oc_storages_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_storages
    ADD CONSTRAINT oc_storages_pkey PRIMARY KEY (numeric_id);


--
-- Name: oc_systemtag_group oc_systemtag_group_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_systemtag_group
    ADD CONSTRAINT oc_systemtag_group_pkey PRIMARY KEY (gid, systemtagid);


--
-- Name: oc_systemtag oc_systemtag_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_systemtag
    ADD CONSTRAINT oc_systemtag_pkey PRIMARY KEY (id);


--
-- Name: oc_trusted_servers oc_trusted_servers_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_trusted_servers
    ADD CONSTRAINT oc_trusted_servers_pkey PRIMARY KEY (id);


--
-- Name: oc_users oc_users_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_users
    ADD CONSTRAINT oc_users_pkey PRIMARY KEY (uid);


--
-- Name: oc_vcategory oc_vcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_vcategory
    ADD CONSTRAINT oc_vcategory_pkey PRIMARY KEY (id);


--
-- Name: oc_vcategory_to_object oc_vcategory_to_object_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_vcategory_to_object
    ADD CONSTRAINT oc_vcategory_to_object_pkey PRIMARY KEY (categoryid, objid, type);


--
-- Name: oc_workflows oc_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_workflows
    ADD CONSTRAINT oc_workflows_pkey PRIMARY KEY (id);


--
-- Name: account_id_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX account_id_index ON public.oc_account_terms USING btree (account_id);


--
-- Name: addressbook_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX addressbook_index ON public.oc_addressbooks USING btree (principaluri, uri);


--
-- Name: addressbookid_synctoken; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX addressbookid_synctoken ON public.oc_addressbookchanges USING btree (addressbookid, synctoken);


--
-- Name: addressbookid_uri_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX addressbookid_uri_index ON public.oc_cards USING btree (addressbookid, uri);


--
-- Name: appconfig_appid_key; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX appconfig_appid_key ON public.oc_appconfig USING btree (appid);


--
-- Name: appconfig_config_key_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX appconfig_config_key_index ON public.oc_appconfig USING btree (configkey);


--
-- Name: applicable_mount; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX applicable_mount ON public.oc_external_applicable USING btree (mount_id);


--
-- Name: applicable_type_value; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX applicable_type_value ON public.oc_external_applicable USING btree (type, value);


--
-- Name: applicable_type_value_mount; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX applicable_type_value_mount ON public.oc_external_applicable USING btree (type, value, mount_id);


--
-- Name: authtoken_last_activity_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX authtoken_last_activity_index ON public.oc_authtoken USING btree (last_activity);


--
-- Name: authtoken_token_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX authtoken_token_index ON public.oc_authtoken USING btree (token);


--
-- Name: calendarid_synctoken; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX calendarid_synctoken ON public.oc_calendarchanges USING btree (calendarid, synctoken);


--
-- Name: calendars_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX calendars_index ON public.oc_calendars USING btree (principaluri, uri);


--
-- Name: calobjects_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX calobjects_index ON public.oc_calendarobjects USING btree (calendarid, uri);


--
-- Name: calsub_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX calsub_index ON public.oc_calendarsubscriptions USING btree (principaluri, uri);


--
-- Name: card_contactid_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX card_contactid_index ON public.oc_cards_properties USING btree (cardid);


--
-- Name: card_name_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX card_name_index ON public.oc_cards_properties USING btree (name);


--
-- Name: card_value_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX card_value_index ON public.oc_cards_properties USING btree (value);


--
-- Name: category_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX category_index ON public.oc_vcategory USING btree (category);


--
-- Name: comments_actor_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX comments_actor_index ON public.oc_comments USING btree (actor_type, actor_id);


--
-- Name: comments_marker_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX comments_marker_index ON public.oc_comments_read_markers USING btree (user_id, object_type, object_id);


--
-- Name: comments_marker_object_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX comments_marker_object_index ON public.oc_comments_read_markers USING btree (object_type, object_id);


--
-- Name: comments_object_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX comments_object_index ON public.oc_comments USING btree (object_type, object_id, creation_timestamp);


--
-- Name: comments_parent_id_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX comments_parent_id_index ON public.oc_comments USING btree (parent_id);


--
-- Name: comments_topmost_parent_id_idx; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX comments_topmost_parent_id_idx ON public.oc_comments USING btree (topmost_parent_id);


--
-- Name: config_mount; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX config_mount ON public.oc_external_config USING btree (mount_id);


--
-- Name: config_mount_key; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX config_mount_key ON public.oc_external_config USING btree (mount_id, key);


--
-- Name: credentials_user; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX credentials_user ON public.oc_credentials USING btree ("user");


--
-- Name: dav_shares_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX dav_shares_index ON public.oc_dav_shares USING btree (principaluri, resourceid, type, publicuri);


--
-- Name: display_name_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX display_name_index ON public.oc_accounts USING btree (display_name);


--
-- Name: email_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX email_index ON public.oc_accounts USING btree (email);


--
-- Name: file_source_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX file_source_index ON public.oc_share USING btree (file_source);


--
-- Name: fileid_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX fileid_index ON public.oc_properties USING btree (fileid);


--
-- Name: fs_parent_name_hash; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX fs_parent_name_hash ON public.oc_filecache USING btree (parent, name);


--
-- Name: fs_storage_mimepart; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX fs_storage_mimepart ON public.oc_filecache USING btree (storage, mimepart);


--
-- Name: fs_storage_mimetype; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX fs_storage_mimetype ON public.oc_filecache USING btree (storage, mimetype);


--
-- Name: fs_storage_path_hash; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX fs_storage_path_hash ON public.oc_filecache USING btree (storage, path_hash);


--
-- Name: fs_storage_size; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX fs_storage_size ON public.oc_filecache USING btree (storage, size, fileid);


--
-- Name: group_admin_uid; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX group_admin_uid ON public.oc_group_admin USING btree (uid);


--
-- Name: gu_uid_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX gu_uid_index ON public.oc_group_user USING btree (uid);


--
-- Name: id_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX id_index ON public.oc_files_trash USING btree (id);


--
-- Name: idx_f0c3d55b93cb796c; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX idx_f0c3d55b93cb796c ON public.oc_persistent_locks USING btree (file_id);


--
-- Name: idx_f0c3d55bc901c6ff; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX idx_f0c3d55bc901c6ff ON public.oc_persistent_locks USING btree (owner_account_id);


--
-- Name: item_share_type_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX item_share_type_index ON public.oc_share USING btree (item_type, share_type);


--
-- Name: item_source_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX item_source_index ON public.oc_share USING btree (item_source);


--
-- Name: item_source_type_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX item_source_type_index ON public.oc_share USING btree (item_source, share_type, item_type);


--
-- Name: job_class_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX job_class_index ON public.oc_jobs USING btree (class);


--
-- Name: lock_key_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX lock_key_index ON public.oc_file_locks USING btree (key);


--
-- Name: lock_ttl_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX lock_ttl_index ON public.oc_file_locks USING btree (ttl);


--
-- Name: lower_user_id_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX lower_user_id_index ON public.oc_accounts USING btree (lower_user_id);


--
-- Name: mapping; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX mapping ON public.oc_systemtag_object_mapping USING btree (objecttype, objectid, systemtagid);


--
-- Name: mimetype_id_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX mimetype_id_index ON public.oc_mimetypes USING btree (mimetype);


--
-- Name: mounts_root_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX mounts_root_index ON public.oc_mounts USING btree (root_id);


--
-- Name: mounts_storage_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX mounts_storage_index ON public.oc_mounts USING btree (storage_id);


--
-- Name: mounts_user_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX mounts_user_index ON public.oc_mounts USING btree (user_id);


--
-- Name: mounts_user_root_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX mounts_user_root_index ON public.oc_mounts USING btree (user_id, root_id);


--
-- Name: option_mount; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX option_mount ON public.oc_external_options USING btree (mount_id);


--
-- Name: option_mount_key; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX option_mount_key ON public.oc_external_options USING btree (mount_id, key);


--
-- Name: propertypath_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX propertypath_index ON public.oc_dav_properties USING btree (propertypath);


--
-- Name: sh_external_mp; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX sh_external_mp ON public.oc_share_external USING btree ("user", mountpoint_hash);


--
-- Name: sh_external_user; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX sh_external_user ON public.oc_share_external USING btree ("user");


--
-- Name: share_id_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX share_id_index ON public.oc_federated_reshares USING btree (share_id);


--
-- Name: share_with_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX share_with_index ON public.oc_share USING btree (share_with);


--
-- Name: storages_id_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX storages_id_index ON public.oc_storages USING btree (id);


--
-- Name: tag_ident; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX tag_ident ON public.oc_systemtag USING btree (name, visibility, editable, assignable);


--
-- Name: term_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX term_index ON public.oc_account_terms USING btree (term);


--
-- Name: timestamp_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX timestamp_index ON public.oc_files_trash USING btree ("timestamp");


--
-- Name: token_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX token_index ON public.oc_share USING btree (token);


--
-- Name: type_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX type_index ON public.oc_vcategory USING btree (type);


--
-- Name: uid_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX uid_index ON public.oc_vcategory USING btree (uid);


--
-- Name: uniq_18bba548d17f50a6; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX uniq_18bba548d17f50a6 ON public.oc_dav_job_status USING btree (uuid);


--
-- Name: uniq_907aa303a76ed395; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX uniq_907aa303a76ed395 ON public.oc_accounts USING btree (user_id);


--
-- Name: uniq_f0c3d55bb3bc57da; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX uniq_f0c3d55bb3bc57da ON public.oc_persistent_locks USING btree (token_hash);


--
-- Name: url_hash; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE UNIQUE INDEX url_hash ON public.oc_trusted_servers USING btree (url_hash);


--
-- Name: user_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX user_index ON public.oc_files_trash USING btree ("user");


--
-- Name: vcategory_objectd_index; Type: INDEX; Schema: public; Owner: oc_admin
--

CREATE INDEX vcategory_objectd_index ON public.oc_vcategory_to_object USING btree (objid, type);


--
-- Name: oc_persistent_locks fk_f0c3d55b93cb796c; Type: FK CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_persistent_locks
    ADD CONSTRAINT fk_f0c3d55b93cb796c FOREIGN KEY (file_id) REFERENCES public.oc_filecache(fileid) ON DELETE CASCADE;


--
-- Name: oc_persistent_locks fk_f0c3d55bc901c6ff; Type: FK CONSTRAINT; Schema: public; Owner: oc_admin
--

ALTER TABLE ONLY public.oc_persistent_locks
    ADD CONSTRAINT fk_f0c3d55bc901c6ff FOREIGN KEY (owner_account_id) REFERENCES public.oc_accounts(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

