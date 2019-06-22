--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE database1;




--
-- Drop roles
--

DROP ROLE database1_role;
DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE database1_role;
ALTER ROLE database1_role WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md559e5e102dc20f956b632cc399120b17d';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;






--
-- Database creation
--

CREATE DATABASE database1 WITH TEMPLATE = template0 OWNER = database1_role;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect database1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8 (Debian 10.8-1.pgdg90+1)
-- Dumped by pg_dump version 10.8 (Debian 10.8-1.pgdg90+1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: database1_role
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO database1_role;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: database1_role
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO database1_role;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database1_role
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: database1_role
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO database1_role;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: database1_role
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO database1_role;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database1_role
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: database1_role
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO database1_role;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: database1_role
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO database1_role;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database1_role
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: database1_role
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO database1_role;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: database1_role
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO database1_role;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: database1_role
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO database1_role;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database1_role
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: database1_role
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO database1_role;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database1_role
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: database1_role
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO database1_role;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: database1_role
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO database1_role;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database1_role
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: database1_role
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO database1_role;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: database1_role
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO database1_role;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database1_role
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: database1_role
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO database1_role;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: database1_role
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO database1_role;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database1_role
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: database1_role
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO database1_role;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: database1_role
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO database1_role;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database1_role
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: database1_role
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO database1_role;

--
-- Name: keskon_ideaday; Type: TABLE; Schema: public; Owner: database1_role
--

CREATE TABLE public.keskon_ideaday (
    id integer NOT NULL,
    day character varying(20) NOT NULL,
    "momentDay" character varying(20) NOT NULL,
    "typeMeal" character varying(20) NOT NULL,
    "ideaDayUser_id" integer NOT NULL,
    "mealId_id" integer NOT NULL
);


ALTER TABLE public.keskon_ideaday OWNER TO database1_role;

--
-- Name: keskon_ideaday_id_seq; Type: SEQUENCE; Schema: public; Owner: database1_role
--

CREATE SEQUENCE public.keskon_ideaday_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keskon_ideaday_id_seq OWNER TO database1_role;

--
-- Name: keskon_ideaday_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database1_role
--

ALTER SEQUENCE public.keskon_ideaday_id_seq OWNED BY public.keskon_ideaday.id;


--
-- Name: keskon_mealidea; Type: TABLE; Schema: public; Owner: database1_role
--

CREATE TABLE public.keskon_mealidea (
    id integer NOT NULL,
    "mealIdeaName" character varying(250) NOT NULL,
    "mealIdeaDescription" character varying(250) NOT NULL,
    "mealIdeaCategory" character varying(20) NOT NULL,
    "mealIdeaSteps" text NOT NULL,
    "mealIdeaImage" character varying(100) NOT NULL,
    "mealIdeaPublisher_id" integer NOT NULL
);


ALTER TABLE public.keskon_mealidea OWNER TO database1_role;

--
-- Name: keskon_mealidea_id_seq; Type: SEQUENCE; Schema: public; Owner: database1_role
--

CREATE SEQUENCE public.keskon_mealidea_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keskon_mealidea_id_seq OWNER TO database1_role;

--
-- Name: keskon_mealidea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database1_role
--

ALTER SEQUENCE public.keskon_mealidea_id_seq OWNED BY public.keskon_mealidea.id;


--
-- Name: keskon_mealidea_mealIdeaLikes; Type: TABLE; Schema: public; Owner: database1_role
--

CREATE TABLE public."keskon_mealidea_mealIdeaLikes" (
    id integer NOT NULL,
    mealidea_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public."keskon_mealidea_mealIdeaLikes" OWNER TO database1_role;

--
-- Name: keskon_mealidea_mealIdeaLikes_id_seq; Type: SEQUENCE; Schema: public; Owner: database1_role
--

CREATE SEQUENCE public."keskon_mealidea_mealIdeaLikes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."keskon_mealidea_mealIdeaLikes_id_seq" OWNER TO database1_role;

--
-- Name: keskon_mealidea_mealIdeaLikes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: database1_role
--

ALTER SEQUENCE public."keskon_mealidea_mealIdeaLikes_id_seq" OWNED BY public."keskon_mealidea_mealIdeaLikes".id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: keskon_ideaday id; Type: DEFAULT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.keskon_ideaday ALTER COLUMN id SET DEFAULT nextval('public.keskon_ideaday_id_seq'::regclass);


--
-- Name: keskon_mealidea id; Type: DEFAULT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.keskon_mealidea ALTER COLUMN id SET DEFAULT nextval('public.keskon_mealidea_id_seq'::regclass);


--
-- Name: keskon_mealidea_mealIdeaLikes id; Type: DEFAULT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public."keskon_mealidea_mealIdeaLikes" ALTER COLUMN id SET DEFAULT nextval('public."keskon_mealidea_mealIdeaLikes_id_seq"'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: database1_role
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: database1_role
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: database1_role
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
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add meal idea	7	add_mealidea
26	Can change meal idea	7	change_mealidea
27	Can delete meal idea	7	delete_mealidea
28	Can view meal idea	7	view_mealidea
29	Can add idea day	8	add_ideaday
30	Can change idea day	8	change_ideaday
31	Can delete idea day	8	delete_ideaday
32	Can view idea day	8	view_ideaday
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: database1_role
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$JXF5G2U6W0g9$8f0zMC20wyRSdKjuso+gs94CqfJVdwZYc/0GmulC8L4=	\N	t	adminantonyboivin			antonyboivin@outlook.fr	t	t	2019-06-15 21:43:36.328462+00
3	pbkdf2_sha256$150000$f7BPoRxJIAaQ$qxi8AOc3YGadw489JNWrearZVNmcUMmwZ/8iMADABfQ=	2019-06-16 17:29:52.419162+00	f	antony			jeuxtony@outlook.fr	f	t	2019-06-16 17:03:10.335555+00
2	pbkdf2_sha256$150000$Ixa96EgjHonh$6amqgtXganCiDFVTsjyz0a3wmqfUhnJUya2llp/tZas=	2019-06-16 17:34:22.448065+00	f	Jessy			jessicahoarau@hotmail.com	f	t	2019-06-15 21:46:09.080467+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: database1_role
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: database1_role
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: database1_role
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: database1_role
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	keskon	mealidea
8	keskon	ideaday
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: database1_role
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-06-15 21:42:22.490222+00
2	auth	0001_initial	2019-06-15 21:42:22.574125+00
3	admin	0001_initial	2019-06-15 21:42:22.694944+00
4	admin	0002_logentry_remove_auto_add	2019-06-15 21:42:22.723315+00
5	admin	0003_logentry_add_action_flag_choices	2019-06-15 21:42:22.745084+00
6	contenttypes	0002_remove_content_type_name	2019-06-15 21:42:22.780831+00
7	auth	0002_alter_permission_name_max_length	2019-06-15 21:42:22.79241+00
8	auth	0003_alter_user_email_max_length	2019-06-15 21:42:22.814958+00
9	auth	0004_alter_user_username_opts	2019-06-15 21:42:22.83591+00
10	auth	0005_alter_user_last_login_null	2019-06-15 21:42:22.859178+00
11	auth	0006_require_contenttypes_0002	2019-06-15 21:42:22.864803+00
12	auth	0007_alter_validators_add_error_messages	2019-06-15 21:42:22.885435+00
13	auth	0008_alter_user_username_max_length	2019-06-15 21:42:22.91548+00
14	auth	0009_alter_user_last_name_max_length	2019-06-15 21:42:22.937452+00
15	auth	0010_alter_group_name_max_length	2019-06-15 21:42:22.959353+00
16	auth	0011_update_proxy_permissions	2019-06-15 21:42:22.979792+00
17	keskon	0001_initial	2019-06-15 21:42:23.044894+00
18	sessions	0001_initial	2019-06-15 21:42:23.111978+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: database1_role
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
q2eisuolnwh5pgpjqr3rsb0anczlcqyd	MzE2YzFhOGU5NDYxZWY1ZGViYjlmNTQ3ZjIxZmE2ZmVkNzBkZjI3ZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YjVmMWNmODgyNWI4OTVlOTdjNTk1YWEyODRmODEzNmQxMmYxZDc3In0=	2019-06-29 21:46:09.307835+00
gz8rnv0ggola9h96rybkmob233ddmft3	MzE2YzFhOGU5NDYxZWY1ZGViYjlmNTQ3ZjIxZmE2ZmVkNzBkZjI3ZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YjVmMWNmODgyNWI4OTVlOTdjNTk1YWEyODRmODEzNmQxMmYxZDc3In0=	2019-06-30 17:34:22.450633+00
\.


--
-- Data for Name: keskon_ideaday; Type: TABLE DATA; Schema: public; Owner: database1_role
--

COPY public.keskon_ideaday (id, day, "momentDay", "typeMeal", "ideaDayUser_id", "mealId_id") FROM stdin;
\.


--
-- Data for Name: keskon_mealidea; Type: TABLE DATA; Schema: public; Owner: database1_role
--

COPY public.keskon_mealidea (id, "mealIdeaName", "mealIdeaDescription", "mealIdeaCategory", "mealIdeaSteps", "mealIdeaImage", "mealIdeaPublisher_id") FROM stdin;
1	Gratin de pâtes	Gratin de pâtes avec du fromage à raclette	starchy	- Faire cuire des pâtes\r\n- Mélanger :\r\n    . pâtes\r\n    . gruyère\r\n    . dés de jambon\r\n- Ajouter une tranche de fromage à raclette\r\n- Mettre au four	media/gratin.jpg	2
2	Biscuit de Savoie	Gateau légé au framboise	dessert	- Préparer la pâte à gâteau\r\n- Verser dans un moule\r\n- Ajouter des framboise\r\n- mettre au four	media/bisSavoieFramboise.jpg	2
3	Bourritos	Bourritos au poulet	dough	- Préparer les légumes\r\n    . Tomates\r\n    . Salade\r\n- Préparer les morceaux de poulet\r\n- Faire chauffer les galettes	media/bourritos.jpg	2
4	Escalope Milanaise	Escalope Milanaise purée	meat	- Faire cuire les escalopes\r\n- Éplucher les pommes de terre \r\n- Préparer de la purée	media/escaMilanaisePuree.jpg	2
5	Galette au jambon	Galette au jambon	dough	- Dans une poêle :\r\n- Faire chauffer les galettes\r\n- Ajouter du fromage\r\n- Ajouter du jambon\r\n- Ajouter un jaune d’œuf\r\n- Replier la galette	media/galetteJam.jpg	2
6	Knacky pâtes	Knacky pâtes	starchy	- Faire bouillir de l'eau\r\n- Ajouter les pâtes\r\n- Attendre 2 min\r\n- Ajouter les Knacky	media/Knakpate.jpg	3
7	Knacky pâtes amélioré	Knacky pâtes amélioré	starchy	- Faire bouillir de l'eau\r\n- Ajouter les pâtes\r\n- Attendre 2 min\r\n- Ajouter les Knacky\r\n- Préparer du riz\r\n- Ajouter des légumes	media/knaRizPateLeg.jpg	3
8	Tarte flambée	Tarte flambée	dough	- Préchauffer le four 20 min à 220°\r\n- Enfourner les tartes flambées\r\n- Faire cuire pendant 8 à 10 min\r\n- Servir avec une petite salade	media/miniTarteFlambee.jpg	3
9	Paupiette de veau	Paupiette de veau aux légumes	meat	- Faire cuire les paupiettes\r\n- Faire cuire des haricots et des carottes\r\n- Ajouter des  légumes de ratatouille	media/paupietteVeauLegume.jpg	2
10	Poulet avec du blé	Poulet avec du blé	meat	- Faire cuire du poulet\r\n- Faire cuire du blé	media/pouletBle.jpg	2
11	Salade de gésiers	Salade de gésiers	vegetable	- Faire cuire de gésiers\r\n- Préparer de la salade\r\n- Ajouter des tomates cerises\r\n- Ajouter des morceaux de fromage\r\n- Ajouter des croutons	media/saladeGesiers.jpg	2
13	Salade de pâtes	Salade de pâtes	starchy	- Faire cuire des pâtes\r\n- Ajouter de morceaux de jambon\r\n- Ajouter des morceaux de fromage\r\n- Ajouter des tomates cerise	media/saladePates.jpg	3
14	Tarte flambée au fromage	Tarte flambée au fromage	dough	- Préchauffer le four 20 min à 220°\r\n- Ajouter des tranches de fromage\r\n- Enfourner les tartes flambées\r\n- Faire cuire pendant 8 à 10 min\r\n- Servir avec une petite salade	media/tarteFlambeRaclette.jpg	3
18	Tarte au thon	Tarte au thon et tomate	dough	- Faire cuire la pâte\r\n- Couper les tomates en rondelle\r\n- Faire cuire 20 min\r\n- Ajouter la pulpe de tomate, le thon et les rondelles de tomate\r\n- Assaisonner\r\n- Enfourner 15 min à 200°		2
\.


--
-- Data for Name: keskon_mealidea_mealIdeaLikes; Type: TABLE DATA; Schema: public; Owner: database1_role
--

COPY public."keskon_mealidea_mealIdeaLikes" (id, mealidea_id, user_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database1_role
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database1_role
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database1_role
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database1_role
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database1_role
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database1_role
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database1_role
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database1_role
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database1_role
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Name: keskon_ideaday_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database1_role
--

SELECT pg_catalog.setval('public.keskon_ideaday_id_seq', 1, false);


--
-- Name: keskon_mealidea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database1_role
--

SELECT pg_catalog.setval('public.keskon_mealidea_id_seq', 18, true);


--
-- Name: keskon_mealidea_mealIdeaLikes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: database1_role
--

SELECT pg_catalog.setval('public."keskon_mealidea_mealIdeaLikes_id_seq"', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: keskon_ideaday keskon_ideaday_pkey; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.keskon_ideaday
    ADD CONSTRAINT keskon_ideaday_pkey PRIMARY KEY (id);


--
-- Name: keskon_mealidea_mealIdeaLikes keskon_mealidea_mealIdeaLikes_mealidea_id_user_id_e434e9af_uniq; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public."keskon_mealidea_mealIdeaLikes"
    ADD CONSTRAINT "keskon_mealidea_mealIdeaLikes_mealidea_id_user_id_e434e9af_uniq" UNIQUE (mealidea_id, user_id);


--
-- Name: keskon_mealidea_mealIdeaLikes keskon_mealidea_mealIdeaLikes_pkey; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public."keskon_mealidea_mealIdeaLikes"
    ADD CONSTRAINT "keskon_mealidea_mealIdeaLikes_pkey" PRIMARY KEY (id);


--
-- Name: keskon_mealidea keskon_mealidea_pkey; Type: CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.keskon_mealidea
    ADD CONSTRAINT keskon_mealidea_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: keskon_ideaday_ideaDayUser_id_c99efaf8; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX "keskon_ideaday_ideaDayUser_id_c99efaf8" ON public.keskon_ideaday USING btree ("ideaDayUser_id");


--
-- Name: keskon_ideaday_mealId_id_9674d2fa; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX "keskon_ideaday_mealId_id_9674d2fa" ON public.keskon_ideaday USING btree ("mealId_id");


--
-- Name: keskon_mealidea_mealIdeaLikes_mealidea_id_c4225974; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX "keskon_mealidea_mealIdeaLikes_mealidea_id_c4225974" ON public."keskon_mealidea_mealIdeaLikes" USING btree (mealidea_id);


--
-- Name: keskon_mealidea_mealIdeaLikes_user_id_2ae15562; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX "keskon_mealidea_mealIdeaLikes_user_id_2ae15562" ON public."keskon_mealidea_mealIdeaLikes" USING btree (user_id);


--
-- Name: keskon_mealidea_mealIdeaPublisher_id_b2f98c72; Type: INDEX; Schema: public; Owner: database1_role
--

CREATE INDEX "keskon_mealidea_mealIdeaPublisher_id_b2f98c72" ON public.keskon_mealidea USING btree ("mealIdeaPublisher_id");


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: keskon_ideaday keskon_ideaday_ideaDayUser_id_c99efaf8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.keskon_ideaday
    ADD CONSTRAINT "keskon_ideaday_ideaDayUser_id_c99efaf8_fk_auth_user_id" FOREIGN KEY ("ideaDayUser_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: keskon_ideaday keskon_ideaday_mealId_id_9674d2fa_fk_keskon_mealidea_id; Type: FK CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.keskon_ideaday
    ADD CONSTRAINT "keskon_ideaday_mealId_id_9674d2fa_fk_keskon_mealidea_id" FOREIGN KEY ("mealId_id") REFERENCES public.keskon_mealidea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: keskon_mealidea_mealIdeaLikes keskon_mealidea_mealIdeaLikes_user_id_2ae15562_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public."keskon_mealidea_mealIdeaLikes"
    ADD CONSTRAINT "keskon_mealidea_mealIdeaLikes_user_id_2ae15562_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: keskon_mealidea keskon_mealidea_mealIdeaPublisher_id_b2f98c72_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public.keskon_mealidea
    ADD CONSTRAINT "keskon_mealidea_mealIdeaPublisher_id_b2f98c72_fk_auth_user_id" FOREIGN KEY ("mealIdeaPublisher_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: keskon_mealidea_mealIdeaLikes keskon_mealidea_meal_mealidea_id_c4225974_fk_keskon_me; Type: FK CONSTRAINT; Schema: public; Owner: database1_role
--

ALTER TABLE ONLY public."keskon_mealidea_mealIdeaLikes"
    ADD CONSTRAINT keskon_mealidea_meal_mealidea_id_c4225974_fk_keskon_me FOREIGN KEY (mealidea_id) REFERENCES public.keskon_mealidea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8 (Debian 10.8-1.pgdg90+1)
-- Dumped by pg_dump version 10.8 (Debian 10.8-1.pgdg90+1)

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: database1_role
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8 (Debian 10.8-1.pgdg90+1)
-- Dumped by pg_dump version 10.8 (Debian 10.8-1.pgdg90+1)

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: database1_role
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

