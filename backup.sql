--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO k_bekdaulet;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO k_bekdaulet;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO k_bekdaulet;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO k_bekdaulet;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO k_bekdaulet;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO k_bekdaulet;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: course_course; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.course_course (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name_kk character varying(255) NOT NULL,
    name_ru character varying(255) NOT NULL,
    description_kk text NOT NULL,
    description_ru text NOT NULL,
    to_view boolean NOT NULL,
    views integer NOT NULL,
    image character varying(100) NOT NULL,
    rating numeric(3,2) NOT NULL,
    lesson_count integer NOT NULL,
    category_id bigint NOT NULL,
    organization_id bigint,
    duriation interval NOT NULL,
    CONSTRAINT course_course_lesson_count_check CHECK ((lesson_count >= 0)),
    CONSTRAINT course_course_views_check CHECK ((views >= 0))
);


ALTER TABLE public.course_course OWNER TO k_bekdaulet;

--
-- Name: course_course_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.course_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_course_id_seq OWNER TO k_bekdaulet;

--
-- Name: course_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.course_course_id_seq OWNED BY public.course_course.id;


--
-- Name: course_course_lectors; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.course_course_lectors (
    id integer NOT NULL,
    course_id bigint NOT NULL,
    lector_id bigint NOT NULL
);


ALTER TABLE public.course_course_lectors OWNER TO k_bekdaulet;

--
-- Name: course_course_lectors_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.course_course_lectors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_course_lectors_id_seq OWNER TO k_bekdaulet;

--
-- Name: course_course_lectors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.course_course_lectors_id_seq OWNED BY public.course_course_lectors.id;


--
-- Name: course_lector; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.course_lector (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    description_kk text,
    description_ru text,
    icon character varying(100)
);


ALTER TABLE public.course_lector OWNER TO k_bekdaulet;

--
-- Name: course_lector_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.course_lector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_lector_id_seq OWNER TO k_bekdaulet;

--
-- Name: course_lector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.course_lector_id_seq OWNED BY public.course_lector.id;


--
-- Name: course_lesson; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.course_lesson (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name_kk character varying(255) NOT NULL,
    name_ru character varying(255) NOT NULL,
    description_kk text NOT NULL,
    description_ru text NOT NULL,
    duriation interval NOT NULL,
    video character varying(6250) NOT NULL,
    views integer NOT NULL,
    course_id bigint,
    lector_id bigint NOT NULL,
    "order" integer NOT NULL,
    score integer NOT NULL,
    CONSTRAINT course_lesson_order_check CHECK (("order" >= 0)),
    CONSTRAINT course_lesson_score_check CHECK ((score >= 0)),
    CONSTRAINT course_lesson_views_check CHECK ((views >= 0))
);


ALTER TABLE public.course_lesson OWNER TO k_bekdaulet;

--
-- Name: course_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.course_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_lesson_id_seq OWNER TO k_bekdaulet;

--
-- Name: course_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.course_lesson_id_seq OWNED BY public.course_lesson.id;


--
-- Name: course_lesson_modules; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.course_lesson_modules (
    id integer NOT NULL,
    lesson_id bigint NOT NULL,
    lessonmodule_id bigint NOT NULL
);


ALTER TABLE public.course_lesson_modules OWNER TO k_bekdaulet;

--
-- Name: course_lesson_modules_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.course_lesson_modules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_lesson_modules_id_seq OWNER TO k_bekdaulet;

--
-- Name: course_lesson_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.course_lesson_modules_id_seq OWNED BY public.course_lesson_modules.id;


--
-- Name: course_lessonmodule; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.course_lessonmodule (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name_kk character varying(255) NOT NULL,
    name_ru character varying(255) NOT NULL,
    description_kk text NOT NULL,
    description_ru text NOT NULL,
    duriation interval NOT NULL,
    video character varying(6250) NOT NULL,
    course_id bigint,
    lector_id bigint NOT NULL
);


ALTER TABLE public.course_lessonmodule OWNER TO k_bekdaulet;

--
-- Name: course_lessonmodule_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.course_lessonmodule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_lessonmodule_id_seq OWNER TO k_bekdaulet;

--
-- Name: course_lessonmodule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.course_lessonmodule_id_seq OWNED BY public.course_lessonmodule.id;


--
-- Name: course_participant; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.course_participant (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    object_id integer,
    content_type_id integer,
    user_id bigint NOT NULL,
    points integer NOT NULL,
    success boolean NOT NULL,
    CONSTRAINT course_participant_object_id_check CHECK ((object_id >= 0)),
    CONSTRAINT course_participant_points_check CHECK ((points >= 0))
);


ALTER TABLE public.course_participant OWNER TO k_bekdaulet;

--
-- Name: course_participant_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.course_participant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_participant_id_seq OWNER TO k_bekdaulet;

--
-- Name: course_participant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.course_participant_id_seq OWNED BY public.course_participant.id;


--
-- Name: course_resource; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.course_resource (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name_kk character varying(255) NOT NULL,
    name_ru character varying(255) NOT NULL,
    description_kk text NOT NULL,
    description_ru text NOT NULL,
    file character varying(100) NOT NULL,
    link character varying(5000),
    course_id bigint,
    lesson_id bigint,
    lesson_module_id bigint
);


ALTER TABLE public.course_resource OWNER TO k_bekdaulet;

--
-- Name: course_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.course_resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_resource_id_seq OWNER TO k_bekdaulet;

--
-- Name: course_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.course_resource_id_seq OWNED BY public.course_resource.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO k_bekdaulet;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO k_bekdaulet;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_celery_beat_clockedschedule; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_clockedschedule OWNER TO k_bekdaulet;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.django_celery_beat_clockedschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_clockedschedule_id_seq OWNER TO k_bekdaulet;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNED BY public.django_celery_beat_clockedschedule.id;


--
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);


ALTER TABLE public.django_celery_beat_crontabschedule OWNER TO k_bekdaulet;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.django_celery_beat_crontabschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_crontabschedule_id_seq OWNER TO k_bekdaulet;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNED BY public.django_celery_beat_crontabschedule.id;


--
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.django_celery_beat_intervalschedule OWNER TO k_bekdaulet;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.django_celery_beat_intervalschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_intervalschedule_id_seq OWNER TO k_bekdaulet;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNED BY public.django_celery_beat_intervalschedule.id;


--
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    expire_seconds integer,
    CONSTRAINT django_celery_beat_periodictask_expire_seconds_check CHECK ((expire_seconds >= 0)),
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.django_celery_beat_periodictask OWNER TO k_bekdaulet;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.django_celery_beat_periodictask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_periodictask_id_seq OWNER TO k_bekdaulet;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNED BY public.django_celery_beat_periodictask.id;


--
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_periodictasks OWNER TO k_bekdaulet;

--
-- Name: django_celery_beat_solarschedule; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.django_celery_beat_solarschedule OWNER TO k_bekdaulet;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.django_celery_beat_solarschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_solarschedule_id_seq OWNER TO k_bekdaulet;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNED BY public.django_celery_beat_solarschedule.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO k_bekdaulet;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO k_bekdaulet;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO k_bekdaulet;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO k_bekdaulet;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO k_bekdaulet;

--
-- Name: dobro_dobro; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.dobro_dobro (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(250) NOT NULL,
    small_description text NOT NULL,
    description text NOT NULL,
    body text NOT NULL,
    image character varying(100) NOT NULL,
    video character varying(100) NOT NULL,
    reports character varying(100) NOT NULL,
    collected numeric(15,2) NOT NULL,
    necessary numeric(15,2) NOT NULL,
    is_completed boolean NOT NULL
);


ALTER TABLE public.dobro_dobro OWNER TO k_bekdaulet;

--
-- Name: dobro_dobro_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.dobro_dobro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dobro_dobro_id_seq OWNER TO k_bekdaulet;

--
-- Name: dobro_dobro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.dobro_dobro_id_seq OWNED BY public.dobro_dobro.id;


--
-- Name: obrazovanie_category; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.obrazovanie_category (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(120) NOT NULL,
    name_kk character varying(120) NOT NULL
);


ALTER TABLE public.obrazovanie_category OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_category_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.obrazovanie_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obrazovanie_category_id_seq OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.obrazovanie_category_id_seq OWNED BY public.obrazovanie_category.id;


