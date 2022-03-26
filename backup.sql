--
-- k_bekdauletQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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
    body text NOT NULL,
    image character varying(100) NOT NULL,
    video character varying(100) NOT NULL,
    reports character varying(100) NOT NULL,
    collected numeric(15,2) NOT NULL,
    necessary numeric(15,2) NOT NULL,
    is_completed boolean NOT NULL,
    description text NOT NULL
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
    content_type_id integer,
    owner_id bigint,
    reply_id bigint,
    object_id integer,
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
    body text NOT NULL,
    image character varying(100) NOT NULL,
    moderated boolean NOT NULL,
    views integer NOT NULL,
    author_id bigint,
    category_id bigint NOT NULL,
    body_kk text NOT NULL,
    preview_text_kk character varying(1500) NOT NULL,
    preview_text_ru character varying(1500) NOT NULL,
    title_kk character varying(500) NOT NULL,
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
    image character varying(100) NOT NULL,
    video character varying(100),
    original_quality bigint,
    views integer NOT NULL,
    convert_status character varying(255) NOT NULL,
    author_id bigint,
    category_id bigint NOT NULL,
    video_name character varying(6250) NOT NULL,
    image_2 character varying(100) NOT NULL,
    youtube character varying(500),
    subs_kk character varying(100) NOT NULL,
    body_kk text NOT NULL,
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
-- Name: quiz_answer; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.quiz_answer (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    answer_text character varying(255) NOT NULL,
    is_right boolean NOT NULL,
    "order" integer NOT NULL,
    question_id bigint NOT NULL,
    CONSTRAINT quiz_answer_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.quiz_answer OWNER TO k_bekdaulet;

--
-- Name: quiz_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.quiz_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quiz_answer_id_seq OWNER TO k_bekdaulet;

--
-- Name: quiz_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.quiz_answer_id_seq OWNED BY public.quiz_answer.id;


--
-- Name: quiz_question; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.quiz_question (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    technique integer NOT NULL,
    title character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    quiz_id bigint NOT NULL
);


ALTER TABLE public.quiz_question OWNER TO k_bekdaulet;

--
-- Name: quiz_question_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.quiz_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quiz_question_id_seq OWNER TO k_bekdaulet;

--
-- Name: quiz_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.quiz_question_id_seq OWNED BY public.quiz_question.id;


--
-- Name: quiz_test; Type: TABLE; Schema: public; Owner: k_bekdaulet
--

CREATE TABLE public.quiz_test (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    lesson_id bigint
);


ALTER TABLE public.quiz_test OWNER TO k_bekdaulet;

--
-- Name: quiz_test_id_seq; Type: SEQUENCE; Schema: public; Owner: k_bekdaulet
--

CREATE SEQUENCE public.quiz_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quiz_test_id_seq OWNER TO k_bekdaulet;

--
-- Name: quiz_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: k_bekdaulet
--

ALTER SEQUENCE public.quiz_test_id_seq OWNED BY public.quiz_test.id;


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
    email character varying(255) NOT NULL,
    name character varying(255),
    birth_date date,
    image character varying(100),
    city character varying(255),
    last_login timestamp with time zone,
    verified boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    description text,
    surname character varying(255),
    user_type integer NOT NULL,
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
-- Name: quiz_answer id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.quiz_answer ALTER COLUMN id SET DEFAULT nextval('public.quiz_answer_id_seq'::regclass);


--
-- Name: quiz_question id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.quiz_question ALTER COLUMN id SET DEFAULT nextval('public.quiz_question_id_seq'::regclass);


--
-- Name: quiz_test id; Type: DEFAULT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.quiz_test ALTER COLUMN id SET DEFAULT nextval('public.quiz_test_id_seq'::regclass);


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
1	Can add log entry	8	add_logentry
2	Can change log entry	8	change_logentry
3	Can delete log entry	8	delete_logentry
4	Can view log entry	8	view_logentry
5	Can add permission	9	add_permission
6	Can change permission	9	change_permission
7	Can delete permission	9	delete_permission
8	Can view permission	9	view_permission
9	Can add group	10	add_group
10	Can change group	10	change_group
11	Can delete group	10	delete_group
12	Can view group	10	view_group
13	Can add content type	1	add_contenttype
14	Can change content type	1	change_contenttype
15	Can delete content type	1	delete_contenttype
16	Can view content type	1	view_contenttype
17	Can add session	11	add_session
18	Can change session	11	change_session
19	Can delete session	11	delete_session
20	Can view session	11	view_session
21	Can add Добро	12	add_dobro
22	Can change Добро	12	change_dobro
23	Can delete Добро	12	delete_dobro
24	Can view Добро	12	view_dobro
25	Can add Категория	2	add_category
26	Can change Категория	2	change_category
27	Can delete Категория	2	delete_category
28	Can view Категория	2	view_category
29	Can add video quality	3	add_videoquality
30	Can change video quality	3	change_videoquality
31	Can delete video quality	3	delete_videoquality
32	Can view video quality	3	view_videoquality
33	Can add Видеролик	4	add_video
34	Can change Видеролик	4	change_video
35	Can delete Видеролик	4	delete_video
36	Can view Видеролик	4	view_video
37	Can add Статья	5	add_report
38	Can change Статья	5	change_report
39	Can delete Статья	5	delete_report
40	Can view Статья	5	view_report
41	Can add Комментарий	6	add_comment
42	Can change Комментарий	6	change_comment
43	Can delete Комментарий	6	delete_comment
44	Can view Комментарий	6	view_comment
45	Can add user	7	add_user
46	Can change user	7	change_user
47	Can delete user	7	delete_user
48	Can view user	7	view_user
49	Can add Поддержка	13	add_contactus
50	Can change Поддержка	13	change_contactus
51	Can delete Поддержка	13	delete_contactus
52	Can view Поддержка	13	view_contactus
53	Can add Вопрос	14	add_question
54	Can change Вопрос	14	change_question
55	Can delete Вопрос	14	delete_question
56	Can view Вопрос	14	view_question
57	Can add crontab	15	add_crontabschedule
58	Can change crontab	15	change_crontabschedule
59	Can delete crontab	15	delete_crontabschedule
60	Can view crontab	15	view_crontabschedule
61	Can add interval	16	add_intervalschedule
62	Can change interval	16	change_intervalschedule
63	Can delete interval	16	delete_intervalschedule
64	Can view interval	16	view_intervalschedule
65	Can add periodic task	17	add_periodictask
66	Can change periodic task	17	change_periodictask
67	Can delete periodic task	17	delete_periodictask
68	Can view periodic task	17	view_periodictask
69	Can add periodic tasks	18	add_periodictasks
70	Can change periodic tasks	18	change_periodictasks
71	Can delete periodic tasks	18	delete_periodictasks
72	Can view periodic tasks	18	view_periodictasks
73	Can add solar event	19	add_solarschedule
74	Can change solar event	19	change_solarschedule
75	Can delete solar event	19	delete_solarschedule
76	Can view solar event	19	view_solarschedule
77	Can add clocked	20	add_clockedschedule
78	Can change clocked	20	change_clockedschedule
79	Can delete clocked	20	delete_clockedschedule
80	Can view clocked	20	view_clockedschedule
81	Can add Лектор	21	add_lector
82	Can change Лектор	21	change_lector
83	Can delete Лектор	21	delete_lector
84	Can view Лектор	21	view_lector
85	Can add Курс	22	add_course
86	Can change Курс	22	change_course
87	Can delete Курс	22	delete_course
88	Can view Курс	22	view_course
89	Can add Урок	23	add_lesson
90	Can change Урок	23	change_lesson
91	Can delete Урок	23	delete_lesson
92	Can view Урок	23	view_lesson
93	Can add Организации	24	add_organization
94	Can change Организации	24	change_organization
95	Can delete Организации	24	delete_organization
96	Can view Организации	24	view_organization
97	Can add Рейтинг	25	add_rating
98	Can change Рейтинг	25	change_rating
99	Can delete Рейтинг	25	delete_rating
100	Can view Рейтинг	25	view_rating
101	Can add Модуль	26	add_lessonmodule
102	Can change Модуль	26	change_lessonmodule
103	Can delete Модуль	26	delete_lessonmodule
104	Can view Модуль	26	view_lessonmodule
105	Can add Ресурс	27	add_resource
106	Can change Ресурс	27	change_resource
107	Can delete Ресурс	27	delete_resource
108	Can view Ресурс	27	view_resource
109	Can add Участник	28	add_participant
110	Can change Участник	28	change_participant
111	Can delete Участник	28	delete_participant
112	Can view Участник	28	view_participant
113	Can add Тест	29	add_test
114	Can change Тест	29	change_test
115	Can delete Тест	29	delete_test
116	Can view Тест	29	view_test
117	Can add Вопрос	30	add_question
118	Can change Вопрос	30	change_question
119	Can delete Вопрос	30	delete_question
120	Can view Вопрос	30	view_question
121	Can add Ответ	31	add_answer
122	Can change Ответ	31	change_answer
123	Can delete Ответ	31	delete_answer
124	Can view Ответ	31	view_answer
\.


--
-- Data for Name: course_course; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.course_course (id, created_at, updated_at, name_kk, name_ru, description_kk, description_ru, to_view, views, image, rating, lesson_count, category_id, organization_id, duriation) FROM stdin;
\.


--
-- Data for Name: course_course_lectors; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.course_course_lectors (id, course_id, lector_id) FROM stdin;
\.


--
-- Data for Name: course_lector; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.course_lector (id, created_at, updated_at, name, surname, description_kk, description_ru, icon) FROM stdin;
\.


--
-- Data for Name: course_lesson; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.course_lesson (id, created_at, updated_at, name_kk, name_ru, description_kk, description_ru, duriation, video, views, course_id, lector_id, "order", score) FROM stdin;
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
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-02-12 18:21:02.136677+00	1	🙏 Ментальное здоровье	1	[{"added": {}}]	2	1
2	2022-02-12 18:21:08.858296+00	2	🌱 Экофилософия	1	[{"added": {}}]	2	1
3	2022-02-12 18:21:15.506643+00	3	💸 Фин.грамотность	1	[{"added": {}}]	2	1
4	2022-02-12 18:21:55.654644+00	4	🧿 Культура	1	[{"added": {}}]	2	1
5	2022-02-12 18:22:23.186835+00	5	❤️ ️Половое воспитание	1	[{"added": {}}]	2	1
6	2022-02-12 18:25:13.428656+00	1	Наруто сражается с Обито	1	[{"added": {}}]	4	1
7	2022-02-12 18:27:12.164474+00	1	Электрокары: что с ними не так?	1	[{"added": {}}]	5	1
8	2022-02-12 18:27:40.578892+00	1	Электрокары: что с ними не так?	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
9	2022-02-12 18:35:26.09457+00	1	beximiliano@gmail.com	2	[{"changed": {"fields": [" ", "Description"]}}]	7	1
42	2022-02-12 18:52:49.611479+00	1	Наруто сражается с Обито	3		4	1
43	2022-02-12 18:54:48.81988+00	2	Наруто сражается с Обито, великая битва шиноби	1	[{"added": {}}]	4	1
44	2022-02-12 19:07:35.645248+00	1	Электрокары: что с ними не так Электрокары: что с ними не так?	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	5	1
45	2022-02-12 19:07:54.351323+00	1	Электрокары: что с ними не так Электрокары: что с ними не так? Электрокары: что с ними не так?	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	5	1
46	2022-02-12 19:09:05.945055+00	1	Электрокары: что с ними не так?	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	5	1
47	2022-02-12 19:20:43.542959+00	2	kazbekov.bekdaulet2000@gmail.com	1	[{"added": {}}]	7	1
48	2022-02-12 19:21:54.130211+00	2	kazbekov.bekdaulet2000@gmail.com	3		7	1
49	2022-02-13 07:27:08.943762+00	2	Все знают, а ты нет: как начать инвестировать?	1	[{"added": {}}]	5	1
50	2022-02-13 07:27:21.042996+00	2	Все знают, а ты нет: как начать инвестировать?	2	[{"changed": {"fields": ["Moderated"]}}]	5	1
51	2022-02-13 09:22:52.665758+00	3	Что такое гедонизм?	1	[{"added": {}}]	4	1
52	2022-02-13 15:56:24.781977+00	4	Танджиро и Незуко против Руи	1	[{"added": {}}]	4	1
53	2022-02-14 08:37:46.328301+00	3	birzhan@gmail.com	1	[{"added": {}}]	7	1
54	2022-02-14 08:43:56.177305+00	3	birzhan@gmail.com	3		7	1
55	2022-02-14 08:47:26.658+00	4	birzhan@gmail.com	2	[{"changed": {"fields": [" "]}}]	7	1
56	2022-02-14 09:46:49.826125+00	1	2022-02-14 18:00:00+06:00	1	[{"added": {}}]	20	1
57	2022-02-14 10:13:59.090021+00	5	Как сортировать мусор?	1	[{"added": {}}]	4	1
58	2022-02-14 10:49:32.85119+00	6	видос для проверки	1	[{"added": {}}]	4	1
59	2022-02-14 10:56:02.05118+00	6	видос для проверки	3		4	1
60	2022-02-14 11:01:19.220588+00	7	тест видос "	1	[{"added": {}}]	4	1
61	2022-02-14 13:44:35.394245+00	8	asd	1	[{"added": {}}]	4	1
62	2022-02-14 13:46:52.135587+00	8	Как создать стартап?	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435", "Body"]}}]	4	1
63	2022-02-14 13:47:08.692289+00	7	тест видос "	3		4	1
64	2022-02-14 20:57:42.533273+00	5	❤️Половое воспитание	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	2	1
65	2022-02-14 20:57:53.661365+00	5	❤️ Половое воспитание	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	2	1
66	2022-02-15 06:33:47.052564+00	9	тест	1	[{"added": {}}]	4	1
67	2022-02-15 06:34:42.242956+00	3	Что такое гедонизм?	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0432\\u0438\\u0434\\u0435\\u043e \\u0441 \\u0440\\u0430\\u0441\\u0448\\u0438\\u0440\\u0435\\u043d\\u0438\\u0435\\u043c)"]}}]	4	1
68	2022-02-15 06:34:57.769629+00	4	Танджиро и Незуко против Руи	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0432\\u0438\\u0434\\u0435\\u043e \\u0441 \\u0440\\u0430\\u0441\\u0448\\u0438\\u0440\\u0435\\u043d\\u0438\\u0435\\u043c)"]}}]	4	1
69	2022-02-15 06:35:08.597139+00	2	Наруто сражается с Обито, великая битва шиноби	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0432\\u0438\\u0434\\u0435\\u043e \\u0441 \\u0440\\u0430\\u0441\\u0448\\u0438\\u0440\\u0435\\u043d\\u0438\\u0435\\u043c)"]}}]	4	1
70	2022-02-15 06:35:18.683299+00	5	Как сортировать мусор?	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0432\\u0438\\u0434\\u0435\\u043e \\u0441 \\u0440\\u0430\\u0441\\u0448\\u0438\\u0440\\u0435\\u043d\\u0438\\u0435\\u043c)"]}}]	4	1
71	2022-02-15 06:35:30.195509+00	8	Как создать стартап?	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0432\\u0438\\u0434\\u0435\\u043e \\u0441 \\u0440\\u0430\\u0441\\u0448\\u0438\\u0440\\u0435\\u043d\\u0438\\u0435\\u043c)"]}}]	4	1
72	2022-02-15 06:40:06.518135+00	9	тест	2	[]	4	1
73	2022-02-15 06:45:31.549799+00	9	тест	3		4	1
74	2022-02-15 06:46:05.244312+00	10	тест	1	[{"added": {}}]	4	1
75	2022-02-15 06:51:59.03507+00	11	тест 2	1	[{"added": {}}]	4	1
76	2022-02-15 07:48:26.480251+00	11	тест 2	2	[{"changed": {"fields": ["Body", "\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0432\\u0438\\u0434\\u0435\\u043e \\u0441 \\u0440\\u0430\\u0441\\u0448\\u0438\\u0440\\u0435\\u043d\\u0438\\u0435\\u043c)"]}}]	4	1
77	2022-02-15 07:49:47.815059+00	10	тест	3		4	1
78	2022-02-15 08:18:01.616134+00	12	тест 3	1	[{"added": {}}]	4	1
79	2022-02-15 08:38:27.521631+00	13	Q&A Moldir Matzhanova	1	[{"added": {}}]	4	1
80	2022-02-15 08:43:33.397365+00	13	Q&A Moldir Matzhanova	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
81	2022-02-15 08:50:05.904342+00	13	Q&A Moldir Matzhanova	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
82	2022-02-15 09:48:05.016501+00	3	«Я получил эту работу обманом»	1	[{"added": {}}]	5	1
83	2022-02-15 09:49:01.764285+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Moderated"]}}]	5	1
84	2022-02-15 10:38:47.202254+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
85	2022-02-15 10:39:29.422561+00	11	тест 2	3		4	1
86	2022-02-15 10:39:29.425721+00	12	тест 3	3		4	1
409	2022-03-02 04:37:31.433202+00	37	Q&A Nagimuwa	2	[{"changed": {"fields": ["Body"]}}]	4	1
87	2022-02-15 10:40:12.719006+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
88	2022-02-15 10:41:47.773156+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
89	2022-02-15 10:41:58.857051+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
90	2022-02-15 10:43:51.775431+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
91	2022-02-15 10:45:17.889021+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
92	2022-02-15 10:45:47.39902+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
93	2022-02-15 10:46:12.279766+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
94	2022-02-15 10:48:23.774791+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
95	2022-02-15 10:50:29.888313+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
96	2022-02-15 10:51:43.033556+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
97	2022-02-15 10:51:51.524465+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
98	2022-02-15 10:52:30.818353+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
99	2022-02-15 10:55:43.78776+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
100	2022-02-15 11:00:41.913213+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
101	2022-02-15 11:01:31.729902+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
102	2022-02-15 11:06:06.039829+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
103	2022-02-15 11:06:32.147243+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
104	2022-02-15 11:07:18.9578+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
105	2022-02-15 11:09:16.658094+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
106	2022-02-15 11:09:55.329493+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
107	2022-02-15 11:15:19.791444+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
108	2022-02-15 11:15:43.331191+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
109	2022-02-15 11:18:07.283642+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
110	2022-02-15 11:19:15.086611+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
111	2022-02-15 11:21:40.608742+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
112	2022-02-15 11:22:22.34194+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
113	2022-02-15 11:23:14.265651+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
114	2022-02-15 11:23:45.466839+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
115	2022-02-15 11:25:17.052317+00	2	Все знают, а ты нет: как начать инвестировать?	2	[{"changed": {"fields": ["Body"]}}]	5	1
116	2022-02-15 11:31:37.525825+00	2	Все знают, а ты нет: как начать инвестировать?	2	[{"changed": {"fields": ["Body"]}}]	5	1
117	2022-02-15 11:32:43.684058+00	2	Все знают, а ты нет: как начать инвестировать?	2	[{"changed": {"fields": ["Body"]}}]	5	1
118	2022-02-15 11:33:48.075436+00	2	Все знают, а ты нет: как начать инвестировать?	2	[{"changed": {"fields": ["Body"]}}]	5	1
119	2022-02-15 11:35:25.470338+00	2	Все знают, а ты нет: как начать инвестировать?	2	[{"changed": {"fields": ["Body"]}}]	5	1
120	2022-02-15 11:36:14.858366+00	2	Все знают, а ты нет: как начать инвестировать?	2	[{"changed": {"fields": ["Body"]}}]	5	1
121	2022-02-15 11:36:48.990783+00	2	Все знают, а ты нет: как начать инвестировать?	2	[{"changed": {"fields": ["Body"]}}]	5	1
122	2022-02-15 11:52:05.134818+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	1	[{"added": {}}]	5	1
123	2022-02-15 11:52:56.687853+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	2	[{"changed": {"fields": ["Body"]}}]	5	1
124	2022-02-15 12:02:17.980794+00	6	Что я только что посмотрел? Признаки арт-хауса. Как понять кино. На примере “Черный-черный человек”	1	[{"added": {}}]	5	1
125	2022-02-15 12:03:49.042535+00	6	Что я только что посмотрел? Признаки арт-хауса. Как понять кино. На примере “Черный-черный человек”	2	[{"changed": {"fields": ["Body"]}}]	5	1
126	2022-02-15 12:04:38.391499+00	6	Что я только что посмотрел? Признаки арт-хауса. Как понять кино. На примере “Черный-черный человек”	2	[{"changed": {"fields": ["Body"]}}]	5	1
127	2022-02-15 12:14:27.456661+00	7	Спорить бесполезно: The Backfire Effect	1	[{"added": {}}]	5	1
128	2022-02-15 12:15:33.374537+00	7	Спорить бесполезно: The Backfire Effect	2	[{"changed": {"fields": ["Body"]}}]	5	1
129	2022-02-15 12:22:11.700608+00	8	Почерневшие бананы нам не враги	1	[{"added": {}}]	5	1
130	2022-02-15 12:22:55.1094+00	7	Спорить бесполезно: The Backfire Effect	2	[{"changed": {"fields": ["Body"]}}]	5	1
131	2022-02-15 12:24:17.417068+00	8	Почерневшие бананы нам не враги	2	[{"changed": {"fields": ["Body"]}}]	5	1
132	2022-02-15 12:25:04.220136+00	8	Почерневшие бананы нам не враги	2	[{"changed": {"fields": ["Body"]}}]	5	1
133	2022-02-15 12:27:43.061618+00	8	Почерневшие бананы нам не враги	2	[{"changed": {"fields": ["Body"]}}]	5	1
134	2022-02-15 12:28:14.216706+00	7	Спорить бесполезно: The Backfire Effect	2	[{"changed": {"fields": ["Body"]}}]	5	1
135	2022-02-15 12:28:37.425046+00	7	Спорить бесполезно: The Backfire Effect	2	[{"changed": {"fields": ["Body"]}}]	5	1
136	2022-02-16 04:51:51.771527+00	2	Все знают, а ты нет: как начать инвестировать?	2	[{"changed": {"fields": ["Body", "\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f"]}}]	5	1
137	2022-02-16 06:02:33.963895+00	1	Электрокары: что с ними не так?	2	[{"changed": {"fields": ["Body"]}}]	5	1
138	2022-02-16 06:41:14.103742+00	1	Электрокары: что с ними не так?	2	[{"changed": {"fields": ["Body"]}}]	5	1
139	2022-02-16 06:42:13.449519+00	1	Электрокары: что с ними не так?	2	[{"changed": {"fields": ["Body"]}}]	5	1
140	2022-02-16 06:44:40.840704+00	1	Электрокары: что с ними не так?	2	[{"changed": {"fields": ["Body"]}}]	5	1
141	2022-02-16 06:45:49.975265+00	1	Электрокары: что с ними не так?	2	[{"changed": {"fields": ["Body"]}}]	5	1
142	2022-02-16 06:46:14.207754+00	1	Электрокары: что с ними не так?	2	[{"changed": {"fields": ["Body"]}}]	5	1
143	2022-02-16 06:47:50.309341+00	1	Электрокары: что с ними не так?	2	[{"changed": {"fields": ["Body"]}}]	5	1
144	2022-02-16 06:50:48.681384+00	1	Электрокары: что с ними не так?	2	[{"changed": {"fields": ["Body"]}}]	5	1
145	2022-02-16 06:54:16.408255+00	1	Электрокары: что с ними не так?	2	[{"changed": {"fields": ["Body"]}}]	5	1
146	2022-02-16 07:03:03.611934+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	1	[{"added": {}}]	5	1
147	2022-02-16 10:06:16.118578+00	1	Что такое Garyshker?	1	[{"added": {}}]	14	1
148	2022-02-16 10:09:00.544611+00	1	Что такое Garyshker?	2	[{"changed": {"fields": ["\\u041e\\u0442\\u0432\\u0435\\u0442"]}}]	14	1
149	2022-02-16 10:09:07.090062+00	1	Что такое Garyshker?	2	[{"changed": {"fields": ["\\u041e\\u0442\\u0432\\u0435\\u0442"]}}]	14	1
150	2022-02-16 10:09:31.722098+00	1	Что такое Garyshker?	2	[]	14	1
151	2022-02-16 10:21:17.432613+00	1	Что такое Garyshker?	2	[{"changed": {"fields": ["\\u041e\\u0442\\u0432\\u0435\\u0442"]}}]	14	1
152	2022-02-16 10:30:08.012241+00	2	Что такое Образование?	1	[{"added": {}}]	14	1
153	2022-02-16 10:30:27.330638+00	3	Почему бесплатно и зачем вам это?	1	[{"added": {}}]	14	1
154	2022-02-16 10:30:49.286667+00	4	Для чего нужна платформа?	1	[{"added": {}}]	14	1
155	2022-02-16 10:31:28.802314+00	5	Можно ли предлагать свои идеи/контент?	1	[{"added": {}}]	14	1
156	2022-02-16 11:00:22.57315+00	13	Q&A Moldir Matzhanova	3		4	1
157	2022-02-16 11:38:00.880701+00	14	Вопрос - ответ	1	[{"added": {}}]	4	1
158	2022-02-18 07:57:25.780868+00	6	kazbekov.bekdaulet2000@gmail.com	2	[{"changed": {"fields": ["Description"]}}]	7	1
159	2022-02-18 08:55:16.72311+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
160	2022-02-18 09:04:34.018132+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
161	2022-02-18 09:05:35.433108+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
162	2022-02-18 09:08:36.616632+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
163	2022-02-18 09:12:09.796759+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
164	2022-02-18 09:19:35.910924+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
165	2022-02-18 09:21:03.451909+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
166	2022-02-18 09:21:51.175595+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
167	2022-02-18 09:46:30.261023+00	13	Как выбирать курсы?	1	[{"added": {}}]	5	1
168	2022-02-18 09:47:41.333407+00	13	Как выбирать курсы?	2	[{"changed": {"fields": ["Body"]}}]	5	1
169	2022-02-18 09:56:40.654026+00	14	Как Выбрать Своего Психолога	1	[{"added": {}}]	5	1
170	2022-02-18 09:57:18.772428+00	14	Как выбрать своего психолога	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	5	1
171	2022-02-18 10:36:40.823158+00	15	Мифы о ЗППП	1	[{"added": {}}]	5	1
172	2022-02-18 10:43:34.591139+00	1	Электрокары: что с ними не так?	2	[]	5	1
173	2022-02-18 11:00:36.937728+00	16	Наш шанс: Для достижения более «справедливого и пригодного для жизни» будущего	1	[{"added": {}}]	5	1
174	2022-02-18 11:07:06.37143+00	17	Личный опыт психотерапии	1	[{"added": {}}]	5	1
175	2022-02-18 11:13:14.272512+00	18	Вы бы купили свежие овощи в магазине, зная, что у продавца — ВИЧ?	1	[{"added": {}}]	5	1
176	2022-02-18 19:11:13.301595+00	4	Танджиро и Незуко против Руи	2	[{"changed": {"fields": ["Body"]}}]	4	1
177	2022-02-19 13:46:48.339084+00	6	kazbekov.bekdaulet2000@gmail.com	2	[{"changed": {"fields": [" "]}}]	7	1
178	2022-02-20 17:29:33.325879+00	15	тест	1	[{"added": {}}]	4	1
179	2022-02-20 17:35:38.498505+00	7	bonlyoone@gmail.com	3		7	1
180	2022-02-20 17:52:15.414218+00	16	тест 2	1	[{"added": {}}]	4	1
181	2022-02-20 17:52:40.881082+00	15	тест	3		4	1
182	2022-02-20 17:52:40.883474+00	16	тест 2	3		4	1
183	2022-02-20 18:22:12.686309+00	12	bonlyoone@gmail.com	3		7	1
184	2022-02-21 06:50:52.747631+00	13	bonlyoone3@gmail.com	2	[{"changed": {"fields": ["Email address"]}}]	7	1
185	2022-02-21 07:39:04.867173+00	15	bonlyoone@gmail.com	2	[{"changed": {"fields": ["Birth date", "User type"]}}]	7	1
186	2022-02-21 12:07:04.933025+00	17	Подкаст экология	1	[{"added": {}}]	4	1
187	2022-02-21 13:06:09.720727+00	17	Подкаст экология	3		4	1
188	2022-02-21 13:12:22.434106+00	5	Как сортировать мусор?	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
538	2022-03-06 12:51:55.016746+00	61	привет	3		6	1
189	2022-02-21 13:12:31.969119+00	5	Как сортировать мусор?	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
190	2022-02-21 13:26:54.853203+00	18	Шапалак	1	[{"added": {}}]	4	1
191	2022-02-22 04:39:46.675203+00	8	Как создать стартап?	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
192	2022-02-22 04:40:06.676295+00	8	Как создать стартап?	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
193	2022-02-22 05:23:22.387737+00	18	Шапалак	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
194	2022-02-22 05:24:48.760224+00	18	Казахстанская сатира о жизни	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435", "Body", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
195	2022-02-22 05:25:05.492359+00	14	Q&A Moldir Matzhanova	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
196	2022-02-22 05:25:12.474483+00	14	Q&A Moldir Matzhanova	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
197	2022-02-22 05:25:21.15974+00	14	Q&A Moldir Matzhanova	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
198	2022-02-22 05:26:22.316577+00	8	Стартапы в Казахстане: как создать и развивать	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435", "Body", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
199	2022-02-22 05:26:38.803382+00	8	Стартапы в Казахстане: как создать и развивать	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f"]}}]	4	1
200	2022-02-22 05:38:50.229997+00	8	Стартапы в Казахстане: как создать и развивать	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
201	2022-02-22 05:39:04.762697+00	8	Стартапы в Казахстане: как создать и развивать	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
202	2022-02-22 05:58:14.790624+00	8	Стартапы в Казахстане: как создать и развивать	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
203	2022-02-22 05:58:31.200146+00	8	Стартапы в Казахстане: как создать и развивать	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
204	2022-02-22 06:06:57.3227+00	18	Казахстанская сатира о жизни	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
205	2022-02-22 06:07:08.413641+00	18	Казахстанская сатира о жизни	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
206	2022-02-22 06:11:30.394609+00	14	Q&A Moldir Matzhanova	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
207	2022-02-22 06:11:48.330166+00	14	Q&A Moldir Matzhanova	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
208	2022-02-22 08:10:46.731503+00	19	Как копить деньги?	1	[{"added": {}}]	4	1
209	2022-02-22 08:14:54.346249+00	14	Q&A Moldir Matzhanova	2	[{"changed": {"fields": ["Author"]}}]	4	1
210	2022-02-22 08:15:01.489611+00	18	Казахстанская сатира о жизни	2	[{"changed": {"fields": ["Author"]}}]	4	1
211	2022-02-22 08:15:08.761129+00	5	Как сортировать мусор?	2	[{"changed": {"fields": ["Author"]}}]	4	1
212	2022-02-22 08:15:23.848429+00	8	Стартапы в Казахстане: как создать и развивать	2	[{"changed": {"fields": ["Author"]}}]	4	1
213	2022-02-22 08:31:45.530988+00	19	Как начать копить деньги?	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435", "Body"]}}]	4	1
214	2022-02-22 08:35:29.514604+00	20	Q&A Arman Yussupov	1	[{"added": {}}]	4	1
215	2022-02-22 09:01:09.131994+00	21	masterclass	1	[{"added": {}}]	4	1
216	2022-02-22 09:05:28.737673+00	21	Знаки на пластике	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435", "Body"]}}]	4	1
217	2022-02-22 09:07:28.522831+00	21	Знаки на пластике	3		4	1
218	2022-02-22 09:36:49.223322+00	22	Q&A Askar Illyasov	1	[{"added": {}}]	4	1
219	2022-02-23 04:47:20.388149+00	22	Q&A Askar Illyasov	2	[{"changed": {"fields": ["Body"]}}]	4	1
220	2022-02-23 04:57:46.926454+00	23	подкаст половое воспитание	1	[{"added": {}}]	4	1
221	2022-02-23 05:01:59.086992+00	23	Знать можно предотвратить  Знать нельзя допускать	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435", "Body"]}}]	4	1
222	2022-02-23 05:02:37.370743+00	23	Знать можно предотвратить.  Знать нельзя допускать.	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
223	2022-02-23 05:38:04.863727+00	18	akmaralintrovert@gmail.com	2	[{"changed": {"fields": ["Email address"]}}]	7	1
224	2022-02-23 05:39:41.337095+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Author"]}}]	5	1
225	2022-02-23 05:58:05.105666+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Author"]}}]	5	1
226	2022-02-23 05:59:31.277702+00	23	Знать можно предотвратить. Знать нельзя допускать.	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435", "Body"]}}]	4	1
227	2022-02-23 07:13:01.656652+00	24	Кино и творческие люди	1	[{"added": {}}]	4	1
228	2022-02-23 07:17:47.425225+00	14	Q&A Moldir Matzhanova	2	[]	4	1
229	2022-02-23 07:51:20.532206+00	2	Все знают, а ты нет: как начать инвестировать?	2	[{"changed": {"fields": ["Author"]}}]	5	1
230	2022-02-23 07:51:49.687538+00	18	Вы бы купили свежие овощи в магазине, зная, что у продавца — ВИЧ?	2	[{"changed": {"fields": ["Author"]}}]	5	1
231	2022-02-23 07:54:09.519837+00	13	Как выбирать курсы?	2	[{"changed": {"fields": ["Author"]}}]	5	1
232	2022-02-23 07:56:21.09316+00	14	Как выбрать своего психолога	2	[{"changed": {"fields": ["Author"]}}]	5	1
233	2022-02-23 07:56:30.775023+00	17	Личный опыт психотерапии	2	[{"changed": {"fields": ["Author"]}}]	5	1
234	2022-02-23 07:56:44.12679+00	15	Мифы о ЗППП	2	[{"changed": {"fields": ["Author"]}}]	5	1
235	2022-02-23 07:57:04.287101+00	16	Наш шанс: Для достижения более «справедливого и пригодного для жизни» будущего	2	[{"changed": {"fields": ["Author"]}}]	5	1
236	2022-02-23 07:57:19.914291+00	8	Почерневшие бананы нам не враги	2	[{"changed": {"fields": ["Author"]}}]	5	1
237	2022-02-23 07:57:34.470005+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	2	[{"changed": {"fields": ["Author"]}}]	5	1
238	2022-02-23 07:57:51.65049+00	7	Спорить бесполезно: The Backfire Effect	2	[{"changed": {"fields": ["Author"]}}]	5	1
239	2022-02-23 07:58:24.876284+00	6	Что я только что посмотрел? Признаки арт-хауса. Как понять кино. На примере “Черный-черный человек”	2	[{"changed": {"fields": ["Body", "Author"]}}]	5	1
240	2022-02-23 07:58:36.146753+00	1	Электрокары: что с ними не так?	2	[{"changed": {"fields": ["Author"]}}]	5	1
241	2022-02-23 08:06:05.053769+00	19	Бумажные стаканчики — супергерои или антагонисты?	1	[{"added": {}}]	5	1
242	2022-02-23 08:14:11.073968+00	20	Ваш родитель: ангел или демон?	1	[{"added": {}}]	5	1
243	2022-02-23 08:18:36.626295+00	22	Половое воспитание - не только про секс	1	[{"added": {}}]	5	1
244	2022-02-23 08:19:20.612882+00	22	Половое воспитание - не только про секс	2	[{"changed": {"fields": ["Body"]}}]	5	1
245	2022-02-23 08:23:43.626384+00	22	Половое воспитание - не только про секс	2	[{"changed": {"fields": ["Body"]}}]	5	1
246	2022-02-23 09:13:39.901643+00	25	Горная жизнь. Как правильно готовиться к походу?	1	[{"added": {}}]	4	1
247	2022-02-23 10:08:09.307183+00	23	10 вступительных вопросов, которые задают психотерапевты	1	[{"added": {}}]	5	1
248	2022-02-23 10:09:18.794744+00	20	Q&A Arman Yussupov	2	[]	4	1
249	2022-02-23 10:09:29.429518+00	25	Горная жизнь. Как правильно готовиться к походу?	2	[]	4	1
250	2022-02-23 10:14:14.29005+00	2	Наруто сражается с Обито, великая битва шиноби	3		4	1
251	2022-02-23 10:14:14.292743+00	4	Танджиро и Незуко против Руи	3		4	1
252	2022-02-23 10:14:14.294264+00	3	Что такое гедонизм?	3		4	1
253	2022-02-23 10:21:15.689897+00	23	10 вступительных вопросов, которые задают психотерапевты	2	[{"changed": {"fields": ["Body"]}}]	5	1
254	2022-02-23 10:22:25.829776+00	23	10 вступительных вопросов, которые задают психотерапевты	2	[{"changed": {"fields": ["Body"]}}]	5	1
255	2022-02-23 10:24:22.376062+00	22	Половое воспитание - не только про секс	2	[{"changed": {"fields": ["Body"]}}]	5	1
256	2022-02-23 10:25:23.895574+00	20	Ваш родитель: ангел или демон?	2	[{"changed": {"fields": ["Body"]}}]	5	1
257	2022-02-23 10:29:13.017482+00	19	Бумажные стаканчики — супергерои или антагонисты?	2	[{"changed": {"fields": ["Body"]}}]	5	1
258	2022-02-23 10:40:55.211603+00	25	Горная жизнь. Как правильно готовиться к походу?	2	[]	4	1
259	2022-02-23 10:45:28.28912+00	1	Электрокары: что с ними не так?	2	[{"changed": {"fields": ["Body"]}}]	5	1
260	2022-02-23 10:59:32.684867+00	6	Что я только что посмотрел? Признаки арт-хауса. Как понять кино. На примере “Черный-черный человек”	2	[{"changed": {"fields": ["Body"]}}]	5	1
261	2022-02-23 11:04:12.716536+00	6	Что я только что посмотрел? Признаки арт-хауса. Как понять кино. На примере “Черный-черный человек”	2	[{"changed": {"fields": ["Body"]}}]	5	1
262	2022-02-23 11:04:54.909039+00	6	Что я только что посмотрел? Признаки арт-хауса. Как понять кино. На примере “Черный-черный человек”	2	[{"changed": {"fields": ["Body"]}}]	5	1
263	2022-02-23 11:05:50.385314+00	6	Что я только что посмотрел? Признаки арт-хауса. Как понять кино. На примере “Черный-черный человек”	2	[{"changed": {"fields": ["Body"]}}]	5	1
264	2022-02-23 11:11:29.589119+00	6	Что я только что посмотрел? Признаки арт-хауса. Как понять кино. На примере “Черный-черный человек”	2	[{"changed": {"fields": ["Body"]}}]	5	1
265	2022-02-23 11:12:15.991676+00	6	Что я только что посмотрел? Признаки арт-хауса. Как понять кино. На примере “Черный-черный человек”	2	[{"changed": {"fields": ["Body"]}}]	5	1
266	2022-02-23 11:22:25.019716+00	7	Спорить бесполезно: The Backfire Effect	2	[{"changed": {"fields": ["Body"]}}]	5	1
267	2022-02-23 11:30:35.939488+00	7	Спорить бесполезно: The Backfire Effect	2	[{"changed": {"fields": ["Body"]}}]	5	1
268	2022-02-23 11:32:41.919041+00	25	Горная жизнь. Как правильно готовиться к походу?	2	[]	4	1
269	2022-02-23 11:34:52.656879+00	7	Спорить бесполезно: The Backfire Effect	2	[{"changed": {"fields": ["Body"]}}]	5	1
270	2022-02-23 11:35:39.826411+00	7	Спорить бесполезно: The Backfire Effect	2	[]	5	1
271	2022-02-23 11:56:49.822059+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	2	[{"changed": {"fields": ["Body"]}}]	5	1
272	2022-02-23 11:58:13.737494+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	2	[{"changed": {"fields": ["Body"]}}]	5	1
273	2022-02-23 11:58:45.682994+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	2	[{"changed": {"fields": ["Body"]}}]	5	1
274	2022-02-23 11:59:38.849005+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	2	[{"changed": {"fields": ["Body"]}}]	5	1
275	2022-02-23 12:02:15.994977+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	2	[{"changed": {"fields": ["Body"]}}]	5	1
276	2022-02-23 12:08:40.682025+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	2	[{"changed": {"fields": ["Body"]}}]	5	1
277	2022-02-23 12:14:06.886306+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	2	[{"changed": {"fields": ["Body"]}}]	5	1
278	2022-02-23 12:18:03.731336+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	2	[{"changed": {"fields": ["Body"]}}]	5	1
279	2022-02-23 12:18:51.853996+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	2	[{"changed": {"fields": ["Body"]}}]	5	1
280	2022-02-23 12:21:06.206565+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	2	[{"changed": {"fields": ["Body"]}}]	5	1
281	2022-02-23 12:22:37.160568+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
282	2022-02-23 12:22:52.351189+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
283	2022-02-23 12:27:41.391553+00	8	Почерневшие бананы нам не враги	2	[{"changed": {"fields": ["Body"]}}]	5	1
284	2022-02-23 12:29:28.360612+00	8	Почерневшие бананы нам не враги	2	[]	5	1
285	2022-02-23 12:30:03.59244+00	8	Почерневшие бананы нам не враги	2	[{"changed": {"fields": ["Body"]}}]	5	1
286	2022-02-23 12:34:04.093025+00	26	Про осознанное потребление, сортировку и KWR	1	[{"added": {}}]	4	1
287	2022-02-23 12:37:49.680466+00	27	Ложные эко-друзья	1	[{"added": {}}]	4	1
288	2022-02-23 12:40:02.316931+00	28	Q&A Asselina	1	[{"added": {}}]	4	1
289	2022-02-23 12:41:04.100494+00	29	Уходи, осенняя хандра!	1	[{"added": {}}]	4	1
290	2022-02-23 12:42:26.298623+00	30	Жизнь на карантине глазами коуча	1	[{"added": {}}]	4	1
291	2022-02-23 12:43:44.555516+00	31	Презервативы : как покупать, проверять и использовать?	1	[{"added": {}}]	4	1
292	2022-02-23 12:44:34.498063+00	32	Половое воспитание - не только про секс	1	[{"added": {}}]	4	1
293	2022-02-23 12:45:38.18228+00	33	Как управлять личными финансами?	1	[{"added": {}}]	4	1
294	2022-02-23 14:47:19.201765+00	32	Половое воспитание	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
295	2022-02-23 14:48:12.160594+00	32	Половое воспитание	2	[]	4	1
296	2022-02-23 14:58:02.438258+00	8	Почерневшие бананы нам не враги	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
297	2022-02-23 14:58:53.68954+00	8	Почерневшие бананы нам не враги	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
298	2022-02-23 15:00:58.589399+00	7	Спорить бесполезно: The Backfire Effect	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
299	2022-02-23 15:03:34.844306+00	7	Спорить бесполезно: The Backfire Effect	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
300	2022-02-23 15:06:17.797776+00	7	Спорить бесполезно: The Backfire Effect	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
301	2022-02-23 15:06:34.269443+00	7	Спорить бесполезно: The Backfire Effect	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
302	2022-02-23 15:13:38.027022+00	22	Половое воспитание - не только про секс	2	[{"changed": {"fields": ["Body"]}}]	5	1
303	2022-02-23 15:20:04.406196+00	22	Половое воспитание - не только про секс	2	[{"changed": {"fields": ["Body"]}}]	5	1
304	2022-02-23 15:32:16.1364+00	22	Половое воспитание - не только про секс	2	[{"changed": {"fields": ["Body"]}}]	5	1
305	2022-02-23 15:33:22.263065+00	22	Половое воспитание - не только про секс	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
306	2022-02-23 15:37:15.612223+00	22	Половое воспитание - не только про секс	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
307	2022-02-23 15:51:23.23+00	16	Наш шанс: Для достижения более «справедливого и пригодного для жизни» будущего	2	[{"changed": {"fields": ["Body"]}}]	5	1
308	2022-02-23 15:56:01.505238+00	16	Наш шанс: Для достижения более «справедливого и пригодного для жизни» будущего	2	[{"changed": {"fields": ["Body"]}}]	5	1
309	2022-02-23 15:58:47.72112+00	15	Мифы о ЗППП	2	[{"changed": {"fields": ["Body"]}}]	5	1
310	2022-02-23 16:01:43.740248+00	15	Мифы о ЗППП	2	[{"changed": {"fields": ["Body"]}}]	5	1
311	2022-02-23 16:02:52.391924+00	15	Мифы о ЗППП	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
312	2022-02-23 16:12:12.21776+00	15	Мифы о ЗППП	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
313	2022-02-23 16:13:50.085418+00	15	Мифы о ЗППП	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
314	2022-02-23 16:14:19.981304+00	15	Мифы о ЗППП	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
315	2022-02-23 16:24:22.864779+00	17	Личный опыт психотерапии	2	[{"changed": {"fields": ["Body"]}}]	5	1
316	2022-02-23 16:24:58.447009+00	17	Личный опыт психотерапии	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
317	2022-02-23 16:25:16.815+00	17	Личный опыт психотерапии	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
318	2022-02-23 16:28:37.606666+00	14	Как выбрать своего психолога	2	[{"changed": {"fields": ["Body"]}}]	5	1
319	2022-02-23 16:30:06.897065+00	14	Как выбрать своего психолога	2	[{"changed": {"fields": ["Body", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
320	2022-02-23 16:31:55.960168+00	14	Как выбрать своего психолога	2	[{"changed": {"fields": ["Body"]}}]	5	1
321	2022-02-23 16:33:53.513062+00	14	Как выбрать своего психолога	2	[{"changed": {"fields": ["Body", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
322	2022-02-23 16:34:44.133243+00	13	Как выбирать курсы?	3		5	1
323	2022-02-23 16:38:52.701095+00	18	Вы бы купили свежие овощи в магазине, зная, что у продавца — ВИЧ?	2	[{"changed": {"fields": ["Body"]}}]	5	1
324	2022-02-23 16:39:46.6339+00	18	Вы бы купили свежие овощи в магазине, зная, что у продавца — ВИЧ?	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
539	2022-03-06 12:51:55.018287+00	60	asdfasfsa	3		6	1
325	2022-02-23 16:40:12.845179+00	18	Вы бы купили свежие овощи в магазине, зная, что у продавца — ВИЧ?	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
326	2022-02-23 16:43:24.814229+00	20	Ваш родитель: ангел или демон?	2	[{"changed": {"fields": ["Body", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
327	2022-02-23 16:49:09.129172+00	20	Ваш родитель: ангел или демон?	2	[{"changed": {"fields": ["Body", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
328	2022-02-23 16:52:06.432087+00	19	Бумажные стаканчики — супергерои или антагонисты?	2	[{"changed": {"fields": ["Body"]}}]	5	1
329	2022-02-23 17:10:26.366556+00	19	Бумажные стаканчики — супергерои или антагонисты?	2	[{"changed": {"fields": ["Body", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
330	2022-02-23 17:10:46.402883+00	19	Бумажные стаканчики — супергерои или антагонисты?	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
331	2022-02-23 17:13:03.994977+00	19	Бумажные стаканчики — супергерои или антагонисты?	2	[{"changed": {"fields": ["Body"]}}]	5	1
332	2022-02-23 17:15:00.514155+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
333	2022-02-23 17:18:33.866361+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
334	2022-02-23 17:20:51.911144+00	20	Ваш родитель: ангел или демон?	2	[{"changed": {"fields": ["Body"]}}]	5	1
335	2022-02-23 17:24:30.465085+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
336	2022-02-23 17:26:21.644128+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
337	2022-02-23 17:27:47.786061+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
338	2022-02-23 17:30:11.281081+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
339	2022-02-23 17:35:29.72771+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
340	2022-02-23 17:41:18.724583+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
341	2022-02-23 17:43:02.550993+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
342	2022-02-23 17:48:33.314346+00	23	10 вступительных вопросов, которые задают психотерапевты	2	[{"changed": {"fields": ["Body"]}}]	5	1
343	2022-02-23 17:48:43.769954+00	23	10 вступительных вопросов, которые задают психотерапевты	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
344	2022-02-23 17:48:58.225937+00	23	10 вступительных вопросов, которые задают психотерапевты	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
345	2022-02-24 04:52:15.200005+00	20	Q&A Arman Yussupov	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
346	2022-02-24 04:55:09.798878+00	20	Q&A Arman Yussupov	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
347	2022-02-24 05:07:47.791204+00	20	Q&A Arman Yussupov	2	[{"changed": {"fields": ["Body", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
348	2022-02-24 05:14:48.433037+00	14	Q&A Moldir Matzhanova	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
349	2022-02-24 05:14:56.6722+00	20	Q&A Arman Yussupov	2	[]	4	1
350	2022-02-24 05:15:22.981167+00	14	Q&A Moldir Matzhanova	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
351	2022-02-24 05:27:00.584548+00	14	Q&A Moldir Matzhanova	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
352	2022-02-24 05:29:48.578085+00	14	Q&A Moldir Matzhanova	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
353	2022-02-24 07:47:56.65793+00	5	Проживаем целые сутки как Мураками: о режиме дня наглядно	2	[{"changed": {"fields": ["Body"]}}]	5	1
354	2022-02-24 10:22:46.2794+00	31	Презервативы: как покупать, проверять и использовать?	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
355	2022-02-24 10:23:00.10495+00	20	Q&A Arman Yussupov	2	[]	4	1
356	2022-02-24 10:37:52.182649+00	2	Все знают, а ты нет: как начать инвестировать?	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
357	2022-02-24 10:38:05.319011+00	2	Все знают, а ты нет: как начать инвестировать?	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	5	1
358	2022-02-24 10:42:01.006136+00	2	Все знают, а ты нет: как начать инвестировать?	2	[{"changed": {"fields": ["Body"]}}]	5	1
359	2022-02-25 04:28:41.367706+00	20	Q&A Arman Yussupov	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
360	2022-02-25 04:32:23.363903+00	20	Q&A Arman Yussupov	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
361	2022-02-25 04:35:05.283569+00	20	Q&A Arman Yussupov	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
362	2022-02-25 04:38:07.749659+00	20	Q&A Arman Yussupov	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
363	2022-02-25 04:43:22.77902+00	28	Q&A Asselina	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
364	2022-02-25 04:53:35.95335+00	22	Q&A Askar Illyasov	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
365	2022-02-25 05:04:48.058958+00	22	Q&A Askar Illyasov	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
366	2022-02-25 05:09:24.542974+00	28	Q&A Asselina	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
367	2022-02-25 05:09:43.218735+00	28	Q&A Asselina	2	[]	4	1
368	2022-02-25 05:19:36.406482+00	20	Q&A Arman Yussupov	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
369	2022-02-25 05:48:31.225383+00	34	Про экологию простым языком	1	[{"added": {}}]	4	1
370	2022-02-25 06:09:54.305125+00	24	Кино и творческие люди	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
371	2022-02-25 06:10:41.411194+00	24	Кино и творческие люди	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
372	2022-02-25 06:25:05.434835+00	24	Кино и творческие люди	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
373	2022-02-25 06:34:47.680661+00	23	Знать можно предотвратить. Знать нельзя допускать.	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
374	2022-02-25 06:40:54.166975+00	19	Как начать копить деньги?	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
375	2022-02-25 07:02:25.915429+00	30	Жизнь на карантине глазами коуча	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
376	2022-02-25 07:10:09.465934+00	30	Жизнь на карантине глазами коуча	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
377	2022-02-25 07:11:07.406926+00	26	Про осознанное потребление, сортировку и KWR	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
378	2022-02-25 09:42:34.164553+00	25	Горная жизнь. Как правильно готовиться к походу?	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
379	2022-02-25 09:56:47.249373+00	8	Стартапы в Казахстане: как создать и развивать	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	4	1
380	2022-02-25 10:22:10.631728+00	33	Как управлять личными финансами?	2	[{"changed": {"fields": ["Body", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
381	2022-02-25 10:30:13.687265+00	32	Половое воспитание	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
382	2022-02-25 11:11:17.30134+00	31	Презервативы: как покупать, проверять и использовать?	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
383	2022-02-25 11:15:26.381474+00	29	Уходи, осенняя хандра!	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
384	2022-02-25 11:20:59.521715+00	27	Ложные эко-друзья	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
385	2022-02-25 11:24:40.492718+00	18	Казахстанская сатира о жизни	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
386	2022-02-25 11:54:50.560243+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
387	2022-02-25 11:55:31.007099+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
388	2022-02-25 11:56:13.006786+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
389	2022-02-25 11:57:18.289231+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
390	2022-02-26 14:09:57.636779+00	17	garyshkerpro@gmail.com	2	[{"changed": {"fields": ["Verified"]}}]	7	1
391	2022-02-26 14:10:05.599436+00	1	beximiliano@gmail.com	2	[]	7	1
392	2022-02-26 14:43:23.546317+00	14	bonlyoone2@gmail.com	3		7	1
393	2022-02-26 14:43:29.40374+00	13	bonlyoone3@gmail.com	3		7	1
394	2022-02-28 05:04:55.913178+00	1	Что такое Garyshker?	2	[{"changed": {"fields": ["\\u041e\\u0442\\u0432\\u0435\\u0442"]}}]	14	1
395	2022-02-28 05:05:20.235083+00	2	Что такое Образование?	2	[{"changed": {"fields": ["\\u041e\\u0442\\u0432\\u0435\\u0442"]}}]	14	1
396	2022-02-28 05:07:43.101745+00	3	Что такое Проекты?	2	[{"changed": {"fields": ["\\u0412\\u043e\\u043f\\u0440\\u043e\\u0441", "\\u041e\\u0442\\u0432\\u0435\\u0442"]}}]	14	1
397	2022-02-28 05:09:17.464245+00	3	Что такое Проекты?	3		14	1
398	2022-02-28 05:09:17.46695+00	2	Что такое Образование?	3		14	1
399	2022-02-28 05:09:17.468361+00	1	Что такое Garyshker?	3		14	1
400	2022-02-28 11:34:13.052012+00	35	Talks экофилософия	1	[{"added": {}}]	4	1
401	2022-02-28 11:44:04.529712+00	36	Talks Путешествия	1	[{"added": {}}]	4	1
402	2022-02-28 11:50:37.270485+00	37	Q&A Nagimuwa	1	[{"added": {}}]	4	1
403	2022-02-28 11:52:51.126787+00	35	Talks экофилософия	2	[{"changed": {"fields": ["Body"]}}]	4	1
404	2022-02-28 11:55:21.874381+00	37	Q&A Nagimuwa	2	[{"changed": {"fields": ["Body"]}}]	4	1
405	2022-02-28 11:57:15.995615+00	36	Talks Путешествия	2	[{"changed": {"fields": ["Body"]}}]	4	1
406	2022-02-28 12:10:39.972266+00	35	Talks экофилософия	2	[{"changed": {"fields": ["Body"]}}]	4	1
407	2022-03-01 06:36:33.664753+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
408	2022-03-02 04:36:37.095224+00	37	Q&A Nagimuwa	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
410	2022-03-02 04:37:58.193576+00	35	Talksу Экофилософия	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
411	2022-03-02 04:38:26.395811+00	35	Talks	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
412	2022-03-02 04:38:34.525081+00	36	Talks	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
413	2022-03-02 04:42:24.745631+00	37	Q&A Nagimuwa	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
414	2022-03-02 04:44:19.473608+00	37	Q&A Nagimuwa	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
415	2022-03-02 05:15:35.594347+00	36	Talks	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
416	2022-03-02 05:27:17.110482+00	36	Talks	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
417	2022-03-02 06:18:52.976653+00	35	Talks	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
418	2022-03-02 06:28:25.558596+00	36	Talks	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
419	2022-03-02 06:29:07.533554+00	35	Talks	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
420	2022-03-02 06:29:40.126882+00	35	Talks	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
421	2022-03-02 06:30:23.482185+00	35	Talks	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
422	2022-03-02 06:30:42.476296+00	36	Talks	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f"]}}]	4	1
423	2022-03-02 06:34:37.330887+00	5	Можно ли предлагать свои идеи/контент?	3		14	1
424	2022-03-02 06:34:37.333176+00	4	Для чего нужна платформа?	3		14	1
425	2022-03-02 06:36:44.947136+00	6	Что дает регистрация на платформе?	1	[{"added": {}}]	14	1
426	2022-03-02 06:38:33.116501+00	7	Как открыть профиль?	1	[{"added": {}}]	14	1
427	2022-03-02 06:41:14.634199+00	8	Что означает " Читать", "Смотреть"?	1	[{"added": {}}]	14	1
428	2022-03-02 06:41:25.885218+00	8	Что такое " Читать", "Смотреть"?	2	[{"changed": {"fields": ["\\u0412\\u043e\\u043f\\u0440\\u043e\\u0441"]}}]	14	1
429	2022-03-02 06:42:25.841836+00	8	Что такое " Читать", "Смотреть"?	2	[{"changed": {"fields": ["\\u041e\\u0442\\u0432\\u0435\\u0442"]}}]	14	1
430	2022-03-02 06:42:54.158616+00	9	Почему бесплатно и зачем вам это?	1	[{"added": {}}]	14	1
431	2022-03-02 06:44:27.444564+00	10	Как можно помочь проекту?	1	[{"added": {}}]	14	1
432	2022-03-02 06:44:49.272564+00	11	Кто финансирует Garyshker?	1	[{"added": {}}]	14	1
433	2022-03-02 06:45:14.28304+00	12	Почему Garyshker?	1	[{"added": {}}]	14	1
434	2022-03-02 06:47:23.146542+00	13	Для чего нужна платформа?	1	[{"added": {}}]	14	1
435	2022-03-02 06:49:15.158112+00	8	Что такое " Читать", "Смотреть"?	2	[{"changed": {"fields": ["\\u041e\\u0442\\u0432\\u0435\\u0442"]}}]	14	1
436	2022-03-02 06:49:45.381392+00	8	Что такое " Читать", "Смотреть"?	2	[{"changed": {"fields": ["\\u041e\\u0442\\u0432\\u0435\\u0442"]}}]	14	1
437	2022-03-02 06:50:32.965292+00	10	Как можно помочь проекту?	2	[{"changed": {"fields": ["\\u041e\\u0442\\u0432\\u0435\\u0442"]}}]	14	1
438	2022-03-02 06:50:43.979107+00	8	Что такое " Читать", "Смотреть"?	2	[{"changed": {"fields": ["\\u041e\\u0442\\u0432\\u0435\\u0442"]}}]	14	1
439	2022-03-04 11:08:57.330403+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
440	2022-03-04 11:09:52.63048+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
441	2022-03-04 11:10:27.161908+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
442	2022-03-04 11:12:46.130453+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
443	2022-03-04 11:13:18.707711+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
444	2022-03-05 05:03:36.602528+00	23	10 вступительных вопросов, которые задают психотерапевты	2	[{"changed": {"fields": ["Body"]}}]	5	1
445	2022-03-05 05:06:09.775841+00	23	10 вступительных вопросов, которые задают психотерапевты	2	[{"changed": {"fields": ["Body"]}}]	5	1
446	2022-03-05 05:25:51.705173+00	23	10 вступительных вопросов, которые задают психотерапевты	2	[{"changed": {"fields": ["Body"]}}]	5	1
447	2022-03-05 05:27:55.51886+00	22	Половое воспитание - не только про секс	2	[{"changed": {"fields": ["Body"]}}]	5	1
448	2022-03-05 05:44:52.022288+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
449	2022-03-05 05:45:41.323377+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
450	2022-03-05 05:47:57.684364+00	9	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	2	[{"changed": {"fields": ["Body"]}}]	5	1
451	2022-03-05 06:10:40.623196+00	8	Что такое "Читать", "Смотреть"?	2	[{"changed": {"fields": ["\\u0412\\u043e\\u043f\\u0440\\u043e\\u0441"]}}]	14	1
452	2022-03-05 06:50:50.709619+00	13	Для чего нужна платформа?	2	[{"changed": {"fields": ["\\u041e\\u0442\\u0432\\u0435\\u0442"]}}]	14	1
453	2022-03-05 07:20:03.297054+00	8	Что такое "Читать", "Смотреть"?	2	[{"changed": {"fields": ["\\u041e\\u0442\\u0432\\u0435\\u0442"]}}]	14	1
454	2022-03-05 07:20:49.349105+00	13	Для чего нужна платформа?	2	[{"changed": {"fields": ["\\u041e\\u0442\\u0432\\u0435\\u0442"]}}]	14	1
455	2022-03-05 07:21:26.470541+00	13	Для чего нужна платформа?	2	[{"changed": {"fields": ["\\u041e\\u0442\\u0432\\u0435\\u0442"]}}]	14	1
456	2022-03-05 07:24:19.797562+00	36	Talks: Как собраться в путешествие	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
457	2022-03-05 07:24:33.457004+00	36	Talks: Как собраться в путешествие и немного о Garyshker	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
458	2022-03-05 07:25:00.726395+00	35	Talks:Резиновый ли мусорный полигон? Почему грязный пластик тяжелее перерабатывать?	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
459	2022-03-05 07:25:08.760542+00	35	Talks: Резиновый ли мусорный полигон? Почему грязный пластик тяжелее перерабатывать?	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
460	2022-03-05 07:27:14.032532+00	32	Сексуальное просвещение молодежи, проблема насилия и абортов	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
461	2022-03-05 07:28:03.320357+00	35	Talks: Экология с разных точек зрения	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
462	2022-03-05 08:58:16.144654+00	20	Ваш родитель: ангел или демон?	2	[{"changed": {"fields": ["Body"]}}]	5	1
463	2022-03-05 09:00:07.931575+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
464	2022-03-05 09:01:06.183342+00	3	«Я получил эту работу обманом»	2	[{"changed": {"fields": ["Body"]}}]	5	1
465	2022-03-05 09:02:35.88388+00	19	Бумажные стаканчики — супергерои или антагонисты?	2	[{"changed": {"fields": ["Body"]}}]	5	1
466	2022-03-05 11:53:37.730103+00	18	Вы бы купили свежие овощи в магазине, зная, что у продавца — ВИЧ?	2	[{"changed": {"fields": ["Body"]}}]	5	1
467	2022-03-05 12:08:07.11367+00	2	Все знают, а ты нет: как начать инвестировать?	2	[{"changed": {"fields": ["Body"]}}]	5	1
468	2022-03-05 12:09:09.078433+00	17	Личный опыт психотерапии	2	[{"changed": {"fields": ["Body"]}}]	5	1
469	2022-03-06 12:51:54.901394+00	135	kjk	3		6	1
470	2022-03-06 12:51:54.904159+00	134	Всем привет	3		6	1
471	2022-03-06 12:51:54.905712+00	133	sdpgriejwg[owejrgerwg	3		6	1
472	2022-03-06 12:51:54.907093+00	132	asdf	3		6	1
473	2022-03-06 12:51:54.908504+00	131	Лол	3		6	1
474	2022-03-06 12:51:54.910043+00	130	lf	3		6	1
475	2022-03-06 12:51:54.911509+00	129	может быть потом смайлики сделать?	3		6	1
476	2022-03-06 12:51:54.912951+00	128	прикольно)	3		6	1
477	2022-03-06 12:51:54.914264+00	127	Лоол	3		6	1
478	2022-03-06 12:51:54.91565+00	126	720 тоже	3		6	1
479	2022-03-06 12:51:54.916949+00	125	480 есть!!!	3		6	1
480	2022-03-06 12:51:54.918534+00	124	Glhf	3		6	1
481	2022-03-06 12:51:54.919925+00	123	Еще коммент	3		6	1
482	2022-03-06 12:51:54.921339+00	120	)	3		6	1
483	2022-03-06 12:51:54.922608+00	119	Мне нужен психолог	3		6	1
484	2022-03-06 12:51:54.923866+00	118	Вы все правы	3		6	1
485	2022-03-06 12:51:54.92504+00	116	потом	3		6	1
486	2022-03-06 12:51:54.926205+00	114	Да	3		6	1
487	2022-03-06 12:51:54.92737+00	113	Hssh	3		6	1
488	2022-03-06 12:51:54.9287+00	112	Habsburg	3		6	1
489	2022-03-06 12:51:54.929978+00	111	Hshshs	3		6	1
490	2022-03-06 12:51:54.931764+00	110	Hsshhs	3		6	1
491	2022-03-06 12:51:54.933345+00	109	Hshshshs	3		6	1
492	2022-03-06 12:51:54.934627+00	108	Shah	3		6	1
493	2022-03-06 12:51:54.935981+00	107	Shsh	3		6	1
494	2022-03-06 12:51:54.937782+00	106	Shahs	3		6	1
495	2022-03-06 12:51:54.940834+00	105	Hsg	3		6	1
496	2022-03-06 12:51:54.942703+00	104	Ты что терминатор?	3		6	1
497	2022-03-06 12:51:54.94412+00	103	Да	3		6	1
498	2022-03-06 12:51:54.945433+00	102	Лол	3		6	1
499	2022-03-06 12:51:54.947031+00	101	робит	3		6	1
500	2022-03-06 12:51:54.948792+00	100	ger	3		6	1
501	2022-03-06 12:51:54.95029+00	99	ergq	3		6	1
502	2022-03-06 12:51:54.951597+00	98	iehrgwerg	3		6	1
503	2022-03-06 12:51:54.953135+00	97	adf	3		6	1
504	2022-03-06 12:51:54.954652+00	96	afd	3		6	1
505	2022-03-06 12:51:54.956058+00	95	adsf	3		6	1
506	2022-03-06 12:51:54.957391+00	94	adfs	3		6	1
507	2022-03-06 12:51:54.958787+00	93	adf	3		6	1
508	2022-03-06 12:51:54.961019+00	92	adfs	3		6	1
509	2022-03-06 12:51:54.962356+00	91	asdf	3		6	1
510	2022-03-06 12:51:54.963641+00	90	adsf	3		6	1
511	2022-03-06 12:51:54.965197+00	89	adfs	3		6	1
512	2022-03-06 12:51:54.966511+00	88	asdf	3		6	1
513	2022-03-06 12:51:54.968005+00	87	afds	3		6	1
514	2022-03-06 12:51:54.969383+00	86	adf	3		6	1
515	2022-03-06 12:51:54.97062+00	85	afds	3		6	1
516	2022-03-06 12:51:54.98252+00	84	fds	3		6	1
517	2022-03-06 12:51:54.986357+00	83	adsf	3		6	1
518	2022-03-06 12:51:54.988404+00	82	asdf	3		6	1
519	2022-03-06 12:51:54.990115+00	81	adfs	3		6	1
520	2022-03-06 12:51:54.991731+00	80	asdf	3		6	1
521	2022-03-06 12:51:54.99311+00	79	asd	3		6	1
522	2022-03-06 12:51:54.994555+00	78	Лол	3		6	1
523	2022-03-06 12:51:54.995901+00	77	лол	3		6	1
524	2022-03-06 12:51:54.997448+00	76	Тут тоже прикольно	3		6	1
525	2022-03-06 12:51:54.998753+00	75	Тоже прикольно	3		6	1
526	2022-03-06 12:51:55.00015+00	74	Прикольно	3		6	1
527	2022-03-06 12:51:55.001388+00	73	все робит	3		6	1
528	2022-03-06 12:51:55.002712+00	72	прикольно	3		6	1
529	2022-03-06 12:51:55.004111+00	71	классно	3		6	1
530	2022-03-06 12:51:55.005565+00	70	и писать ответы	3		6	1
531	2022-03-06 12:51:55.006981+00	69	могу лайкать комменты	3		6	1
532	2022-03-06 12:51:55.008362+00	68	я теперь стал здоровее	3		6	1
533	2022-03-06 12:51:55.009668+00	67	asd	3		6	1
534	2022-03-06 12:51:55.010936+00	66	что такое гедонизм?	3		6	1
535	2022-03-06 12:51:55.012381+00	65	Jesus	3		6	1
536	2022-03-06 12:51:55.013869+00	64	Dhshd	3		6	1
537	2022-03-06 12:51:55.015279+00	62	ыфва	3		6	1
540	2022-03-06 12:51:55.019895+00	59	asdfasdf	3		6	1
541	2022-03-06 12:51:55.023343+00	58	dsfsdfas	3		6	1
542	2022-03-06 12:51:55.024838+00	57	asfd	3		6	1
543	2022-03-06 12:51:55.026234+00	56	sdaf	3		6	1
544	2022-03-06 12:51:55.02765+00	55	asdf	3		6	1
545	2022-03-06 12:51:55.029086+00	54	asdf	3		6	1
546	2022-03-06 12:51:55.031195+00	53	asdf	3		6	1
547	2022-03-06 12:51:55.03283+00	52	asdf	3		6	1
548	2022-03-06 12:51:55.034287+00	51	asdfa	3		6	1
549	2022-03-06 12:51:55.035761+00	50	привет	3		6	1
550	2022-03-06 12:51:55.037115+00	49	erfjepfefrf	3		6	1
551	2022-03-06 12:51:55.038526+00	48	asdfasfj[eriocmerwog	3		6	1
552	2022-03-06 12:51:55.040459+00	47	asdfaas	3		6	1
553	2022-03-06 12:51:55.041985+00	46	фвы	3		6	1
554	2022-03-06 12:51:55.043426+00	45	ыфва	3		6	1
555	2022-03-06 12:51:55.045033+00	44	ыв	3		6	1
556	2022-03-06 12:51:55.04662+00	43	лайки	3		6	1
557	2022-03-06 12:51:55.048212+00	42	коммент	3		6	1
558	2022-03-06 12:51:55.04965+00	41	лайки для комментов пока не работают в бэке миграция не пошла(	3		6	1
559	2022-03-06 12:51:55.051657+00	40	я сломал комменты кажись, трабл с лайками	3		6	1
560	2022-03-06 12:51:55.053117+00	39	asd	3		6	1
561	2022-03-06 12:51:55.054458+00	38	да так и есть )	3		6	1
562	2022-03-06 12:51:55.055827+00	37	Хорош, эти статьи в продакшн надо выкатывать или можно удалять?	3		6	1
563	2022-03-06 12:51:55.057222+00	36	вроде научился выгружать	3		6	1
564	2022-03-06 12:51:55.058483+00	35	прочел	3		6	1
565	2022-03-06 12:51:55.059952+00	34	лол	3		6	1
566	2022-03-06 12:51:55.061233+00	33	проверяю debounce	3		6	1
567	2022-03-06 12:51:55.062592+00	32	если кто то прочитал напишите ответ)	3		6	1
568	2022-03-06 12:51:55.063798+00	31	комменты работать должный	3		6	1
569	2022-03-06 12:52:08.165797+00	30	ментал хэлс	3		6	1
570	2022-03-06 12:52:08.168414+00	29	тут	3		6	1
571	2022-03-06 12:52:08.17007+00	28	Блин вот бы отвечалось под комментом)	3		6	1
572	2022-03-06 12:52:08.171589+00	27	Salam	3		6	1
573	2022-03-06 12:52:08.17309+00	26	??	3		6	1
574	2022-03-06 12:52:08.174475+00	25	Ema	3		6	1
575	2022-03-06 12:52:08.175897+00	24	видооос!!!!!!	3		6	1
576	2022-03-06 12:52:08.177211+00	23	Бэк надо вставит изменения	3		6	1
577	2022-03-06 12:52:08.178882+00	22	Хеллоу	3		6	1
578	2022-03-06 12:52:08.180224+00	21	+++	3		6	1
579	2022-03-06 12:52:08.18182+00	20	Что такое?	3		6	1
580	2022-03-06 12:52:08.183114+00	19	Классный мультик	3		6	1
581	2022-03-06 12:52:08.184393+00	18	sadasdsad	3		6	1
582	2022-03-06 12:52:08.186067+00	17	asdasdsa	3		6	1
583	2022-03-06 12:52:08.187286+00	16	sadsadasdas	3		6	1
584	2022-03-06 12:52:08.188593+00	15	dddddddddDDDDDDDDDDDDDDDDDDDD	3		6	1
585	2022-03-06 12:52:08.189854+00	14	хотя во фронте тоже надо правки добавить по дизайну	3		6	1
586	2022-03-06 12:52:08.191146+00	13	в мобилке да	3		6	1
587	2022-03-06 12:52:08.192812+00	12	кажется пока много что доделать нужно да?	3		6	1
588	2022-03-06 12:52:08.194122+00	11	это Биржан	3		6	1
589	2022-03-06 12:52:08.19545+00	10	привет	3		6	1
590	2022-03-06 12:52:08.196794+00	9	так и есть	3		6	1
591	2022-03-06 12:52:08.198742+00	8	классно	3		6	1
592	2022-03-06 12:52:08.200279+00	7	Ёто АНИМЕЕЕЕЕ!!!!!!	3		6	1
593	2022-03-06 12:52:08.201635+00	6	кумаш брооо это не мультик же	3		6	1
594	2022-03-06 12:52:08.202871+00	5	керемет мультфильм	3		6	1
595	2022-03-06 12:52:08.204146+00	4	ничего)	3		6	1
596	2022-03-06 12:52:08.205507+00	3	что тут?	3		6	1
597	2022-03-06 12:52:08.206807+00	2	что ты говоришь?	3		6	1
598	2022-03-06 12:52:08.208052+00	1	asd	3		6	1
599	2022-03-07 09:55:01.627701+00	6	Про меня	1	[{"added": {}}]	2	1
600	2022-03-07 09:55:30.809279+00	6	Про меня	3		2	1
601	2022-03-08 09:17:16.029075+00	9	birzhanshakarim@gmail.com	2	[{"changed": {"fields": ["Verified", "Is staff"]}}]	7	1
602	2022-03-08 09:19:30.812183+00	9	birzhanshakarim@gmail.com	2	[{"changed": {"fields": ["Is staff"]}}]	7	1
603	2022-03-09 11:11:56.296045+00	9	birzhanshakarim@gmail.com	2	[{"changed": {"fields": [" ", "Description", "User type"]}}]	7	1
604	2022-03-15 05:06:18.908531+00	6	Что я только что посмотрел? Признаки арт-хауса. Как понять кино. На примере “Черный-черный человек”	2	[{"changed": {"fields": ["Body"]}}]	5	1
605	2022-03-15 05:11:00.903529+00	16	Наш шанс: Для достижения более «справедливого и пригодного для жизни» будущего	2	[{"changed": {"fields": ["Body"]}}]	5	1
606	2022-03-15 05:18:44.538454+00	16	Наш шанс: Для достижения более «справедливого и пригодного для жизни» будущего	2	[{"changed": {"fields": ["Body"]}}]	5	1
607	2022-03-15 05:49:41.597234+00	23	10 вступительных вопросов, которые задают психотерапевты	2	[{"changed": {"fields": ["Body"]}}]	5	1
608	2022-03-17 11:52:35.634371+00	5	Как сортировать мусор?	2	[{"changed": {"fields": ["\\u0421\\u0443\\u0431\\u0442\\u0438\\u0442\\u0440\\u044b (\\u043a\\u0430\\u0437)"]}}]	4	1
609	2022-03-18 05:18:33.446158+00	37	Nagimuwa рассказала о важности путешествий в ее жизни	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
610	2022-03-18 05:18:59.4255+00	20	Arman Yussupov о ментальном здоровье	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
611	2022-03-18 05:19:30.80004+00	28	Asselina об опыте ведения экологичного образ жизни	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
612	2022-03-18 05:45:57.417428+00	22	Askar Illyasov поделился своим видением темы полового воспитания	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
613	2022-03-18 05:46:40.870755+00	14	Moldir Matzhanova поделилась тем, что помогает выбраться из апатии и уныния	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	4	1
614	2022-03-18 06:01:51.874084+00	38	Жизненный цикл футболки	1	[{"added": {}}]	4	1
615	2022-03-18 06:03:43.195084+00	38	Жизненный цикл футболки	3		4	1
616	2022-03-18 10:56:39.289611+00	5	Как сортировать мусор?	2	[{"changed": {"fields": ["\\u0421\\u0443\\u0431\\u0442\\u0438\\u0442\\u0440\\u044b (\\u043a\\u0430\\u0437)"]}}]	4	1
617	2022-03-18 10:57:04.244138+00	5	Как сортировать мусор?	2	[{"changed": {"fields": ["\\u0421\\u0443\\u0431\\u0442\\u0438\\u0442\\u0440\\u044b (\\u043a\\u0430\\u0437)"]}}]	4	1
618	2022-03-18 12:15:14.600889+00	39	Rick Astley - Never Gonna Give You Up	1	[{"added": {}}]	4	1
619	2022-03-18 12:16:28.590671+00	39	Rick Astley - Never Gonna Give You Up	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430 \\u0432\\u0442\\u043e\\u0440\\u0430\\u044f", "\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0432\\u0438\\u0434\\u0435\\u043e \\u0441 \\u0440\\u0430\\u0441\\u0448\\u0438\\u0440\\u0435\\u043d\\u0438\\u0435\\u043c)"]}}]	4	1
620	2022-03-18 12:18:13.739437+00	39	Rick Astley - Never Gonna Give You Up	2	[{"changed": {"fields": ["Body", "Body kk", "\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0432\\u0438\\u0434\\u0435\\u043e \\u0441 \\u0440\\u0430\\u0441\\u0448\\u0438\\u0440\\u0435\\u043d\\u0438\\u0435\\u043c)"]}}]	4	1
621	2022-03-18 12:39:20.157702+00	39	Rick Astley - Never Gonna Give You Up	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0432\\u0438\\u0434\\u0435\\u043e \\u0441 \\u0440\\u0430\\u0441\\u0448\\u0438\\u0440\\u0435\\u043d\\u0438\\u0435\\u043c)"]}}]	4	1
622	2022-03-18 20:57:13.34345+00	1	beximiliano@gmail.com	2	[{"changed": {"fields": ["Verified"]}}]	7	1
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time) FROM stdin;
1	2022-02-14 12:00:00+00
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
1	2022-02-14 09:46:49.822108+00
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
1	contenttypes	contenttype
2	obrazovanie	category
3	obrazovanie	videoquality
4	obrazovanie	video
5	obrazovanie	report
6	obrazovanie	comment
7	user	user
8	admin	logentry
9	auth	permission
10	auth	group
11	sessions	session
12	dobro	dobro
13	support	contactus
14	support	question
15	django_celery_beat	crontabschedule
16	django_celery_beat	intervalschedule
17	django_celery_beat	periodictask
18	django_celery_beat	periodictasks
19	django_celery_beat	solarschedule
20	django_celery_beat	clockedschedule
21	course	lector
22	course	course
23	course	lesson
24	organizations	organization
25	rating	rating
26	course	lessonmodule
27	course	resource
28	course	participant
29	quiz	test
30	quiz	question
31	quiz	answer
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	user	0001_initial	2022-02-12 18:18:08.039181+00
2	contenttypes	0001_initial	2022-02-12 18:18:08.050158+00
3	contenttypes	0002_remove_content_type_name	2022-02-12 18:18:08.05747+00
4	obrazovanie	0001_initial	2022-02-12 18:18:08.242923+00
5	obrazovanie	0002_alter_comment_likes	2022-02-12 18:18:08.255228+00
6	obrazovanie	0003_auto_20220213_0013	2022-02-12 18:18:08.274394+00
7	obrazovanie	0004_auto_20220213_0014	2022-02-12 18:18:08.309773+00
8	admin	0001_initial	2022-02-12 18:18:16.086634+00
9	admin	0002_logentry_remove_auto_add	2022-02-12 18:18:16.099094+00
10	admin	0003_logentry_add_action_flag_choices	2022-02-12 18:18:16.109363+00
11	auth	0001_initial	2022-02-12 18:18:16.180688+00
12	auth	0002_alter_permission_name_max_length	2022-02-12 18:18:16.195399+00
13	auth	0003_alter_user_email_max_length	2022-02-12 18:18:16.201488+00
14	auth	0004_alter_user_username_opts	2022-02-12 18:18:16.207235+00
15	auth	0005_alter_user_last_login_null	2022-02-12 18:18:16.212984+00
16	auth	0006_require_contenttypes_0002	2022-02-12 18:18:16.215198+00
17	auth	0007_alter_validators_add_error_messages	2022-02-12 18:18:16.221889+00
18	auth	0008_alter_user_username_max_length	2022-02-12 18:18:16.227517+00
19	auth	0009_alter_user_last_name_max_length	2022-02-12 18:18:16.233259+00
20	auth	0010_alter_group_name_max_length	2022-02-12 18:18:16.247254+00
21	auth	0011_update_proxy_permissions	2022-02-12 18:18:16.261529+00
22	auth	0012_alter_user_first_name_max_length	2022-02-12 18:18:16.267404+00
23	django_celery_beat	0001_initial	2022-02-12 18:18:16.30868+00
24	django_celery_beat	0002_auto_20161118_0346	2022-02-12 18:18:16.361829+00
25	django_celery_beat	0003_auto_20161209_0049	2022-02-12 18:18:16.373096+00
26	django_celery_beat	0004_auto_20170221_0000	2022-02-12 18:18:16.378305+00
27	django_celery_beat	0005_add_solarschedule_events_choices	2022-02-12 18:18:16.382947+00
28	django_celery_beat	0006_auto_20180322_0932	2022-02-12 18:18:16.403711+00
29	django_celery_beat	0007_auto_20180521_0826	2022-02-12 18:18:16.41516+00
30	django_celery_beat	0008_auto_20180914_1922	2022-02-12 18:18:16.432434+00
31	django_celery_beat	0006_auto_20180210_1226	2022-02-12 18:18:16.445147+00
32	django_celery_beat	0006_periodictask_priority	2022-02-12 18:18:16.451388+00
33	django_celery_beat	0009_periodictask_headers	2022-02-12 18:18:16.458068+00
34	django_celery_beat	0010_auto_20190429_0326	2022-02-12 18:18:16.565001+00
35	django_celery_beat	0011_auto_20190508_0153	2022-02-12 18:18:16.582972+00
36	django_celery_beat	0012_periodictask_expire_seconds	2022-02-12 18:18:16.590758+00
37	django_celery_beat	0013_auto_20200609_0727	2022-02-12 18:18:16.59671+00
38	django_celery_beat	0014_remove_clockedschedule_enabled	2022-02-12 18:18:16.602182+00
39	django_celery_beat	0015_edit_solarschedule_events_choices	2022-02-12 18:18:16.607339+00
40	dobro	0001_initial	2022-02-12 18:18:16.617409+00
41	dobro	0002_alter_dobro_description	2022-02-12 18:18:16.622499+00
42	dobro	0003_rename_description_dobro_body	2022-02-12 18:18:16.629134+00
43	dobro	0004_dobro_description	2022-02-12 18:18:16.633957+00
44	sessions	0001_initial	2022-02-12 18:18:16.649707+00
45	support	0001_initial	2022-02-12 18:18:16.667184+00
46	user	0002_auto_20220114_1414	2022-02-12 18:18:16.746573+00
47	user	0003_auto_20220212_2326	2022-02-12 18:18:16.787153+00
48	user	0004_user_user_type	2022-02-12 18:18:16.802984+00
49	obrazovanie	0005_alter_comment_likes	2022-02-13 09:18:51.341576+00
50	obrazovanie	0002_auto_20220215_1135	2022-02-15 06:28:07.614373+00
51	obrazovanie	0006_merge_20220215_1228	2022-02-15 06:28:07.622734+00
52	support	0002_auto_20220216_1615	2022-02-16 10:16:01.942482+00
53	support	0002_auto_20220216_2346	2022-02-16 17:54:12.630477+00
54	support	0003_merge_0002_auto_20220216_1615_0002_auto_20220216_2346	2022-02-16 17:54:12.639339+00
55	user	0005_alter_user_image	2022-02-19 12:55:15.144165+00
56	user	0006_alter_user_image	2022-02-19 12:58:02.951858+00
57	user	0007_alter_user_user_type	2022-02-20 17:34:26.027903+00
58	user	0008_alter_user_user_type	2022-02-20 17:58:22.923878+00
59	user	0009_auto_20220221_1333	2022-02-21 07:33:47.325131+00
60	obrazovanie	0002_video_image_2	2022-02-23 09:36:06.466325+00
61	user	0005_auto_20220223_1531	2022-02-23 09:36:06.578201+00
62	user	0010_merge_0005_auto_20220223_1531_0009_auto_20220221_1333	2022-02-23 09:36:06.59456+00
63	obrazovanie	0003_auto_20220226_1635	2022-02-26 10:35:05.651997+00
64	user	0011_rename_terms_ofuser_user_verified	2022-02-26 14:08:05.943787+00
65	organizations	0001_initial	2022-03-17 10:56:28.159305+00
66	organizations	0002_auto_20220316_0011	2022-03-17 10:56:28.167827+00
67	obrazovanie	0003_auto_20220315_2317	2022-03-17 10:56:28.221097+00
68	course	0001_initial	2022-03-17 10:56:28.292892+00
69	course	0002_lesson	2022-03-17 10:56:28.326806+00
70	course	0003_auto_20220316_0021	2022-03-17 10:56:28.349914+00
71	course	0004_lesson_course	2022-03-17 10:56:28.423747+00
72	obrazovanie	0004_auto_20220317_1120	2022-03-17 10:56:28.5175+00
73	obrazovanie	0005_video_subs_kk	2022-03-17 10:56:28.537072+00
74	obrazovanie	0006_video_body_kk	2022-03-17 10:56:28.555389+00
75	obrazovanie	0007_merge_0003_auto_20220226_1635_0006_video_body_kk	2022-03-17 10:56:28.558336+00
76	rating	0001_initial	2022-03-17 10:56:28.611777+00
77	rating	0002_alter_rating_owner	2022-03-17 10:56:28.642358+00
78	quiz	0001_initial	2022-03-25 21:11:42.776601+00
79	course	0002_course_duriation	2022-03-25 21:24:07.242708+00
80	course	0003_alter_participant_success	2022-03-25 21:33:10.579172+00
81	course	0004_alter_course_to_view	2022-03-25 21:36:58.989429+00
82	course	0005_alter_course_views	2022-03-26 08:58:21.851003+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ud358mtscz13ow03ogcg8ssmu9invu7z	.eJxVjEEOwiAQRe_C2hAoUKhL9z0DmWEYqRqalHZlvLtt0oVu_3vvv0WEbS1xa3mJE4mr0OLyuyGkZ64HoAfU-yzTXNdlQnko8qRNjjPl1-10_w4KtLLXGGzwHkinniCl7DoTfPaakREsEhPuvB-sUcloBsVmYFKddwgKnBKfLwwHOLo:1nIx07:FAqRbgtW1HYsre8pxxNfcq1PZqQPuYGHnYhCM1PtM7I	2022-02-26 18:20:03.529169+00
q8nm1wegzpn5ht1uflbj7byiz3eal8yv	.eJxVjEEOwiAQRe_C2hAoUKhL9z0DmWEYqRqalHZlvLtt0oVu_3vvv0WEbS1xa3mJE4mr0OLyuyGkZ64HoAfU-yzTXNdlQnko8qRNjjPl1-10_w4KtLLXGGzwHkinniCl7DoTfPaakREsEhPuvB-sUcloBsVmYFKddwgKnBKfLwwHOLo:1nJYEz:l1uDywvDniwzPRvq5uPwg6S2r9vjxrAvCrF-R40k7PY	2022-02-28 10:05:53.429334+00
i9qkvzx7ayi63lmll2coqh1koldvxhtv	.eJxVjEEOwiAQRe_C2hAoUKhL9z0DmWEYqRqalHZlvLtt0oVu_3vvv0WEbS1xa3mJE4mr0OLyuyGkZ64HoAfU-yzTXNdlQnko8qRNjjPl1-10_w4KtLLXGGzwHkinniCl7DoTfPaakREsEhPuvB-sUcloBsVmYFKddwgKnBKfLwwHOLo:1nKHMg:VAj1cGi7Ujq4lGS80aIS2k4rN7AjJdus5OVuizG0GXg	2022-03-02 10:16:50.664123+00
39fhznfy3e8ynhu5epiqpr50o6e1cdq5	.eJxVjEEOwiAQRe_C2hAoUKhL9z0DmWEYqRqalHZlvLtt0oVu_3vvv0WEbS1xa3mJE4mr0OLyuyGkZ64HoAfU-yzTXNdlQnko8qRNjjPl1-10_w4KtLLXGGzwHkinniCl7DoTfPaakREsEhPuvB-sUcloBsVmYFKddwgKnBKfLwwHOLo:1nN8qI:XXxED8DVWy6ywdiHOsVCPVe-DteKu6gaAjL7zPxrsgs	2022-03-10 07:47:14.992838+00
3v6gkx0c39l8mf388ury6pizpsqgo21e	.eJxVjEEOwiAQRe_C2hAoUKhL9z0DmWEYqRqalHZlvLtt0oVu_3vvv0WEbS1xa3mJE4mr0OLyuyGkZ64HoAfU-yzTXNdlQnko8qRNjjPl1-10_w4KtLLXGGzwHkinniCl7DoTfPaakREsEhPuvB-sUcloBsVmYFKddwgKnBKfLwwHOLo:1nOeDm:rh7RWRai_y-blgQkTDuXfPSpwBLCdmBCT1vTVaMSOJQ	2022-03-14 11:29:42.517725+00
z5w8vzjrikbgndf7njdld1opzqwf47xh	.eJxVjEEOwiAQRe_C2hAoUKhL9z0DmWEYqRqalHZlvLtt0oVu_3vvv0WEbS1xa3mJE4mr0OLyuyGkZ64HoAfU-yzTXNdlQnko8qRNjjPl1-10_w4KtLLXGGzwHkinniCl7DoTfPaakREsEhPuvB-sUcloBsVmYFKddwgKnBKfLwwHOLo:1nOitB:dh6S9vQxLwrw3UoRKAtV6GaogY_cTYZMvue3bpymBJ4	2022-03-14 16:28:45.609776+00
iy2fw4pxk3kkacwvx1iium2961n78pe2	.eJxVjEEOwiAQRe_C2hAoUKhL9z0DmWEYqRqalHZlvLtt0oVu_3vvv0WEbS1xa3mJE4mr0OLyuyGkZ64HoAfU-yzTXNdlQnko8qRNjjPl1-10_w4KtLLXGGzwHkinniCl7DoTfPaakREsEhPuvB-sUcloBsVmYFKddwgKnBKfLwwHOLo:1nQMXo:noHG_A6uasUxu52z7sOB4WyWfSgZl5Gr5tVIIT03-H4	2022-03-19 05:01:28.511918+00
daegw7paizttmw8jlde64biylpsatph0	.eJxVjEEOwiAQRe_C2hAoUKhL9z0DmWEYqRqalHZlvLtt0oVu_3vvv0WEbS1xa3mJE4mr0OLyuyGkZ64HoAfU-yzTXNdlQnko8qRNjjPl1-10_w4KtLLXGGzwHkinniCl7DoTfPaakREsEhPuvB-sUcloBsVmYFKddwgKnBKfLwwHOLo:1nRA4S:s3DZB5ajPIlbfVAJItcUHi20NeicOcN9eMIU3L5maSc	2022-03-21 09:54:28.220451+00
yeflmq6an59tduooar6eaheumyfrfluk	.eJxVjEEOwiAQRe_C2hAoUKhL9z0DmWEYqRqalHZlvLtt0oVu_3vvv0WEbS1xa3mJE4mr0OLyuyGkZ64HoAfU-yzTXNdlQnko8qRNjjPl1-10_w4KtLLXGGzwHkinniCl7DoTfPaakREsEhPuvB-sUcloBsVmYFKddwgKnBKfLwwHOLo:1nTj4V:2bVUEDpz0fd8F50HsCIEgBSso2Se95CPWurX8Hs0c1A	2022-03-28 11:41:07.641945+00
pnvaur91wuuhurj4h9bt7kf642o11ve5	.eJxVjEEOwiAQRe_C2hAoUKhL9z0DmWEYqRqalHZlvLtt0oVu_3vvv0WEbS1xa3mJE4mr0OLyuyGkZ64HoAfU-yzTXNdlQnko8qRNjjPl1-10_w4KtLLXGGzwHkinniCl7DoTfPaakREsEhPuvB-sUcloBsVmYFKddwgKnBKfLwwHOLo:1nTyRl:I9eLE3sdGO_jTKYHAPhoB6LnsaS3ThY_UvIRgi_hqjo	2022-03-29 04:06:09.107277+00
\.


--
-- Data for Name: dobro_dobro; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.dobro_dobro (id, created_at, updated_at, title, small_description, body, image, video, reports, collected, necessary, is_completed, description) FROM stdin;
\.


--
-- Data for Name: obrazovanie_category; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_category (id, created_at, updated_at, name, name_kk) FROM stdin;
1	2022-02-12 18:21:02.135584+00	2022-02-12 18:21:02.135601+00	🙏 Ментальное здоровье	
2	2022-02-12 18:21:08.857362+00	2022-02-12 18:21:08.85738+00	🌱 Экофилософия	
3	2022-02-12 18:21:15.505717+00	2022-02-12 18:21:15.505736+00	💸 Фин.грамотность	
4	2022-02-12 18:21:55.653751+00	2022-02-12 18:21:55.653769+00	🧿 Культура	
5	2022-02-12 18:22:23.185936+00	2022-02-14 20:57:53.660416+00	❤️ Половое воспитание	
\.


--
-- Data for Name: obrazovanie_comment; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_comment (id, created_at, updated_at, body, content_type_id, owner_id, reply_id, object_id) FROM stdin;
136	2022-03-06 13:06:15.376316+00	2022-03-06 13:06:15.376341+00	Классный чувак)	4	1	\N	24
137	2022-03-08 09:17:40.652603+00	2022-03-08 09:17:40.652626+00	fgf	4	9	\N	37
138	2022-03-09 08:09:28.916449+00	2022-03-09 08:09:28.916471+00	как?	5	1	\N	23
139	2022-03-09 10:52:06.873094+00	2022-03-09 10:52:06.873116+00	rfr	5	1	138	23
140	2022-03-09 10:52:15.010179+00	2022-03-09 10:52:15.010206+00	xc	5	1	\N	23
141	2022-03-09 10:53:17.519228+00	2022-03-09 10:53:17.519253+00	a	5	1	\N	23
142	2022-03-09 10:56:44.660508+00	2022-03-09 10:56:44.660533+00	ф	5	1	\N	15
143	2022-03-09 10:57:14.358886+00	2022-03-09 10:57:14.358911+00	ы	5	1	\N	22
144	2022-03-10 07:06:46.297876+00	2022-03-10 07:06:46.297902+00	ddsfjskjdfjds	5	17	\N	23
145	2022-03-10 07:07:30.353518+00	2022-03-10 07:07:30.353542+00	wdsjjdsjdjdjdjdjdjdjjddjdjdjdjdjdjdjjddjjdjjdjjjjdjdjdjddjdjdjdjdjdjdjdjdjdjdjddjdjdjdjdjhdjdjdjhhhhhhhhhh	5	17	\N	23
146	2022-03-11 13:06:11.474375+00	2022-03-11 13:06:11.4744+00	fvfv	4	9	137	37
147	2022-03-11 13:20:23.617953+00	2022-03-11 13:20:23.617976+00	kjgkfgh	4	9	\N	37
148	2022-03-13 17:16:38.700584+00	2022-03-13 17:16:38.700608+00	ывафвы\nфыва\nфыва	5	1	138	23
149	2022-03-13 17:16:56.993523+00	2022-03-13 17:16:56.993548+00	как \nак ак\nка	5	1	\N	23
150	2022-03-14 11:42:09.935701+00	2022-03-14 11:42:09.935725+00	dfdfd	4	5	\N	33
151	2022-03-16 05:17:35.036939+00	2022-03-16 05:17:35.036964+00	mdmsdmfds	4	5	\N	32
152	2022-03-16 05:17:38.200976+00	2022-03-16 05:17:38.201+00	dsmfnsdnkfd	4	5	\N	32
153	2022-03-16 05:17:43.456517+00	2022-03-16 05:17:43.45654+00	jdjfsjfds	4	5	\N	32
154	2022-03-19 18:26:33.624958+00	2022-03-19 18:26:33.624982+00	что тут?	4	1	\N	39
155	2022-03-19 18:26:47.060055+00	2022-03-19 18:26:47.060085+00	точняк	4	1	154	39
156	2022-03-19 18:41:35.284985+00	2022-03-19 18:41:35.285006+00	мне очень нравиться эта песня) \nя бы слушал вечность если у меня была депрессия или типа того	4	1	\N	39
157	2022-03-19 18:42:04.661806+00	2022-03-19 18:42:04.661828+00	хотя не я не хочу уже слушать	4	1	\N	39
158	2022-03-19 18:42:22.414546+00	2022-03-19 18:42:22.414566+00	кажется я теперь здоров	4	1	\N	39
159	2022-03-19 18:49:17.481519+00	2022-03-19 18:49:17.481542+00	я когда был маленький любил ходить по горам пока я не попробовал быстрый спуск)\nя не думал что когда я буду бегать вниз по горе, я разгонюсь так сильно что мое тело обгонит мои ноги, и по итогу я врежусь в кусты. \nМораль истории такова что не надо бегать, надо наслаждаться моментом, и не спешить и обдумать что ты собираешься сделать	4	1	\N	37
\.


--
-- Data for Name: obrazovanie_comment_likes; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_comment_likes (id, comment_id, user_id) FROM stdin;
351	141	1
354	145	15
355	137	9
356	147	9
357	147	1
358	137	1
359	149	1
360	144	1
361	145	1
362	159	1
\.


--
-- Data for Name: obrazovanie_report; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_report (id, created_at, updated_at, title, body, image, moderated, views, author_id, category_id, body_kk, preview_text_kk, preview_text_ru, title_kk) FROM stdin;
3	2022-02-15 09:48:05.004535+00	2022-03-09 06:07:37.017475+00	«Я получил эту работу обманом»	<h4>Распознаем признаки синдрома самозванца и даем отпор</h4>\r\n\r\n<p>&laquo;<em>Я получил эту работу обманом</em>&raquo; &mdash; с этими словами наш знакомый редактор заявил, что хочет уволиться. Он объяснил, что при отборе на должность ему помогла удача, а не компетенция, поэтому он &mdash; мошенник, которого никто до сих пор не разоблачил.&nbsp;<br />\r\n<br />\r\nГоре-редактора зовут Данияр. Год назад он дважды прошел через фильтр эйчаров и ходко устроился на работу (прикиньте, дважды обмануть эйчаров и случайно начать писать статьи &mdash; вот дает). Как вышло, что человек, работавший на совесть больше года, выполнявший все задачи качественно и в срок, уверен, что недостаточно хорош для должности? И почему его до сих пор не уволили &mdash; давайте объясним.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/among-us-imposter-1.jpg" /><br />\r\n<span style="font-size:11px">Among us. Источник:&nbsp;<a href="https://screenrant.com/among-us-play-imposter-every-time/">screenrant</a></span></p>\r\n\r\n<h4>Импостер среди своих</h4>\r\n\r\n<p>Фундамент такого мышления &mdash; синдром самозванца. Этот синдром строится на обесценивании своих достижений и умений. Как и наш Данияр, человек с подозрениями на синдром самозванца: - облицовывает свой успех обманом, удачей или случайностью - остерегается провалов (и нередко попадает в сети перфекционизма) - боится не повторить свой успех (ведь все построено единичной удаче, не забыли?) - не хочет омрачить приятное впечатление о себе (представьте, что у Даника есть задача. Простая. Допустим, купить хлеба в офис. Тут все понятно: надо пойти в магазин, выбрать хлеб, проверить срок годности, оплатить и принести. А вот как всё усложняет импостер внутри нашего героя: необходимо найти редкий магазин, выбрать хлеб только из высокосортной муки, изумить своим выбором продавца и, зачем-то, проджект-менеджера. В итоге плечи Данияра тяжелеют от такой ответственности, он боится не оправдать надежд, поэтому не решается даже открыть дверь магазина).</p>\r\n\r\n<ul>\r\n\t<li>Я оказался здесь случайно, мне повезло;</li>\r\n\t<li>Никто не догадывается, что я недостаточно умелый;</li>\r\n\t<li>Я часто либо мешкаюсь перед тем, как приступить к работе, либо долго довожу ее до идеала;</li>\r\n\t<li>В первый раз я приложил большие усилия, значит мне еще надо постараться, чтоб удержать успех).</li>\r\n</ul>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/2.jpg" /><br />\r\n<span style="font-size:11px">Кадр из фильма &quot;Бойцовский клуб&quot;</span><span style="font-size:11px">. Источник:&nbsp;<a href="https://warriors.fandom.com/ru/wiki/Рассказчик_(Бойцовский_клуб)">Fandom</a></span></p>\r\n\r\n<h4>Что делать, если узнали себя в Данияре?</h4>\r\n\r\n<p>Начать борьбу с синдромом можно с определения причины. Их бывает много, однако большинство из них вьются с детства, ведь семейные паттерны &mdash; это то, чем человек окружен всегда и постоянно. Данияра могли поощрять только за успехи, приучая к борьбе за дозы тепла и рождая завышенные ожидания, а могли и взращивать в нем чувство неполноценности, сравнивая с соседским Олжасом. Тут каждый случай индивидуален. &nbsp;Мы выделили пару советов для борьбы с синдромом самозванца как Данияру, так и Олжасу:</p>\r\n\r\n<ol>\r\n\t<li>Узнавайте себя. Важно расписывать свои достижения, анализировать умения и работать над сильными сторонами (буквально учиться шлифовать их).</li>\r\n\t<li>Находите причины, предпосылки и прорабатывайте их. К примеру, в той же борьбе с чувством неполноценности отрежьте себя от сравнений с другими и вернитесь к списку личных успехов.</li>\r\n\t<li>Ищите ментора со свежей головой. Он будет курировать вас и поможет понять, над чем стоит поработать, а что является плодом фантазий.</li>\r\n</ol>\r\n\r\n<p><em>Будьте внимательны к себе, подать заявление на увольнение всегда успеете.</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Источники:<br />\r\n<a href="https://paulineroseclance.com/impostor_phenomenon.html https://paulineroseclance.com/pdf/-Langford.pdf">https://paulineroseclance.com/impostor_phenomenon.html https://paulineroseclance.com/pdf/-Langford.pdf/</a><br />\r\n<a href="https://www.usenix.org/conference/wiac12/overcoming-my-biggest-roadblock-myself">https:https://www.usenix.org/conference/wiac12/overcoming-my-biggest-roadblock-myself</a></p>	report-image/Бойцовский-клуб-2.jpg	t	132	18	1				
1	2022-02-12 18:27:12.162267+00	2022-03-12 18:40:44.639699+00	Электрокары: что с ними не так?	<p>С плачевной ситуацией загрязнения воздуха, человечеству необходимо было искать альтернативу для машин - электрокаров, использующих электрический двигатель место обычного газового. Больше и больше компаний сейчас предлагают электрокары, продвигая идею &ldquo;чистых машин&rdquo;. Но все ли так просто? электрокаров, использующих электрический двигатель место обычного газового. Больше и больше компаний сейчас предлагают электр</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/13/rtx7a0lu-pic4_zoom-1500x1500-85729-1.png" /><br />\r\n<span style="font-size:11px">Презентация Tesla Cybertrack. Источник:&nbsp;<a href="https://news.sky.com/story/elon-musk-boasts-of-nearly-150-000-tesla-cybertruck-orders-despite-launch-gaffe-11868785">Skynews</a></span></p>\r\n\r\n<p>Разница между традиционными машинами и электрическими кроется в обработке энергий в их двигателях. В первом, энергия хранится в субстанции и вырабатывается<br />\r\nчерез химическую реакцию. Из-за этого, когда топливо горит, на воздух сбрасываются парниковые газы. Газы, в свою очередь, способствуют парниковому эффекту, что приведет к изменению климата. Катастрофа, которую уже не избежать. А электрокары, не сжигают топливо, а используют литиевые батареи. Плюс, они считаются более эффективными. Это когда энергия теряется наименьшим образом и используется по максимуму. Все, 1:0. Электрокары выигрывают. Но, стоп&hellip;<br />\r\n<br />\r\nНа самом деле, если энергия для батарей машин не получена с солнечных панелей или ветровых турбин, эмиссия газов может быть еще больше. (Куда больше?) Когда электричество для батарей получена из электростанции, где уже было сожжено некоторое количество топлива, не будет иметь значения - ты на машине, или на электромашине.<br />\r\n<br />\r\nА насколько экологичен процесс производства электромашин? По данным Союза Заинтересованных Ученых, даже при том, что процесс создания двух машин одинаковый, выброс газа больше у электрокаров. Почему? У электрокаров просто большая по объему батареи, которые сделаны из дорогих материалов. Это означает, что эти материалы трудно добыть, а об экологичности речь и не идет.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/13/supercharger_columbus-medium-1.png" /><br />\r\n<span style="font-size:11px">Источник:&nbsp;<a href="https://www.wired.com/2016/03/teslas-electric-cars-might-not-green-think/">Wired</a></span></p>\r\n\r\n<p>Но, естественно, электрокары есть и будут отличной альтернативой обычным машинам, но что будет когда их батареи закончятся? Мы их бросим? А как же zero waste?<br />\r\n<br />\r\nКогда батареи попадают на землю как мусор, они выделяют токсины и тяжелые металлы, которые портят землю. Батареи сложно перерабатывать, так как это просто не было усмотрено. А теперь когда их миллионы штук, никто не знает как правильно вернуть их к жизни. К 2030 году, у нас будет 145 миллион батареек. И мы не знаем, что с ними делать.<br />\r\n<br />\r\nВыводы: электрокары - не так чисты. Даже если они не вырабатывает углекислый газ во время использования, они могут вырабатывать газы в производстве и после эксплуатации. Однако, технологии меняются - и все эти проблемы можно решить. Главное, не надо останавливаться. А вообще, велосипед в руки.<br />\r\n<br />\r\n<span style="font-size:11px">Источники:<br />\r\n<a href="https://youmatter.world/en/are-electric-cars-eco-friendly-and-zero-emission-vehicles-26440/" style="text-decoration:none"><span style="font-family:Roboto,sans-serif"><span style="color:#b67906"><u>https://youmatter.world/en/are-electric-cars-eco-friendly-and-zero-emission-vehicles-26440/</u></span></span></a></span><br />\r\n<span style="font-size:11px"><a href="https://www.sciencemag.org/news/2021/05/millions-electric-cars-are-coming-what-happens-all-dead-batteries" style="text-decoration:none"><span style="font-family:Roboto,sans-serif"><span style="color:#b67906"><u>https://www.sciencemag.org/news/2021/05/millions-electric-cars-are-coming-what-happens-all-dead-batteries</u></span></span></a></span></p>	report-image/RTX7A0LU-pic4_zoom-1500x1500-85729_1_64I1e1K.png	t	339	18	2				
6	2022-02-15 12:02:17.978757+00	2022-03-15 05:06:24.343563+00	Что я только что посмотрел? Признаки арт-хауса. Как понять кино. На примере “Черный-черный человек”	<p>Бывает смотрите фильм и не понимаете что происходит. Вы сидите и ждете, что вот-вот все станет ясно. Но так не происходит. Конец фильма, титры и вы. До сих пор ничего не поняли. И как с этим жить?</p>\r\n\r\n<p>Особенно такое происходит с артхаусными фильмами. &ldquo;Интеллектуальные фильмы&rdquo;, как и их описывают, могут и будут играться с вашим разумом, чувствами и восприятием. Совершенно разными способами, но сильно. Они давят, напрягают, пугают и ваша закружившаяся голова будет недоумевать, куда обратиться.</p>\r\n\r\n<p style="text-align:center"><img alt="" src="/media/uploads/2022/02/23/1471005422_196-0-1049-853_1920x0_80_0_0_91c35de3130cd1705fb3380ad2a66ff9.jpg" /></p>\r\n\r\n<p><span style="font-size:11px">Сериал &quot;Шерлок Холмс&quot;. Источник:&nbsp;<a href="https://crimea.ria.ru/20150710/1100434703.html">BBC Wales</a></span></p>\r\n\r\n<p>Давайте разберемся, что делает артхаус таким сложным и сильным, и какие у него суперспособности.</p>\r\n\r\n<ol>\r\n\t<li>&nbsp;Артхаус - многогранен. К вам могут попасться авангард, фестивальный или авторский фильм. Они разные - и именно так они могут обмануть вас. То, что вы никогда не видели или жанр, который мало знаком - все это новое неизведанное. А новое - пугает.&nbsp;</li>\r\n\t<li>Здесь форма повествования может оказаться важнее чем само повествование. Разными методами фильм будет акцентировать на вещи, которые работают на формирование или изменения восприятия зрителя. Например, то, как Тарковский снимал ходьбу героя через один кадр на протяжении 5 минут или как Адильхан Ержанов в своем фильме &ldquo;Черный-черный человек&rdquo; показывал, как играют подростки, которые на первый взгляд кажутся не относящиеся к истории героями. Иногда это форма может быть совершенно другой, но его главная миссия - работать на воздействие зрителя.&nbsp;</li>\r\n\t<li>Да, это про нас. Такие фильмы обычно рассуждают на тему социально-политических конфликтов или на более внутренние психологические проблемы. &ldquo;Черный-черный человек&rdquo; - использует эту силу, повествуя историю о ауле, проблемы которого: коррупция, рэкетирство, торговля наркотиками. Район, который пропитан несправедливостью и черными-черными делишками может оказаться гипер реалистичной картиной нашего мира. Здесь нет героев или спасателей, а в циничном обществе тебе никто не поможет. Возможно поэтому зарождаются черные-черные человечки, как показано в этом фильме.</li>\r\n</ol>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/956x597.jpeg" /><span style="font-size:11px">Кадр из фильма &quot;</span><span style="font-size:11px">Черный-черный человек</span><span style="font-size:11px">&quot;. Источник:&nbsp;<a href="https://www.vashdosug.ru/msk/cinema/article/2571902/">Ваш досуг</a></span></p>\r\n\r\n<p>Окей, теперь самое важное.&nbsp;</p>\r\n\r\n<p>Учимся понимать артхаус. Короткий гайд:&nbsp;</p>\r\n\r\n<ol>\r\n\t<li>Читаем до просмотра или наоборот. И читаем все: описание, рецензии, интервью режиссера. До просмотра у вас сформируется представление, а если читать после, то объяснение. В обоих случаях, у вас зародится мнение.</li>\r\n\t<li>Спрашиваем. (Но не во время просмотра!) Что-то непонятно - задаем вопрос. А если вопросы - слишком поверхностно, то обсуждаем.</li>\r\n\t<li>Обращаем внимание на следующие вещи: герои, диалоги, места, события, музыка, декорации. Помним, что артхаус любит и приветствует символизм и скрытые послания. Учимся собирать пазл. (Фильм для практики: &ldquo;Помни&rdquo; Кристофера Нолана, будете буквально собирать историю по кусочкам)</li>\r\n\t<li>Можете еще раз посмотреть фильм! Или режиссерскую версию. На этих версиях, всегда больше и по смыслу и по содержанию фильмы.</li>\r\n</ol>\r\n\r\n<p>И помним за каждым сильным артхаусом стоит простая человеческая история. А если вы человек, то поймете все.</p>\r\n\r\n<p>Источники:</p>\r\n\r\n<p><a href="https://www.quora.com/How-do-I-have-a-better-understanding-of-movies" style="text-decoration:none"><span style="font-size:11pt"><span style="font-family:Roboto"><span style="color:#b67906"><u>https://www.quora.com/How-do-I-have-a-better-understanding-of-movies</u></span></span></span></a><br />\r\n<a href="https://brod.kz/articles/200423-gajd-po-teorii-kino-chto-takoe-arthaus/" style="text-decoration:none"><span style="font-size:11pt"><span style="font-family:Roboto"><span style="color:#b67906"><u>https://brod.kz/articles/200423-gajd-po-teorii-kino-chto-takoe-arthaus/</u></span></span></span></a></p>	report-image/orig.jpeg	t	140	19	4				
7	2022-02-15 12:14:27.45445+00	2022-03-15 05:06:40.121306+00	Спорить бесполезно: The Backfire Effect	<p>В идеально рациональном мире, добро всегда побеждает зло, а истина любую ложь. &nbsp;Но мы живем в другом мире.&nbsp;</p>\r\n\r\n<p><strong>Что мы ожидаем</strong>: Когда ваши убеждения опровергаются фактами, вы меняете свое мнение и включаете новую информацию в свое мышление.</p>\r\n\r\n<p><strong>Что иногда происходит</strong>: Когда ваши самые глубокие убеждения опровергаются противоречивыми доказательствами, ваши убеждения становятся сильнее.</p>\r\n\r\n<p>Это когнитивного искажение назвается backfire effect - когда перед очевидными фактами, человек не будет переубежден, а наоборот будет сильнее верить в свой аргумент. Важно понимать этот эффект - он влияет на вашу способность изменять мнение других людей &nbsp;и рационально обрабатывать информацию самостоятельно.&nbsp;</p>\r\n\r\n<p>По сути, этот эффект - ловушка. Он означает, что демонстрация людям доказательств их неправоты зачастую неэффективна и может привести к обратным результатам, спорить - тоже бесполезно.&nbsp;</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/dq08bruw4aagsca_88Ujdts.jpg" /><br />\r\n<span style="font-size:11px">Backfire effect. Источник:&nbsp;<a href="https://twitter.com/javisalas/status/1057566145308512257?lang=ms">Twitter</a></span></p>\r\n\r\n<p>Это влияет на все аспекты нашей жизни. Например, исследования показывают, что эффект распространен в выборе политического кандидата или в вопросах вакцинации. В первом случае, знакомство людей с негативной информацией о политическом кандидате, которого они предпочитают, часто приводит к усилению их поддержки этого кандидата. А во втором, если дать родителям, которые против вакцинации, информацию, показывающую, почему вакцинация их ребенка является лучшим способом действий, они иногда с большей вероятностью верят в связь между вакцинацией и аутизмом. И таких примеров много. А суть одна - иногда даже факты бессильны.&nbsp;</p>\r\n\r\n<h5>Почему так?</h5>\r\n\r\n<p>Когда человек сталкивается с информацией, которая предполагает, что его текущие убеждения в некотором роде ошибочны, он чувствует угрозу, что вызывает у него множество негативных эмоций. Это особенно вероятно, когда рассматриваемые убеждения имеют решающее значение для их самооценки, что означает, что они представляют собой важную часть идентичности и идеологии этого человека.</p>\r\n\r\n<p>Эти негативные эмоции могут заглушить человека, их способность принимать корректирующую информацию - исчезает. Они откажутся обработать ее должным образом, и увеличивая вероятность того, что они попытаются найти способы обесценить ее.</p>\r\n\r\n<p>Люди часто пытаются сбрасывать со счетов и отвергать корректирующую информацию, что иногда приводит их к обратному эффекту. В своей попытке отвергнуть эту информацию люди сначала пытаются вспомнить ранее существовавшие знания (чтобы использовать в своих аргументах), &nbsp;которые могут привести к усилению этих знаний в их сознании и, следовательно, усилить их поддержку своих ранее существовавших убеждений.</p>\r\n\r\n<p>Более того, когда люди достаточно сильно возражают против нежелательной информации, они часто приводят больше аргументов в поддержку своей позиции. Это может заставить их поверить в то, что существует больше доказательств в поддержку их точки зрения, чем было до того, как им были представлены нежелательные доказательства.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/0a3f04dba8747aa76152ad4255135be6.jpg" /><br />\r\n<span style="font-size:11px">Keanu Reeves. Источник:&nbsp;<a href="https://www.pinterest.com/pin/226939268709314355/">Pinterest</a></span></p>\r\n\r\n<h5>Как уменьшить эффект:</h5>\r\n\r\n<p><strong>У других</strong><br />\r\nЕсть стратегии как: повышение осведомленности людей об этой предвзятости, использование более простых объяснений и изменение способа подачи информации.</p>\r\n\r\n<p>Проводилось очень много исследований, вывод таков: когда вы разговариваете с людьми, пытаясь изменить их позицию вы должны помнить, что то, как вы представляете информацию, так же важно, как и то, что вы представляете, если вы хотите избежать обратного эффекта. Таким образом, вам необходимо отображать новую информацию в спокойной манере, которая позволяет людям усвоить новые факты и прийти к выводу, что вы хотите, чтобы они сделали это сами.</p>\r\n\r\n<p>Кстати, помните, что нападение на другого человека за &#39;&#39;неправильное&#39;&#39; мнение, каким бы ошибочным оно ни было, вряд ли сработает, так как это, вероятно, просто заставит его защищаться. Если люди воспринимают вас как невежливых или враждебных, они с большей вероятностью усомнятся в обоснованности вашего аргумента, даже если сам аргумент является рациональным и хорошо обоснованным.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/spiderman-memepng.jp2" /><br />\r\n<span style="font-size:11px">Spider mans meme. Источник:&nbsp;<a href="https://www.news18.com/news/buzz/did-spider-man-no-way-home-recreate-the-spideys-pointing-at-each-other-meme-4581383.html">News 18</a></span></p>\r\n\r\n<p><strong>У себя</strong><br />\r\nУменьшение эффекта у себя требует критического отношения к тому, как вы обрабатываете новую информацию, что позволит вам мыслить более рационально и принимать более обоснованные решения. Нужно и можно осознавать его влияние и изменять то, как вы реагируете, когда сталкиваетесь с информацией, противоречащей вашим убеждениям. Вам следует сначала попытаться взглянуть на новые идеи свежим взглядом и оценить их, исходя из их собственных достоинств, не сравнивая с уже существующей теориями по этой теме.</p>\r\n\r\n<p>Хотя обратный эффект играет важную роль в том, как люди обрабатывают новую информацию, это не означает, что он влияет на всех постоянно, и исследования показывают, что есть случаи, когда обратный эффект не влияет на мыслительный процесс людей.</p>\r\n\r\n<p>В целом, хотя обратный эффект может влиять на мыслительный процесс людей в различных ситуациях, он проявляется не всегда. Испытывают ли люди обратный эффект или нет, зависит от множества факторов, и, поскольку его трудно предсказать, вам, как правило, следует проявлять осторожность и действовать таким образом, чтобы учитывать его возможное влияние.</p>\r\n\r\n<p>Перевод:</p>\r\n\r\n<p><a href="https://effectiviology.com/backfire-effect-facts-dont-change-minds/" style="text-decoration:none"><span style="font-size:11pt"><span style="font-family:Arial"><span style="color:#b67906"><u>https://effectiviology.com/backfire-effect-facts-dont-change-minds/</u></span></span></span></a></p>	report-image/pls221b8pyo31-2.png	t	82	19	1				
8	2022-02-15 12:22:11.698541+00	2022-03-15 05:07:24.474091+00	Почерневшие бананы нам не враги	<p>Помните сколько возмущении вызывали картинки, на которых бананы были упакованы в одноразовый пластиковый контейнер или в пищевую пленку?</p>\r\n\r\n<p>Мы согласны с вами, ведь, бананы имеют уже свою упаковку от природы - желтую, идеально повторяющую силуэт продукта, а главное биоразлагаемую. Так зачем же её ещё паковать? Она, что, капуста? И что же теперь, через десять лет, чтобы добраться до жевательной мякоти нужно будет разгадать загадку Монтесумы? (дурацкая шутка от редактора)</p>\r\n\r\n<p style="text-align:center"><img alt="" src="/media/uploads/2022/02/15/istockphoto-1125983533-170667a.jpeg" /></p>\r\n\r\n<p><strong>Давайте разбираться.</strong><br />\r\nЛюди в интернетах говорят, что банан, конечно, вкусный и полезный фрукт, но он очень быстро портится, чернеет изнутри и снаружи. Это послужило причиной сделать исследование на тему &ldquo;Влияние упаковочных материалов на срок годности и качество сортов бананов&rdquo; В 2012 году три студента М. Хайлу, Т. Сейюм и Д. Белю выяснили, что в полиэтиленовых пакетах бананы хранятся дольше, чем без него. Они поделили работу на несколько частей: цвет банана, толщина кожуры, толщина пульпы и соотношение целлюлозы и кожуры, твердость мякоти, процент товарности.</p>\r\n\r\n<p>Не будем сильно углубляться в остальные части, давайте поговорим только о цвете банана, твердости мякоти и проценте товарности. Цвет банана на третий день уже значительно отличался, когда был упакован, в то время как в полиэтиленовой упаковке они хранились до 18 дней неизменно.</p>\r\n\r\n<p>Насчет твердости мякоти, полиэтиленовый пакет давал возможность сохранять продукт, в то время как без упаковки бананы становились мягкими на шестой день. Покупать бананы без упаковки переставали на пятнадцатый день, тогда как в упаковке продавались до 36 дней с момента упаковывания.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/rts26thu-e1566317189599.jpg" /><br />\r\n<span style="font-size:11px">Бананы в упаковке. Источник:&nbsp;<a href="https://qz.com/1691363/fusarium-fungus-could-wipe-out-the-worlds-favorite-banana-again/">QZ</a></span></p>\r\n\r\n<p>Например, в Корее облегчили жизнь людям, но не природе посредством инновации под названием &ldquo;один банан в день&rdquo;(Haru Hana) Южнокорейской сетью супермаркетов E-Mart. Суть заключалась в том, что в одноразовый пластиковый контейнер клали пять-шесть бананов с разной степенью созревания. То есть, с лева на право находились от зеленых до желтых спелых бананов. Когда пользователь ест каждый день по одному банану, следующий банан созревает на следующий день(может лучше приложить фото или иллюстрацию?) Возможно, это допустимо для Южной Кореи, ведь там сортируют мусор.&nbsp;</p>\r\n\r\n<p>Многие пользователи были рады новому приспособлению, ведь это ко всему прочему гигиена - в кожуру не будут попадать лишние бактерий, которые в конечном итоге окажутся у нас в руках. &nbsp;Но с другой стороны пользователи писали, что бананы сортировать по мере созревания можно и в магазине, ведь в этом нет ничего тяжелого.</p>\r\n\r\n<p>Источники:</p>\r\n\r\n<p><a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4571223/" style="text-decoration:none"><span style="font-size:11pt"><span style="font-family:Roboto,sans-serif"><span style="color:#b67906"><u>https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4571223/</u></span></span></span></a><br />\r\n<a href="https://www.treehugger.com/one-day-bananas-genius-work-or-waste-packaging-survey-4856840" style="text-decoration:none"><span style="font-size:11pt"><span style="font-family:Roboto,sans-serif"><span style="color:#b67906"><u>https://www.treehugger.com/one-day-bananas-genius-work-or-waste-packaging-survey-4856840</u></span></span></span></a></p>\r\n\r\n<p>&nbsp;</p>	report-image/111.jpeg	t	103	20	2				
5	2022-02-15 11:52:05.13181+00	2022-03-23 09:01:25.12114+00	Проживаем целые сутки как Мураками: о режиме дня наглядно	<p>&nbsp;</p>\r\n\r\n<p>В детстве у всех свое расписание: в обед надо изучить виды динозавров, до вечера встретиться с друзьями, а потом идти выяснять, почему взрослые не решают &laquo;проблему&raquo; Бермудского треугольника. В этом ярком детском мире не круто просыпаться в 7:00, дремать в обед, ужинать в 19:30 и идти спать в 22:00 по приказу родителей &mdash; за это во дворе свои же забуллят.</p>\r\n\r\n<p>А во взрослом мире считается, что это, наоборот, круто. Отвечаем на вопрос &laquo;Почему?&raquo;, попробовав пожить с вами целые сутки по распорядку дня Харуки Мураками*.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/1z1oczgfqkilfzfeollfxow-2.png" /><br />\r\n<span style="font-size:11px">Распорядок дня Харуки Мураками. Источник:&nbsp;<a href="https://medium.com/알트-alt/haruki-murakamis-routine-celebrity-routine-3-74d80c5a07c">Medium</a></span></p>\r\n\r\n<h5>Просыпаемся и работаем до 12:00</h5>\r\n\r\n<p>День Мураками начинается в 4:00. После подъема и утренних ритуалов он идет работать. Так проходят 5-6 часов.</p>\r\n\r\n<p>Здесь поставим возле биоритма писателя симпатичную галочку, так как с самого утра в организме начинает бодрствовать гормон счастья и регулирует наш сон. Помимо буста серотонина, вот что происходит до обеда:</p>\r\n\r\n<p>&bull; всплеск кортизола (персональный будильник организма);<br />\r\n&bull; мелатонин сдает свой пост (помешаете ему и нарушите свой сон ночью &mdash; днем под воздействием солнечного света будете закисшим, начнете клевать носом, а оно вам надо?);<br />\r\n&bull; подключается глюкоза (ваш лучший друг, главный поставщик энергии) и не только.</p>\r\n\r\n<p>В двух словах, утром организм делает всё, чтоб предоставить энергию, повысить работоспособность. Здесь важно не прозевать это состояние и всё, на этом этапе мы молодцы.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/0jjt7jajhb80jy-ve.jpeg" /><br />\r\n<span style="font-size:11px">Харуки Мураками на рабочем месте. Источник:&nbsp;<a href="https://medium.com/@yukettina423/haruki-murakami-has-never-experienced-writers-block-ae4852cd1bfa">Medium</a></span></p>\r\n\r\n<h5>Делаем что хотим с 12:00 до 21:00</h5>\r\n\r\n<p>В обед мозг устает &mdash; надо поесть. А чтоб занять себя после ланча, можно повторить за нашим писателем. Мураками это время заполняет разными активностями: бегает, плавает, читает книги и слушает музыку.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/murakami-running1.jpg" /><br />\r\n<span style="font-size:11px">Харуки Мураками на пробежке. Источник:&nbsp;<a href="https://www.leadingagile.com/2014/11/haruki-murakami-teaches-sustainable-pace/">Leadingagile</a></span></p>\r\n\r\n<h5>Кто куда, а мы в 21:00 идем спать</h5>\r\n\r\n<p>Сон будет более качественным, если работать сообща с циркадным ритмом &mdash; засыпать с заходом солнца и просыпаться с появлением дневного света. У всех людей разные биоритмы, но мы сегодня берем пример с Харуки Мураками, поэтому спать идем в это время. Так мы застанем все фазы как медленного, так и быстрого сна, организм полностью расслабится и восстановится, а нейромедиаторы успеют умело поработать. К утру мы получим стартер пак нужных веществ, что снизит уровень стресса и улучшит самочувствие в целом. Сказали же, классная вещь.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/isil-pehlevan-sleep-book-cover-mockup.jpg" /><br />\r\n<span style="font-size:11px">Обложка книги Харуки Мураками &quot;Сон&quot;. Источник:&nbsp;<a href="https://www.artstation.com/artwork/mDRnRE">Artstation</a></span></p>\r\n\r\n<p>Мураками практически всю жизнь придерживается режима и видит в этом ветви прогресса. Однако мы с вами не авторы <a href="https://www.meloman.kz/modern-prose/murakami-h-norvezhskij-les-1035486.html">&laquo;Норвежского леса&raquo;</a> и у нас есть свои биологические часы, под которые полезно будет урегулировать ритм жизни.<br />\r\n<br />\r\n*У него не было времени с нами поболтать, поэтому информацию о его режиме дня взяли из книги Мейсона Карри <a href="https://www.meloman.kz/management-strategy/karri-m-rejim-geniya-rasporyadok-dnya-velikih-lyudey.html">&laquo;Режим гения. Распорядок дня великих людей&raquo;</a>. Почитайте ее на досуге, если хотите узнать, как планировали свой день Рахманинов, Тесла, Джейн Остин, Набоков и другие гиганты.</p>	report-image/murakamicover.jpg	t	98	18	4				
2	2022-02-13 07:27:08.939861+00	2022-03-24 16:33:32.962146+00	Все знают, а ты нет: как начать инвестировать?	<p>Инвестиции, инвестиции, инвестиции, инвестиции, инвестиции, инвестиции, инвестиции, инвестиции, инвестиции, инвестиции, ИНВЕСТИРУЙ! ТЫ, СЕЙЧАС!</p>\r\n\r\n<p>Что? Объясните мне что это такое?</p>\r\n\r\n<p>Знакомая ситуация? Кажется, вы в танке: все вокруг инвестируют, а вы нет. Как будто никто и не обучался, а знали все о инвестициях с рождения. Но это не так. Учимся вместе.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/24/999.jpg" /><br />\r\n<span style="font-size:11px">Кадры из фильма &quot;Игра на понижение&quot;. Источник:&nbsp;<a href="https://www.wired.com/story/the-big-short-gamestop-meme-stock/">Wired</a></span></p>\r\n\r\n<h5>Куда инвестировать</h5>\r\n\r\n<p>Относительно простыми инвестициями считается недвижимость - однако, окупаемость проекта может занять много лет. Также вложиться можно в валюты или вклады (депозиты) - первая из которых нередсказуема, а вторая гарантирует доходность, которая не превышает инфляцию. Сегодня мы рассмотрим инвестирование в акции, что является ценной бумагой, подверждающая владельца совладельцом компании. Доля может быть совсем маленькой, но она все равно будет означать, что часть компании - ваша. &nbsp;Акции - это полноценный актив, источник дохода &nbsp;и ими легко управлять. Как недвижимость, машина - акции будут вашей собственностью. Вы можете подходом &ldquo;купить и забыть&rdquo; приобрести акции, а потом получить доход. Для этого необходимы брокеры. Это юридическое лицо, у которого есть лицензия торговать акциями и быть посредником между продовцом и покупателям.&nbsp;</p>\r\n\r\n<h5>Как зарабатывают</h5>\r\n\r\n<p>Теперь узнаем зачем это вообще начинать. Не потому, что вам друг или коллега сказал так, а просто потому, что хотите. На инвестициях можно заработать двумя способами:</p>\r\n\r\n<ol>\r\n\t<li>Курсовая разница. Купля-продажа акции компаний. Прибыль будет разницей в цене. Но стоит понимать, что это не слепая удача, а результат ваших действий. Когда купили, сколько вложили, какую компанию выбрали и когда продали.&nbsp;</li>\r\n\t<li>Дивиденды. Это пассивный доход - проценты прибыли крупных компаний. Компании распределяют это своим акционерам. Тут дело в вашей доле и во времени. Дивиденды обычно выплачиваются раз в год.</li>\r\n</ol>\r\n\r\n<p>Ок, мы узнали как зарабатывают инвесторы. Но каким должен быть инвестор? <strong>Инвестор это&hellip;</strong></p>\r\n\r\n<ul>\r\n\t<li><strong>обучен</strong> и <strong>знает</strong> как работают все процессы. Это большая ответственность - торговать на бирже, поэтому важно знать, что вы делаете. Обучение не должно останавливаться.&nbsp;</li>\r\n\t<li>грамотно оценивает <strong>какую сумму может вложить</strong>. К сожалению, биржа не банк, где при банкротстве вам вернут деньги. Акции компаний - также могут падать или обесцениваться. Если вы хотите вложить свои последние деньги - подумайте и еще раз подумайте.&nbsp;</li>\r\n\t<li>думает, сколько <strong>времени</strong> готов посвятить. Инвесторы это разные люди, а главное обычные люди. Они работают, растят детей или иногда вообще далеки от мира финансов. Оценивайте свое время и тратьте с умом. Для самостоятельной торговли&nbsp;</li>\r\n\t<li>естественно нужно больше времени: вы должны пройти обучение, изучать статистику, смотреть на динамику и выбирать акции. Есть и другой способ: довериться компаниям, которые будут делать все за вас. Вам останется давать деньги. Время останется у вас.&nbsp;</li>\r\n\t<li>выбирает <strong>стратегию</strong> и <strong>придерживается</strong> ее. Стратегия - это ваше поведение. Как, чем торгуете и как часто торгуете. Нужно подумать о факторах, которые могут повлиять на ваши решения. Ваша стратегия фокусируется на активах и периоде, на который вы хотите вложиться. Выбор стратегии важен - он смягчает риски и дает вам развиваться.&nbsp;</li>\r\n\t<li>может выбирать <strong>компанию-посредника</strong> и не дает мошенникам обмануть себя. С ростом популярности инвестиций, теперь на рынке стало 1000 мошенников на одного инвестора. Детальное изучения сайтов - только это может спасти вас.</li>\r\n\t<li><strong>не поддается эмоциям</strong>. Например, бывает подают акции - но жто не значит, что стоит боятся и сразу продавать акции. Надо ждать и слодовать своим планам. Не давайте эмоциям разрушать ваши сделки.&nbsp;</li>\r\n</ul>\r\n\r\n<p>Источники:</p>\r\n\r\n<p><a href="https://fincult.info/article/chto-nuzhno-znat-nachinayushchemu-investoru/" style="text-decoration:none"><span style="font-size:11pt"><span style="font-family:Arial"><span style="color:#b67906"><u>https://fincult.info/article/chto-nuzhno-znat-nachinayushchemu-investoru/</u></span></span></span></a></p>\r\n\r\n<p><a href="https://freedom24.kz/how-it-works/" style="text-decoration:none"><span style="font-size:11pt"><span style="font-family:Arial"><span style="color:#b67906"><u>https://freedom24.kz/how-it-works/</u></span></span></span></a></p>\r\n\r\n<p><a href="https://www.sberbank.ru/ru/person/investments/how_to_start_invest" style="text-decoration:none"><span style="font-size:11pt"><span style="font-family:Arial"><span style="color:#b67906"><u>https://www.sberbank.ru/ru/person/investments/how_to_start_invest</u></span></span></span></a></p>\r\n\r\n<p><a href="https://www.investopedia.com/articles/basics/06/invest1000.asp" style="text-decoration:none"><span style="font-size:11pt"><span style="font-family:Arial"><span style="color:#b67906"><u>https://www.investopedia.com/articles/basics/06/invest1000.asp</u></span></span></span></a></p>	report-image/888.jpg	t	343	19	3				
17	2022-02-18 11:07:06.369497+00	2022-03-25 20:53:56.931433+00	Личный опыт психотерапии	<p>Впервые я задумалась о терапии примерно в двадцать три года. На тот момент я переживала определенные изменения в жизни и, как это часто бывает, испытывала тревогу относительно будущего. Специалиста я нашла достаточно быстро. Оказалось, что многие мои знакомые уже были в терапии и охотно делились контактами центров и сервисов по подбору. Я же, в свою очередь, не имела абсолютно никакого опыта этом, если не считать пары прочтенных книг из категории популярной психологии, которые ожидаемо носили довольно поверхностный характер. Мне хотелось понять на личном опыте, что из себя представляет последовательная и основательная работа с психикой. Я четко понимала, что своими собственными силами мне не справиться. Главной задачей было найти своего психолога.&nbsp;</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/elliottherapy_5Mxv8c8.png" /><br />\r\n<span style="font-size:11px">Кадр из сериала &quot;Мистер Робот&quot;. Источник:&nbsp;<a href="https://identity-mag.com/stigmatizing-psychotherapy/">Identity.</a></span></p>\r\n\r\n<p>После нескольких дней переписки с приглянувшимися специалистами я наконец назначала время своей первой сессии. Сейчас я понимаю, что тогда я двигалась в темноте, на одной лишь интуиции. У меня не было понимания, о том, каким должен быть правильный психолог и как будет происходить наша работа. Информация в интернете давала общие советы вроде подбора психолога по образованию или методу терапии, а знакомые лишь говорили опираться на ощущение комфорта, вовремя сеансов. Однако, действительно осознать все аспекты терапии мне удалось лишь после полугода еженедельных сессий. И оказалось, что ни образования, ни способ его работы, ни твои уровень комфорта не являются ключевым при построении взаимоотношений с психологом.</p>\r\n\r\n<p>В общей сложности я провела в психотерапии около трех лет. Первые два года наши встречи не были постоянными. Мы встречались в периоды, когда я больше всего нуждалась в помощи. Каждый такой период был построен под конкретный запрос, актуальный на том момент времени,, и мы пытались найти решение с разной эффективностью. Какое-то время меня устраивал такой формат работы, но с началом локдауна я поняла,, что есть еще ряд определенных проблем, которые, как оказалось, я с успехом маскировала, нагружая себя работой и постоянным потоком новой информации.Оказавшись в своего рода, домашнем вакууме, мое подсознание решило показать мне, что на самом деле беспокоило его все эти годы.</p>\r\n\r\n<p>В общей сложности я провела в психотерапии около трех лет. Первые два года наши встречи не были постоянными. Мы встречались в периоды, когда я больше всего нуждалась в помощи. Каждый такой период был построен под конкретный запрос, актуальный на том момент времени,, и мы пытались найти решение с разной эффективностью. Какое-то время меня устраивал такой формат работы, но с началом локдауна я поняла,, что есть еще ряд определенных проблем, которые, как оказалось, я с успехом маскировала, нагружая себя работой и постоянным потоком новой информации.Оказавшись в своего рода, домашнем вакууме, мое подсознание решило показать мне, что на самом деле беспокоило его все эти годы.После нескольких недель размышлений я решила попробовать год непрерывных сеансов и посмотреть, что из этого выйдет. В тот момент я не ставила себе никаких целей относительно терапии. Конечно, у меня были определенные проблемы, которые мне хотелось проработать, но я не понимала, что конкретно я хочу видеть в себе или своей жизни в качестве результата года, проведенного с психологом. Однако, сейчас я могу сказать, что этот опыт стал одним из самых значимым в моей жизни. И хоть я и не могу назвать его полностью позитивным, но и жалеть об этом решении я тоже не вправе.&nbsp;</p>\r\n\r\n<p>За этот год качественно изменились мои отношения с близкими людьми. Я научилась строить отношения, в которых мне комфортно находиться и выражать свои эмоции. Бонусом стало избавление от комплексов и привычки все усложнять, а также страх не соответствовать. Однако, самое ценное, на мой взгляд, что я вынесла из всего опыта &ndash; это избавление от страх эмоциональной близости с другим человеком. Мои отношения с психологом стали самым интимным союзом в моей жизни. И здесь не идет речь о физических отношениях. Оказалось, что максимально открыться другому человеку и позволить себе предстать слабым стало для меня большим испытанием.&nbsp;Осознав это, многие другие вещи стали проясняться. Например, теперь я понимаю, почему веду себя так или иначе в определенных ситуациях, особенно в тех, где преобладает открытое проявление чувства привязанности со стороны другого человека. Также и другие люди стали менее сложными для восприятия, и оказалось, что проблемы решаются, если знать, как правильно взаимодействовать. В сущности, жизнь перестала казаться такой сложной, а уровень ненужной драмы существенно снизился. Возможно, со временем я смогла бы осознать все эти вещи сама и без терапии. Но я уверена, что мне потребовалось на это гораздо больше времени. Мне хочется думать, что мой годичный опыт психоанализа стал интенсивной программой обучения основам собственной личности.&nbsp;</p>	report-image/ElliotTherapy.png	t	292	21	1				
9	2022-02-16 07:03:03.609149+00	2022-03-21 15:04:31.916894+00	Money doesn’t have to be hard. 3 способа упростить вашу финансовую жизнь	<blockquote>\r\n<p><em>Вам не нужно быть гением, чтобы с умом относиться к деньгам</em></p>\r\n</blockquote>\r\n\r\n<p>Смышленые по вопросам финансов люди, которых я знаю, не являются гендиректорами, докторами или венчурными инвесторами. Наоборот, они ведут умеренные образы жизни. Инженеры, учителя, руководители строительных проектов*... многие из них &mdash; миллионеры, сколачивающие целые состояния, при этом остающиеся незаметными у всех на виду.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/44.jpg" /><br />\r\n<span style="font-size:11px">Floyd Mayweather</span><span style="font-size:11px">. Источник:&nbsp;<a href="https://ringsidereport.com/?p=63490">Ringsidereport</a></span><br />\r\n<br />\r\n<strong>Прикол вот в чём.</strong><br />\r\nМногие из них не понимают разницу между взаимным и биржевым инвестиционными фондами, не отличают криптовалюту от блокчейна, а ICO &mdash; от RSU. Они не самые подкованные, потому что им и не надо быть таковыми. Они знают: если долго делать несколько вещей безошибочно, то к тому времени, когда пенсия будет наступать на пятки, статус миллионера у них уже будет в кармане.<br />\r\nИтак, если этих умных инвесторов не назовешь самыми компетентными&hellip; то что такого они делают, что вы могли упустить?<br />\r\n<br />\r\n<strong>Главное &mdash; не усложнять.</strong><br />\r\nСамые богатые инвесторы фокусируются на 3-х простых действиях. Повторяя за ними, можно шустро продвинуться в сторону финансовой независимости.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/555.png" /><br />\r\n<span style="font-size:11px">Кадр из сериала &quot;Во все тяжкие&quot;. Источник:&nbsp;<a href="https://www.quora.com/In-Breaking-Bad-what-is-a-good-approximation-of-how-much-money-Skyler-had-in-the-storage-unit-when-she-showed-Walt-how-she-stopped-counting-it">Quora</a></span></p>\r\n\r\n<h5>1. Тратьте меньше, чем вы зарабатываете</h5>\r\n\r\n<p>Вы это уже знаете, извините. Однако советы вроде &ldquo;откладывайте часть денег с каждой зарплаты&rdquo;, &ldquo;тратьте меньше, чем вы зарабатываете&rdquo; вызывают насмешку у многих людей оттого, насколько простыми они звучат.</p>\r\n\r\n<blockquote>\r\n<p style="text-align:center"><em>&ldquo;Если бы это было так легко, все были бы до неприличия богатыми&rdquo;.</em></p>\r\n</blockquote>\r\n\r\n<p>Правда ведь? А вот и нет. &nbsp; &nbsp; &nbsp;<br />\r\nМы упускаем из виду простые вещи. Усложнение чего-то обрекает инвесторов выполнять слишком много дел и отвлекаться. Состоятельные люди (не путать с высокооплачиваемыми работниками, которые расточительствуют, только чтобы засветить своими кошельками) на жизнь тратят меньше, чем зарабатывают, а вышедшую разницу используют для вклада. С каждой зарплаты. Без исключения.</p>\r\n\r\n<blockquote>\r\n<p style="text-align:center"><em>&ldquo;Речь не о том, сколько денег вы добываете, а о том, сколько денег откладываете, насколько эффективно они работают на вас и сколько поколений вы покрываете своими сбережениями&rdquo;</em> &mdash; Роберт Т. Кийосаки.</p>\r\n</blockquote>\r\n\r\n<h6>Правило 25%</h6>\r\n\r\n<p>Если вы находитесь на начальных ступенях карьеры, представьте, что зарабатываете на 25% меньше, чем есть на самом деле. Планируйте ежемесячные затраты по этим цифрам, приноровитесь жить на этом уровне дохода и инвестируйте большую часть этих 25%. Если у вас высокий уровень дохода, но деньги для инвестирования можно пересчитать по двум мизинцам, то при следующей прибавке к зарплате раскошельтесь на инвестиционный портфель, вместо того, чтобы раздувать образ жизни до вселенских размеров. (прим. ред. Лайфстайл инфлейшн - феномен, описывающий состояние, когда человек отрезал себя от возможности стать wealthy)&nbsp;</p>\r\n\r\n<h5>2. Инвестируйте</h5>\r\n\r\n<p>Вот здесь-то люди действительно усложняют вещи, превращая все в игру, а не в систему буста благосостояния. Инвестирование.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/666.jpg" /><br />\r\n<span style="font-size:11px">Warren Buffet. Источник:&nbsp;<a href="https://www.cnbc.com/2018/12/17/warren-buffett-says-read-this-poem-when-the-market-is-tanking.html">CNBC</a></span></p>\r\n\r\n<p>Финансовая индустрия не желает, чтобы вы знали, насколько простым может быть инвестирование. Они хотят заставить вас думать, что это непосильно самоучкам, или что вы должны быть гениальным финансовым аналитиком и превосходить весь фондовый рынок, чтобы чуть больше получать &mdash; 6-8% в год оказалось недостаточным.</p>\r\n\r\n<p>У заголовков по финансовым вопросам есть цель &mdash; они хотят, чтобы вы кликнули. &nbsp; &nbsp; &nbsp;И это простое для них дело &mdash; запугивать, чтоб вы продолжали кликать. Почему? Им необходимо показать рекламодателям, что вы будете вновь и вновь возвращаться ради кликбейтов, не сулящих никаких надежд. Те состоятельные люди, которых я знаю, не читают новости по финансам ежедневно&hellip; или в целом любого рода новости. Они знают, что новости токсичны и что благодаря страху вас держат в узде, покушаясь на два ваших ценнейших ресурса:</p>\r\n\r\n<ol>\r\n\t<li>Время</li>\r\n\t<li>Энергия</li>\r\n</ol>\r\n\r\n<p>Вместо всего этого люди, живущие в достатке, следуют простой до нелепости философии: начать инвестировать как можно раньше, инвестировать часто; и делают целые состояния по этой формуле.</p>\r\n\r\n<p><em>Деньги х Время, потраченное на вложения = Достаток</em></p>\r\n\r\n<p>Формирование достатка не связано с выбором акции или правильного тайминга на рынке. Увы, есть крошечный процент людей, которые оказались везунчиками, имея дело с этими стратегиями, и именно они отшлифованы по всему интернету как истории успеха или фальшивые примеры того &ldquo;как стать богатым быстро инвестируя&rdquo;&nbsp;</p>\r\n\r\n<p>Увы, опыт крошечного процента людей, которым с этими стратегиями повезло, разлетелся по всему интернету в виде историй успеха и фальшивых примеров того, &ldquo;как быстро разбогатеть с помощью инвестиций&rdquo;. Это ведь те же самые люди, которые идут на большие риски и лишаются своего достатка, не успев даже закрепить заработанное. Это не достаток. Это азартные игры с деньгами в рассрочку. В один момент все может выйти из строя.&nbsp;</p>\r\n\r\n<h6>Налоговое инвестирование*</h6>\r\n\r\n<p>Многие из будущих миллионеров имеют что-то общее. Они используют три разных инвестиционных счета с долгосрочными налоговыми льготами. &nbsp;</p>\r\n\r\n<ol>\r\n\t<li>401k или Традиционный ИПС</li>\r\n\t<li>Roth 401k или Roth ИПС</li>\r\n\t<li>Индивидуальное брокерство</li>\r\n</ol>\r\n\r\n<p>Сколько вы инвестируете в каждый счет зависит от ваших целей, но у вас нет угроз в неравном распределении в ваши 20 и 30 лет. Выберите не дорогостоящий ETF (прим. ред. биржевой инвестиционный фонд), акции и/или криптовалюту. Либо используйте Робо-эдвайзер, если вы пассивный инвестор. Проводите исследования, чтобы разобраться, какие инвестиции принадлежат каждому счету. Наконец, превратите депозиты в эти счета на автопилоте и проверяйте, регулируйте каждый месяц, если необходимо. Но вам, скорее всего, этого не надо будет.</p>\r\n\r\n<h5>3. Повторяйте&nbsp;</h5>\r\n\r\n<p>Финансовый успех &mdash; это привычка. Инвесторы, сфокусированные на выполнении простых задач, будут иметь самые внушительные банковские счета через десять лет.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/03/05/860220-82588-koxakmtwcu-1519139055.jpg" /><br />\r\n<span style="font-size:11px">&nbsp;Кадр из фильма &quot;Волк с Уолл стрит&quot;</span><span style="font-size:11px">. Источник:&nbsp;<a href="https://scroll.in/reel/860220/books-versus-movie-both-versions-of-the-wolf-of-wall-street-lack-bite-and-a-moral-core">Scroll</a></span></p>\r\n\r\n<p style="text-align:center"><em>&ldquo;Вы не растете к уровню ваших целей. Вы падаете на уровни своих систем&rdquo; &mdash; Джеймс Клир.</em></p>\r\n\r\n<p>Не тратьте время на то, чтоб быть приклеенным к новостям по финансовым темам, часами искать лучшие акции или ерничать, еженедельно пытаясь нажать на кнопку перевода. Вместо этого выделите 30 минут в графике для &ldquo;финансового свидания&rdquo; раз в неделю. Защищайте это время, как если бы была назначена важная встреча. Используйте это для того, чтоб отслеживать свои финансовые цели и прогресс.</p>\r\n\r\n<h6>Еженедельные финансовые проверки</h6>\r\n\r\n<p>Миллионерам важно фокусироваться на важных задачах на протяжении недели без потери ценного времени и энергии. Вот, что они делают во время финансовых проверок (порой, бывает, и меня приглашают):</p>\r\n\r\n<ul>\r\n\t<li>Пересмотр недельных расходов</li>\r\n\t<li>Подтверждение того, что счета вовремя были оплачены</li>\r\n\t<li>Отслеживание прогресса &bull; Распределение части зарплаты инвестициям &nbsp; &nbsp; &nbsp;</li>\r\n</ul>\r\n\r\n<p>Это не высшая математика, но это больше, чем ноль часов в неделю, которые другие люди тратят на анализ своих личных финансов. Секрет в простоте и последовательности&hellip; никакой магии.</p>\r\n\r\n<h6>Сводим все воедино</h6>\r\n\r\n<p>Все хотят хорошо обращаться с деньгами, но это иногда кажется мистикой. Учитесь у людей, которые молча, тихо делают состояния&hellip; не будучи самыми умными инвесторами. Придерживайтесь простых рабочих вещей.</p>\r\n\r\n<ol>\r\n\t<li>Расходуйте меньше, чем вы зарабатываете, так у вас есть шанс сколотить состояние через инвестирование и предпринимательство.</li>\r\n\t<li>Используйте счета с выгодными налоговыми льготами и авто-депозитами, чтобы улучшить инвестиционный портфель в течение следующего десятилетия.</li>\r\n\t<li>Сделайте систему повторяющейся и используйте &ldquo;финансовые свидания&rdquo;, чтобы отслеживать и делать прогресс.</li>\r\n</ol>\r\n\r\n<p>Источник:</p>\r\n\r\n<p><a href="https://themakingofamillionaire.com/money-doesnt-have-to-be-hard-3-ways-to-simplify-your-financial-life-46fc51b05504" style="text-decoration:none"><span style="font-size:11pt"><span style="font-family:Roboto,sans-serif"><span style="color:#b67906"><u>https://themakingofamillionaire.com/money-doesnt-have-to-be-hard-3-ways-to-simplify-your-financial-life-46fc51b05504</u></span></span></span></a></p>	report-image/detail_99b2279f53911711a62785cf63752f7e.jpg	t	146	18	3				
14	2022-02-18 09:56:40.652133+00	2022-03-22 15:49:58.154612+00	Как выбрать своего психолога	<p>Впервые выбирать специалиста может быть довольно сложным занятием. Особенно, когда не понимаешь, на какие критерии ориентироваться. К счастью, сейчас в сети стало больше информации о выборе психолога и терапии в целом. Однако, мы не можем забывать, что психоанализ является сугубо индивидуальным опытом, поэтому обобщенные рекомендации могут носить лишь ознакомительный характер. Вам по-прежнему придется ориентироваться лишь на собственные ощущения во время сессии. После собственного опыта терапии я выделила для себя несколько аспектов, которыми руководствовалась при выборе специалиста.&nbsp;</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/good-will-hunting.jpg" /><br />\r\n<span style="font-size:11px">Кадр из фильма &quot;Умница по имени Уилл Хантинг&quot;. Источник:&nbsp;<a href="https://jparkerfitlife.wordpress.com/2019/04/19/four-lessons-counseling-taught-me-that-changed-my-outlook-on-life/">JParkerFitLife</a></span></p>\r\n\r\n<h5>Образование</h5>\r\n\r\n<p>Я думаю, этот пункт является самым очевидным и основным. Мало, кто знает, но психология все еще находится в так называемой серой зоне, где не очень понятны базовые входные требования относительно образования. Сейчас множество курсов, которые предлагают профессиональную переподготовку в психологов за несколько месяцев. Такие специалисты вызывают у меня сомнения. Если вы ищете качественную работу, то стоит поискать людей с более фундаментальным высшим образованием. Также психолог должен сам проходить терапию и супервизии у более опытных коллег. Это необходимо, чтобы специалист был в состоянии оказывать квалифицированную поддержку и мог выстраивать профессиональные отношения с клиентами.&nbsp;</p>\r\n\r\n<h5>Метод работы</h5>\r\n\r\n<p>В психотерапии существуют разные подходы. Например, гештальт-терапия, поведенческий подход, Юнгианский анализ, арт-терапия и многие другие. Понять детали каждого подхода и разобраться, какой именно подойдет человеку без опыта в психологии, может быть довольно сложно. Я лично считаю, вначале нет большой необходимости вникать в научные статьи относительно каждого подхода. Важнее начать и попробовать, и уже затем отталкиваться от своих ощущений. После определенного времени, проведенного в терапии, разбираться в тонкостях подходов станет легче, и тогда возникает более четкое понимание эффективности в каждом индивидуальном случае.&nbsp;</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/robin-williams-7.jpg" /><br />\r\n<span style="font-size:11px">Кадр из фильма &quot;Умница по имени Уилл Хантинг&quot;. Источник:&nbsp;<a href="https://www.women.com/lizvazquez/lists/therapy-scenes-in-movies">Women.com</a></span></p>\r\n\r\n<h5>Ощущение</h5>\r\n\r\n<p>Если говорить совсем просто, то вы должны чувствовать себя свободно при общении с психологом. Отношения с психологом как с любым другим человеком в вашей жизни будут изменяться по ходу времени &ndash; это нормально. Доверие и ощущение комфорта также будет развиваться лишь со временем. Мы не можем быть полностью открытыми перед незнакомыми людьми. Потребуется определенный опыт, пережитый вместе, чтобы мы могли чувствовать близость. Ваш психолог этому не исключение. Однако, что вы сможете понять уже на первой сессии &ndash; это чувствуете ли вы, что вас понимают? Если это ощущение не случилось, то стоит попробовать другого специалиста. Возможно, вам придется пройти нескольких психологов на пути, прежде чем вы найдете именно вашего человека. И это абсолютно нормально.&nbsp;</p>\r\n\r\n<h5>Сроки</h5>\r\n\r\n<p>Разные методы имеют разные сроки для достижения результата. Для каких-то методов работы достаточно трех сеансов, чтобы почувствовать первые изменения, другие же потребует более длительного периода. Вы всегда можете задать вопросы своему психологу, относительно примерных сроков и, основываясь на вашем запросе и текущем состоянии, он сможет вас сориентировать. Однако, вы должны помнить о собственных ощущениях. Если вам кажется, что уже долгое время нет эффекта или улучшений, вам стоит поделится об этом с вашим специалистом. Удивительно, но даже это может стать дополнительным источником информации для решения проблемы.&nbsp;</p>\r\n\r\n<h5>Цена</h5>\r\n\r\n<p>Будем откровенны, психотерапия &ndash; это недешево. У опытного психолога цены могут быть действительно высокими и на то есть объективные причины: постоянное повышение квалификации, собственная терапия и супервизия &ndash; это одни из нескольких факторов, влияющих на цену. Однако, с каждым годом терапия становится все доступнее благодаря различным психологическим сервисам, которые предоставляют возможность получить квалифицированную помощь по фиксированной цене. В большинстве случаев это является вполне доступным. Также, часто студенты или выпускники ставят невысокую цену на свои сессии. Это тоже может стать одним из вариантов, получить опыт терапии при ограниченном бюджете.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/main-qimg-d6aea15027be0e3da5cfd296c9ba84ac.jpeg" /><br />\r\n<span style="font-size:11px">Кадр из фильма &quot;Умница по имени Уилл Хантинг&quot;. Источник:&nbsp;<a href="https://www.quora.com/What-is-the-significance-of-Its-not-your-fault-in-Good-Will-Hunting">Quora</a></span></p>\r\n\r\n<p>Эти пять пунктов, по моему мнению, основные в поиске психолога. На первый взгляд, может показаться, что это сложный и долгий процесс, но в реальности, при правильном настрое на улучшение качества своей жизни, специалист находится быстро. Нужно лишь как в любом деле выработать правильную стратегию поиска и отбора. Эти пять критериев помогут создать базу для этого. Найти своего психолога &ndash; не самое легкое занятие, но в конечном счете результат будет того стоит.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	report-image/robin-williams-7.jpg	t	84	21	1				
18	2022-02-18 11:13:14.269062+00	2022-03-24 16:31:40.193+00	Вы бы купили свежие овощи в магазине, зная, что у продавца — ВИЧ?	<p>При проведении опроса в 2019 году населению разных стран было задано всео два вопроса: &ldquo;Как вы думаете, могут ли дети с ВИЧ посещать школу наравне с теми, у кого ее нет?&rdquo; и &ldquo;Купили бы вы свежие овощи в магазине, зная, что у продавца &mdash; ВИЧ?&rdquo;.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/diagnostika-vich-inf.jpeg" /><br />\r\n<span style="font-size:11px">Источник:&nbsp;<a href="https://shifamed.ru/articles/diagnostika-vich-infektsii-pochemu-tak-vazhna/">SHIFAMED</a></span></p>\r\n\r\n<p>Если вы ответили положительно на эти вопросы, у вас есть полное (нам хочется верить в это) понимание того, что такое ВИЧ. Если ответом был &ldquo;Нет&rdquo;, то вы, возможно, не окружены условиями, которые проливают свет на это заболевание. Давайте исправим это.</p>\r\n\r\n<p>По определению ВОЗ, <strong>вирус иммунодефицита человека</strong> &mdash; это инфекция, поражающая клетки иммунной системы. В результате атаки организм ослабевает и становится восприимчивым к заболеваниям.</p>\r\n\r\n<h5>Как, почему и еще раз как?</h5>\r\n\r\n<p>ВИЧ передается от человека к человеку. Вирусу важен кровоток, поэтому заражению люди могут подвергаться посредством грудного кормления, незащищенного секса (без презервативов) или инъекций с использованием нестерильной иглы (тут уже у кого какой боец: наркотики, татухи или пирсинги), включая переливание крови и другие хирургические вмешательства. У детей с врожденным ВИЧ или зараженных через грудное молоко заболевание может проявляться через заторможенное развитие речи и ходьбы, диарею, пневмонию и другие заболевания. Все те щекотливые мнения о том, что ВИЧ передается через рукопожатия, чих, кашель, поцелуи, через простыни и посуду зараженного, в бассейнах &mdash; миф на уровне мессенджерских паразитных рассылок.</p>\r\n\r\n<p>Коварная черта вируса в том, что он может быть тише воды и ниже травы, а затем удосужится заявить о себе спустя несколько месяцев через симптомы гриппа (а может вообще никак не проявляться годами и существовать в свое удовольствие). У некоторых людей могут наблюдаться: высокая температура, озноб, боль в горле и мышцах, сыпь, усталость, и другие симптомы. Это &mdash; одни из первых заметных сигналов ВИЧ-инфекции. Чем дальше &mdash; тем серьезнее. Без должного внимания человеку в спину будут дышать такие заболевания, как туберкулез, бактериальные заболевания, менингит, а конечной дестинацией обычно является СПИД.</p>\r\n\r\n<p>При подозрении на наличие вируса необходимо сдать анализы и пройти тесты. Любой желающий может провериться дома, купив экспресс-тест в аптеке. Однако это не гарантия достоверности, поэтому специалисты советуют сдавать лабораторные тесты в несколько этапов в медицинских учреждениях (при этом там никто никого не укусит). По результатам тестов проводится диагностика и выстраивается дальнейший медикаментозный путь. ВИЧ неизлечим, однако люди способны проживать счастливую и резвую жизнь, придерживаясь антиретровирусной терапии &mdash; принятие от двух противовирусных препаратов в день может служить иммунитету настоящей опорой.</p>\r\n\r\n<p>Важно знать, что табуированность &mdash; липкий друг недопониманий и неосведомленности. Делитесь, читайте, обсуждайте, будьте открыты &mdash; и вы обязательно осветите чей-то путь.<br />\r\n<br />\r\nИсточники:</p>\r\n\r\n<p><a href="https://www.catie.ca/ga-pdf.php?file=pdf/Brochures/HIV-basics.pdf" style="text-decoration:none"><span style="font-size:10pt"><span style="font-family:Roboto,sans-serif"><span style="color:#b67906"><u>https://www.catie.ca/ga-pdf.php?file=pdf/Brochures/HIV-basics.pdf</u></span></span></span></a><span style="font-size:10pt"><span style="font-family:Roboto,sans-serif"><span style="color:#b67906">&nbsp;</span></span></span></p>\r\n\r\n<p><a href="https://www.health.ny.gov/diseases/aids/general/resources/child/docs/chapter_1.pdf" style="text-decoration:none"><span style="font-size:10pt"><span style="font-family:Roboto,sans-serif"><span style="color:#b67906"><u>https://www.health.ny.gov/diseases/aids/general/resources/child/docs/chapter_1.pdf</u></span></span></span></a></p>\r\n\r\n<p><a href="https://www.who.int/health-topics/hiv-aids/#tab=tab_2" style="text-decoration:none"><span style="font-size:10pt"><span style="font-family:Roboto,sans-serif"><span style="color:#b67906"><u>https://www.who.int/health-topics/hiv-aids/#tab=tab_2</u></span></span></span></a><span style="font-size:10pt"><span style="font-family:Roboto,sans-serif"><span style="color:#b67906">&nbsp;</span></span></span></p>\r\n\r\n<p><a href="https://www.cdc.gov/hiv/basics/whatishiv.html" style="text-decoration:none"><span style="font-size:10pt"><span style="font-family:Roboto,sans-serif"><span style="color:#b67906"><u>https://www.cdc.gov/hiv/basics/whatishiv.html</u></span></span></span></a><span style="font-size:10pt"><span style="font-family:Roboto,sans-serif"><span style="color:#b67906"> </span></span></span></p>	report-image/gettyimages-1257380452_wide-9095f1cb28f5271b3d30c58349b27746c6fcbac7.jpg	t	303	18	5				
20	2022-02-23 08:14:11.072173+00	2022-03-24 16:32:23.8801+00	Ваш родитель: ангел или демон?	<p>Короткий тест. Прижмите палец, когда ваш ответ будет &ldquo;да&rdquo;.</p>\r\n\r\n<ul>\r\n\t<li>Вы не хотите, не можете и не будете делать что-либо без родителей?</li>\r\n\t<li>Вы ненавидите родителей и считаете их самыми ужасными?</li>\r\n\t<li>Вы чувствуете себя нервным и раздраженным в присутствии родителей?</li>\r\n</ul>\r\n\r\n<p>Если вы начали зажимать пальцы, то эта статья для вас. И не только. Нельзя заниматься самодиагнозом и делать поспешные выводы, но стоит задуматься на тему сепарации с родителем. Сегодня разберем все самые важные аспекты этого процесса.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/678x380.jpeg" /><br />\r\n<span style="font-size:11px">Кадр из фильма &quot;Чудо&quot;. Источник:&nbsp;<a href="https://www.kinopoisk.ru/film/722951/" target="_blank">Kinopoisk</a></span></p>\r\n\r\n<p>Отношения между ребенком и родителями очень сложная, важная тема. Человек связан со своими родителями во многих аспектах: эмоциональная, физическая и материальная. Эта психологическая связь, укрепленная материальной составляющей, оказывается, может не только воспитывать ребенка, но и убивать его.&nbsp;</p>\r\n\r\n<p>Представим ребенка, у которого две крайности: он не может принимать решения, действовать без присутствия или одобрения родителя или когда он является ярким представителем глубокого хейта и игнора в сторону родителя. Излишнее идеализирование родителей или наоборот демобилизация родителя в глазах ребенка - просит, ой, как просит, СЕПАРАЦИЮ!</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/home-alone-759.jpg" /><br />\r\n<span style="font-size:11px">Кадр из фильма &quot;Один Дома&quot;. Источник:&nbsp;<a href="https://indianexpress.com/article/entertainment/web-series/disney-home-alone-reboot-5886580/">Indianexpress</a></span></p>\r\n\r\n<p>Конечно, можно и представить и другие ситуации.&nbsp;</p>\r\n\r\n<p>Например, тяжелые отношения, которые свидетельствует об отсутствии сепарации, выглядят так:</p>\r\n\r\n<ol>\r\n\t<li>Размытые личные границы. Также нет границ, которые позволяют общаться, а дома всегда тревожно. Вы возможно так и не смогли почувствовать себя комфортно в общении.</li>\r\n\t<li>Зависимость/контрзависимость. Вы можете либо идеализировать или обесценивать. Или все вместе.&nbsp;</li>\r\n\t<li>Бесконечные ожидания от родителя, как он должен с вами вести или нереалистичная идея о том, каким должен быть ваш родитель. Вы ждете от них то, что возможно никогда не получите. Родители тоже люди, отделенные от вас.</li>\r\n\t<li>У вас есть обиды, страхи, злость. Вы раздражаетесь, когда они с вами.&nbsp;</li>\r\n\t<li>Постоянно испытываете чувство вины, а родители манипулируют.&nbsp;</li>\r\n\t<li>Нет понимания. А главное, вас не воспринимают за личность. В их глазах, вы ребенок, который до сих пор пьет молоко из груди матери. Отпускаем груд, одновременно. Ребенок и мать.&nbsp;</li>\r\n</ol>\r\n\r\n<p>И не говорите, что у вас из этого ничего нет. Это может быть и есть везде. От безобидных вещей - например, когда вы каждую неделю летаете в родительский дом до когда к вам, оказывается, дома никто не прислушивается. Однако, давайте развеем некоторые мифы касательно сепарации в целом.</p>\r\n\r\n<p>Это не всегда больно, и не всегда убивает вас. Он может быть безболезненным, быстрым, но не незаметным. Психологи утверждают, что сепарация происходит в подростковом возрасте, верхняя граница которой считается 24 лет. Также, сепарация не означает физическую сепарацию, она глубоко внутри, психологическое явление. К сожалению, убежать от проблемы - не получится. А в конце концов, связь между ребенком и родителем не разрывается. Она будет строится на уважении, любви и на понимании. Двух уже взрослых людей.&nbsp;</p>\r\n\r\n<p>Источники:</p>\r\n\r\n<p><a href="https://www.instagram.com/p/CKmLqiTMPh5/" style="text-decoration:none"><span style="font-size:9pt"><span style="font-family:Roboto,sans-serif"><span style="color:#ff9900"><u>https://www.instagram.com/p/CKmLqiTMPh5/</u></span></span></span></a></p>\r\n\r\n<p><a href="https://profi.ru/media/separacija-pjat-mifov-pro-otnoshenija-roditelej-i-detej" style="text-decoration:none"><span style="font-size:9pt"><span style="font-family:Roboto,sans-serif"><span style="color:#ff9900"><u>https://profi.ru/media/separacija-pjat-mifov-pro-otnoshenija-roditelej-i-detej</u></span></span></span></a></p>	report-image/678x380.jpeg	t	62	20	1				
15	2022-02-18 10:36:40.820465+00	2022-03-24 16:32:27.094932+00	Мифы о ЗППП	<p>Представьте, вы &mdash; Михаил Булгаков. Не знаменитый писатель, а тот, кем он был до: только выпустившийся с университета венеролог, &laquo;Мишка Булгаков&raquo;, которого отправили отвечать в одиночку за целую больницу в захолустье.&nbsp;</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/doktor-bulgakov36pic.jpeg" /><br />\r\n<span style="font-size:11px">Михаил Булгаков. Источник:&nbsp;<a href="http://булгаковская.москва/nikolay_afanasievich_bulgakov.html">Булгаковская</a></span></p>\r\n\r\n<p>В один день к вам приходит дядька и жалуется, что ему заложило горло. Дышится трудно, говорит. Вы проводите осмотр, обнаруживаете красноту в глотке, странные белые пятна в ней, сыпь на груди и делаете вывод: сифилис.&nbsp;</p>\r\n\r\n<p>А теперь загадка: могли ли вы заразиться от пациента?</p>\r\n\r\n<p>Если призадумались, эта статья станет вашим другом. Разберемся вместе в мифах и стереотипах о заболеваниях, передающихся половым путем (далее &mdash; ЗППП).</p>\r\n\r\n<h5>Миф намбер уан. &laquo;ЗППП неизлечимы&raquo;</h5>\r\n\r\n<p>Это зависит от самих заболеваний. Некоторые виды в самом деле неизлечимы, но на сегодняшний день половина заболеваний поддается полному излечению. К примеру, нашумевший хламидиоз, как и его товарищей &mdash; сифилис, гонорею и трихомониаз &mdash; можно вылечить полностью.</p>\r\n\r\n<h5>Миф намбер ту. &laquo;ЗППП на то и ЗППП, что передаются только половым путем&raquo;</h5>\r\n\r\n<p>Не совсем так. По многим данным, больше 90% венерических заболеваний передаются половым путем, однако общество любит рваться в диссонанс, где из-за остальных мизерных процентов люди мечутся из крайности в крайность. Так они создают два лагеря: одни верят, что ЗППП передаются всеми возможными путями, вербально и по радиоволнам, а другие убеждены, что названия венерических заболеваний говорят сами за себя и заразиться в бытовой жизни невозможно. Ниже привели список путей передачи ЗППП, не включая все виды полового акта:</p>\r\n\r\n<p>-&nbsp;через кровь. Происходит это посредством переливания крови и взаимодействия с открытыми ранами;<br />\r\n-&nbsp;через слюну. Речь идет о поцелуях, совместном выкуривании одной сигареты и использовании вещей личной гигиены и других;<br />\r\n-&nbsp;через грудное молоко;<br />\r\n-&nbsp;при совместном использовании полотенец, мочалок, нижнего белья, где помимо выделений могут жить лобковые вши. Хоть и возбудители ЗППП припеваючи живут только при температурных условиях организма человека и во внешней среде долго не протянут, риск заражения при длительном контакте никто не отменял;<br />\r\n-&nbsp;по иголкам и не стерилизованным медицинским инструментам.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/1.jpg" /><br />\r\n<span style="font-size:11px">Заболевания. Источник:&nbsp;<a href="Михаил Булгаков. Источник: Булгаковская">НМИРК</a></span></p>\r\n\r\n<h5>Миф намбер три. &laquo;Дети не болеют ЗППП&raquo;</h5>\r\n\r\n<p>К сожалению, болеют.&nbsp;</p>\r\n\r\n<h5>Миф намбер фор. &laquo;Нет симптомов - нет причин проверяться на наличие заболеваний и сдавать тесты&raquo;</h5>\r\n\r\n<p>Симптомы ЗППП часто могут быть неощутимы, а период, в котором человек с венерическим заболеванием может не ощущать дискомфорта, всегда варьируется. Если человек, к примеру, обнаружил у себя симптомы ЗППП, это означает, что инкубационный период мог длиться как месяц, так и круглый год. Или несколько лет. &nbsp;По данным ВОЗ, ежедневно обнаруживаются более одного миллиона случаев заражения ЗППП. Большинство из заболеваний протекают бессимптомно, поэтому важно развеивать мифы в голове, чтобы обезопасить себя и других людей.</p>\r\n\r\n<p>&nbsp;</p>	report-image/people-holding-red-condom_23-2148495879.jpg	t	97	18	5				
22	2022-02-23 08:18:36.624697+00	2022-03-24 16:33:34.899686+00	Половое воспитание - не только про секс	<p>Одна из причин по которой многие родители не хотят обучать детей половому воспитанию - это распространенный миф о том, что половое воспитание говорит только о сексе.<br />\r\nЭти предположения имеют место быть, так как слово пол переводится на английский язык как &laquo;секс&raquo; и вводит в заблуждение. Постараемся развеять мифы и рассказать вам о чем же на самом деле говорит половое воспитание.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/185c482d7a948154971628485b60a117.jpg" /><br />\r\n<span style="font-size:11px">Образ Насти Ивлеевой на &quot;Что было дальше?&quot;. Источник: </span><span style="font-size:11px"><a href="https://www.cosmo.ru/stars/news/05-06-2020/derzkiy-top-i-choker-nastyu-ivleevu-v-epatazhnom-obraze-prinyali-za-madonnu/">Cosmo</a></span></p>\r\n\r\n<ol>\r\n\t<li>Человеческое развитие (включая репродуктивную функцию, половое созревание, сексуальную ориентацию и гендерную идентичность)</li>\r\n\t<li>Отношения (включая семьи, дружбу, романтические отношения и свидания)</li>\r\n\t<li>Личные навыки (включая общение, переговоры и принятие решений)</li>\r\n\t<li>Сексуальное поведение (включая воздержание и сексуальность на протяжении всей жизни)</li>\r\n\t<li>Сексуальное здоровье (включая венерические заболевания, контрацептивы и беременность)</li>\r\n\t<li>Общество и культура (включая гендерные роли, разнообразие и сексуальность в СМИ)</li>\r\n</ol>\r\n\r\n<p>Обучен - значит вооружён. Таким слоганом известна система образования Нидерландов, где половое просвещение начинается ещё в детском саду. Как следствие, дети, которые знают себя, о своих границах, предпочтениях, о возможных последствиях половых отношении воздерживаются и начинают половую жизнь позже. Отзываются о своих первых разах подростки из Нидерланд положительно. Чаще всего говорят, это было весело и комфортно.&nbsp;</p>\r\n\r\n<p>Как происходит обучение? Нет, детям не вручают книгу камасутры как только они переступают порог детского сада.<br />\r\nОбучение проходит систематично с малых лет. Половое созревание как предмет пытаются сделать частью их жизни. Сначала рассказывают про отношения в семье, между друзей и незнакомыми людьми. Далее рассказывают о их строении тела посредством детских книг и фильмов. По мере возрастания уже заложенная базовая информация дополняется и воспринимается как норма.</p>\r\n\r\n<p>Давайте приведем пару примеров из урока с детского сада : Учительница показывает картинку, где ребёнок готовит еду с бабушкой и задаёт вопрос детям: если бабушка захочет вас поцеловать во время готовки, как вы отреагируете? Многие дети говорят хорошо, это ведь моя бабушка, некоторые говорят, что это бы им не понравилось. Далее следует вопрос к тем, кто был настроен негативно такому жесту : как вы дадите знать бабушке, что не хотите, чтобы она вас целовала? Дети отвечают, что просто открыто сказали бы об этом.<img alt="" src="/media/uploads/2022/02/23/istockphoto-1140591899-612x612-2.jpg" />&nbsp;<br />\r\n<span style="font-size:11px">Бабушка кормит внука. Источник: </span><span style="font-size:11px"><a href="https://www.istockphoto.com/photos/asian-grandma-eating">istock</a></span></p>\r\n\r\n<p>Ещё пример, на картинке мальчик и девочка обнимаются. Учитель спрашивает : в каких случаях незнакомые или знакомые друг другу люди обнимаются? Дети отвечают : когда они друг другу нравятся. А если они не нравятся друг-другу, то скорее всего они не будут друг друга обнимать.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/square_1280_80dcaf15a0e141ac7cadab00b850d8ad.jpg" /><br />\r\n<span style="font-size:11px">A$AP Rocky и Rihanna. Источник: </span><span style="font-size:11px"><a href="https://lenta.ru/news/2021/05/20/asap_rihanna/">lenta.ru</a></span></p>\r\n\r\n<p>Чуть старше, в классах 3-4 детей спрашивают как они чувствуют себя, когда влюбляются. Учителю отвечают, что у них бабочки в животе и они начинают волноваться когда видят объект симпатии. Дети делятся мнением, как лучше предложить встречаться. Им рассказывают, что наряду с отношениями идёт расставание. Говорят, что сообщит о расставании следует лицом к лицу, нежели через смс, ведь это может ранить человека.&nbsp;</p>\r\n\r\n<p>Посредством, казалось бы, таких простых вопросов детей с самого раннего детства учат знать свои границы и уважать чужие.&nbsp;</p>	report-image/oblozhka-2.jpg	t	130	20	5				
19	2022-02-23 08:06:05.048687+00	2022-03-24 18:12:56.312167+00	Бумажные стаканчики — супергерои или антагонисты?	<p>Бытует шуточное мнение, что изобретатели бумажных стаканчиков &mdash; это сценаристы мультсериала &laquo;Скуби-Ду&raquo;. Ведь мультсериал запомнился любовью к дедуктивным &mdash; хоть и детским &mdash; лабиринтам: преступники пускали пыль в глаза и творили зло, маскируясь под неприметных персонажей, а главным героям и зрителю предстояло найти чужого среди своих. Со стаканчиками почти так же. Из-за своего названия они кажутся экологичными, но на деле мало чем отличаются от пластиковых трубочек.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/starbucks-disposable-cups-shortage-ft-blog0222.jpg" /><br />\r\n<span style="font-size:11px">Источник:&nbsp;<a href="https://www.foodandwine.com/news/disposable-paper-cup-shortage-starbucks">Foodandwine</a></span></p>\r\n\r\n<h5>Обо всём по порядку</h5>\r\n\r\n<p>Наши бумажные антагонисты делаются, в основном, из полиэтилена и волокон целлюлозы, то есть за картоном есть пластиковая прослойка, не позволяющая промокнуть стаканчику. Отсюда и все беды. Сам стаканчик на переработку отдать не получится, так как бумагу от пластика отделить сложно. Это возможно, но затратно, не везде рискуют брать на себя это дело. А крышка посуды вовсе сделана из полистирола. Это 6-ая маркировка пластика &mdash; капризный вид, который почти невозможно переработать.&nbsp;</p>\r\n\r\n<p>Раз бумажные стаканчики мы с вами переработать не можем, то поговорим об естественном разложении.&nbsp;</p>\r\n\r\n<p>Некоторые стаканчики делаются из полилактида вместо полиэтилена, что делает их биоразлагаемыми. Полилактид, простым языком, получают из кукурузного крахмала или сахарного тростника вместо нефти. Казалось бы, вот &mdash; решение, однако нюанс таких стаканчиков в том, что их разложение возможно благодаря компостированию в определенных температурных условиях. Не все компосты способны на это, поэтому этот метод тоже мимо.</p>\r\n\r\n<p>А нашим героям из полиэтилена требуется 30 лет, чтоб разложиться. В среднем человек тратит на кофе 20 минут, не подозревая, что емкость от него будет разлагаться 15 768 000 минут. То есть пока расщепляются стаканчики, человечество успеет повторно отстроить Титаник, Эмпайр-стейт-билдинг, Бурдж-Халифу, Эйфелеву башню, стадион Уэмбли, мост Золотые ворота, при этом чуть больше 12 лет еще останется в запасе.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/cupcube2.jpg" /><br />\r\n<span style="font-size:11px">Инсталяция из бумажных стаканов. Источник:&nbsp;<a href="https://worldarchitecture.org/article-links/efvme/mule-studio-s-installation-made-of-5-555-paper-cups-draws-attention-to-minimal-waste-in-london.html">Worldarchitecture</a></span>&nbsp;</p>\r\n\r\n<p>Вдобавок пока стаканчик разлагается, он успеет отравить окружающую среду, что свойственно пластику. Наш полиэтилен, к примеру, еще до разложения выделяет токсины при сильном нагревании (что можно сказать и о некоторых других видах пластика, которые сначала разрушаются при нагревании, переохлаждении либо при взаимодействии с алкоголем, затем попадают в организм и пакостят, вызывая аллергию или беспокоя раковые клетки).</p>\r\n\r\n<h5>Подытожим</h5>\r\n\r\n<p>Какая часть стаканчика подлежит переработке? Никакая. &nbsp;<br />\r\nМожно ли отделить бумагу от пластика? Нельзя. Ладно, можно, но это хлопотно.<br />\r\nНадо ли нам-? Не надо.<br />\r\nИ что, даже в пункты переработки нельзя их сдать? Нет.</p>\r\n\r\n<p>А что, собственно, можно делать? Ответ один &mdash; использовать многоразовые бутылки, кружки и термосы. Это &mdash; первый шаг к осознанному потреблению добротных ресурсов, которые у нас пока что имеются.</p>\r\n\r\n<p>Памятка напоследок: это бумажные стаканчики разлагаются 30 лет, а расщепление других вещей из пластика может затянуться до 450-500 лет. Запомните, <strong>кейін ұят болмасын.</strong></p>\r\n\r\n<p>Источники:</p>\r\n\r\n<p><a href="https://www.youtube.com/watch?v=jQ2AmyQdxNQ" style="text-decoration:none"><span style="font-size:9pt"><span style="font-family:Roboto,sans-serif"><span style="color:#ff9900"><u>Экология в Казахстане | Как быть эко-френдли? | Garyshker podcast</u></span></span></span></a></p>\r\n\r\n<p><a href="https://earth911.com/recycling-guide/how-to-recycle-paper-cups/" style="text-decoration:none"><span style="font-size:9pt"><span style="font-family:Roboto,sans-serif"><span style="color:#ff9900"><u>https://earth911.com/recycling-guide/how-to-recycle-paper-cups/</u></span></span></span></a></p>	report-image/Starbucks-Disposable-Cups-Shortage-FT-BLOG0222.jpg	t	47	18	2				
16	2022-02-18 11:00:36.935649+00	2022-03-15 05:18:44.536755+00	Наш шанс: Для достижения более «справедливого и пригодного для жизни» будущего	<p>&ldquo;Мы жили в раю - теперь это ад&rdquo; &nbsp;- было сказано когда пожары в Эвбее уничтожили 120 000 акров земли. Ничего не осталось, все сгорело. Но это не просто единичный случай. А глобальное потепление - наша новая реальность.</p>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/original.jpg" /><br />\r\n<span style="font-size:11px">Грета Тунберг. Источник:&nbsp;<a href="https://www.theatlantic.com/science/archive/2019/09/why-greta-wins/598612/">The Atlantic</a></span></p>\r\n\r\n<p><strong>Что мы знаем</strong></p>\r\n\r\n<ul>\r\n\t<li>Человеческая деятельность - <strong>единственная причина</strong> глобального потепления. &nbsp;</li>\r\n\t<li>Это влияет на <strong>каждый участок</strong> планеты.</li>\r\n\t<li>С 1901 года, уровень моря повысился <strong>в три раза</strong> - &nbsp;к 2100 году, экстремальные повышения такого рода, которые случались раз в 100 года, станут ежегодными. &nbsp;</li>\r\n\t<li>Между 2011 и 2020 годами, наблюдалось самое <strong>максимальное понижение</strong> арктических вод с 1850 года. В 2050 году в Арктике не останется ни единого льда. &nbsp;</li>\r\n\t<li>Процент углекислого газа в атмосфере достиг <strong>своего максимума </strong>- таких показателей не было в последние 2 миллиона лет. &nbsp;Метан и оксид азота также содержаться в атмосфере в рекордных объемах.</li>\r\n</ul>\r\n\r\n<p>Да, новости мрачные: климатический кризис будет усугубляться, прежде чем он станет лучше. В новом крупном научном отчете ООН делается вывод о том, что страны и корпорации так долго откладывают сокращение выбросов ископаемого топлива, что мы больше не можем остановить усиление климатического кризиса в течение следующих 30 лет. Это одновременно отрезвляющая и, возможно, обездвиживающая оценка.</p>\r\n\r\n<p>&laquo;Мы сталкиваемся с огромной системной проблемой. Если это не заставляет вас чувствовать себя маленьким&hellip; если вы не чувствуете горя, гнева, беспокойства или какой-то смеси этих двух вещей, вы, вероятно, не обращаете внимания &raquo;, - сказала Кэтрин К. Уилкинсон, авторка &laquo;Все, что мы можем спасти&raquo; - &nbsp;сборник статей о климате и решений, о которых сейчас будет идти речь.&nbsp;</p>\r\n\r\n<p>Все, что нужно - это избежать потепления на 3-4 градусов цельсия планеты, что и есть наихудший сценарий развития. Но это просит крупных, системных и общих усилий. Например:</p>\r\n\r\n<ul>\r\n\t<li>Остановить добычу ископаемого топлива.</li>\r\n\t<li>Ограничить выброс метана насколько это возможно - газ, который не так долго остается в атмосфере как остальные.&nbsp;</li>\r\n\t<li>Закрыть, спрятать и не вспоминать о природных истоках углекислого газа для предотвращения выброса газа.&nbsp;</li>\r\n\t<li>Использовать только альтернативные ресурсы энергии. Вкладываться в экопроекты.&nbsp;</li>\r\n</ul>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/207971-1600x1067-ocean-pollution.jpg" /><br />\r\nЗагрязнение океанов<span style="font-size:11px">. Источник:&nbsp;<a href="https://greenliving.lovetoknow.com/Solutions_for_Ocean_Pollution">Love to know</a></span></p>\r\n\r\n<p>Все это общие рекомендации и вы наверное задумались: как же тогда участвовать &nbsp;в более системных изменениях, <strong>как личность</strong>?</p>\r\n\r\n<ol>\r\n\t<li><strong>Получать образование и сохранять надежду</strong>: подписывайтесь на разные информационные порталы и делитесь ими. Например, Climate Optimist от Гарвардской школы общественного здравоохранения, чтобы получать ежемесячную дозу ориентированных на решения вопросов климата.&nbsp;</li>\r\n\t<li><strong>Рассматривать решение как о возможности</strong>: Билл Маккиббен ( американский эколог) охарактеризовал деньги как кислород, который подпитывает пожары климатического кризиса, причем в некоторых случаях в буквальном смысле слова, поэтому можно брать деньги из источника проблемы и вложить их в решения. Например, для поддержания проектов. И это должно быть независимо от того, управляют ли они своими собственными инвестициями, своими компаниями или своими клиентами.</li>\r\n\t<li><strong>Включение осведомленности </strong>о климате в вашу повседневную работу: Климатический кризис можно описать как высший вызов добывающего капитализма и экономии ископаемого топлива, но также как высшее призвание. Поскольку мы намного больше, чем наш потребительский выбор, мы намного больше, чем наша практика голосования и гражданское участие (хотя это тоже важно), <strong>мы обязаны</strong> найти способы внести климат в свою профессиональную жизнь. Что бы не делали - все это должно отражать ваше решение спасти планету.&nbsp;</li>\r\n</ol>\r\n\r\n<p>Любой, кто это читает, имеет доступ к какой-то силе. Для сравнения, вы можете чувствовать себя ничтожным, но каким-то образом обладаете влиянием и властью. У вас есть возможности, которые можно использовать. Для достижения будущего, которого мы хотим.&nbsp;</p>\r\n\r\n<p>Источники:</p>\r\n\r\n<p><a href="https://www.instagram.com/impact/?hl=ru" style="text-decoration:none"><span style="font-size:9pt"><span style="font-family:Roboto,sans-serif"><span style="color:#ff9900"><u>https://www.instagram.com/impact/?hl=ru</u></span></span></span></a></p>\r\n\r\n<p><a href="https://www.nytimes.com/2021/08/13/podcasts/climate-change-solutions-ipcc.html" style="text-decoration:none"><span style="font-size:9pt"><span style="font-family:Roboto,sans-serif"><span style="color:#ff9900"><u>https://www.nytimes.com/2021/08/13/podcasts/climate-change-solutions-ipcc.html</u></span></span></span></a></p>	report-image/planet-earth-1401465793Ufs.jpg	t	75	19	2				
23	2022-02-23 10:08:09.302686+00	2022-03-25 11:22:23.81795+00	10 вступительных вопросов, которые задают психотерапевты	<h5>Статья поделена на 5 секции:</h5>\r\n\r\n<ul>\r\n\t<li>что ожидать</li>\r\n\t<li>вопросы</li>\r\n\t<li>типы психологов</li>\r\n\t<li>после первого сеанса</li>\r\n\t<li>следующие шаги&nbsp;</li>\r\n</ul>\r\n\r\n<p><img alt="" src="/media/uploads/2022/02/23/777.jpg" /><br />\r\n<span style="font-size:11px">Кадр из сериала &quot;Тед Лассо&quot;. Источник:&nbsp;<a href="https://nerdist.com/article/ted-lasso-season-two-mental-health-storyline/">Nerdist</a></span></p>\r\n\r\n<p>Хотите пройти терапию? Несмотря на то, что у каждого психотерапевта есть собственный(индивидуальный) подход к работе существует пару вопросов, которые задаются психологами во время первого приема.</p>\r\n\r\n<p>Вы записались на первый сеанс терапии с психотерапевтом. Это может быть ваша самая первая сессия или вы просто поменяли психолога.&nbsp;</p>\r\n\r\n<p>Учитывая оба варианта для некоторых людей первый поход к психотерапевтом может быть подавляющим(волнительным). Это абсолютно нормально волноваться и испытывать разные чувства : &nbsp;захотите вернуться обратно к старому психотерапевту или сомневаться идти или нет. Многие записываются наа прием, затем могут отменить или переназначить время записи.&nbsp;</p>\r\n\r\n<p>Не знание того, что тебя ждет впереди может заставлять делать эти вещи. Опять повторимся. что это нормально. Переживать перед первой встречей с кем-либо, даже если это психолог(психотерапевт)</p>\r\n\r\n<p>Чтобы помочь справиться с беспокойством, мы поделимся с вами наиболее частыми вопросами, которые психотерапевт может задать во время первой встречи.&nbsp;</p>\r\n\r\n<h5>Что ожидать?</h5>\r\n\r\n<p>Перед первой сессией вас могут попросить заполнить письменную или онлайн анкету. У вас есть право выбора : отвечать на вопросы или отказаться отвечать на вопросы в данный момент.</p>\r\n\r\n<p>Первая встреча является пробным периодом, поэтому психотерапевтом будет представлять себя и ознакомится с вашими данными, заполненными анкетами и запросами.&nbsp;</p>\r\n\r\n<p>Один из таких форм - это <strong>согласие об осведомленности&nbsp;</strong>(Informed consent)(разрешение) документ, который вы подписываете перед тем, как вступить в терапию. Этот документ может включать в себя:</p>\r\n\r\n<ul>\r\n\t<li>информацию о вашем терапевте(психологе/психотерапевте) - имя, учётные данные и номер лицензии.&nbsp;</li>\r\n\t<li>право на отказ и приватность&nbsp;</li>\r\n\t<li>оплата</li>\r\n\t<li>пределы конфиденциальности&nbsp;</li>\r\n\t<li>права пациента</li>\r\n\t<li>риски и преимущества</li>\r\n</ul>\r\n\r\n<p>В зависимости от ваших запросов и симптомов вам могут дать дополнительные опросник.</p>\r\n\r\n<p>Этот опросник может включать вопросы про ваше здоровье в целом : физическом и ментальном. Вопросы о здоровье вашей семьи тоже не исключение.</p>\r\n\r\n<p>Для того, чтобы получить максимальную выгоду от лечения постарайтесь быть открытыми и честными. Это поможет вашему психотерапевту подстроить лечение в нужное русло.&nbsp;</p>\r\n\r\n<h5>Вопросы, которые могут быть заданы</h5>\r\n\r\n<p>Определенное количество вопросов будут заданы вам во время первой встречи. Посредством задавание данных вопросов психотерапевт сможет ознакомиться с вашим прошлым, также как с настоящим и будущими целями.&nbsp;</p>\r\n\r\n<p>В зависимости от типа терапии, который вы выбрали вопросы могут видоизменяться</p>\r\n\r\n<h5>Почему вы нуждаетесь в терапии именно сейчас?&nbsp;</h5>\r\n\r\n<p>Люди входят в терапию по абсолютно разными причинам. Вас попросят объяснить ваши мотивы, чтобы понять конечную цель.</p>\r\n\r\n<p>Это позволит определиться не только с вашими целями, но и насколько специалист подготовлен и осведомлен по направлению, которому вы обращаетесь к нему. Если он сам недостаточно подкован, то поможет найти специалистов в этой области для вас или проконсультироваться с другими психотерапевтами обладающими знаниями в этой области.</p>\r\n\r\n<h5>Что вы ожидаете от терапии?&nbsp;</h5>\r\n\r\n<p>Существует распространённое заблуждение о том, как психотерапевт должен себя вести. Специалисты не дают советов или не говорят как чувствовать, поступать в том или ином случае. Такого рода поддержку можно получить обратившись к друзьям или семье.&nbsp;</p>\r\n\r\n<p>Психотерапевте помогут вам понять и осознать себя, достичь ваших целей и обдумать лучший для вас выбор.&nbsp;</p>\r\n\r\n<p>Они могут определить вызваны ли ваши симптомы психическим заболеванием и при необходимости порекомендуют(выпишут) лечение.&nbsp;</p>\r\n\r\n<h5>Были вы в терапии до этого момента? Каким был этот опыт?</h5>\r\n\r\n<p>Вопрос говорит сам за себя: оно поможет психотерапевту понять, что вы ожидаете от терапии. Это также даст им понятие о вашем прошлом неопрятном опыте.&nbsp;</p>\r\n\r\n<p>Некоторые люди идут в терапии с запросом преодоления трудностей в жизни, в то время как другие могут искать безопасное место, где бы их выслушали и поддержали.</p>\r\n\r\n<p>Какими бы ни были ваши причины обращения за терапией, вам не нужно стыдиться.</p>\r\n\r\n<h5>Есть ли у вас мысли о суициде или посещали ли они вас в течении последнего месяца?&nbsp;</h5>\r\n\r\n<p>В терапии есть пару исключении из конфиденциальности, и нанесение вреда себе или окружающим - есть одна из исключении.</p>\r\n\r\n<p>Если у вас возникали мысли о самоубийстве, честно рассказать о них - лучший способ получить помощь. Психотерапевт разработает план безопасности и попытается выяснить, нужны ли дополнительные меры.</p>\r\n\r\n<h5>Есть ли у вас мысли об убийстве или были ли у вас мысли об убийстве за последний месяц?&nbsp;</h5>\r\n\r\n<p>Это ещё одно исключение из правил конфиденциальности, за которым следует обеспечение безопасности вам и вашим близким.</p>\r\n\r\n<p>Помните, что у терапевта есть юридическая обязанность предупреждать и защищать людей в случае угрозы причинения вреда.</p>\r\n\r\n<h5>Есть ли в вашей жизни люди, которые готовы вас поддержать? Если да, то кто?&nbsp;</h5>\r\n\r\n<p>Психотерапевты задают этот вопрос так как поддержка повышает позитивное состояние ментального здоровья и хорошее самочувствие.</p>\r\n\r\n<p>Исследование доказало, что иметь близких друзей, которые готовы поддержать тесно связано с быстрым лечением(вылечиванием?) и понижением шансов суицида.</p>\r\n\r\n<h5>Какие у вас отношения с семьей?</h5>\r\n\r\n<p>Это поможет психотерапевту узнать много о вас и вашем прошлом, также выяснить здоровые ли у вас отношения в семье.&nbsp;</p>\r\n\r\n<p>Эти вопросы могут вызвать болезненные и неприятные воспоминания. Помните, что вам не нужно решать эти проблемы сейчас, если вы этого не хотите.</p>\r\n\r\n<h5>Как вы справляетесь со стрессом?</h5>\r\n\r\n<p>То, как вы справляетесь со стрессом поможет специалисту выяснить стратегии лечения и преодоления стресса, которые работают для вас.<br />\r\nЕсли у вас есть проблемы с преодолением стресса, в вашем плане лечения могут быть обучения методам и навыкам, которые вы можете попробовать. Если у вас уже имеются хорошие пути преодоления, то психотерапевт вам подскажет как ими эффективно пользоваться во время стресса.</p>\r\n\r\n<h5>Какие ваши сильные стороны?</h5>\r\n\r\n<p>Будьте открыты насчёт своих сильных сторон и качеств. Ваш психотерапевт поможет использовать ваши сильные стороны, когда вам плохо.</p>\r\n\r\n<h5>Каких целей вы хотите достичь терапией?</h5>\r\n\r\n<p>Возможно, вы многое привносите в сеанс терапии в отношении целей и того, над чем вы хотите работать.</p>\r\n\r\n<p>Этот вопрос поможет отсеять и сосредоточиться на действительно важном. Также позволит терапевту составить план лечения на основе ваших реакции.</p>\r\n\r\n<h5>Типы психотерапевтов</h5>\r\n\r\n<p>По данным Национального альянса по психическим заболеваниям (NAMI), есть много типов специалистов в области психического здоровья, которые могут предоставить терапию, в том числе:</p>\r\n\r\n<ol>\r\n\t<li>Консултанты, врачи и терапевты.<br />\r\n\tЭти профессионалы имеют степень магистра в области терапии или в смежных областях, таких как психология, супружеская и семейная терапия или психологическое консультирование. Эти профессионалы обучены использовать терапевтические методы и оценивать психическое здоровье человека.<br />\r\n\tОбщие лицензии в этой группе включают:<br />\r\n\tлицензированный профессиональный консультант (LPC) лицензированные терапевты по вопросам брака и семьи (LMFT) лицензированный консультант по лечению алкогольной и наркотической зависимости.</li>\r\n\t<li>Социальный работник<br />\r\n\tСоциальные работники очень похожи на LPC, поскольку они также имеют четкую подготовку по оценке и лечению психического здоровья человека. Кроме того, они имеют степень магистра в области социальной работы. Общие лицензии и сертификаты в этой группе: лицензированный клинический социальный работник (LCSW) лицензированный независимый социальный работник (LICSW) сертифицированный социальный работник (ACSW)</li>\r\n\t<li>Психологи.<br />\r\n\tЭти специалисты имеют докторскую степень в области психологии (PsyD), философии (PhD) или другой специальности, например, консультирования. Психологи обычно имеют более длительные и контролируемые программы обучения, чем профессионалы со степенью магистра. Хотя они могут проводить терапию, их также обучают проводить оценки и психологическое тестирование.&nbsp;</li>\r\n\t<li>Психиатры.<br />\r\n\tПсихиатры - это лицензированные врачи, изучавшие психиатрические состояния и прошедшие психиатрическую подготовку. Они могут проводить терапию, назначать и контролировать лекарства, а также диагностировать психические расстройства. Психиатры обычно имеют одну из следующих докторских степеней: доктор медицины (MD) врач остеопатической медицины (ДО)</li>\r\n</ol>\r\n\r\n<h5>После первой сессий&nbsp;</h5>\r\n\r\n<p>Ваша первая встреча может быть утомительной. Делиться своими эмоциями и вспоминать о неприятных моментах, чувствах в жизни может эмоционально истощать.</p>\r\n\r\n<p>Чувствовать усталость и слабость - нормально.</p>\r\n\r\n<p>Не спешите расстраиваться! Вы начали путь лечения - первые шаги на пути улучшения вашего самочувствия.&nbsp;</p>\r\n\r\n<p>После первого сеанса подумайте как вы и психотерапевт относитесь друг к другу. Если вам он не подошел, то ничего страшного в этом нет. Поиски хорошего специалиста, который лучше всего вам подходит вам и вашим потребностям может занять некоторое время.&nbsp;</p>\r\n\r\n<h5>И, что теперь?&nbsp;</h5>\r\n\r\n<p>Теперь, когда вы знакомы с вопросами, которые могут встречаться на первых сеансах вы можете чувствовать себя более расслабленно.&nbsp;</p>\r\n\r\n<p>Помните, что вам не обязательно отвечать на вопросы психотерапевту только потому, что он их вам задаёт.</p>\r\n\r\n<p>Безусловно, ответы на эти вопросы помогут понимать вас лучше, но также вы можете дать понять терапевту, что вам не комфортно делиться определённой информацией.&nbsp;</p>\r\n\r\n<p>Перевод:</p>\r\n\r\n<p><a href="https://psychcentral.com/blog/introductory-questions-therapists-commonly-ask" style="text-decoration:none"><span style="font-size:9pt"><span style="font-family:Roboto,sans-serif"><span style="color:#ff9900"><u>https://psychcentral.com/blog/introductory-questions-therapists-commonly-ask</u></span></span></span></a></p>	report-image/777.jpg	t	317	20	1				
\.


--
-- Data for Name: obrazovanie_report_likes; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_report_likes (id, report_id, user_id) FROM stdin;
117	18	5
125	17	1
126	6	5
130	16	6
131	18	1
132	18	15
134	15	6
135	18	22
136	22	22
137	5	1
138	17	6
139	23	15
140	1	1
26	2	4
141	7	1
29	3	5
63	3	1
75	6	9
76	8	1
79	15	1
80	14	1
89	6	1
91	18	10
93	15	10
94	14	10
98	1	9
103	17	5
109	7	6
\.


--
-- Data for Name: obrazovanie_report_saves; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_report_saves (id, report_id, user_id) FROM stdin;
20	1	1
22	2	4
23	2	1
25	3	5
28	18	6
29	9	1
31	8	1
33	14	9
34	18	1
37	17	1
52	3	1
53	5	1
54	18	10
55	15	10
59	18	5
60	16	6
62	9	9
63	23	1
66	7	1
\.


--
-- Data for Name: obrazovanie_video; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_video (id, created_at, updated_at, title, body, image, video, original_quality, views, convert_status, author_id, category_id, video_name, image_2, youtube, subs_kk, body_kk) FROM stdin;
14	2022-02-16 11:38:00.87502+00	2022-03-21 10:27:15.756712+00	Moldir Matzhanova поделилась тем, что помогает выбраться из апатии и уныния	<p>Поговорили с @matzhanova_ на тему ментального здоровья. Постарались раскрыть предмет, важность открытого общения между людьми, первопричины возникающих проблем. Обсудили, что помогает выбраться из апатии и уныния. Узнали про ее отношения к психологам/психотерапевтам и многое другое&hellip;</p>	video-image/222.png		1920	245	converted	17	1	mental_qanda_moldir.mp4	video-image/111.png	\N		
18	2022-02-21 13:26:54.849382+00	2022-03-10 10:58:39.107259+00	Казахстанская сатира о жизни	<p>Адиль Закенов - основатель казахстанского юмористического комикса &laquo;Шапалак&raquo;. В этом подкасте мы поговорили о сатире в комиксах, про зарождение проекта Шапалак и об острых гранях в политических шутках. &nbsp;</p>\r\n\r\n<p>Ведущий: Ислам Ишмухаметов &nbsp;<br />\r\nГость: Адиль Закенов</p>	video-image/culture_podcast_2_interes_cover.png		1080	51	converted	17	4	final.mp4	video-image/culture_podcast_1_2_mNJpBtl.jpg	\N		
35	2022-02-28 11:34:13.050531+00	2022-03-24 18:13:34.077043+00	Talks: Экология с разных точек зрения	<p>Резиновый ли мусорный полигон? Почему грязный пластик тяжелее перерабатывать? &nbsp;Что вреднее для человека: пластиковые стаканы или бумажные? Погрузитесь в тему экофилософии и узнайте ответы на вопросы в этом ролике.</p>	video-image/eco_talks_interes_cover.png		1080	104	converted	17	2	eco_talks_1.mp4	video-image/eco_talks_interes_cover_RcRyLwE.png	\N		
5	2022-02-14 10:13:57.44273+00	2022-03-25 11:51:49.08951+00	Как сортировать мусор?	<p>Что такое органика и чем она отличается от вторсырья? На эти вопросы вы найдете ответы в нашем новом ролике.</p>	video-image/garyshker.jpg	video-video/eco_2.mp4	1536	471	converted	17	2	eco_2.mp4		\N	video-subs-kk/kazsub_for_eco.vtt	
19	2022-02-22 08:10:46.729984+00	2022-03-13 17:22:15.755861+00	Как начать копить деньги?	<p>Деньги - это инструмент для комфортной жизни. Нехватка финансов - огромный ментальный риск. Грамотное управление личным бюджетом всегда обеспечит уверенное состояние. &nbsp;</p>\r\n\r\n<p>Узнайте в видео, как начать беречь, копить и умножать свой капитал.</p>	video-image/finance_masterclass_1_interes_cover.png		1080	33	converted	17	3	fin_masterclass_1.mp4	video-image/finance_masterclass_1_smortet_cover.png	\N		
27	2022-02-23 12:37:49.676649+00	2022-03-09 19:43:26.576003+00	Ложные эко-друзья	<p>В этом мастер классе мы развеяли мифы о том, что бумажные пакеты, стаканчики и хлопковая одежда менее вредны и быстро разлагаются. Предложили отличные альтернативы, которые обходятся дешевле и более выгодны в пользовании.</p>	video-image/eco_masterclass_1_interes_cover.png		1080	28	converted	17	2	eco_masterclass_2_fakefriends.mp4	video-image/eco_masterclass_1_smotret_cover.png	\N		
36	2022-02-28 11:44:04.528193+00	2022-03-24 18:13:21.472284+00	Talks: Как собраться в путешествие и немного о Garyshker	<p>Garyshker Talks на тему Путешествий, где наши спикеры затронули актуальную для нашего времени тему &mdash; путешествия, поделившись полезной информацией и жизненным опытом. Также на нем мы немного поговорили о нашем проекте, о том как пришла идея и почему путешествия сыграли в этом важную роль.</p>	video-image/culture_travel_qanda_smotret_cover_3.png		1080	122	converted	17	4	talks_travel_1.mp4	video-image/culture_travel_qanda_smotret_cover_4_Ju0xtT3.png	\N		
22	2022-02-22 09:36:49.221561+00	2022-03-19 22:12:29.917103+00	Askar Illyasov поделился своим видением темы полового воспитания	<p>Поговорили с нашим гостем - Аскаром Ильясовым, который поделился своим видением темы полового воспитания.&nbsp;</p>	video-image/askar_interes_cover.png		1440	60	converted	17	5	sexed_qanda_askar_light.mp4	video-image/askar_smotret_cover.png	\N		
20	2022-02-22 08:35:29.513108+00	2022-03-21 10:04:39.165999+00	Arman Yussupov о ментальном здоровье	<p>Поговорили с @yussupov21 про осеннюю хандру, и узнали его мнение о том, как он бережет свое ментальное здоровье. &nbsp;</p>\r\n\r\n<p>Бывает ли у вас хандра и как вы с этим боритесь?</p>	video-image/arman_interes_cover_2.png		1920	28	converted	17	1	mental_qanda_arman.mp4	video-image/arman_smotret_cover_3.png	\N		
29	2022-02-23 12:41:04.094474+00	2022-03-21 10:55:02.480983+00	Уходи, осенняя хандра!	<p>В этом мастер классе мы узнаем, откуда растут ноги осенней хандры и как с ней справляться.&nbsp;</p>	video-image/mental_masterclass_interes_cover.png		1080	26	converted	17	1	mental_masterclass_1.mp4	video-image/mental_masterclass_smotret_cover.png	\N		
28	2022-02-23 12:40:02.313029+00	2022-03-19 22:25:03.040858+00	Asselina об опыте ведения экологичного образ жизни	<p>Поговорили с @asseliina на тему эко-философии. Она поделилась опытом ведения экологичного образ жизни. Обсудили некоторые глобальные и локальные проблемы, касающиеся природы и ее загрязнения. Попытались разобраться, как нам способствовать улучшению экологической ситуации в мире.</p>	video-image/asselina_interes_cover.png		1920	54	converted	17	2	eco_qanda_asselina.mp4	video-image/asselina_smotret_cover.png	\N		
32	2022-02-23 12:44:34.491422+00	2022-03-24 18:14:31.656658+00	Сексуальное просвещение молодежи, проблема насилия и абортов	<p>Камила Туякбаева - сертифицированный тренер сети Y-PEER по вопросам сексуального и репродуктивного здоровья подростков. В этом подкасте мы обсудили тему сексуального просвещения молодежи, о проблемах насилия и абортов. &nbsp;Ведущий: Ислам Ишмухаметов &nbsp;Гость: Камила Туякбаева</p>	video-image/sexed_podcast_2_inters_cover.png		1080	103	converted	17	5	sexed_podcast_2_kamilla_light.mp4	video-image/sexed_podcast_2_smotret_interes.png	\N		
39	2022-03-18 12:15:14.590536+00	2022-03-25 11:31:04.389565+00	Rick Astley - Never Gonna Give You Up	<h6>Rick Astley - Never Gonna Give You Up</h6>	video-image/wallp.jpeg		\N	58	converted	6	4	asd	video-image/wallp_IzxOkdB.jpeg	dQw4w9WgXcQ		<h6>Rick Astley - Never Gonna Give You Up</h6>
37	2022-02-28 11:50:37.269004+00	2022-03-25 11:37:40.684363+00	Nagimuwa рассказала о важности путешествий в ее жизни	<p>Узнали у @nagimuwaa о важности путешествий в ее жизни.</p>	video-image/nagimuwa_travel_qanda_interes_cover.png		1920	208	converted	17	4	culture_qanda_1_travel.mp4	video-image/culture_travel_qanda_smotret_cover_2.png	\N		
31	2022-02-23 12:43:44.553158+00	2022-03-24 12:40:14.533049+00	Презервативы: как покупать, проверять и использовать?	<p>Говорить о контрацепции можно и нужно, поэтому наш мастер класс будет полезен как подросткам, так и взрослым.&nbsp;</p>	video-image/sexed_masterclass_interes_cover.png		1080	92	converted	17	5	sexed_masterclass_1.mp4	video-image/sexed_masterclass_smotret_cover.png	\N		
26	2022-02-23 12:34:04.090616+00	2022-03-24 18:13:55.23557+00	Про осознанное потребление, сортировку и KWR	<p>Виктория Горобцова - сооснователь компании Kazakhstan Waste Recycling (KWR), которая занимается переработкой вторсырья. Эко-философия - это стиль жизни. В этом выпуске подкаста мы узнаем, что такое гринвошинг, существует ли эко-полиэтилен и чем вреден органический отход, который, казалось бы, спокойно и быстро разлагается? &nbsp;</p>\r\n\r\n<p>Ведущий: Ислам Ишмухаметов &nbsp;</p>\r\n\r\n<p>Гость: Виктория Горобцова</p>	video-image/eco_podcast_2_interes_cover.png		1080	23	converted	17	2	eco_podcast_3_kwr_light.mp4	video-image/eco_podcast_2_smotret_cover.png	\N		
34	2022-02-25 05:48:31.22317+00	2022-03-24 18:14:34.540604+00	Про экологию простым языком	<p>Во сколько обойдется быть экологичным обычному человеку? Ответ на этот вопрос вы найдете в нашем выпуске подкаста и дополнительно узнаете, как тратить не больше, а грамотно. Также вас ждет интересный факт: почему же в ближайшем будущем не будет хватать еды и воды из-за климатических беженцев. &nbsp;</p>\r\n\r\n<p>Ведущие: Алдияр Жапарханов, Даурен Амиргазинов &nbsp;</p>\r\n\r\n<p>Гости: Михаил Беликов, Пакизат Сайлаубекова</p>	video-image/eco_pocast_interes_cover.png		1080	96	converted	17	2	eco_podcast_1_light.mp4	video-image/eco_podcast_cover_2.png	\N		
33	2022-02-23 12:45:38.178888+00	2022-03-24 18:14:37.348121+00	Как управлять личными финансами?	<p>Деньги - это инструмент для комфортной жизни. Нехватка финансов - огромный ментальный риск. Грамотное управление личным бюджетом всегда обеспечит уверенное состояние. Александра из @finclass поделится с нами советами как начать беречь, копить и умножать свой капитал! &nbsp;</p>\r\n\r\n<p>Ведущий: Ислам Ишмухаметов &nbsp;</p>\r\n\r\n<p>Гость: Александра Ильина</p>	video-image/finance_podcast_2_interes_cover.png		1080	85	converted	17	3	fin_podcast_1_homecredit_light.mp4	video-image/finance_podcast_2_smotret_cover.png	\N		
30	2022-02-23 12:42:26.295314+00	2022-03-21 10:54:34.69209+00	Жизнь на карантине глазами коуча	<p>Коуч - это ребрендинг психолога? Обсудили 8 сфер жизни, которые необходимые для поддержания гармоничной, целостной личности. А всем ли нужны эти восемь сфер? Вы можете слушать подкаст и отвечать на вопросы нашего спикера Мадины и выяснить свои нужды, расставить правильно приоритеты.</p>\r\n\r\n<p>Ведущий: Ислам Ишмухаметов &nbsp;</p>\r\n\r\n<p>Гость: Мадина Гаитова (Life Coach, у которой более 350 часов персональных сессии коучинга.)</p>	video-image/mental_podcast_1_interes_cover_2.png		1080	86	converted	17	1	mental_podcast_1_couch_light.mp4	video-image/mental_podcast_1_smotret_cover.png	\N		
23	2022-02-23 04:57:46.924496+00	2022-03-16 05:20:11.23567+00	Знать можно предотвратить. Знать нельзя допускать.	<p>Ребенок не хочет целовать дальних родственников, но его заставляют? Этот подкаст заставит вас задуматься, чем это чревато. Еще вы узнаете о том, почему стоит начать готовиться объяснять своим детям о половом воспитании прямо сейчас. &nbsp;</p>\r\n\r\n<p>Ведущие: Алдияр Жапарханов, Даурен Амиргазинов &nbsp;</p>\r\n\r\n<p>Гости: Асель Шаназарова (сексолог &nbsp;проекта uyatemes.kz), Шолпан Каржаубаева (гинеколог, руководитель Молодежного центра здоровья)</p>	video-image/sexed_podcast_1_interes_cover.png		1080	43	converted	17	5	sexed_podcast_1_light.mp4	video-image/sexed_podcast_1_smortet.png	\N		
25	2022-02-23 09:13:39.896506+00	2022-03-09 19:45:17.007963+00	Горная жизнь. Как правильно готовиться к походу?	<p>Дикая природа никого не щадит, поэтому важно быть уверенным в надёжности людей, с которыми вы поднимаетесь в горы. Популяризация горного туризма растет, образование стоит на месте. В этом подкасте вы узнаете, почему важно знать о квалификации горного гида и быть подготовленным к любым случаям в горах. &nbsp;</p>\r\n\r\n<p>Ведущий: Ислам Ишмухаметов &nbsp;</p>\r\n\r\n<p>Гость: Асель Исанова (основатель школы пребывания в дикой природе ТАМЫР.)</p>	video-image/eco_podcast_3_interes_cover.png		1080	44	converted	17	2	eco_podcast_2_tamyr_light.mp4	video-image/eco_podcast_3_smotret_cover.png	\N		
24	2022-02-23 07:13:01.654873+00	2022-03-24 18:14:54.744991+00	Кино и творческие люди	<p>Ержан Габдуллин - глава пост-продакшен студии SLA Bazelevs, которая является компанией Тимура Бекмамбетова и известна такими фильмами, как: &laquo;Ёлки&raquo;, &laquo;Время первых&raquo;, &laquo;Выкрутасы&raquo;. В этом подкасте мы поговорили о том, как делает кино Тимур Бекмамбетов, как проходит процесс монтажа и что особенного в жизни творческих людей.</p>\r\n\r\n<p>Ведущий: Ислам Ишмухаметов &nbsp;</p>\r\n\r\n<p>Гость: Ержан Габдуллин</p>	video-image/culture_podcast_1_interes_cover.png		1080	45	converted	17	4	culture_podcast_2_erzhan_light.mp4	video-image/culture_podcast_1_smotret_cover.png	\N		
8	2022-02-14 13:44:28.37857+00	2022-03-10 10:58:45.128985+00	Стартапы в Казахстане: как создать и развивать	<p>Евгений Мухамеджанов - управляющий директор Казахстанской фондовой биржи (KASE), директор стартап площадки KASE, основатель компании EcoNetwork, член клуба бизнес ангелов &laquo;Алматы&raquo;. В этом подкасте мы поговорили о стартапах Казахстана, об особенностях нашего рынка, и о том, как начать создавать стартапы. &nbsp;</p>\r\n\r\n<p>Ведущий: Ислам Ишмухаметов &nbsp;<br />\r\nГость: Евгений Мухамеджанов</p>	video-image/finance_podcast_1_smotret_cover.png	video-video/Как_создать_стартап.mp4	720	364	converted	17	3	Как_создать_стартап.mp4		\N		
\.


--
-- Data for Name: obrazovanie_video_likes; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_video_likes (id, video_id, user_id) FROM stdin;
25	5	1
41	8	1
47	14	1
59	8	15
60	5	6
62	8	6
63	5	15
65	18	6
66	18	15
69	14	15
71	22	6
72	25	15
73	24	15
74	34	6
76	27	1
77	37	6
78	29	9
79	37	1
81	37	9
\.


--
-- Data for Name: obrazovanie_video_saves; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_video_saves (id, video_id, user_id) FROM stdin;
10	8	1
11	5	1
26	14	1
30	5	6
39	8	6
40	5	15
43	34	6
45	37	9
\.


--
-- Data for Name: obrazovanie_video_video_quality; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_video_video_quality (id, video_id, videoquality_id) FROM stdin;
11	5	11
12	5	12
13	5	13
14	5	14
15	8	15
16	8	16
29	14	29
30	14	30
31	14	31
32	14	32
37	18	37
38	18	38
39	18	39
40	19	40
41	19	41
42	19	42
43	20	43
44	20	44
45	20	45
46	20	46
50	22	50
51	22	51
52	22	52
53	22	53
54	23	54
55	23	55
56	23	56
57	24	57
58	24	58
59	24	59
62	25	62
63	25	63
64	25	64
65	26	65
66	26	66
67	26	67
68	29	68
69	29	69
70	29	70
71	31	71
72	31	72
73	31	73
74	27	74
75	27	75
76	27	76
77	28	77
78	28	78
79	28	79
80	28	80
81	30	81
82	30	82
83	30	83
84	33	84
85	33	85
86	33	86
87	32	87
88	32	88
89	32	89
90	34	90
91	34	91
92	34	92
93	35	93
94	35	94
95	35	95
96	37	96
97	37	97
98	37	98
99	36	99
100	37	100
101	36	101
102	36	102
\.


--
-- Data for Name: obrazovanie_videoquality; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.obrazovanie_videoquality (id, created_at, updated_at, path, quality, width, height) FROM stdin;
1	2022-02-12 18:42:44.012644+00	2022-02-12 18:42:44.012685+00	y2mate.com_-_Насколько_они_сильны_вместе__Саске_в_шоке_от_силы_Минато_и_Наруто_1080p_360p.mp4	360	640	360
2	2022-02-12 18:42:44.179172+00	2022-02-12 18:42:44.17921+00	y2mate.com_-_Насколько_они_сильны_вместе__Саске_в_шоке_от_силы_Минато_и_Наруто_1080p_480p.mp4	480	854	480
3	2022-02-12 18:47:15.817148+00	2022-02-12 18:47:15.817186+00	y2mate.com_-_Насколько_они_сильны_вместе__Саске_в_шоке_от_силы_Минато_и_Наруто_1080p_720p.mp4	720	1280	720
4	2022-02-12 19:03:48.149327+00	2022-02-12 19:03:48.149365+00	y2mate.com_-_Насколько_они_сильны_вместе__Саске_в_шоке_от_силы_Минато_и_Наруто_1080p_360p.mp4	360	640	360
5	2022-02-12 19:06:43.375057+00	2022-02-12 19:06:43.375094+00	y2mate.com_-_Насколько_они_сильны_вместе__Саске_в_шоке_от_силы_Минато_и_Наруто_1080p_480p.mp4	480	854	480
6	2022-02-12 19:11:13.111615+00	2022-02-12 19:11:13.111652+00	y2mate.com_-_Насколько_они_сильны_вместе__Саске_в_шоке_от_силы_Минато_и_Наруто_1080p_720p.mp4	720	1280	720
7	2022-02-13 09:41:38.997424+00	2022-02-13 09:41:38.997466+00	Что_такое_гедонизм_360p.mp4	360	640	360
8	2022-02-13 09:42:02.883418+00	2022-02-13 09:42:02.883465+00	Что_такое_гедонизм_480p.mp4	480	854	480
9	2022-02-13 15:57:59.600761+00	2022-02-13 15:57:59.6008+00	Танджиро_и_Незуко_против_Руи_Клинок_рассекающии_демонов_360p.mp4	360	640	360
10	2022-02-13 15:59:00.861546+00	2022-02-13 15:59:00.861591+00	Танджиро_и_Незуко_против_Руи_Клинок_рассекающии_демонов_480p.mp4	480	854	480
11	2022-02-14 10:17:52.198719+00	2022-02-14 10:17:52.198762+00	eco_2_360p.mp4	360	640	360
12	2022-02-14 10:18:11.83149+00	2022-02-14 10:18:11.831536+00	eco_2_480p.mp4	480	854	480
13	2022-02-14 10:18:39.2312+00	2022-02-14 10:18:39.231241+00	eco_2_720p.mp4	720	1280	720
14	2022-02-14 10:19:20.452894+00	2022-02-14 10:19:20.452935+00	eco_2_1080p.mp4	1080	1920	1080
15	2022-02-14 13:47:39.930732+00	2022-02-14 13:47:39.930772+00	Как_создать_стартап_360p.mp4	360	640	360
16	2022-02-14 13:59:27.247328+00	2022-02-14 13:59:27.247368+00	Как_создать_стартап_480p.mp4	480	854	480
17	2022-02-15 07:48:39.976423+00	2022-02-15 07:48:39.976466+00	Запись_экрана_2022-02-08_в_21.05.33_360p.mov	360	640	360
18	2022-02-15 07:48:48.282488+00	2022-02-15 07:48:48.282532+00	Запись_экрана_2022-02-08_в_21.05.33_480p.mov	480	854	480
19	2022-02-15 07:48:59.782708+00	2022-02-15 07:48:59.782754+00	Запись_экрана_2022-02-08_в_21.05.33_720p.mov	720	1280	720
20	2022-02-15 07:49:13.45975+00	2022-02-15 07:49:13.459792+00	Запись_экрана_2022-02-08_в_21.05.33_1080p.mov	1080	1920	1080
21	2022-02-15 08:20:36.930551+00	2022-02-15 08:20:36.930593+00	видос_600мб_360p.mov	360	640	360
22	2022-02-15 08:22:36.451765+00	2022-02-15 08:22:36.45181+00	видос_600мб_480p.mov	480	854	480
23	2022-02-15 08:25:07.205478+00	2022-02-15 08:25:07.205523+00	видос_600мб_720p.mov	720	1280	720
24	2022-02-15 08:28:28.65759+00	2022-02-15 08:28:28.657632+00	видос_600мб_1080p.mov	1080	1920	1080
25	2022-02-15 08:40:59.069244+00	2022-02-15 08:40:59.069287+00	q_and_a_mental_health_360p.mp4	360	640	360
26	2022-02-15 08:42:51.801708+00	2022-02-15 08:42:51.801753+00	q_and_a_mental_health_480p.mp4	480	854	480
27	2022-02-15 08:45:10.24244+00	2022-02-15 08:45:10.242485+00	q_and_a_mental_health_720p.mp4	720	1280	720
28	2022-02-15 08:48:12.655611+00	2022-02-15 08:48:12.655656+00	q_and_a_mental_health_1080p.mp4	1080	1920	1080
29	2022-02-16 11:41:04.194149+00	2022-02-16 11:41:04.194188+00	mental_qanda_moldir_360p.mp4	360	640	360
30	2022-02-16 11:43:01.354438+00	2022-02-16 11:43:01.35448+00	mental_qanda_moldir_480p.mp4	480	854	480
31	2022-02-16 11:45:21.708118+00	2022-02-16 11:45:21.708154+00	mental_qanda_moldir_720p.mp4	720	1280	720
32	2022-02-16 11:48:18.33939+00	2022-02-16 11:48:18.33943+00	mental_qanda_moldir_1080p.mp4	1080	1920	1080
33	2022-02-20 17:29:48.075271+00	2022-02-20 17:29:48.075311+00	тест_видос_360p.mov	360	640	360
34	2022-02-20 17:29:50.28011+00	2022-02-20 17:29:50.280148+00	тест_видос_480p.mov	480	854	480
35	2022-02-20 17:29:52.837175+00	2022-02-20 17:29:52.83722+00	тест_видос_720p.mov	720	1280	720
36	2022-02-20 17:29:55.976689+00	2022-02-20 17:29:55.976732+00	тест_видос_1080p.mov	1080	1920	1080
37	2022-02-21 13:42:09.399791+00	2022-02-21 13:42:09.399835+00	final_360p.mp4	360	640	360
38	2022-02-21 13:55:32.69178+00	2022-02-21 13:55:32.691823+00	final_480p.mp4	480	854	480
39	2022-02-21 14:14:39.584416+00	2022-02-21 14:14:39.58446+00	final_720p.mp4	720	1280	720
40	2022-02-22 08:11:07.666006+00	2022-02-22 08:11:07.666049+00	fin_masterclass_1_360p.mp4	360	640	360
41	2022-02-22 08:11:24.014698+00	2022-02-22 08:11:24.014742+00	fin_masterclass_1_480p.mp4	480	854	480
42	2022-02-22 08:11:48.214972+00	2022-02-22 08:11:48.215015+00	fin_masterclass_1_720p.mp4	720	1280	720
43	2022-02-22 08:37:52.757601+00	2022-02-22 08:37:52.757642+00	mental_qanda_arman_360p.mp4	360	640	360
44	2022-02-22 08:40:02.554589+00	2022-02-22 08:40:02.554628+00	mental_qanda_arman_480p.mp4	480	854	480
45	2022-02-22 08:42:48.370248+00	2022-02-22 08:42:48.370289+00	mental_qanda_arman_720p.mp4	720	1280	720
46	2022-02-22 08:46:36.693244+00	2022-02-22 08:46:36.693285+00	mental_qanda_arman_1080p.mp4	1080	1920	1080
47	2022-02-22 09:01:40.255455+00	2022-02-22 09:01:40.255495+00	eco_masterclass_saltanat_360p.mp4	360	640	360
48	2022-02-22 09:01:55.482344+00	2022-02-22 09:01:55.482388+00	eco_masterclass_saltanat_480p.mp4	480	854	480
49	2022-02-22 09:02:17.153579+00	2022-02-22 09:02:17.15362+00	eco_masterclass_saltanat_720p.mp4	720	1280	720
50	2022-02-22 09:38:10.232902+00	2022-02-22 09:38:10.232945+00	sexed_qanda_askar_light_360p.mp4	360	640	360
51	2022-02-22 09:39:33.946694+00	2022-02-22 09:39:33.946734+00	sexed_qanda_askar_light_480p.mp4	480	854	480
52	2022-02-22 09:41:29.796757+00	2022-02-22 09:41:29.7968+00	sexed_qanda_askar_light_720p.mp4	720	1280	720
53	2022-02-22 09:44:49.444967+00	2022-02-22 09:44:49.445012+00	sexed_qanda_askar_light_1080p.mp4	1080	1920	1080
54	2022-02-23 05:09:14.820869+00	2022-02-23 05:09:14.820907+00	sexed_podcast_1_light_360p.mp4	360	640	360
55	2022-02-23 05:22:47.043167+00	2022-02-23 05:22:47.043209+00	sexed_podcast_1_light_480p.mp4	480	854	480
56	2022-02-23 05:43:30.73548+00	2022-02-23 05:43:30.735522+00	sexed_podcast_1_light_720p.mp4	720	1280	720
57	2022-02-23 07:25:24.151005+00	2022-02-23 07:25:24.151044+00	culture_podcast_2_erzhan_light_360p.mp4	360	640	360
58	2022-02-23 07:40:01.701855+00	2022-02-23 07:40:01.701897+00	culture_podcast_2_erzhan_light_480p.mp4	480	854	480
59	2022-02-23 08:01:44.809983+00	2022-02-23 08:01:44.810028+00	culture_podcast_2_erzhan_light_720p.mp4	720	1280	720
60	2022-02-23 09:23:26.166101+00	2022-02-23 09:23:26.166142+00	eco_podcast_2_tamyr_light_360p.mp4	360	640	360
61	2022-02-23 09:34:02.412194+00	2022-02-23 09:34:02.412236+00	eco_podcast_2_tamyr_light_480p.mp4	480	854	480
62	2022-02-23 11:41:44.957105+00	2022-02-23 11:41:44.957157+00	eco_podcast_2_tamyr_light_360p.mp4	360	640	360
63	2022-02-23 11:52:19.170574+00	2022-02-23 11:52:19.170617+00	eco_podcast_2_tamyr_light_480p.mp4	480	854	480
64	2022-02-23 12:08:23.416679+00	2022-02-23 12:08:23.416725+00	eco_podcast_2_tamyr_light_720p.mp4	720	1280	720
65	2022-02-23 12:47:14.779195+00	2022-02-23 12:47:14.779238+00	eco_podcast_3_kwr_light_360p.mp4	360	640	360
66	2022-02-23 13:03:04.825546+00	2022-02-23 13:03:04.825595+00	eco_podcast_3_kwr_light_480p.mp4	480	854	480
67	2022-02-23 13:26:59.437518+00	2022-02-23 13:26:59.437565+00	eco_podcast_3_kwr_light_720p.mp4	720	1280	720
68	2022-02-23 14:43:15.182488+00	2022-02-23 14:43:15.182539+00	mental_masterclass_1_360p.mp4	360	640	360
69	2022-02-23 14:43:30.046394+00	2022-02-23 14:43:30.046449+00	mental_masterclass_1_480p.mp4	480	854	480
70	2022-02-23 14:43:52.069033+00	2022-02-23 14:43:52.069081+00	mental_masterclass_1_720p.mp4	720	1280	720
71	2022-02-23 14:45:16.259505+00	2022-02-23 14:45:16.259556+00	sexed_masterclass_1_360p.mp4	360	640	360
72	2022-02-23 14:45:30.387964+00	2022-02-23 14:45:30.388015+00	sexed_masterclass_1_480p.mp4	480	854	480
73	2022-02-23 14:45:51.134874+00	2022-02-23 14:45:51.134925+00	sexed_masterclass_1_720p.mp4	720	1280	720
74	2022-02-23 14:49:06.767986+00	2022-02-23 14:49:06.768039+00	eco_masterclass_2_fakefriends_360p.mp4	360	640	360
75	2022-02-23 14:49:22.901452+00	2022-02-23 14:49:22.901503+00	eco_masterclass_2_fakefriends_480p.mp4	480	854	480
76	2022-02-23 14:49:46.48766+00	2022-02-23 14:49:46.487711+00	eco_masterclass_2_fakefriends_720p.mp4	720	1280	720
77	2022-02-23 14:52:41.462133+00	2022-02-23 14:52:41.462186+00	eco_qanda_asselina_360p.mp4	360	640	360
78	2022-02-23 14:53:02.096914+00	2022-02-23 14:53:02.096977+00	eco_qanda_asselina_480p.mp4	480	854	480
79	2022-02-23 14:53:26.74039+00	2022-02-23 14:53:26.74044+00	eco_qanda_asselina_720p.mp4	720	1280	720
80	2022-02-23 14:53:58.18094+00	2022-02-23 14:53:58.180992+00	eco_qanda_asselina_1080p.mp4	1080	1920	1080
81	2022-02-23 14:56:52.682306+00	2022-02-23 14:56:52.682366+00	mental_podcast_1_couch_light_360p.mp4	360	640	360
82	2022-02-23 15:20:35.821816+00	2022-02-23 15:20:35.821861+00	mental_podcast_1_couch_light_480p.mp4	480	854	480
83	2022-02-23 15:41:29.334171+00	2022-02-23 15:41:29.334218+00	mental_podcast_1_couch_light_720p.mp4	720	1280	720
84	2022-02-23 16:26:14.270764+00	2022-02-23 16:26:14.270811+00	fin_podcast_1_homecredit_light_360p.mp4	360	640	360
85	2022-02-23 16:39:23.890636+00	2022-02-23 16:39:23.890685+00	fin_podcast_1_homecredit_light_480p.mp4	480	854	480
86	2022-02-23 16:59:25.875352+00	2022-02-23 16:59:25.8754+00	fin_podcast_1_homecredit_light_720p.mp4	720	1280	720
87	2022-02-23 17:27:11.331276+00	2022-02-23 17:27:11.331322+00	sexed_podcast_2_kamilla_light_360p.mp4	360	640	360
88	2022-02-23 17:40:23.476641+00	2022-02-23 17:40:23.476692+00	sexed_podcast_2_kamilla_light_480p.mp4	480	854	480
89	2022-02-23 17:59:51.189856+00	2022-02-23 17:59:51.189904+00	sexed_podcast_2_kamilla_light_720p.mp4	720	1280	720
90	2022-02-25 05:59:12.71109+00	2022-02-25 05:59:12.711136+00	eco_podcast_1_light_360p.mp4	360	640	360
91	2022-02-25 06:11:46.484672+00	2022-02-25 06:11:46.484723+00	eco_podcast_1_light_480p.mp4	480	854	480
92	2022-02-25 06:30:55.885919+00	2022-02-25 06:30:55.885966+00	eco_podcast_1_light_720p.mp4	720	1280	720
93	2022-02-28 11:41:36.879021+00	2022-02-28 11:41:36.879062+00	eco_talks_1_360p.mp4	360	640	360
94	2022-02-28 11:50:11.873392+00	2022-02-28 11:50:11.873435+00	eco_talks_1_480p.mp4	480	854	480
95	2022-02-28 12:03:01.155076+00	2022-02-28 12:03:01.155118+00	eco_talks_1_720p.mp4	720	1280	720
96	2022-02-28 16:32:10.918636+00	2022-02-28 16:32:10.91868+00	culture_qanda_1_travel_360p.mp4	360	640	360
97	2022-02-28 16:35:25.775101+00	2022-02-28 16:35:25.775155+00	culture_qanda_1_travel_480p.mp4	480	854	480
98	2022-02-28 16:39:49.614533+00	2022-02-28 16:39:49.614587+00	culture_qanda_1_travel_720p.mp4	720	1280	720
99	2022-02-28 16:41:18.450946+00	2022-02-28 16:41:18.451004+00	talks_travel_1_360p.mp4	360	640	360
100	2022-02-28 16:46:36.410591+00	2022-02-28 16:46:36.410649+00	culture_qanda_1_travel_1080p.mp4	1080	1920	1080
101	2022-02-28 16:50:49.771592+00	2022-02-28 16:50:49.771657+00	talks_travel_1_480p.mp4	480	854	480
102	2022-02-28 17:01:30.996694+00	2022-02-28 17:01:30.996741+00	talks_travel_1_720p.mp4	720	1280	720
\.


--
-- Data for Name: organizations_organization; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.organizations_organization (id, created_at, updated_at, name_kk, name_ru, description_kk, description_ru, icon) FROM stdin;
\.


--
-- Data for Name: quiz_answer; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.quiz_answer (id, created_at, updated_at, answer_text, is_right, "order", question_id) FROM stdin;
\.


--
-- Data for Name: quiz_question; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.quiz_question (id, created_at, updated_at, technique, title, is_active, quiz_id) FROM stdin;
\.


--
-- Data for Name: quiz_test; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.quiz_test (id, created_at, updated_at, lesson_id) FROM stdin;
\.


--
-- Data for Name: rating_rating; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.rating_rating (id, created_at, updated_at, rating, body, object_id, content_type_id, owner_id) FROM stdin;
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
10	2022-03-02 06:44:27.443538+00	2022-03-02 06:50:32.964332+00	Как можно помочь проекту?	Вы уже вносите огромный вклад, вступая в сообщество и потребляя наш контент. Однако так как проект не имеет коммерческой основы, мы рады любой поддержке с вашей стороны. Поддержать проект финансово вы можете нажав на соответствующую кнопку в панели меню сайта.
9	2022-03-02 06:42:54.157664+00	2022-03-02 06:42:54.157685+00	Почему бесплатно и зачем вам это?	Цель простая, но весомая — быть полезными. Нам важно создавать благоприятные условия для развития общества, невзирая на затраты для создания контента и отсутствие коммерции.  Гарышкер — это наше «сен де бір кірпіш дүниеге…».
11	2022-03-02 06:44:49.271583+00	2022-03-02 06:44:49.271604+00	Кто финансирует Garyshker?	На данный момент проект живет и развивается за счет личных средств основателя. Для поддержания проекта скоро планируется привлечение партнеров и спонсоров, также любой желающий может сделать пожертвование на развитие проекта, перейдя в раздел “Поддержать проект”.
12	2022-03-02 06:45:14.282099+00	2022-03-02 06:45:14.28212+00	Почему Garyshker?	В переводе с казахского garyshker. — это "космонавт". Мы, в первую очередь, имеем безграничные мечты. Это означает, что каждая мечта соразмерна с космосом, а точнее — она, как и космос, не имеет границ.
6	2022-03-02 06:36:44.943887+00	2022-03-02 06:36:44.943908+00	Что дает регистрация на платформе?	Учетная запись открывает вам мир курсов, онлайн и оффлайн встреч, позволяет зарабатывать баллы, соревноваться с другими пользователями и тратить их в Магазине. Она также помогает генерировать идеи, реализовывать проекты, собирать слышащее, осознанное окружение и получать опыт.
7	2022-03-02 06:38:33.115521+00	2022-03-02 06:38:33.115544+00	Как открыть профиль?	Каждый может открыть профиль, пройдя регистрацию. Перед регистрацией просим внимательно ознакомиться с нашими ценностями и продолжить только в случае внутреннего согласия с ними.
8	2022-03-02 06:41:14.633149+00	2022-03-05 07:20:03.296006+00	Что такое "Читать", "Смотреть"?	"Читать": Ваша карманная книжка-справочник. Раздел предлагает статьи, написанные простым языком о непростых топиках. \r\n\r\n"Смотреть": Визуальное горючее. Раздел "Смотреть" — это обилие крутых подкастов, емких диалогов с блогерами и серий коротких мастер-классов с полезным багажом. В направлении уже есть материалы на тему медитации, полового воспитания, острых комиксов, экофилософии, стартапов с директорами и многих других полезностей.  Вкусная приправа к вашей еде.
13	2022-03-02 06:47:23.145586+00	2022-03-05 07:21:26.469368+00	Для чего нужна платформа?	Наша платформа — ядро экосистемы проекта. \r\n\r\nВо первых, Вы можете бесплатно смотреть, читать, слушать и изучать разношёрстный контент по нашим темам, а именно по: экофилософии, ментальному здоровью, половому воспитанию, финансовой грамотности и культуре. \r\n\r\nВо вторых, у вас есть возможность саморазвиваться, зарабатывать баллы и использовать их за ваше желание расти.\r\n\r\nВ третьих, мы выложили на сайте все текущие и завершенные проекты (как наши, так и партнёрские). Это может быть путеводителем для ивентов, на которые вы можете зарегистрироваться. \r\n\r\nВкратце, Garyshker. — это место встречи. Место, где объединяются все наши ресурсы, восполняемые и развиваемые ежедневно.
\.


--
-- Data for Name: user_user; Type: TABLE DATA; Schema: public; Owner: k_bekdaulet
--

COPY public.user_user (id, password, email, name, birth_date, image, city, last_login, verified, is_staff, is_active, is_superuser, created_at, updated_at, description, surname, user_type) FROM stdin;
10	pbkdf2_sha256$260000$aC2aBhh0mADTAbnAh3SiuS$wdT8oSH9+dC8SHNJaHzDy5H26sji82xNTeztbOnfDv4=	bonlyoonee@gmail.com	Бекс	2000-12-15	profile/75E69C6C-A0F7-4A38-B449-62BAA3D640CD.jpeg	Алматы	2022-02-20 09:16:50.875724+00	f	f	t	f	2022-02-20 09:16:50.875592+00	2022-02-20 19:32:28.028475+00	Люблю жизнь!!!	Машина	0
15	pbkdf2_sha256$260000$x05Ov3KgT0XFr82yLm2HJI$G3w2q0CVzuiPRPTiyEycD1jmmrz6mkbYfTmZSSWTvX4=	bonlyoone@gmail.com	Beks	2000-02-21	profile/never-gonna-give-you-up_tTixkjD.jpeg	Алматы	2022-02-21 06:51:07.062212+00	f	f	t	f	2022-02-21 06:51:07.062119+00	2022-02-22 12:30:20.818576+00	я кексик	Keks	2
4	pbkdf2_sha256$260000$PaR5AVSlBpe6QxQIhFAtLE$1RFmVVa2LXNtW0i06Jrj1SxXyCTwJBahhwaHwl7adts=	birzhan@gmail.com	Биржан	1996-02-14	profile/garysh_Q6L0rNu.jpg	Алматы	2022-02-14 08:46:04.537447+00	f	f	t	f	2022-02-14 08:46:04.537353+00	2022-02-14 08:47:26.653714+00	string	\N	1
24	pbkdf2_sha256$260000$i6eqNcCz1eqhMAkswNtSWw$X3vTfxq0PmBYbg3Qycq+/1/cItAkPwrSh0s2mZdTe/4=	toshiro.satori@gmail.com	Тоширо	1995-12-21	garysh.jpg	Нур-Султан	2022-03-01 05:15:49.134844+00	f	f	t	f	2022-03-01 05:15:49.134752+00	2022-03-01 05:15:49.134777+00	\N	Нео	3
8	pbkdf2_sha256$260000$xlGTdeyz0Lmodv7r7GVUPc$9Z4tNM8Q+277RTaEU5EVImcprsMbZOZ+tqxTwjSdasY=	abdo@gmail.com	Абди	2000-01-01	garysh.jpg	Алматы	2022-02-19 06:08:24.866785+00	f	f	t	f	2022-02-19 06:08:24.866684+00	2022-02-19 06:08:24.86671+00	Учусь	Салам	0
18	pbkdf2_sha256$260000$dlMIyz2y7kHM5VBd0DuLpR$h+jwJWdFbzzb80ssOXoBmFI5135z3bJnk12p16el05k=	akmaralintrovert@gmail.com	Akmaral	2001-01-01	garysh.jpg	Алматы	2022-02-23 05:35:53.662689+00	f	f	t	f	2022-02-23 05:35:53.662561+00	2022-02-23 05:38:20.369143+00			2
17	pbkdf2_sha256$260000$1BFJJz9JcEOn3qEivpYqg5$/5ST+yWvkqcK5gFFIpe5E/h3eokJzyVycuiitij4494=	garyshkerpro@gmail.com	Garyshker.	2019-10-31	profile/photo_2022-02-22_14.16.17.jpeg	Алматы	2022-02-22 08:09:45.88585+00	t	f	t	f	2022-02-22 08:09:45.885759+00	2022-02-26 14:09:57.632141+00		\N	3
11	pbkdf2_sha256$260000$Jdnrb9OHQ6noRPpAvScs4H$9mu/gq2ua74SOp4vnKP/RdPewqnciwLJutu9MGDi/Ug=	kairkhanovich.017@mail.ru	Ерасыл	1996-12-04	garysh.jpg	Караганда	2022-02-20 16:54:23.564945+00	f	f	t	f	2022-02-20 16:54:23.564818+00	2022-02-20 16:54:23.564846+00	\N	Жоламан	1
19	pbkdf2_sha256$260000$92DDhpMyocZfdUphwpEETm$zHmQBqxuWIrD0HtQCytVJV5iTLVPH0P3KD82vOZpivc=	aruzhanarticles@gmail.com	Aruzhan	2001-01-01	garysh.jpg	Алматы	2022-02-23 07:51:01.893789+00	f	f	t	f	2022-02-23 07:51:01.893669+00	2022-02-23 07:52:23.559499+00	\N		1
1	pbkdf2_sha256$260000$7kEvmjRg6chzt09kYHBZ9S$XCfRgqBzbMPbNeWOHIf7g97nNtOApNpCHgUYfYV6AqA=	beximiliano@gmail.com	Бекдаулет	2000-12-15	profile/never-gonna-give-you-up_jKwCf3H.jpeg	Almaty	2022-03-15 04:06:09.10475+00	t	t	t	t	2022-02-12 18:19:20.011716+00	2022-03-18 21:17:16.335589+00	я люблю себя!!!! Glhf	Казбеков	0
25	pbkdf2_sha256$260000$uFpxtKKgzZTRgdI5htbwVP$QquY+pjHPId+1ewG8pgzbURSU4D6dHVZTefmFFgDwWk=	nursultan.baikenov@gmail.com	Nursultan	1992-11-08	garysh.jpg	Алматы	2022-03-04 18:00:22.22548+00	f	f	t	f	2022-03-04 18:00:22.225394+00	2022-03-04 18:00:22.225418+00	\N	Baiken	2
16	pbkdf2_sha256$260000$NJF3JXLqPk8ThZzcZiJVUQ$tyjbp2A3naPUzBx4Dmdd8wsLQM03SICKkjeCjxGI3K4=	abdirinat@gmail.com	Abdi	2000-02-22	garysh.jpg	Алматы	2022-02-21 07:00:36.713702+00	f	f	t	f	2022-02-21 07:00:36.713616+00	2022-02-21 07:01:42.431076+00	\N		2
20	pbkdf2_sha256$260000$ro8skjGFnqPPr9fhAaFgUp$wqfbcjV8dps8Hicawejzrk5zPUczB+ZWaMGvvCXXaas=	aknietkenes@gmail.com	Akniet	2001-01-01	garysh.jpg	Павлодар	2022-02-23 07:53:24.974847+00	f	f	t	f	2022-02-23 07:53:24.974722+00	2022-02-23 07:53:50.928344+00	\N		2
21	pbkdf2_sha256$260000$oXwAQjZcDT9EWIvaUElUZg$+8B98NZFij1fMY7PkA1fsuzVQat3oX+o1nTZ9meYt2U=	ademaarticles@gmail.com	Adema	2001-01-01	garysh.jpg	Алматы	2022-02-23 07:55:04.346385+00	f	f	t	f	2022-02-23 07:55:04.346264+00	2022-02-23 07:55:27.419213+00	\N		1
22	pbkdf2_sha256$260000$rd2xn9lZl3gyHCl2b1DEoi$eZRtJ0Y1zNWSaXiuqhdKamfSZngUE4ZnUJzvb04aXJs=	muhammedaliaru@gmail.com	Али	2000-09-08	garysh.jpg	Алматы	2022-02-23 18:17:09.436059+00	f	f	t	f	2022-02-23 18:17:09.435976+00	2022-02-23 18:17:09.436+00	\N	Ару	2
26	pbkdf2_sha256$260000$nXc0dM2BGNQeu4FvkUVJfR$ajY9NCKvjfqPRoovVNF+sjU5LE2fNf84lBdCFOSvbc4=	sultangazyarshyn@gmail.com	Аршын	1996-05-27	garysh.jpg	Жезказган	2022-03-07 09:57:33.099289+00	f	f	t	f	2022-03-07 09:57:33.099194+00	2022-03-07 09:57:33.09922+00	\N	Султангазы	2
5	pbkdf2_sha256$260000$0Ycq4myTqTdtz3erIYN9yn$6Gc3xpUjYeHsEjAEB17QX5LAdtKfhbxW8lexjtF/BGg=	abdi@gmail.com	Абди	2000-02-14	profile/012920-AirbnbOrg-BOD-Joe-00298_RET1_1000x1500_SquareCrop.jpg	Алматы	2022-02-14 09:04:16.910546+00	f	f	t	f	2022-02-14 09:04:16.910458+00	2022-03-14 11:46:20.870708+00	string		1
27	pbkdf2_sha256$260000$f567zSNOm2caHioHZIdRYC$pP5QvwwjZChCEaasgBCAy11+Pu76bFcJpKVtGaaszPA=	info.broglasses@gmail.com	Danik	1992-06-03	garysh.jpg	Алматы	2022-03-17 07:10:25.61501+00	f	f	t	f	2022-03-17 07:10:25.61492+00	2022-03-17 07:10:25.614945+00	\N	Shaikemelov	2
23	pbkdf2_sha256$260000$I7bemcoM3PUpAmNF0tU17b$bfWeSWPXd/D5XtEH+U9lK1m1zHhxXsZrKpMCPlq4Xn4=	arai.nurtassova@gmail.com	Arai	1994-07-15	garysh.jpg	Алматы	2022-02-27 18:58:51.715256+00	f	f	t	f	2022-02-27 18:58:51.715165+00	2022-02-27 18:58:51.71519+00	\N	Nurtassova	3
6	pbkdf2_sha256$260000$yFWCVQ33IBt9t6pLwXFC5O$X3y5ZohSAosieFJPG2rVpLygOPRhxyNoWwSAaCmw72M=	kazbekov.bekdaulet2000@gmail.com	Т1000	2000-12-15	profile/lui.png	Алматы	2022-02-18 07:55:48.371371+00	f	f	t	f	2022-02-18 07:55:48.371253+00	2022-02-28 06:05:08.352904+00	убиваю направо и налево	Терминатор	2
9	pbkdf2_sha256$260000$ZdsPcfoQsxqNdB3S7Rd5ze$04iUsjYV21K65IJtKmSOqXUilS33TR1Uz24gQq2frYc=	birzhanshakarim@gmail.com	Birzhan	1996-10-31	profile/DDCDAA6E-C2C8-4B62-8983-72763EFA7474.jpeg	Алматы	2022-02-19 07:20:47.520726+00	t	f	t	f	2022-02-19 07:20:47.520606+00	2022-03-12 19:53:41.766681+00	ты кто?	Shakarim	2
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 124, true);


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

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 622, true);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, true);


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

SELECT pg_catalog.setval('public.django_content_type_id_seq', 31, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 82, true);


--
-- Name: dobro_dobro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.dobro_dobro_id_seq', 1, false);


--
-- Name: obrazovanie_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_category_id_seq', 6, true);


--
-- Name: obrazovanie_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_comment_id_seq', 159, true);


--
-- Name: obrazovanie_comment_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_comment_likes_id_seq', 362, true);


--
-- Name: obrazovanie_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_report_id_seq', 23, true);


--
-- Name: obrazovanie_report_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_report_likes_id_seq', 141, true);


--
-- Name: obrazovanie_report_saves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_report_saves_id_seq', 66, true);


--
-- Name: obrazovanie_video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_video_id_seq', 39, true);


--
-- Name: obrazovanie_video_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_video_likes_id_seq', 81, true);


--
-- Name: obrazovanie_video_saves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_video_saves_id_seq', 45, true);


--
-- Name: obrazovanie_video_video_quality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_video_video_quality_id_seq', 102, true);


--
-- Name: obrazovanie_videoquality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.obrazovanie_videoquality_id_seq', 102, true);


--
-- Name: organizations_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.organizations_organization_id_seq', 1, false);


--
-- Name: quiz_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.quiz_answer_id_seq', 1, false);


--
-- Name: quiz_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.quiz_question_id_seq', 1, false);


--
-- Name: quiz_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.quiz_test_id_seq', 1, false);


--
-- Name: rating_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.rating_rating_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.support_question_id_seq', 13, true);


--
-- Name: user_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.user_user_groups_id_seq', 1, false);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: k_bekdaulet
--

SELECT pg_catalog.setval('public.user_user_id_seq', 27, true);


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
-- Name: quiz_answer quiz_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.quiz_answer
    ADD CONSTRAINT quiz_answer_pkey PRIMARY KEY (id);


--
-- Name: quiz_question quiz_question_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.quiz_question
    ADD CONSTRAINT quiz_question_pkey PRIMARY KEY (id);


--
-- Name: quiz_test quiz_test_pkey; Type: CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.quiz_test
    ADD CONSTRAINT quiz_test_pkey PRIMARY KEY (id);


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
-- Name: quiz_answer_question_id_26edde8a; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX quiz_answer_question_id_26edde8a ON public.quiz_answer USING btree (question_id);


--
-- Name: quiz_question_quiz_id_b7429966; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX quiz_question_quiz_id_b7429966 ON public.quiz_question USING btree (quiz_id);


--
-- Name: quiz_test_lesson_id_758017a4; Type: INDEX; Schema: public; Owner: k_bekdaulet
--

CREATE INDEX quiz_test_lesson_id_758017a4 ON public.quiz_test USING btree (lesson_id);


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
-- Name: quiz_answer quiz_answer_question_id_26edde8a_fk_quiz_question_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.quiz_answer
    ADD CONSTRAINT quiz_answer_question_id_26edde8a_fk_quiz_question_id FOREIGN KEY (question_id) REFERENCES public.quiz_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quiz_question quiz_question_quiz_id_b7429966_fk_quiz_test_id; Type: FK CONSTRAINT; Schema: public; Owner: k_bekdaulet
--

ALTER TABLE ONLY public.quiz_question
    ADD CONSTRAINT quiz_question_quiz_id_b7429966_fk_quiz_test_id FOREIGN KEY (quiz_id) REFERENCES public.quiz_test(id) DEFERRABLE INITIALLY DEFERRED;


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
-- k_bekdauletQL database dump complete
--