--
-- Name: obrazovanie_comment; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.obrazovanie_comment (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    body text NOT NULL,
    object_id integer,
    content_type_id integer,
    owner_id bigint,
    reply_id bigint,
    CONSTRAINT obrazovanie_comment_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.obrazovanie_comment OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.obrazovanie_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obrazovanie_comment_id_seq OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.obrazovanie_comment_id_seq OWNED BY public.obrazovanie_comment.id;


--
-- Name: obrazovanie_comment_likes; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.obrazovanie_comment_likes (
    id integer NOT NULL,
    comment_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.obrazovanie_comment_likes OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_comment_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.obrazovanie_comment_likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obrazovanie_comment_likes_id_seq OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_comment_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.obrazovanie_comment_likes_id_seq OWNED BY public.obrazovanie_comment_likes.id;


--
-- Name: obrazovanie_report; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.obrazovanie_report (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(500) NOT NULL,
    title_kk character varying(500) NOT NULL,
    preview_text_ru text NOT NULL,
    preview_text_kk text NOT NULL,
    body text NOT NULL,
    body_kk text NOT NULL,
    image character varying(100) NOT NULL,
    moderated boolean NOT NULL,
    views integer NOT NULL,
    author_id bigint,
    category_id bigint NOT NULL,
    CONSTRAINT obrazovanie_report_views_check CHECK ((views >= 0))
);


ALTER TABLE public.obrazovanie_report OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_report_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.obrazovanie_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obrazovanie_report_id_seq OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.obrazovanie_report_id_seq OWNED BY public.obrazovanie_report.id;


--
-- Name: obrazovanie_report_likes; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.obrazovanie_report_likes (
    id integer NOT NULL,
    report_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.obrazovanie_report_likes OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_report_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.obrazovanie_report_likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obrazovanie_report_likes_id_seq OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_report_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.obrazovanie_report_likes_id_seq OWNED BY public.obrazovanie_report_likes.id;


--
-- Name: obrazovanie_report_saves; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.obrazovanie_report_saves (
    id integer NOT NULL,
    report_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.obrazovanie_report_saves OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_report_saves_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.obrazovanie_report_saves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obrazovanie_report_saves_id_seq OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_report_saves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.obrazovanie_report_saves_id_seq OWNED BY public.obrazovanie_report_saves.id;


--
-- Name: obrazovanie_video; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.obrazovanie_video (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(500) NOT NULL,
    body text NOT NULL,
    body_kk text NOT NULL,
    image character varying(100) NOT NULL,
    image_2 character varying(100) NOT NULL,
    video character varying(100),
    video_name character varying(6250) NOT NULL,
    youtube character varying(500),
    original_quality bigint,
    views integer NOT NULL,
    subs_kk character varying(100) NOT NULL,
    convert_status character varying(255) NOT NULL,
    author_id bigint,
    category_id bigint NOT NULL,
    CONSTRAINT obrazovanie_video_original_quality_check CHECK ((original_quality >= 0)),
    CONSTRAINT obrazovanie_video_views_check CHECK ((views >= 0))
);


ALTER TABLE public.obrazovanie_video OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_video_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.obrazovanie_video_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obrazovanie_video_id_seq OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.obrazovanie_video_id_seq OWNED BY public.obrazovanie_video.id;


--
-- Name: obrazovanie_video_likes; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.obrazovanie_video_likes (
    id integer NOT NULL,
    video_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.obrazovanie_video_likes OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_video_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.obrazovanie_video_likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obrazovanie_video_likes_id_seq OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_video_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.obrazovanie_video_likes_id_seq OWNED BY public.obrazovanie_video_likes.id;


--
-- Name: obrazovanie_video_saves; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.obrazovanie_video_saves (
    id integer NOT NULL,
    video_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.obrazovanie_video_saves OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_video_saves_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.obrazovanie_video_saves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obrazovanie_video_saves_id_seq OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_video_saves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.obrazovanie_video_saves_id_seq OWNED BY public.obrazovanie_video_saves.id;


--
-- Name: obrazovanie_video_video_quality; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.obrazovanie_video_video_quality (
    id integer NOT NULL,
    video_id bigint NOT NULL,
    videoquality_id bigint NOT NULL
);


ALTER TABLE public.obrazovanie_video_video_quality OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_video_video_quality_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.obrazovanie_video_video_quality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obrazovanie_video_video_quality_id_seq OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_video_video_quality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.obrazovanie_video_video_quality_id_seq OWNED BY public.obrazovanie_video_video_quality.id;


--
-- Name: obrazovanie_videoquality; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.obrazovanie_videoquality (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    path character varying(5000) NOT NULL,
    quality integer,
    width integer,
    height integer,
    CONSTRAINT obrazovanie_videoquality_height_check CHECK ((height >= 0)),
    CONSTRAINT obrazovanie_videoquality_quality_check CHECK ((quality >= 0)),
    CONSTRAINT obrazovanie_videoquality_width_check CHECK ((width >= 0))
);


ALTER TABLE public.obrazovanie_videoquality OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_videoquality_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.obrazovanie_videoquality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obrazovanie_videoquality_id_seq OWNER TO k_bekdaulet;

--
-- Name: obrazovanie_videoquality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.obrazovanie_videoquality_id_seq OWNED BY public.obrazovanie_videoquality.id;


--
-- Name: organizations_organization; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.organizations_organization (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name_kk character varying(255) NOT NULL,
    name_ru character varying(255) NOT NULL,
    description_kk text NOT NULL,
    description_ru text NOT NULL,
    icon character varying(100)
);


ALTER TABLE public.organizations_organization OWNER TO k_bekdaulet;

--
-- Name: organizations_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.organizations_organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organizations_organization_id_seq OWNER TO k_bekdaulet;

--
-- Name: organizations_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.organizations_organization_id_seq OWNED BY public.organizations_organization.id;


--
-- Name: rating_rating; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.rating_rating (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    rating integer NOT NULL,
    body text,
    object_id integer,
    content_type_id integer,
    owner_id bigint NOT NULL,
    CONSTRAINT rating_rating_object_id_check CHECK ((object_id >= 0)),
    CONSTRAINT rating_rating_rating_check CHECK ((rating >= 0))
);


ALTER TABLE public.rating_rating OWNER TO k_bekdaulet;

--
-- Name: rating_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.rating_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_rating_id_seq OWNER TO k_bekdaulet;

--
-- Name: rating_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.rating_rating_id_seq OWNED BY public.rating_rating.id;


--
-- Name: rating_rating_likes; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.rating_rating_likes (
    id integer NOT NULL,
    rating_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.rating_rating_likes OWNER TO k_bekdaulet;

--
-- Name: rating_rating_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.rating_rating_likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_rating_likes_id_seq OWNER TO k_bekdaulet;

--
-- Name: rating_rating_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.rating_rating_likes_id_seq OWNED BY public.rating_rating_likes.id;


--
-- Name: support_contactus; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.support_contactus (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(65535) NOT NULL,
    email character varying(65535) NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.support_contactus OWNER TO k_bekdaulet;

--
-- Name: support_contactus_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.support_contactus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.support_contactus_id_seq OWNER TO k_bekdaulet;

--
-- Name: support_contactus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.support_contactus_id_seq OWNED BY public.support_contactus.id;


--
-- Name: support_question; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.support_question (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    question text,
    answer text
);


ALTER TABLE public.support_question OWNER TO k_bekdaulet;

--
-- Name: support_question_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.support_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.support_question_id_seq OWNER TO k_bekdaulet;

--
-- Name: support_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.support_question_id_seq OWNED BY public.support_question.id;


--
-- Name: user_user; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.user_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255),
    surname character varying(255),
    birth_date date,
    image character varying(100),
    city character varying(255),
    description text,
    user_type integer NOT NULL,
    last_login timestamp with time zone,
    verified boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    CONSTRAINT user_user_user_type_check CHECK ((user_type >= 0))
);


ALTER TABLE public.user_user OWNER TO k_bekdaulet;

--
-- Name: user_user_groups; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.user_user_groups (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.user_user_groups OWNER TO k_bekdaulet;

--
-- Name: user_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.user_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_groups_id_seq OWNER TO k_bekdaulet;

--
-- Name: user_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.user_user_groups_id_seq OWNED BY public.user_user_groups.id;


--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO k_bekdaulet;

--
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public.user_user.id;


--
-- Name: user_user_user_permissions; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.user_user_user_permissions (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.user_user_user_permissions OWNER TO k_bekdaulet;

--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.user_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_user_permissions_id_seq OWNER TO k_bekdaulet;

--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.user_user_user_permissions_id_seq OWNED BY public.user_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: course_course id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_course ALTER COLUMN id SET DEFAULT nextval('public.course_course_id_seq'::regclass);


--
-- Name: course_course_lectors id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_course_lectors ALTER COLUMN id SET DEFAULT nextval('public.course_course_lectors_id_seq'::regclass);


--
-- Name: course_lector id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_lector ALTER COLUMN id SET DEFAULT nextval('public.course_lector_id_seq'::regclass);


--
-- Name: course_lesson id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_lesson ALTER COLUMN id SET DEFAULT nextval('public.course_lesson_id_seq'::regclass);


--
-- Name: course_lesson_modules id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_lesson_modules ALTER COLUMN id SET DEFAULT nextval('public.course_lesson_modules_id_seq'::regclass);


--
-- Name: course_lessonmodule id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_lessonmodule ALTER COLUMN id SET DEFAULT nextval('public.course_lessonmodule_id_seq'::regclass);


--
-- Name: course_participant id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_participant ALTER COLUMN id SET DEFAULT nextval('public.course_participant_id_seq'::regclass);


--
-- Name: course_resource id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_resource ALTER COLUMN id SET DEFAULT nextval('public.course_resource_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_beat_clockedschedule id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_clockedschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_crontabschedule id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_crontabschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_intervalschedule id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_intervalschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_periodictask id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_periodictask_id_seq'::regclass);


--
-- Name: django_celery_beat_solarschedule id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_solarschedule_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: dobro_dobro id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.dobro_dobro ALTER COLUMN id SET DEFAULT nextval('public.dobro_dobro_id_seq'::regclass);


--
-- Name: obrazovanie_category id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_category ALTER COLUMN id SET DEFAULT nextval('public.obrazovanie_category_id_seq'::regclass);


--
-- Name: obrazovanie_comment id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_comment ALTER COLUMN id SET DEFAULT nextval('public.obrazovanie_comment_id_seq'::regclass);


--
-- Name: obrazovanie_comment_likes id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_comment_likes ALTER COLUMN id SET DEFAULT nextval('public.obrazovanie_comment_likes_id_seq'::regclass);


--
-- Name: obrazovanie_report id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_report ALTER COLUMN id SET DEFAULT nextval('public.obrazovanie_report_id_seq'::regclass);


--
-- Name: obrazovanie_report_likes id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_report_likes ALTER COLUMN id SET DEFAULT nextval('public.obrazovanie_report_likes_id_seq'::regclass);


--
-- Name: obrazovanie_report_saves id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_report_saves ALTER COLUMN id SET DEFAULT nextval('public.obrazovanie_report_saves_id_seq'::regclass);


--
-- Name: obrazovanie_video id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video ALTER COLUMN id SET DEFAULT nextval('public.obrazovanie_video_id_seq'::regclass);


--
-- Name: obrazovanie_video_likes id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video_likes ALTER COLUMN id SET DEFAULT nextval('public.obrazovanie_video_likes_id_seq'::regclass);


--
-- Name: obrazovanie_video_saves id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video_saves ALTER COLUMN id SET DEFAULT nextval('public.obrazovanie_video_saves_id_seq'::regclass);


--
-- Name: obrazovanie_video_video_quality id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video_video_quality ALTER COLUMN id SET DEFAULT nextval('public.obrazovanie_video_video_quality_id_seq'::regclass);


--
-- Name: obrazovanie_videoquality id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_videoquality ALTER COLUMN id SET DEFAULT nextval('public.obrazovanie_videoquality_id_seq'::regclass);


--
-- Name: organizations_organization id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.organizations_organization ALTER COLUMN id SET DEFAULT nextval('public.organizations_organization_id_seq'::regclass);


--
-- Name: rating_rating id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.rating_rating ALTER COLUMN id SET DEFAULT nextval('public.rating_rating_id_seq'::regclass);


--
-- Name: rating_rating_likes id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.rating_rating_likes ALTER COLUMN id SET DEFAULT nextval('public.rating_rating_likes_id_seq'::regclass);


--
-- Name: support_contactus id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.support_contactus ALTER COLUMN id SET DEFAULT nextval('public.support_contactus_id_seq'::regclass);


--
-- Name: support_question id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.support_question ALTER COLUMN id SET DEFAULT nextval('public.support_question_id_seq'::regclass);


--
-- Name: user_user id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.user_user ALTER COLUMN id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- Name: user_user_groups id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.user_user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_user_groups_id_seq'::regclass);


--
-- Name: user_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.user_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Добро	6	add_dobro
22	Can change Добро	6	change_dobro
23	Can delete Добро	6	delete_dobro
24	Can view Добро	6	view_dobro
25	Can add Категория	7	add_category
26	Can change Категория	7	change_category
27	Can delete Категория	7	delete_category
28	Can view Категория	7	view_category
29	Can add video quality	8	add_videoquality
30	Can change video quality	8	change_videoquality
31	Can delete video quality	8	delete_videoquality
32	Can view video quality	8	view_videoquality
33	Can add Видеролик	9	add_video
34	Can change Видеролик	9	change_video
35	Can delete Видеролик	9	delete_video
36	Can view Видеролик	9	view_video
37	Can add Статья	10	add_report
38	Can change Статья	10	change_report
39	Can delete Статья	10	delete_report
40	Can view Статья	10	view_report
41	Can add Комментарий	11	add_comment
42	Can change Комментарий	11	change_comment
43	Can delete Комментарий	11	delete_comment
44	Can view Комментарий	11	view_comment
45	Can add user	12	add_user
46	Can change user	12	change_user
47	Can delete user	12	delete_user
48	Can view user	12	view_user
49	Can add Поддержка	13	add_contactus
50	Can change Поддержка	13	change_contactus
51	Can delete Поддержка	13	delete_contactus
52	Can view Поддержка	13	view_contactus
53	Can add Вопрос	14	add_question
54	Can change Вопрос	14	change_question
55	Can delete Вопрос	14	delete_question
56	Can view Вопрос	14	view_question
57	Can add Курс	15	add_course
58	Can change Курс	15	change_course
59	Can delete Курс	15	delete_course
60	Can view Курс	15	view_course
61	Can add Лектор	16	add_lector
62	Can change Лектор	16	change_lector
63	Can delete Лектор	16	delete_lector
64	Can view Лектор	16	view_lector
65	Can add Урок	17	add_lesson
66	Can change Урок	17	change_lesson
67	Can delete Урок	17	delete_lesson
68	Can view Урок	17	view_lesson
69	Can add Модуль	18	add_lessonmodule
70	Can change Модуль	18	change_lessonmodule
71	Can delete Модуль	18	delete_lessonmodule
72	Can view Модуль	18	view_lessonmodule
73	Can add Ресурс	19	add_resource
74	Can change Ресурс	19	change_resource
75	Can delete Ресурс	19	delete_resource
76	Can view Ресурс	19	view_resource
77	Can add Участник	20	add_participant
78	Can change Участник	20	change_participant
79	Can delete Участник	20	delete_participant
80	Can view Участник	20	view_participant
81	Can add Организации	21	add_organization
82	Can change Организации	21	change_organization
83	Can delete Организации	21	delete_organization
84	Can view Организации	21	view_organization
85	Can add Рейтинг	22	add_rating
86	Can change Рейтинг	22	change_rating
87	Can delete Рейтинг	22	delete_rating
88	Can view Рейтинг	22	view_rating
89	Can add crontab	23	add_crontabschedule
90	Can change crontab	23	change_crontabschedule
91	Can delete crontab	23	delete_crontabschedule
92	Can view crontab	23	view_crontabschedule
93	Can add interval	24	add_intervalschedule
94	Can change interval	24	change_intervalschedule
95	Can delete interval	24	delete_intervalschedule
96	Can view interval	24	view_intervalschedule
97	Can add periodic task	25	add_periodictask
98	Can change periodic task	25	change_periodictask
99	Can delete periodic task	25	delete_periodictask
100	Can view periodic task	25	view_periodictask
101	Can add periodic tasks	26	add_periodictasks
102	Can change periodic tasks	26	change_periodictasks
103	Can delete periodic tasks	26	delete_periodictasks
104	Can view periodic tasks	26	view_periodictasks
105	Can add solar event	27	add_solarschedule
106	Can change solar event	27	change_solarschedule
107	Can delete solar event	27	delete_solarschedule
108	Can view solar event	27	view_solarschedule
109	Can add clocked	28	add_clockedschedule
110	Can change clocked	28	change_clockedschedule
111	Can delete clocked	28	delete_clockedschedule
112	Can view clocked	28	view_clockedschedule
\.


--
-- Data for Name: course_course; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.course_course (id, created_at, updated_at, name_kk, name_ru, description_kk, description_ru, to_view, views, image, rating, lesson_count, category_id, organization_id, duriation) FROM stdin;
1	2022-03-25 03:16:48.960196+06	2022-03-25 13:43:01.130231+06	курс	курс	курс для всех	курс для всех	t	2	course-image/wallp_4mLcCf5.jpeg	4.00	3	3	1	12 days
2	2022-03-25 13:01:57.093287+06	2022-03-25 13:43:13.73728+06	курс 2	курс 2	курс 2	курс 2	t	0	course-image/back.jpeg	0.00	2	1	1	21 days
\.


--
-- Data for Name: course_course_lectors; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.course_course_lectors (id, course_id, lector_id) FROM stdin;
1	1	1
20	2	1
\.


--
-- Data for Name: course_lector; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.course_lector (id, created_at, updated_at, name, surname, description_kk, description_ru, icon) FROM stdin;
1	2022-03-25 03:17:32.459236+06	2022-03-25 03:17:32.459322+06	Лектор 1	Лектор 1	Лектор 1	Лектор 1	lector/Frame_1.png
\.


--
-- Data for Name: course_lesson; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.course_lesson (id, created_at, updated_at, name_kk, name_ru, description_kk, description_ru, duriation, video, views, course_id, lector_id, "order", score) FROM stdin;
2	2022-03-25 03:18:04.525242+06	2022-03-25 04:00:28.095431+06	урок 2	урок 2	урок 2	урок 2	00:15:00	video2.mp4	6	1	1	2	0
3	2022-03-25 03:18:30.273702+06	2022-03-25 12:59:39.189204+06	урок 3	урок 3	урок 3	урок 3	00:04:00	video3.mp4	3	1	1	3	0
4	2022-03-25 13:02:30.950421+06	2022-03-25 13:02:57.410873+06	урок 2.1	урок 2.1	урок 2.1	урок 2.1	00:15:00	video2.1.mp4	0	2	1	1	0
5	2022-03-25 13:02:51.277991+06	2022-03-25 13:03:02.13944+06	урок 2.2	урок 2.2	урок 2.2	урок 2.2	00:12:00		0	2	1	2	0
1	2022-03-25 03:17:40.68618+06	2022-03-25 13:03:06.273629+06	урок 1	урок 1	урок 1	урок 1	00:12:00	video.mp4	5	1	1	1	0
\.


--
-- Data for Name: course_lesson_modules; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.course_lesson_modules (id, lesson_id, lessonmodule_id) FROM stdin;
\.


--
-- Data for Name: course_lessonmodule; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.course_lessonmodule (id, created_at, updated_at, name_kk, name_ru, description_kk, description_ru, duriation, video, course_id, lector_id) FROM stdin;
1	2022-03-25 13:38:03.364074+06	2022-03-25 13:38:03.364163+06	модуль	модуль	модуль	модуль	00:04:00	videomodule.mp4	1	1
\.


--
-- Data for Name: course_participant; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.course_participant (id, created_at, updated_at, object_id, content_type_id, user_id, points, success) FROM stdin;
\.


--
-- Data for Name: course_resource; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.course_resource (id, created_at, updated_at, name_kk, name_ru, description_kk, description_ru, file, link, course_id, lesson_id, lesson_module_id) FROM stdin;
1	2022-03-25 13:38:07.275403+06	2022-03-25 13:38:25.625124+06	ресурс	ресурс	ресурс	ресурс	course/course_1/18_03_last_week_activity_3.csv	\N	1	1	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-03-25 03:16:30.429459+06	1	организация	1	[{"added": {}}]	21	1
2	2022-03-25 03:16:48.978829+06	1	курс	1	[{"added": {}}]	15	1
3	2022-03-25 03:17:32.469631+06	1	Лектор 1 Лектор 1	1	[{"added": {}}]	16	1
4	2022-03-25 03:17:40.711015+06	1	урок 1	1	[{"added": {}}]	17	1
5	2022-03-25 03:18:04.550466+06	2	урок 2	1	[{"added": {}}]	17	1
6	2022-03-25 03:18:30.291212+06	3	урок 3	1	[{"added": {}}]	17	1
7	2022-03-25 03:18:53.162693+06	1	курс	2	[{"changed": {"fields": ["\\u0414\\u043e\\u0441\\u0442\\u0443\\u043f\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u043e\\u043a\\u0430\\u0437\\u0430"]}}]	15	1
8	2022-03-25 03:52:05.073506+06	3	урок 3	2	[{"changed": {"fields": ["Order"]}}]	17	1
9	2022-03-25 03:52:10.620255+06	2	урок 2	2	[{"changed": {"fields": ["Order"]}}]	17	1
10	2022-03-25 03:52:15.673806+06	1	урок 1	2	[{"changed": {"fields": ["Order"]}}]	17	1
11	2022-03-25 13:00:23.23716+06	2	beximiliano@gmail.com	3		20	1
12	2022-03-25 13:00:23.247822+06	1	beximiliano@gmail.com	3		20	1
13	2022-03-25 13:00:48.061245+06	3	beximiliano@gmail.com	3		20	1
14	2022-03-25 13:01:57.108399+06	2	курс 2	1	[{"added": {}}]	15	1
15	2022-03-25 13:02:30.962173+06	4	урок 2.1	1	[{"added": {}}]	17	1
16	2022-03-25 13:02:51.294784+06	5	урок 2.2	1	[{"added": {}}]	17	1
17	2022-03-25 13:02:57.426247+06	4	урок 2.1	2	[{"changed": {"fields": ["Order"]}}]	17	1
18	2022-03-25 13:03:02.155625+06	5	урок 2.2	2	[{"changed": {"fields": ["Order"]}}]	17	1
19	2022-03-25 13:38:03.381121+06	1	модуль	1	[{"added": {}}]	18	1
20	2022-03-25 13:38:07.282627+06	1	ресурс	1	[{"added": {}}]	19	1
21	2022-03-25 13:38:26.31565+06	1	ресурс	2	[{"changed": {"fields": ["\\u0424\\u0430\\u0439\\u043b"]}}]	19	1
22	2022-03-25 13:43:01.136041+06	1	курс	2	[{"changed": {"fields": ["\\u0414\\u043b\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u044c \\u043a\\u0443\\u0440\\u0441\\u0430"]}}]	15	1
23	2022-03-25 13:43:13.74087+06	2	курс 2	2	[{"changed": {"fields": ["\\u0414\\u043b\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u044c \\u043a\\u0443\\u0440\\u0441\\u0430"]}}]	15	1
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	dobro	dobro
7	obrazovanie	category
8	obrazovanie	videoquality
9	obrazovanie	video
10	obrazovanie	report
11	obrazovanie	comment
12	user	user
13	support	contactus
14	support	question
15	course	course
16	course	lector
17	course	lesson
18	course	lessonmodule
19	course	resource
20	course	participant
21	organizations	organization
22	rating	rating
23	django_celery_beat	crontabschedule
24	django_celery_beat	intervalschedule
25	django_celery_beat	periodictask
26	django_celery_beat	periodictasks
27	django_celery_beat	solarschedule
28	django_celery_beat	clockedschedule
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-03-25 02:58:36.450162+06
2	contenttypes	0002_remove_content_type_name	2022-03-25 02:58:36.460724+06
3	auth	0001_initial	2022-03-25 02:58:36.496303+06
4	auth	0002_alter_permission_name_max_length	2022-03-25 02:58:36.501744+06
5	auth	0003_alter_user_email_max_length	2022-03-25 02:58:36.506581+06
6	auth	0004_alter_user_username_opts	2022-03-25 02:58:36.511844+06
7	auth	0005_alter_user_last_login_null	2022-03-25 02:58:36.516942+06
8	auth	0006_require_contenttypes_0002	2022-03-25 02:58:36.518698+06
9	auth	0007_alter_validators_add_error_messages	2022-03-25 02:58:36.523661+06
10	auth	0008_alter_user_username_max_length	2022-03-25 02:58:36.528804+06
11	auth	0009_alter_user_last_name_max_length	2022-03-25 02:58:36.53399+06
12	auth	0010_alter_group_name_max_length	2022-03-25 02:58:36.54121+06
13	auth	0011_update_proxy_permissions	2022-03-25 02:58:36.546333+06
14	auth	0012_alter_user_first_name_max_length	2022-03-25 02:58:36.551061+06
15	user	0001_initial	2022-03-25 02:58:36.589727+06
16	admin	0001_initial	2022-03-25 02:58:36.612693+06
17	admin	0002_logentry_remove_auto_add	2022-03-25 02:58:36.619604+06
18	admin	0003_logentry_add_action_flag_choices	2022-03-25 02:58:36.626377+06
19	organizations	0001_initial	2022-03-25 02:58:36.641188+06
20	obrazovanie	0001_initial	2022-03-25 02:58:36.763575+06
21	course	0001_initial	2022-03-25 02:58:36.96529+06
22	django_celery_beat	0001_initial	2022-03-25 02:58:36.982748+06
23	django_celery_beat	0002_auto_20161118_0346	2022-03-25 02:58:36.99209+06
24	django_celery_beat	0003_auto_20161209_0049	2022-03-25 02:58:37.000603+06
25	django_celery_beat	0004_auto_20170221_0000	2022-03-25 02:58:37.006252+06
26	django_celery_beat	0005_add_solarschedule_events_choices	2022-03-25 02:58:37.011302+06
27	django_celery_beat	0006_auto_20180322_0932	2022-03-25 02:58:37.031066+06
28	django_celery_beat	0007_auto_20180521_0826	2022-03-25 02:58:37.041197+06
29	django_celery_beat	0008_auto_20180914_1922	2022-03-25 02:58:37.057327+06
30	django_celery_beat	0006_auto_20180210_1226	2022-03-25 02:58:37.066591+06
31	django_celery_beat	0006_periodictask_priority	2022-03-25 02:58:37.07384+06
32	django_celery_beat	0009_periodictask_headers	2022-03-25 02:58:37.08124+06
33	django_celery_beat	0010_auto_20190429_0326	2022-03-25 02:58:37.162849+06
34	django_celery_beat	0011_auto_20190508_0153	2022-03-25 02:58:37.176776+06
35	django_celery_beat	0012_periodictask_expire_seconds	2022-03-25 02:58:37.183295+06
36	django_celery_beat	0013_auto_20200609_0727	2022-03-25 02:58:37.188891+06
37	django_celery_beat	0014_remove_clockedschedule_enabled	2022-03-25 02:58:37.194521+06
38	django_celery_beat	0015_edit_solarschedule_events_choices	2022-03-25 02:58:37.199277+06
39	dobro	0001_initial	2022-03-25 02:58:37.209578+06
40	rating	0001_initial	2022-03-25 02:58:37.253523+06
41	sessions	0001_initial	2022-03-25 02:58:37.263314+06
42	support	0001_initial	2022-03-25 02:58:37.279039+06
43	course	0002_lesson_order	2022-03-25 03:51:50.180593+06
44	course	0003_auto_20220325_1311	2022-03-25 13:11:43.099075+06
45	course	0004_auto_20220325_1342	2022-03-25 13:42:33.781129+06
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
g0g6aswrrqosi37tmugllj083n24disg	.eJxVjEEOwiAQRe_C2hAoUKhL9z0DmWEYqRqalHZlvLtt0oVu_3vvv0WEbS1xa3mJE4mr0OLyuyGkZ64HoAfU-yzTXNdlQnko8qRNjjPl1-10_w4KtLLXGGzwHkinniCl7DoTfPaakREsEhPuvB-sUcloBsVmYFKddwgKnBKfLwwHOLo:1nXUmW:voGdvvxg6KmvhXIRJ2e1VZTR3AaX0wIJQ0Xm7QCc8eo	2022-04-08 03:14:08.378917+06
\.


--
-- Data for Name: dobro_dobro; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.dobro_dobro (id, created_at, updated_at, title, small_description, description, body, image, video, reports, collected, necessary, is_completed) FROM stdin;
\.


--
-- Data for Name: obrazovanie_category; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_category (id, created_at, updated_at, name, name_kk) FROM stdin;
1	2022-02-13 00:21:02.135584+06	2022-02-13 00:21:02.135601+06	🙏 Ментальное здоровье	
2	2022-02-13 00:21:08.857362+06	2022-02-13 00:21:08.85738+06	🌱 Экофилософия	
3	2022-02-13 00:21:15.505717+06	2022-02-13 00:21:15.505736+06	💸 Фин.грамотность	
4	2022-02-13 00:21:55.653751+06	2022-02-13 00:21:55.653769+06	🧿 Культура	
5	2022-02-13 00:22:23.185936+06	2022-02-15 02:57:53.660416+06	❤️ Половое воспитание	
\.


--
-- Data for Name: obrazovanie_comment; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_comment (id, created_at, updated_at, body, object_id, content_type_id, owner_id, reply_id) FROM stdin;
\.


--
-- Data for Name: obrazovanie_comment_likes; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_comment_likes (id, comment_id, user_id) FROM stdin;
\.


--
-- Data for Name: obrazovanie_report; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_report (id, created_at, updated_at, title, title_kk, preview_text_ru, preview_text_kk, body, body_kk, image, moderated, views, author_id, category_id) FROM stdin;
\.


--
-- Data for Name: obrazovanie_report_likes; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_report_likes (id, report_id, user_id) FROM stdin;
\.


--
-- Data for Name: obrazovanie_report_saves; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_report_saves (id, report_id, user_id) FROM stdin;
\.


--
-- Data for Name: obrazovanie_video; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_video (id, created_at, updated_at, title, body, body_kk, image, image_2, video, video_name, youtube, original_quality, views, subs_kk, convert_status, author_id, category_id) FROM stdin;
18	2022-02-21 19:26:54.849382+06	2022-03-10 16:58:39.107259+06	Казахстанская сатира о жизни	<p>Адиль Закенов - основатель казахстанского юмористического комикса &laquo;Шапалак&raquo;. В этом подкасте мы поговорили о сатире в комиксах, про зарождение проекта Шапалак и об острых гранях в политических шутках. &nbsp;</p>\r\n\r\n<p>Ведущий: Ислам Ишмухаметов &nbsp;<br />\r\nГость: Адиль Закенов</p>		video-image/culture_podcast_2_interes_cover.png	video-image/culture_podcast_1_2_mNJpBtl.jpg		final.mp4	\N	1080	51		converted	17	4
5	2022-02-14 16:13:57.44273+06	2022-03-18 19:06:00.43932+06	Как сортировать мусор?	<p>Что такое органика и чем она отличается от вторсырья? На эти вопросы вы найдете ответы в нашем новом ролике.</p>		video-image/garyshker.jpg		video-video/eco_2.mp4	eco_2.mp4	\N	1536	469	video-subs-kk/kazsub_for_eco.vtt	converted	17	2
14	2022-02-16 17:38:00.87502+06	2022-03-19 03:20:11.140975+06	Moldir Matzhanova поделилась тем, что помогает выбраться из апатии и уныния	<p>Поговорили с @matzhanova_ на тему ментального здоровья. Постарались раскрыть предмет, важность открытого общения между людьми, первопричины возникающих проблем. Обсудили, что помогает выбраться из апатии и уныния. Узнали про ее отношения к психологам/психотерапевтам и многое другое&hellip;</p>		video-image/222.png	video-image/111.png		mental_qanda_moldir.mp4	\N	1920	244		converted	17	1
35	2022-02-28 17:34:13.050531+06	2022-03-20 04:21:17.762883+06	Talks: Экология с разных точек зрения	<p>Резиновый ли мусорный полигон? Почему грязный пластик тяжелее перерабатывать? &nbsp;Что вреднее для человека: пластиковые стаканы или бумажные? Погрузитесь в тему экофилософии и узнайте ответы на вопросы в этом ролике.</p>		video-image/eco_talks_interes_cover.png	video-image/eco_talks_interes_cover_RcRyLwE.png		eco_talks_1.mp4	\N	1080	100		converted	17	2
29	2022-02-23 18:41:04.094474+06	2022-03-10 14:07:52.136766+06	Уходи, осенняя хандра!	<p>В этом мастер классе мы узнаем, откуда растут ноги осенней хандры и как с ней справляться.&nbsp;</p>		video-image/mental_masterclass_interes_cover.png	video-image/mental_masterclass_smotret_cover.png		mental_masterclass_1.mp4	\N	1080	25		converted	17	1
19	2022-02-22 14:10:46.729984+06	2022-03-13 23:22:15.755861+06	Как начать копить деньги?	<p>Деньги - это инструмент для комфортной жизни. Нехватка финансов - огромный ментальный риск. Грамотное управление личным бюджетом всегда обеспечит уверенное состояние. &nbsp;</p>\r\n\r\n<p>Узнайте в видео, как начать беречь, копить и умножать свой капитал.</p>		video-image/finance_masterclass_1_interes_cover.png	video-image/finance_masterclass_1_smortet_cover.png		fin_masterclass_1.mp4	\N	1080	33		converted	17	3
27	2022-02-23 18:37:49.676649+06	2022-03-10 01:43:26.576003+06	Ложные эко-друзья	<p>В этом мастер классе мы развеяли мифы о том, что бумажные пакеты, стаканчики и хлопковая одежда менее вредны и быстро разлагаются. Предложили отличные альтернативы, которые обходятся дешевле и более выгодны в пользовании.</p>		video-image/eco_masterclass_1_interes_cover.png	video-image/eco_masterclass_1_smotret_cover.png		eco_masterclass_2_fakefriends.mp4	\N	1080	28		converted	17	2
20	2022-02-22 14:35:29.513108+06	2022-03-18 11:18:59.42419+06	Arman Yussupov о ментальном здоровье	<p>Поговорили с @yussupov21 про осеннюю хандру, и узнали его мнение о том, как он бережет свое ментальное здоровье. &nbsp;</p>\r\n\r\n<p>Бывает ли у вас хандра и как вы с этим боритесь?</p>		video-image/arman_interes_cover_2.png	video-image/arman_smotret_cover_3.png		mental_qanda_arman.mp4	\N	1920	27		converted	17	1
36	2022-02-28 17:44:04.528193+06	2022-03-20 04:11:29.451197+06	Talks: Как собраться в путешествие и немного о Garyshker	<p>Garyshker Talks на тему Путешествий, где наши спикеры затронули актуальную для нашего времени тему &mdash; путешествия, поделившись полезной информацией и жизненным опытом. Также на нем мы немного поговорили о нашем проекте, о том как пришла идея и почему путешествия сыграли в этом важную роль.</p>		video-image/culture_travel_qanda_smotret_cover_3.png	video-image/culture_travel_qanda_smotret_cover_4_Ju0xtT3.png		talks_travel_1.mp4	\N	1080	117		converted	17	4
22	2022-02-22 15:36:49.221561+06	2022-03-20 04:12:29.917103+06	Askar Illyasov поделился своим видением темы полового воспитания	<p>Поговорили с нашим гостем - Аскаром Ильясовым, который поделился своим видением темы полового воспитания.&nbsp;</p>		video-image/askar_interes_cover.png	video-image/askar_smotret_cover.png		sexed_qanda_askar_light.mp4	\N	1440	60		converted	17	5
28	2022-02-23 18:40:02.313029+06	2022-03-20 04:25:03.040858+06	Asselina об опыте ведения экологичного образ жизни	<p>Поговорили с @asseliina на тему эко-философии. Она поделилась опытом ведения экологичного образ жизни. Обсудили некоторые глобальные и локальные проблемы, касающиеся природы и ее загрязнения. Попытались разобраться, как нам способствовать улучшению экологической ситуации в мире.</p>		video-image/asselina_interes_cover.png	video-image/asselina_smotret_cover.png		eco_qanda_asselina.mp4	\N	1920	54		converted	17	2
26	2022-02-23 18:34:04.090616+06	2022-03-10 01:43:11.407882+06	Про осознанное потребление, сортировку и KWR	<p>Виктория Горобцова - сооснователь компании Kazakhstan Waste Recycling (KWR), которая занимается переработкой вторсырья. Эко-философия - это стиль жизни. В этом выпуске подкаста мы узнаем, что такое гринвошинг, существует ли эко-полиэтилен и чем вреден органический отход, который, казалось бы, спокойно и быстро разлагается? &nbsp;</p>\r\n\r\n<p>Ведущий: Ислам Ишмухаметов &nbsp;</p>\r\n\r\n<p>Гость: Виктория Горобцова</p>		video-image/eco_podcast_2_interes_cover.png	video-image/eco_podcast_2_smotret_cover.png		eco_podcast_3_kwr_light.mp4	\N	1080	22		converted	17	2
32	2022-02-23 18:44:34.491422+06	2022-03-20 04:12:48.324204+06	Сексуальное просвещение молодежи, проблема насилия и абортов	<p>Камила Туякбаева - сертифицированный тренер сети Y-PEER по вопросам сексуального и репродуктивного здоровья подростков. В этом подкасте мы обсудили тему сексуального просвещения молодежи, о проблемах насилия и абортов. &nbsp;Ведущий: Ислам Ишмухаметов &nbsp;Гость: Камила Туякбаева</p>		video-image/sexed_podcast_2_inters_cover.png	video-image/sexed_podcast_2_smotret_interes.png		sexed_podcast_2_kamilla_light.mp4	\N	1080	102		converted	17	5
34	2022-02-25 11:48:31.22317+06	2022-03-20 04:13:10.624518+06	Про экологию простым языком	<p>Во сколько обойдется быть экологичным обычному человеку? Ответ на этот вопрос вы найдете в нашем выпуске подкаста и дополнительно узнаете, как тратить не больше, а грамотно. Также вас ждет интересный факт: почему же в ближайшем будущем не будет хватать еды и воды из-за климатических беженцев. &nbsp;</p>\r\n\r\n<p>Ведущие: Алдияр Жапарханов, Даурен Амиргазинов &nbsp;</p>\r\n\r\n<p>Гости: Михаил Беликов, Пакизат Сайлаубекова</p>		video-image/eco_pocast_interes_cover.png	video-image/eco_podcast_cover_2.png		eco_podcast_1_light.mp4	\N	1080	91		converted	17	2
37	2022-02-28 17:50:37.269004+06	2022-03-20 04:18:05.071266+06	Nagimuwa рассказала о важности путешествий в ее жизни	<p>Узнали у @nagimuwaa о важности путешествий в ее жизни.</p>		video-image/nagimuwa_travel_qanda_interes_cover.png	video-image/culture_travel_qanda_smotret_cover_2.png		culture_qanda_1_travel.mp4	\N	1920	204		converted	17	4
39	2022-03-18 18:15:14.590536+06	2022-03-20 04:21:20.428921+06	Rick Astley - Never Gonna Give You Up	<h6>Rick Astley - Never Gonna Give You Up</h6>	<h6>Rick Astley - Never Gonna Give You Up</h6>	video-image/wallp.jpeg	video-image/wallp_IzxOkdB.jpeg		asd	dQw4w9WgXcQ	\N	46		converted	6	4
31	2022-02-23 18:43:44.553158+06	2022-03-16 11:16:56.209328+06	Презервативы: как покупать, проверять и использовать?	<p>Говорить о контрацепции можно и нужно, поэтому наш мастер класс будет полезен как подросткам, так и взрослым.&nbsp;</p>		video-image/sexed_masterclass_interes_cover.png	video-image/sexed_masterclass_smotret_cover.png		sexed_masterclass_1.mp4	\N	1080	91		converted	17	5
33	2022-02-23 18:45:38.178888+06	2022-03-20 04:21:59.266335+06	Как управлять личными финансами?	<p>Деньги - это инструмент для комфортной жизни. Нехватка финансов - огромный ментальный риск. Грамотное управление личным бюджетом всегда обеспечит уверенное состояние. Александра из @finclass поделится с нами советами как начать беречь, копить и умножать свой капитал! &nbsp;</p>\r\n\r\n<p>Ведущий: Ислам Ишмухаметов &nbsp;</p>\r\n\r\n<p>Гость: Александра Ильина</p>		video-image/finance_podcast_2_interes_cover.png	video-image/finance_podcast_2_smotret_cover.png		fin_podcast_1_homecredit_light.mp4	\N	1080	82		converted	17	3
\.


--
-- Data for Name: obrazovanie_video_likes; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_video_likes (id, video_id, user_id) FROM stdin;
\.


--
-- Data for Name: obrazovanie_video_saves; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_video_saves (id, video_id, user_id) FROM stdin;
\.


--
-- Data for Name: obrazovanie_video_video_quality; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_video_video_quality (id, video_id, videoquality_id) FROM stdin;
\.


--
-- Data for Name: obrazovanie_videoquality; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_videoquality (id, created_at, updated_at, path, quality, width, height) FROM stdin;
1	2022-02-13 00:42:44.012644+06	2022-02-13 00:42:44.012685+06	y2mate.com_-_Насколько_они_сильны_вместе__Саске_в_шоке_от_силы_Минато_и_Наруто_1080p_360p.mp4	360	640	360
2	2022-02-13 00:42:44.179172+06	2022-02-13 00:42:44.17921+06	y2mate.com_-_Насколько_они_сильны_вместе__Саске_в_шоке_от_силы_Минато_и_Наруто_1080p_480p.mp4	480	854	480
3	2022-02-13 00:47:15.817148+06	2022-02-13 00:47:15.817186+06	y2mate.com_-_Насколько_они_сильны_вместе__Саске_в_шоке_от_силы_Минато_и_Наруто_1080p_720p.mp4	720	1280	720
4	2022-02-13 01:03:48.149327+06	2022-02-13 01:03:48.149365+06	y2mate.com_-_Насколько_они_сильны_вместе__Саске_в_шоке_от_силы_Минато_и_Наруто_1080p_360p.mp4	360	640	360
5	2022-02-13 01:06:43.375057+06	2022-02-13 01:06:43.375094+06	y2mate.com_-_Насколько_они_сильны_вместе__Саске_в_шоке_от_силы_Минато_и_Наруто_1080p_480p.mp4	480	854	480
6	2022-02-13 01:11:13.111615+06	2022-02-13 01:11:13.111652+06	y2mate.com_-_Насколько_они_сильны_вместе__Саске_в_шоке_от_силы_Минато_и_Наруто_1080p_720p.mp4	720	1280	720
7	2022-02-13 15:41:38.997424+06	2022-02-13 15:41:38.997466+06	Что_такое_гедонизм_360p.mp4	360	640	360
8	2022-02-13 15:42:02.883418+06	2022-02-13 15:42:02.883465+06	Что_такое_гедонизм_480p.mp4	480	854	480
9	2022-02-13 21:57:59.600761+06	2022-02-13 21:57:59.6008+06	Танджиро_и_Незуко_против_Руи_Клинок_рассекающии_демонов_360p.mp4	360	640	360
10	2022-02-13 21:59:00.861546+06	2022-02-13 21:59:00.861591+06	Танджиро_и_Незуко_против_Руи_Клинок_рассекающии_демонов_480p.mp4	480	854	480
11	2022-02-14 16:17:52.198719+06	2022-02-14 16:17:52.198762+06	eco_2_360p.mp4	360	640	360
12	2022-02-14 16:18:11.83149+06	2022-02-14 16:18:11.831536+06	eco_2_480p.mp4	480	854	480
13	2022-02-14 16:18:39.2312+06	2022-02-14 16:18:39.231241+06	eco_2_720p.mp4	720	1280	720
14	2022-02-14 16:19:20.452894+06	2022-02-14 16:19:20.452935+06	eco_2_1080p.mp4	1080	1920	1080
15	2022-02-14 19:47:39.930732+06	2022-02-14 19:47:39.930772+06	Как_создать_стартап_360p.mp4	360	640	360
16	2022-02-14 19:59:27.247328+06	2022-02-14 19:59:27.247368+06	Как_создать_стартап_480p.mp4	480	854	480
17	2022-02-15 13:48:39.976423+06	2022-02-15 13:48:39.976466+06	Запись_экрана_2022-02-08_в_21.05.33_360p.mov	360	640	360
18	2022-02-15 13:48:48.282488+06	2022-02-15 13:48:48.282532+06	Запись_экрана_2022-02-08_в_21.05.33_480p.mov	480	854	480
19	2022-02-15 13:48:59.782708+06	2022-02-15 13:48:59.782754+06	Запись_экрана_2022-02-08_в_21.05.33_720p.mov	720	1280	720
20	2022-02-15 13:49:13.45975+06	2022-02-15 13:49:13.459792+06	Запись_экрана_2022-02-08_в_21.05.33_1080p.mov	1080	1920	1080
21	2022-02-15 14:20:36.930551+06	2022-02-15 14:20:36.930593+06	видос_600мб_360p.mov	360	640	360
22	2022-02-15 14:22:36.451765+06	2022-02-15 14:22:36.45181+06	видос_600мб_480p.mov	480	854	480
23	2022-02-15 14:25:07.205478+06	2022-02-15 14:25:07.205523+06	видос_600мб_720p.mov	720	1280	720
24	2022-02-15 14:28:28.65759+06	2022-02-15 14:28:28.657632+06	видос_600мб_1080p.mov	1080	1920	1080
25	2022-02-15 14:40:59.069244+06	2022-02-15 14:40:59.069287+06	q_and_a_mental_health_360p.mp4	360	640	360
26	2022-02-15 14:42:51.801708+06	2022-02-15 14:42:51.801753+06	q_and_a_mental_health_480p.mp4	480	854	480
27	2022-02-15 14:45:10.24244+06	2022-02-15 14:45:10.242485+06	q_and_a_mental_health_720p.mp4	720	1280	720
28	2022-02-15 14:48:12.655611+06	2022-02-15 14:48:12.655656+06	q_and_a_mental_health_1080p.mp4	1080	1920	1080
29	2022-02-16 17:41:04.194149+06	2022-02-16 17:41:04.194188+06	mental_qanda_moldir_360p.mp4	360	640	360
30	2022-02-16 17:43:01.354438+06	2022-02-16 17:43:01.35448+06	mental_qanda_moldir_480p.mp4	480	854	480
31	2022-02-16 17:45:21.708118+06	2022-02-16 17:45:21.708154+06	mental_qanda_moldir_720p.mp4	720	1280	720
32	2022-02-16 17:48:18.33939+06	2022-02-16 17:48:18.33943+06	mental_qanda_moldir_1080p.mp4	1080	1920	1080
33	2022-02-20 23:29:48.075271+06	2022-02-20 23:29:48.075311+06	тест_видос_360p.mov	360	640	360
34	2022-02-20 23:29:50.28011+06	2022-02-20 23:29:50.280148+06	тест_видос_480p.mov	480	854	480
35	2022-02-20 23:29:52.837175+06	2022-02-20 23:29:52.83722+06	тест_видос_720p.mov	720	1280	720
36	2022-02-20 23:29:55.976689+06	2022-02-20 23:29:55.976732+06	тест_видос_1080p.mov	1080	1920	1080
37	2022-02-21 19:42:09.399791+06	2022-02-21 19:42:09.399835+06	final_360p.mp4	360	640	360
38	2022-02-21 19:55:32.69178+06	2022-02-21 19:55:32.691823+06	final_480p.mp4	480	854	480
39	2022-02-21 20:14:39.584416+06	2022-02-21 20:14:39.58446+06	final_720p.mp4	720	1280	720
40	2022-02-22 14:11:07.666006+06	2022-02-22 14:11:07.666049+06	fin_masterclass_1_360p.mp4	360	640	360
41	2022-02-22 14:11:24.014698+06	2022-02-22 14:11:24.014742+06	fin_masterclass_1_480p.mp4	480	854	480
42	2022-02-22 14:11:48.214972+06	2022-02-22 14:11:48.215015+06	fin_masterclass_1_720p.mp4	720	1280	720
43	2022-02-22 14:37:52.757601+06	2022-02-22 14:37:52.757642+06	mental_qanda_arman_360p.mp4	360	640	360
44	2022-02-22 14:40:02.554589+06	2022-02-22 14:40:02.554628+06	mental_qanda_arman_480p.mp4	480	854	480
45	2022-02-22 14:42:48.370248+06	2022-02-22 14:42:48.370289+06	mental_qanda_arman_720p.mp4	720	1280	720
46	2022-02-22 14:46:36.693244+06	2022-02-22 14:46:36.693285+06	mental_qanda_arman_1080p.mp4	1080	1920	1080
47	2022-02-22 15:01:40.255455+06	2022-02-22 15:01:40.255495+06	eco_masterclass_saltanat_360p.mp4	360	640	360
48	2022-02-22 15:01:55.482344+06	2022-02-22 15:01:55.482388+06	eco_masterclass_saltanat_480p.mp4	480	854	480
49	2022-02-22 15:02:17.153579+06	2022-02-22 15:02:17.15362+06	eco_masterclass_saltanat_720p.mp4	720	1280	720
50	2022-02-22 15:38:10.232902+06	2022-02-22 15:38:10.232945+06	sexed_qanda_askar_light_360p.mp4	360	640	360
51	2022-02-22 15:39:33.946694+06	2022-02-22 15:39:33.946734+06	sexed_qanda_askar_light_480p.mp4	480	854	480
52	2022-02-22 15:41:29.796757+06	2022-02-22 15:41:29.7968+06	sexed_qanda_askar_light_720p.mp4	720	1280	720
53	2022-02-22 15:44:49.444967+06	2022-02-22 15:44:49.445012+06	sexed_qanda_askar_light_1080p.mp4	1080	1920	1080
54	2022-02-23 11:09:14.820869+06	2022-02-23 11:09:14.820907+06	sexed_podcast_1_light_360p.mp4	360	640	360
55	2022-02-23 11:22:47.043167+06	2022-02-23 11:22:47.043209+06	sexed_podcast_1_light_480p.mp4	480	854	480
56	2022-02-23 11:43:30.73548+06	2022-02-23 11:43:30.735522+06	sexed_podcast_1_light_720p.mp4	720	1280	720
57	2022-02-23 13:25:24.151005+06	2022-02-23 13:25:24.151044+06	culture_podcast_2_erzhan_light_360p.mp4	360	640	360
58	2022-02-23 13:40:01.701855+06	2022-02-23 13:40:01.701897+06	culture_podcast_2_erzhan_light_480p.mp4	480	854	480
59	2022-02-23 14:01:44.809983+06	2022-02-23 14:01:44.810028+06	culture_podcast_2_erzhan_light_720p.mp4	720	1280	720
60	2022-02-23 15:23:26.166101+06	2022-02-23 15:23:26.166142+06	eco_podcast_2_tamyr_light_360p.mp4	360	640	360
61	2022-02-23 15:34:02.412194+06	2022-02-23 15:34:02.412236+06	eco_podcast_2_tamyr_light_480p.mp4	480	854	480
62	2022-02-23 17:41:44.957105+06	2022-02-23 17:41:44.957157+06	eco_podcast_2_tamyr_light_360p.mp4	360	640	360
63	2022-02-23 17:52:19.170574+06	2022-02-23 17:52:19.170617+06	eco_podcast_2_tamyr_light_480p.mp4	480	854	480
64	2022-02-23 18:08:23.416679+06	2022-02-23 18:08:23.416725+06	eco_podcast_2_tamyr_light_720p.mp4	720	1280	720
65	2022-02-23 18:47:14.779195+06	2022-02-23 18:47:14.779238+06	eco_podcast_3_kwr_light_360p.mp4	360	640	360
66	2022-02-23 19:03:04.825546+06	2022-02-23 19:03:04.825595+06	eco_podcast_3_kwr_light_480p.mp4	480	854	480
67	2022-02-23 19:26:59.437518+06	2022-02-23 19:26:59.437565+06	eco_podcast_3_kwr_light_720p.mp4	720	1280	720
68	2022-02-23 20:43:15.182488+06	2022-02-23 20:43:15.182539+06	mental_masterclass_1_360p.mp4	360	640	360
69	2022-02-23 20:43:30.046394+06	2022-02-23 20:43:30.046449+06	mental_masterclass_1_480p.mp4	480	854	480
70	2022-02-23 20:43:52.069033+06	2022-02-23 20:43:52.069081+06	mental_masterclass_1_720p.mp4	720	1280	720
71	2022-02-23 20:45:16.259505+06	2022-02-23 20:45:16.259556+06	sexed_masterclass_1_360p.mp4	360	640	360
72	2022-02-23 20:45:30.387964+06	2022-02-23 20:45:30.388015+06	sexed_masterclass_1_480p.mp4	480	854	480
73	2022-02-23 20:45:51.134874+06	2022-02-23 20:45:51.134925+06	sexed_masterclass_1_720p.mp4	720	1280	720
74	2022-02-23 20:49:06.767986+06	2022-02-23 20:49:06.768039+06	eco_masterclass_2_fakefriends_360p.mp4	360	640	360
75	2022-02-23 20:49:22.901452+06	2022-02-23 20:49:22.901503+06	eco_masterclass_2_fakefriends_480p.mp4	480	854	480
76	2022-02-23 20:49:46.48766+06	2022-02-23 20:49:46.487711+06	eco_masterclass_2_fakefriends_720p.mp4	720	1280	720
77	2022-02-23 20:52:41.462133+06	2022-02-23 20:52:41.462186+06	eco_qanda_asselina_360p.mp4	360	640	360
78	2022-02-23 20:53:02.096914+06	2022-02-23 20:53:02.096977+06	eco_qanda_asselina_480p.mp4	480	854	480
79	2022-02-23 20:53:26.74039+06	2022-02-23 20:53:26.74044+06	eco_qanda_asselina_720p.mp4	720	1280	720
80	2022-02-23 20:53:58.18094+06	2022-02-23 20:53:58.180992+06	eco_qanda_asselina_1080p.mp4	1080	1920	1080
81	2022-02-23 20:56:52.682306+06	2022-02-23 20:56:52.682366+06	mental_podcast_1_couch_light_360p.mp4	360	640	360
82	2022-02-23 21:20:35.821816+06	2022-02-23 21:20:35.821861+06	mental_podcast_1_couch_light_480p.mp4	480	854	480
83	2022-02-23 21:41:29.334171+06	2022-02-23 21:41:29.334218+06	mental_podcast_1_couch_light_720p.mp4	720	1280	720
84	2022-02-23 22:26:14.270764+06	2022-02-23 22:26:14.270811+06	fin_podcast_1_homecredit_light_360p.mp4	360	640	360
85	2022-02-23 22:39:23.890636+06	2022-02-23 22:39:23.890685+06	fin_podcast_1_homecredit_light_480p.mp4	480	854	480
86	2022-02-23 22:59:25.875352+06	2022-02-23 22:59:25.8754+06	fin_podcast_1_homecredit_light_720p.mp4	720	1280	720
87	2022-02-23 23:27:11.331276+06	2022-02-23 23:27:11.331322+06	sexed_podcast_2_kamilla_light_360p.mp4	360	640	360
88	2022-02-23 23:40:23.476641+06	2022-02-23 23:40:23.476692+06	sexed_podcast_2_kamilla_light_480p.mp4	480	854	480
89	2022-02-23 23:59:51.189856+06	2022-02-23 23:59:51.189904+06	sexed_podcast_2_kamilla_light_720p.mp4	720	1280	720
90	2022-02-25 11:59:12.71109+06	2022-02-25 11:59:12.711136+06	eco_podcast_1_light_360p.mp4	360	640	360
91	2022-02-25 12:11:46.484672+06	2022-02-25 12:11:46.484723+06	eco_podcast_1_light_480p.mp4	480	854	480
92	2022-02-25 12:30:55.885919+06	2022-02-25 12:30:55.885966+06	eco_podcast_1_light_720p.mp4	720	1280	720
93	2022-02-28 17:41:36.879021+06	2022-02-28 17:41:36.879062+06	eco_talks_1_360p.mp4	360	640	360
94	2022-02-28 17:50:11.873392+06	2022-02-28 17:50:11.873435+06	eco_talks_1_480p.mp4	480	854	480
95	2022-02-28 18:03:01.155076+06	2022-02-28 18:03:01.155118+06	eco_talks_1_720p.mp4	720	1280	720
96	2022-02-28 22:32:10.918636+06	2022-02-28 22:32:10.91868+06	culture_qanda_1_travel_360p.mp4	360	640	360
97	2022-02-28 22:35:25.775101+06	2022-02-28 22:35:25.775155+06	culture_qanda_1_travel_480p.mp4	480	854	480
98	2022-02-28 22:39:49.614533+06	2022-02-28 22:39:49.614587+06	culture_qanda_1_travel_720p.mp4	720	1280	720
99	2022-02-28 22:41:18.450946+06	2022-02-28 22:41:18.451004+06	talks_travel_1_360p.mp4	360	640	360
100	2022-02-28 22:46:36.410591+06	2022-02-28 22:46:36.410649+06	culture_qanda_1_travel_1080p.mp4	1080	1920	1080
101	2022-02-28 22:50:49.771592+06	2022-02-28 22:50:49.771657+06	talks_travel_1_480p.mp4	480	854	480
102	2022-02-28 23:01:30.996694+06	2022-02-28 23:01:30.996741+06	talks_travel_1_720p.mp4	720	1280	720
\.


--
-- Data for Name: organizations_organization; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.organizations_organization (id, created_at, updated_at, name_kk, name_ru, description_kk, description_ru, icon) FROM stdin;
1	2022-03-25 03:16:30.416928+06	2022-03-25 03:16:30.416972+06	организация	организация	организация	организация	lector/week-6.png
\.


--
-- Data for Name: rating_rating; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.rating_rating (id, created_at, updated_at, rating, body, object_id, content_type_id, owner_id) FROM stdin;
1	2022-03-25 13:04:26.738895+06	2022-03-25 13:04:26.73894+06	4	отзыв	1	15	1
\.


--
-- Data for Name: rating_rating_likes; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.rating_rating_likes (id, rating_id, user_id) FROM stdin;
\.


--
-- Data for Name: support_contactus; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.support_contactus (id, created_at, updated_at, name, email, body) FROM stdin;
\.


--
-- Data for Name: support_question; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.support_question (id, created_at, updated_at, question, answer) FROM stdin;
\.


--
-- Data for Name: user_user; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.user_user (id, password, created_at, updated_at, email, name, surname, birth_date, image, city, description, user_type, last_login, verified, is_staff, is_active, is_superuser) FROM stdin;
10	pbkdf2_sha256$260000$aC2aBhh0mADTAbnAh3SiuS$wdT8oSH9+dC8SHNJaHzDy5H26sji82xNTeztbOnfDv4=	2022-02-20 15:16:50.875592+06	2022-02-21 01:32:28.028475+06	bonlyoonee@gmail.com	Бекс	Машина	2000-12-15	profile/75E69C6C-A0F7-4A38-B449-62BAA3D640CD.jpeg	Алматы	Люблю жизнь!!!	0	2022-02-20 15:16:50.875724+06	f	f	t	f
15	pbkdf2_sha256$260000$x05Ov3KgT0XFr82yLm2HJI$G3w2q0CVzuiPRPTiyEycD1jmmrz6mkbYfTmZSSWTvX4=	2022-02-21 12:51:07.062119+06	2022-02-22 18:30:20.818576+06	bonlyoone@gmail.com	Beks	Keks	2000-02-21	profile/never-gonna-give-you-up_tTixkjD.jpeg	Алматы	я кексик	2	2022-02-21 12:51:07.062212+06	f	f	t	f
4	pbkdf2_sha256$260000$PaR5AVSlBpe6QxQIhFAtLE$1RFmVVa2LXNtW0i06Jrj1SxXyCTwJBahhwaHwl7adts=	2022-02-14 14:46:04.537353+06	2022-02-14 14:47:26.653714+06	birzhan@gmail.com	Биржан	\N	1996-02-14	profile/garysh_Q6L0rNu.jpg	Алматы	string	1	2022-02-14 14:46:04.537447+06	f	f	t	f
24	pbkdf2_sha256$260000$i6eqNcCz1eqhMAkswNtSWw$X3vTfxq0PmBYbg3Qycq+/1/cItAkPwrSh0s2mZdTe/4=	2022-03-01 11:15:49.134752+06	2022-03-01 11:15:49.134777+06	toshiro.satori@gmail.com	Тоширо	Нео	1995-12-21	garysh.jpg	Нур-Султан	\N	3	2022-03-01 11:15:49.134844+06	f	f	t	f
8	pbkdf2_sha256$260000$xlGTdeyz0Lmodv7r7GVUPc$9Z4tNM8Q+277RTaEU5EVImcprsMbZOZ+tqxTwjSdasY=	2022-02-19 12:08:24.866684+06	2022-02-19 12:08:24.86671+06	abdo@gmail.com	Абди	Салам	2000-01-01	garysh.jpg	Алматы	Учусь	0	2022-02-19 12:08:24.866785+06	f	f	t	f
18	pbkdf2_sha256$260000$dlMIyz2y7kHM5VBd0DuLpR$h+jwJWdFbzzb80ssOXoBmFI5135z3bJnk12p16el05k=	2022-02-23 11:35:53.662561+06	2022-02-23 11:38:20.369143+06	akmaralintrovert@gmail.com	Akmaral		2001-01-01	garysh.jpg	Алматы		2	2022-02-23 11:35:53.662689+06	f	f	t	f
17	pbkdf2_sha256$260000$1BFJJz9JcEOn3qEivpYqg5$/5ST+yWvkqcK5gFFIpe5E/h3eokJzyVycuiitij4494=	2022-02-22 14:09:45.885759+06	2022-02-26 20:09:57.632141+06	garyshkerpro@gmail.com	Garyshker.	\N	2019-10-31	profile/photo_2022-02-22_14.16.17.jpeg	Алматы		3	2022-02-22 14:09:45.88585+06	t	f	t	f
11	pbkdf2_sha256$260000$Jdnrb9OHQ6noRPpAvScs4H$9mu/gq2ua74SOp4vnKP/RdPewqnciwLJutu9MGDi/Ug=	2022-02-20 22:54:23.564818+06	2022-02-20 22:54:23.564846+06	kairkhanovich.017@mail.ru	Ерасыл	Жоламан	1996-12-04	garysh.jpg	Караганда	\N	1	2022-02-20 22:54:23.564945+06	f	f	t	f
19	pbkdf2_sha256$260000$92DDhpMyocZfdUphwpEETm$zHmQBqxuWIrD0HtQCytVJV5iTLVPH0P3KD82vOZpivc=	2022-02-23 13:51:01.893669+06	2022-02-23 13:52:23.559499+06	aruzhanarticles@gmail.com	Aruzhan		2001-01-01	garysh.jpg	Алматы	\N	1	2022-02-23 13:51:01.893789+06	f	f	t	f
25	pbkdf2_sha256$260000$uFpxtKKgzZTRgdI5htbwVP$QquY+pjHPId+1ewG8pgzbURSU4D6dHVZTefmFFgDwWk=	2022-03-05 00:00:22.225394+06	2022-03-05 00:00:22.225418+06	nursultan.baikenov@gmail.com	Nursultan	Baiken	1992-11-08	garysh.jpg	Алматы	\N	2	2022-03-05 00:00:22.22548+06	f	f	t	f
16	pbkdf2_sha256$260000$NJF3JXLqPk8ThZzcZiJVUQ$tyjbp2A3naPUzBx4Dmdd8wsLQM03SICKkjeCjxGI3K4=	2022-02-21 13:00:36.713616+06	2022-02-21 13:01:42.431076+06	abdirinat@gmail.com	Abdi		2000-02-22	garysh.jpg	Алматы	\N	2	2022-02-21 13:00:36.713702+06	f	f	t	f
20	pbkdf2_sha256$260000$ro8skjGFnqPPr9fhAaFgUp$wqfbcjV8dps8Hicawejzrk5zPUczB+ZWaMGvvCXXaas=	2022-02-23 13:53:24.974722+06	2022-02-23 13:53:50.928344+06	aknietkenes@gmail.com	Akniet		2001-01-01	garysh.jpg	Павлодар	\N	2	2022-02-23 13:53:24.974847+06	f	f	t	f
21	pbkdf2_sha256$260000$oXwAQjZcDT9EWIvaUElUZg$+8B98NZFij1fMY7PkA1fsuzVQat3oX+o1nTZ9meYt2U=	2022-02-23 13:55:04.346264+06	2022-02-23 13:55:27.419213+06	ademaarticles@gmail.com	Adema		2001-01-01	garysh.jpg	Алматы	\N	1	2022-02-23 13:55:04.346385+06	f	f	t	f
22	pbkdf2_sha256$260000$rd2xn9lZl3gyHCl2b1DEoi$eZRtJ0Y1zNWSaXiuqhdKamfSZngUE4ZnUJzvb04aXJs=	2022-02-24 00:17:09.435976+06	2022-02-24 00:17:09.436+06	muhammedaliaru@gmail.com	Али	Ару	2000-09-08	garysh.jpg	Алматы	\N	2	2022-02-24 00:17:09.436059+06	f	f	t	f
26	pbkdf2_sha256$260000$nXc0dM2BGNQeu4FvkUVJfR$ajY9NCKvjfqPRoovVNF+sjU5LE2fNf84lBdCFOSvbc4=	2022-03-07 15:57:33.099194+06	2022-03-07 15:57:33.09922+06	sultangazyarshyn@gmail.com	Аршын	Султангазы	1996-05-27	garysh.jpg	Жезказган	\N	2	2022-03-07 15:57:33.099289+06	f	f	t	f
5	pbkdf2_sha256$260000$0Ycq4myTqTdtz3erIYN9yn$6Gc3xpUjYeHsEjAEB17QX5LAdtKfhbxW8lexjtF/BGg=	2022-02-14 15:04:16.910458+06	2022-03-14 17:46:20.870708+06	abdi@gmail.com	Абди		2000-02-14	profile/012920-AirbnbOrg-BOD-Joe-00298_RET1_1000x1500_SquareCrop.jpg	Алматы	string	1	2022-02-14 15:04:16.910546+06	f	f	t	f
27	pbkdf2_sha256$260000$f567zSNOm2caHioHZIdRYC$pP5QvwwjZChCEaasgBCAy11+Pu76bFcJpKVtGaaszPA=	2022-03-17 13:10:25.61492+06	2022-03-17 13:10:25.614945+06	info.broglasses@gmail.com	Danik	Shaikemelov	1992-06-03	garysh.jpg	Алматы	\N	2	2022-03-17 13:10:25.61501+06	f	f	t	f
23	pbkdf2_sha256$260000$I7bemcoM3PUpAmNF0tU17b$bfWeSWPXd/D5XtEH+U9lK1m1zHhxXsZrKpMCPlq4Xn4=	2022-02-28 00:58:51.715165+06	2022-02-28 00:58:51.71519+06	arai.nurtassova@gmail.com	Arai	Nurtassova	1994-07-15	garysh.jpg	Алматы	\N	3	2022-02-28 00:58:51.715256+06	f	f	t	f
6	pbkdf2_sha256$260000$yFWCVQ33IBt9t6pLwXFC5O$X3y5ZohSAosieFJPG2rVpLygOPRhxyNoWwSAaCmw72M=	2022-02-18 13:55:48.371253+06	2022-02-28 12:05:08.352904+06	kazbekov.bekdaulet2000@gmail.com	Т1000	Терминатор	2000-12-15	profile/lui.png	Алматы	убиваю направо и налево	2	2022-02-18 13:55:48.371371+06	f	f	t	f
9	pbkdf2_sha256$260000$ZdsPcfoQsxqNdB3S7Rd5ze$04iUsjYV21K65IJtKmSOqXUilS33TR1Uz24gQq2frYc=	2022-02-19 13:20:47.520606+06	2022-03-13 01:53:41.766681+06	birzhanshakarim@gmail.com	Birzhan	Shakarim	1996-10-31	profile/DDCDAA6E-C2C8-4B62-8983-72763EFA7474.jpeg	Алматы	ты кто?	2	2022-02-19 13:20:47.520726+06	t	f	t	f
1	pbkdf2_sha256$260000$7kEvmjRg6chzt09kYHBZ9S$XCfRgqBzbMPbNeWOHIf7g97nNtOApNpCHgUYfYV6AqA=	2022-02-13 00:19:20.011716+06	2022-03-19 03:17:16.335589+06	beximiliano@gmail.com	Бекдаулет	Казбеков	2000-12-15	profile/never-gonna-give-you-up_jKwCf3H.jpeg	Almaty	я люблю себя!!!! Glhf	0	2022-03-25 03:14:08.374999+06	t	t	t	t
\.


--
-- Data for Name: user_user_groups; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.user_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: user_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.user_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 112, true);


--
-- Name: course_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.course_course_id_seq', 2, true);


--
-- Name: course_course_lectors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.course_course_lectors_id_seq', 24, true);


--
-- Name: course_lector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.course_lector_id_seq', 1, true);


--
-- Name: course_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.course_lesson_id_seq', 5, true);


--
-- Name: course_lesson_modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.course_lesson_modules_id_seq', 1, false);


--
-- Name: course_lessonmodule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.course_lessonmodule_id_seq', 1, true);


--
-- Name: course_participant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.course_participant_id_seq', 3, true);


--
-- Name: course_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.course_resource_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 23, true);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 1, false);


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 28, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 45, true);


--
-- Name: dobro_dobro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.dobro_dobro_id_seq', 1, false);


--
-- Name: obrazovanie_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_category_id_seq', 1, false);


--
-- Name: obrazovanie_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_comment_id_seq', 1, false);


--
-- Name: obrazovanie_comment_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_comment_likes_id_seq', 1, false);


--
-- Name: obrazovanie_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_report_id_seq', 1, false);


--
-- Name: obrazovanie_report_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_report_likes_id_seq', 1, false);


--
-- Name: obrazovanie_report_saves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_report_saves_id_seq', 1, false);


--
-- Name: obrazovanie_video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_video_id_seq', 1, false);


--
-- Name: obrazovanie_video_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_video_likes_id_seq', 1, false);


--
-- Name: obrazovanie_video_saves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_video_saves_id_seq', 1, false);


--
-- Name: obrazovanie_video_video_quality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_video_video_quality_id_seq', 1, false);


--
-- Name: obrazovanie_videoquality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_videoquality_id_seq', 1, false);


--
-- Name: organizations_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.organizations_organization_id_seq', 1, true);


--
-- Name: rating_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.rating_rating_id_seq', 1, true);


--
-- Name: rating_rating_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.rating_rating_likes_id_seq', 1, false);


--
-- Name: support_contactus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.support_contactus_id_seq', 1, false);


--
-- Name: support_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.support_question_id_seq', 1, false);


--
-- Name: user_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.user_user_groups_id_seq', 1, false);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.user_user_id_seq', 1, false);


--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.user_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: course_course_lectors course_course_lectors_course_id_lector_id_4135093d_uniq; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_course_lectors
    ADD CONSTRAINT course_course_lectors_course_id_lector_id_4135093d_uniq UNIQUE (course_id, lector_id);


--
-- Name: course_course_lectors course_course_lectors_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_course_lectors
    ADD CONSTRAINT course_course_lectors_pkey PRIMARY KEY (id);


--
-- Name: course_course course_course_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_course
    ADD CONSTRAINT course_course_pkey PRIMARY KEY (id);


--
-- Name: course_lector course_lector_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_lector
    ADD CONSTRAINT course_lector_pkey PRIMARY KEY (id);


--
-- Name: course_lesson_modules course_lesson_modules_lesson_id_lessonmodule_id_bd3ce1bb_uniq; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_lesson_modules
    ADD CONSTRAINT course_lesson_modules_lesson_id_lessonmodule_id_bd3ce1bb_uniq UNIQUE (lesson_id, lessonmodule_id);


--
-- Name: course_lesson_modules course_lesson_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_lesson_modules
    ADD CONSTRAINT course_lesson_modules_pkey PRIMARY KEY (id);


--
-- Name: course_lesson course_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_lesson
    ADD CONSTRAINT course_lesson_pkey PRIMARY KEY (id);


--
-- Name: course_lessonmodule course_lessonmodule_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_lessonmodule
    ADD CONSTRAINT course_lessonmodule_pkey PRIMARY KEY (id);


--
-- Name: course_participant course_participant_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_participant
    ADD CONSTRAINT course_participant_pkey PRIMARY KEY (id);


--
-- Name: course_resource course_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_resource
    ADD CONSTRAINT course_resource_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_clockedschedule django_celery_beat_clockedschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: dobro_dobro dobro_dobro_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.dobro_dobro
    ADD CONSTRAINT dobro_dobro_pkey PRIMARY KEY (id);


--
-- Name: obrazovanie_category obrazovanie_category_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_category
    ADD CONSTRAINT obrazovanie_category_pkey PRIMARY KEY (id);


--
-- Name: obrazovanie_comment_likes obrazovanie_comment_likes_comment_id_user_id_12ff6354_uniq; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_comment_likes
    ADD CONSTRAINT obrazovanie_comment_likes_comment_id_user_id_12ff6354_uniq UNIQUE (comment_id, user_id);


--
-- Name: obrazovanie_comment_likes obrazovanie_comment_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_comment_likes
    ADD CONSTRAINT obrazovanie_comment_likes_pkey PRIMARY KEY (id);


--
-- Name: obrazovanie_comment obrazovanie_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_comment
    ADD CONSTRAINT obrazovanie_comment_pkey PRIMARY KEY (id);


--
-- Name: obrazovanie_report_likes obrazovanie_report_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_report_likes
    ADD CONSTRAINT obrazovanie_report_likes_pkey PRIMARY KEY (id);


--
-- Name: obrazovanie_report_likes obrazovanie_report_likes_report_id_user_id_494cdaf3_uniq; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_report_likes
    ADD CONSTRAINT obrazovanie_report_likes_report_id_user_id_494cdaf3_uniq UNIQUE (report_id, user_id);


--
-- Name: obrazovanie_report obrazovanie_report_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_report
    ADD CONSTRAINT obrazovanie_report_pkey PRIMARY KEY (id);


--
-- Name: obrazovanie_report_saves obrazovanie_report_saves_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_report_saves
    ADD CONSTRAINT obrazovanie_report_saves_pkey PRIMARY KEY (id);


--
-- Name: obrazovanie_report_saves obrazovanie_report_saves_report_id_user_id_3246740e_uniq; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_report_saves
    ADD CONSTRAINT obrazovanie_report_saves_report_id_user_id_3246740e_uniq UNIQUE (report_id, user_id);


--
-- Name: obrazovanie_video_likes obrazovanie_video_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video_likes
    ADD CONSTRAINT obrazovanie_video_likes_pkey PRIMARY KEY (id);


--
-- Name: obrazovanie_video_likes obrazovanie_video_likes_video_id_user_id_b18b674f_uniq; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video_likes
    ADD CONSTRAINT obrazovanie_video_likes_video_id_user_id_b18b674f_uniq UNIQUE (video_id, user_id);


--
-- Name: obrazovanie_video obrazovanie_video_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video
    ADD CONSTRAINT obrazovanie_video_pkey PRIMARY KEY (id);


--
-- Name: obrazovanie_video_saves obrazovanie_video_saves_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video_saves
    ADD CONSTRAINT obrazovanie_video_saves_pkey PRIMARY KEY (id);


--
-- Name: obrazovanie_video_saves obrazovanie_video_saves_video_id_user_id_2a86eb3c_uniq; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video_saves
    ADD CONSTRAINT obrazovanie_video_saves_video_id_user_id_2a86eb3c_uniq UNIQUE (video_id, user_id);


--
-- Name: obrazovanie_video_video_quality obrazovanie_video_video__video_id_videoquality_id_eb2d6041_uniq; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video_video_quality
    ADD CONSTRAINT obrazovanie_video_video__video_id_videoquality_id_eb2d6041_uniq UNIQUE (video_id, videoquality_id);


--
-- Name: obrazovanie_video_video_quality obrazovanie_video_video_quality_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video_video_quality
    ADD CONSTRAINT obrazovanie_video_video_quality_pkey PRIMARY KEY (id);


--
-- Name: obrazovanie_videoquality obrazovanie_videoquality_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_videoquality
    ADD CONSTRAINT obrazovanie_videoquality_pkey PRIMARY KEY (id);


--
-- Name: organizations_organization organizations_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.organizations_organization
    ADD CONSTRAINT organizations_organization_pkey PRIMARY KEY (id);


--
-- Name: rating_rating_likes rating_rating_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.rating_rating_likes
    ADD CONSTRAINT rating_rating_likes_pkey PRIMARY KEY (id);


--
-- Name: rating_rating_likes rating_rating_likes_rating_id_user_id_cbe945fa_uniq; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.rating_rating_likes
    ADD CONSTRAINT rating_rating_likes_rating_id_user_id_cbe945fa_uniq UNIQUE (rating_id, user_id);


--
-- Name: rating_rating rating_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.rating_rating
    ADD CONSTRAINT rating_rating_pkey PRIMARY KEY (id);


--
-- Name: support_contactus support_contactus_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.support_contactus
    ADD CONSTRAINT support_contactus_pkey PRIMARY KEY (id);


--
-- Name: support_question support_question_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.support_question
    ADD CONSTRAINT support_question_pkey PRIMARY KEY (id);


--
-- Name: user_user user_user_email_key; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_email_key UNIQUE (email);


--
-- Name: user_user_groups user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_pkey PRIMARY KEY (id);


--
-- Name: user_user_groups user_user_groups_user_id_group_id_bb60391f_uniq; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_group_id_bb60391f_uniq UNIQUE (user_id, group_id);


--
-- Name: user_user user_user_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_pkey PRIMARY KEY (id);


--
-- Name: user_user_user_permissions user_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: course_course_category_id_0b2127b9; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX course_course_category_id_0b2127b9 ON public.course_course USING btree (category_id);


--
-- Name: course_course_lectors_course_id_57e2e094; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX course_course_lectors_course_id_57e2e094 ON public.course_course_lectors USING btree (course_id);


--
-- Name: course_course_lectors_lector_id_a8891bc8; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX course_course_lectors_lector_id_a8891bc8 ON public.course_course_lectors USING btree (lector_id);


--
-- Name: course_course_organization_id_47043717; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX course_course_organization_id_47043717 ON public.course_course USING btree (organization_id);


--
-- Name: course_lesson_course_id_65df4a1c; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX course_lesson_course_id_65df4a1c ON public.course_lesson USING btree (course_id);


--
-- Name: course_lesson_lector_id_59f0e371; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX course_lesson_lector_id_59f0e371 ON public.course_lesson USING btree (lector_id);


--
-- Name: course_lesson_modules_lesson_id_dcc38aef; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX course_lesson_modules_lesson_id_dcc38aef ON public.course_lesson_modules USING btree (lesson_id);


--
-- Name: course_lesson_modules_lessonmodule_id_78457478; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX course_lesson_modules_lessonmodule_id_78457478 ON public.course_lesson_modules USING btree (lessonmodule_id);


--
-- Name: course_lessonmodule_course_id_2447d859; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX course_lessonmodule_course_id_2447d859 ON public.course_lessonmodule USING btree (course_id);


--
-- Name: course_lessonmodule_lector_id_318fd861; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX course_lessonmodule_lector_id_318fd861 ON public.course_lessonmodule USING btree (lector_id);


--
-- Name: course_participant_content_type_id_07d4887f; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX course_participant_content_type_id_07d4887f ON public.course_participant USING btree (content_type_id);


--
-- Name: course_participant_user_id_0ca3d949; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX course_participant_user_id_0ca3d949 ON public.course_participant USING btree (user_id);


--
-- Name: course_resource_course_id_47d8cca5; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX course_resource_course_id_47d8cca5 ON public.course_resource USING btree (course_id);


--
-- Name: course_resource_lesson_id_8284877c; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX course_resource_lesson_id_8284877c ON public.course_resource USING btree (lesson_id);


--
-- Name: course_resource_lesson_module_id_87466b98; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX course_resource_lesson_module_id_87466b98 ON public.course_resource USING btree (lesson_module_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_celery_beat_periodictask_clocked_id_47a69f82; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);


--
-- Name: django_celery_beat_periodictask_crontab_id_d3cba168; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);


--
-- Name: django_celery_beat_periodictask_interval_id_a8ca27da; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);


--
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: django_celery_beat_periodictask_solar_id_a87ce72c; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: obrazovanie_comment_content_type_id_40faf572; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_comment_content_type_id_40faf572 ON public.obrazovanie_comment USING btree (content_type_id);


--
-- Name: obrazovanie_comment_likes_comment_id_1dbce7ed; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_comment_likes_comment_id_1dbce7ed ON public.obrazovanie_comment_likes USING btree (comment_id);


--
-- Name: obrazovanie_comment_likes_user_id_ebcb19d4; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_comment_likes_user_id_ebcb19d4 ON public.obrazovanie_comment_likes USING btree (user_id);


--
-- Name: obrazovanie_comment_owner_id_cf906975; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_comment_owner_id_cf906975 ON public.obrazovanie_comment USING btree (owner_id);


--
-- Name: obrazovanie_comment_reply_id_7a49dbc0; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_comment_reply_id_7a49dbc0 ON public.obrazovanie_comment USING btree (reply_id);


--
-- Name: obrazovanie_report_author_id_69968a89; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_report_author_id_69968a89 ON public.obrazovanie_report USING btree (author_id);


--
-- Name: obrazovanie_report_category_id_b89917f1; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_report_category_id_b89917f1 ON public.obrazovanie_report USING btree (category_id);


--
-- Name: obrazovanie_report_likes_report_id_42e210be; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_report_likes_report_id_42e210be ON public.obrazovanie_report_likes USING btree (report_id);


--
-- Name: obrazovanie_report_likes_user_id_8ab85083; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_report_likes_user_id_8ab85083 ON public.obrazovanie_report_likes USING btree (user_id);


--
-- Name: obrazovanie_report_saves_report_id_cc79702a; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_report_saves_report_id_cc79702a ON public.obrazovanie_report_saves USING btree (report_id);


--
-- Name: obrazovanie_report_saves_user_id_8c91ed91; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_report_saves_user_id_8c91ed91 ON public.obrazovanie_report_saves USING btree (user_id);


--
-- Name: obrazovanie_video_author_id_6e896ee3; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_video_author_id_6e896ee3 ON public.obrazovanie_video USING btree (author_id);


--
-- Name: obrazovanie_video_category_id_75dd4841; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_video_category_id_75dd4841 ON public.obrazovanie_video USING btree (category_id);


--
-- Name: obrazovanie_video_likes_user_id_cfd26802; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_video_likes_user_id_cfd26802 ON public.obrazovanie_video_likes USING btree (user_id);


--
-- Name: obrazovanie_video_likes_video_id_89df5c26; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_video_likes_video_id_89df5c26 ON public.obrazovanie_video_likes USING btree (video_id);


--
-- Name: obrazovanie_video_saves_user_id_b7303b7b; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_video_saves_user_id_b7303b7b ON public.obrazovanie_video_saves USING btree (user_id);


--
-- Name: obrazovanie_video_saves_video_id_c9289784; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_video_saves_video_id_c9289784 ON public.obrazovanie_video_saves USING btree (video_id);


--
-- Name: obrazovanie_video_video_quality_video_id_3e3861ea; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_video_video_quality_video_id_3e3861ea ON public.obrazovanie_video_video_quality USING btree (video_id);


--
-- Name: obrazovanie_video_video_quality_videoquality_id_f8194716; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX obrazovanie_video_video_quality_videoquality_id_f8194716 ON public.obrazovanie_video_video_quality USING btree (videoquality_id);


--
-- Name: rating_rating_content_type_id_0abe2a32; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX rating_rating_content_type_id_0abe2a32 ON public.rating_rating USING btree (content_type_id);


--
-- Name: rating_rating_likes_rating_id_1ea661ac; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX rating_rating_likes_rating_id_1ea661ac ON public.rating_rating_likes USING btree (rating_id);


--
-- Name: rating_rating_likes_user_id_c9bc633f; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX rating_rating_likes_user_id_c9bc633f ON public.rating_rating_likes USING btree (user_id);


--
-- Name: rating_rating_owner_id_7c70caf8; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX rating_rating_owner_id_7c70caf8 ON public.rating_rating USING btree (owner_id);


--
-- Name: user_user_email_1c6f3d1a_like; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX user_user_email_1c6f3d1a_like ON public.user_user USING btree (email varchar_pattern_ops);


--
-- Name: user_user_groups_group_id_c57f13c0; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX user_user_groups_group_id_c57f13c0 ON public.user_user_groups USING btree (group_id);


--
-- Name: user_user_groups_user_id_13f9a20d; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX user_user_groups_user_id_13f9a20d ON public.user_user_groups USING btree (user_id);


--
-- Name: user_user_user_permissions_permission_id_ce49d4de; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX user_user_user_permissions_permission_id_ce49d4de ON public.user_user_user_permissions USING btree (permission_id);


--
-- Name: user_user_user_permissions_user_id_31782f58; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX user_user_user_permissions_user_id_31782f58 ON public.user_user_user_permissions USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_course course_course_category_id_0b2127b9_fk_obrazovanie_category_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_course
    ADD CONSTRAINT course_course_category_id_0b2127b9_fk_obrazovanie_category_id FOREIGN KEY (category_id) REFERENCES public.obrazovanie_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_course_lectors course_course_lectors_course_id_57e2e094_fk_course_course_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_course_lectors
    ADD CONSTRAINT course_course_lectors_course_id_57e2e094_fk_course_course_id FOREIGN KEY (course_id) REFERENCES public.course_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_course_lectors course_course_lectors_lector_id_a8891bc8_fk_course_lector_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_course_lectors
    ADD CONSTRAINT course_course_lectors_lector_id_a8891bc8_fk_course_lector_id FOREIGN KEY (lector_id) REFERENCES public.course_lector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_course course_course_organization_id_47043717_fk_organizat; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_course
    ADD CONSTRAINT course_course_organization_id_47043717_fk_organizat FOREIGN KEY (organization_id) REFERENCES public.organizations_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_lesson course_lesson_course_id_65df4a1c_fk_course_course_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_lesson
    ADD CONSTRAINT course_lesson_course_id_65df4a1c_fk_course_course_id FOREIGN KEY (course_id) REFERENCES public.course_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_lesson course_lesson_lector_id_59f0e371_fk_course_lector_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_lesson
    ADD CONSTRAINT course_lesson_lector_id_59f0e371_fk_course_lector_id FOREIGN KEY (lector_id) REFERENCES public.course_lector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_lesson_modules course_lesson_module_lessonmodule_id_78457478_fk_course_le; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_lesson_modules
    ADD CONSTRAINT course_lesson_module_lessonmodule_id_78457478_fk_course_le FOREIGN KEY (lessonmodule_id) REFERENCES public.course_lessonmodule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_lesson_modules course_lesson_modules_lesson_id_dcc38aef_fk_course_lesson_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_lesson_modules
    ADD CONSTRAINT course_lesson_modules_lesson_id_dcc38aef_fk_course_lesson_id FOREIGN KEY (lesson_id) REFERENCES public.course_lesson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_lessonmodule course_lessonmodule_course_id_2447d859_fk_course_course_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_lessonmodule
    ADD CONSTRAINT course_lessonmodule_course_id_2447d859_fk_course_course_id FOREIGN KEY (course_id) REFERENCES public.course_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_lessonmodule course_lessonmodule_lector_id_318fd861_fk_course_lector_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_lessonmodule
    ADD CONSTRAINT course_lessonmodule_lector_id_318fd861_fk_course_lector_id FOREIGN KEY (lector_id) REFERENCES public.course_lector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_participant course_participant_content_type_id_07d4887f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_participant
    ADD CONSTRAINT course_participant_content_type_id_07d4887f_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_participant course_participant_user_id_0ca3d949_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_participant
    ADD CONSTRAINT course_participant_user_id_0ca3d949_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_resource course_resource_course_id_47d8cca5_fk_course_course_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_resource
    ADD CONSTRAINT course_resource_course_id_47d8cca5_fk_course_course_id FOREIGN KEY (course_id) REFERENCES public.course_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_resource course_resource_lesson_id_8284877c_fk_course_lesson_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_resource
    ADD CONSTRAINT course_resource_lesson_id_8284877c_fk_course_lesson_id FOREIGN KEY (lesson_id) REFERENCES public.course_lesson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_resource course_resource_lesson_module_id_87466b98_fk_course_le; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.course_resource
    ADD CONSTRAINT course_resource_lesson_module_id_87466b98_fk_course_le FOREIGN KEY (lesson_module_id) REFERENCES public.course_lessonmodule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_clocked_id_47a69f82_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_comment_likes obrazovanie_comment__comment_id_1dbce7ed_fk_obrazovan; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_comment_likes
    ADD CONSTRAINT obrazovanie_comment__comment_id_1dbce7ed_fk_obrazovan FOREIGN KEY (comment_id) REFERENCES public.obrazovanie_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_comment obrazovanie_comment_content_type_id_40faf572_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_comment
    ADD CONSTRAINT obrazovanie_comment_content_type_id_40faf572_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_comment_likes obrazovanie_comment_likes_user_id_ebcb19d4_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_comment_likes
    ADD CONSTRAINT obrazovanie_comment_likes_user_id_ebcb19d4_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_comment obrazovanie_comment_owner_id_cf906975_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_comment
    ADD CONSTRAINT obrazovanie_comment_owner_id_cf906975_fk_user_user_id FOREIGN KEY (owner_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_comment obrazovanie_comment_reply_id_7a49dbc0_fk_obrazovanie_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_comment
    ADD CONSTRAINT obrazovanie_comment_reply_id_7a49dbc0_fk_obrazovanie_comment_id FOREIGN KEY (reply_id) REFERENCES public.obrazovanie_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_report obrazovanie_report_author_id_69968a89_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_report
    ADD CONSTRAINT obrazovanie_report_author_id_69968a89_fk_user_user_id FOREIGN KEY (author_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_report obrazovanie_report_category_id_b89917f1_fk_obrazovan; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_report
    ADD CONSTRAINT obrazovanie_report_category_id_b89917f1_fk_obrazovan FOREIGN KEY (category_id) REFERENCES public.obrazovanie_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_report_likes obrazovanie_report_l_report_id_42e210be_fk_obrazovan; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_report_likes
    ADD CONSTRAINT obrazovanie_report_l_report_id_42e210be_fk_obrazovan FOREIGN KEY (report_id) REFERENCES public.obrazovanie_report(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_report_likes obrazovanie_report_likes_user_id_8ab85083_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_report_likes
    ADD CONSTRAINT obrazovanie_report_likes_user_id_8ab85083_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_report_saves obrazovanie_report_s_report_id_cc79702a_fk_obrazovan; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_report_saves
    ADD CONSTRAINT obrazovanie_report_s_report_id_cc79702a_fk_obrazovan FOREIGN KEY (report_id) REFERENCES public.obrazovanie_report(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_report_saves obrazovanie_report_saves_user_id_8c91ed91_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_report_saves
    ADD CONSTRAINT obrazovanie_report_saves_user_id_8c91ed91_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_video obrazovanie_video_author_id_6e896ee3_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video
    ADD CONSTRAINT obrazovanie_video_author_id_6e896ee3_fk_user_user_id FOREIGN KEY (author_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_video obrazovanie_video_category_id_75dd4841_fk_obrazovan; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video
    ADD CONSTRAINT obrazovanie_video_category_id_75dd4841_fk_obrazovan FOREIGN KEY (category_id) REFERENCES public.obrazovanie_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_video_likes obrazovanie_video_li_video_id_89df5c26_fk_obrazovan; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video_likes
    ADD CONSTRAINT obrazovanie_video_li_video_id_89df5c26_fk_obrazovan FOREIGN KEY (video_id) REFERENCES public.obrazovanie_video(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_video_likes obrazovanie_video_likes_user_id_cfd26802_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video_likes
    ADD CONSTRAINT obrazovanie_video_likes_user_id_cfd26802_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_video_saves obrazovanie_video_sa_video_id_c9289784_fk_obrazovan; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video_saves
    ADD CONSTRAINT obrazovanie_video_sa_video_id_c9289784_fk_obrazovan FOREIGN KEY (video_id) REFERENCES public.obrazovanie_video(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_video_saves obrazovanie_video_saves_user_id_b7303b7b_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video_saves
    ADD CONSTRAINT obrazovanie_video_saves_user_id_b7303b7b_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_video_video_quality obrazovanie_video_vi_video_id_3e3861ea_fk_obrazovan; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video_video_quality
    ADD CONSTRAINT obrazovanie_video_vi_video_id_3e3861ea_fk_obrazovan FOREIGN KEY (video_id) REFERENCES public.obrazovanie_video(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: obrazovanie_video_video_quality obrazovanie_video_vi_videoquality_id_f8194716_fk_obrazovan; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.obrazovanie_video_video_quality
    ADD CONSTRAINT obrazovanie_video_vi_videoquality_id_f8194716_fk_obrazovan FOREIGN KEY (videoquality_id) REFERENCES public.obrazovanie_videoquality(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rating_rating rating_rating_content_type_id_0abe2a32_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.rating_rating
    ADD CONSTRAINT rating_rating_content_type_id_0abe2a32_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rating_rating_likes rating_rating_likes_rating_id_1ea661ac_fk_rating_rating_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.rating_rating_likes
    ADD CONSTRAINT rating_rating_likes_rating_id_1ea661ac_fk_rating_rating_id FOREIGN KEY (rating_id) REFERENCES public.rating_rating(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rating_rating_likes rating_rating_likes_user_id_c9bc633f_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.rating_rating_likes
    ADD CONSTRAINT rating_rating_likes_user_id_c9bc633f_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rating_rating rating_rating_owner_id_7c70caf8_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.rating_rating
    ADD CONSTRAINT rating_rating_owner_id_7c70caf8_fk_user_user_id FOREIGN KEY (owner_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_group_id_c57f13c0_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_group_id_c57f13c0_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_user_id_13f9a20d_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_13f9a20d_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permi_permission_id_ce49d4de_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permi_permission_id_ce49d4de_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_31782f58_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_31782f58_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

