--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO demo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO demo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO demo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO demo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO demo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO demo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO demo;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO demo;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO demo;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO demo;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO demo;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO demo;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE django_admin_log (
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


ALTER TABLE django_admin_log OWNER TO demo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO demo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO demo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO demo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO demo;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO demo;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO demo;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO demo;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO demo;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: heatmap_heatmap; Type: TABLE; Schema: public; Owner: demo
--

CREATE TABLE heatmap_heatmap (
    id integer NOT NULL,
    location geography(Point,4326)
);


ALTER TABLE heatmap_heatmap OWNER TO demo;

--
-- Name: heatmap_heatmap_id_seq; Type: SEQUENCE; Schema: public; Owner: demo
--

CREATE SEQUENCE heatmap_heatmap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE heatmap_heatmap_id_seq OWNER TO demo;

--
-- Name: heatmap_heatmap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: demo
--

ALTER SEQUENCE heatmap_heatmap_id_seq OWNED BY heatmap_heatmap.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: heatmap_heatmap id; Type: DEFAULT; Schema: public; Owner: demo
--

ALTER TABLE ONLY heatmap_heatmap ALTER COLUMN id SET DEFAULT nextval('heatmap_heatmap_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add heatmap	7	add_heatmap
20	Can change heatmap	7	change_heatmap
21	Can delete heatmap	7	delete_heatmap
22	Can add site	8	add_site
23	Can change site	8	change_site
24	Can delete site	8	delete_site
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('auth_permission_id_seq', 24, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, false);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	heatmap	heatmap
8	sites	site
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('django_content_type_id_seq', 8, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-04-15 15:21:54.914469-07
2	auth	0001_initial	2017-04-15 15:21:54.96047-07
3	admin	0001_initial	2017-04-15 15:21:55.000335-07
4	admin	0002_logentry_remove_auto_add	2017-04-15 15:21:55.012261-07
5	contenttypes	0002_remove_content_type_name	2017-04-15 15:21:55.035262-07
6	auth	0002_alter_permission_name_max_length	2017-04-15 15:21:55.042403-07
7	auth	0003_alter_user_email_max_length	2017-04-15 15:21:55.053077-07
8	auth	0004_alter_user_username_opts	2017-04-15 15:21:55.064978-07
9	auth	0005_alter_user_last_login_null	2017-04-15 15:21:55.074673-07
10	auth	0006_require_contenttypes_0002	2017-04-15 15:21:55.075994-07
11	auth	0007_alter_validators_add_error_messages	2017-04-15 15:21:55.085681-07
12	auth	0008_alter_user_username_max_length	2017-04-15 15:21:55.097648-07
13	heatmap	0001_initial	2017-04-15 15:21:55.110935-07
14	sessions	0001_initial	2017-04-15 15:21:55.11916-07
15	sites	0001_initial	2017-04-16 11:08:08.027092-07
16	sites	0002_alter_domain_unique	2017-04-16 11:08:08.034128-07
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('django_migrations_id_seq', 16, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: heatmap_heatmap; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY heatmap_heatmap (id, location) FROM stdin;
1	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
2	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
3	0101000020E61000000E661360582C55C00B96EA025EF84040
4	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
5	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
6	0101000020E61000000E661360582C55C00B96EA025EF84040
7	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
8	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
9	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
10	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
11	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
12	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
13	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
14	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
15	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
16	0101000020E61000000E661360582C55C00B96EA025EF84040
17	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
18	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
19	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
20	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
21	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
22	0101000020E6100000A4A7C821E2E755C07C48F8DEDFF04440
23	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
24	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
25	0101000020E61000000E661360582C55C00B96EA025EF84040
26	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
27	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
28	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
29	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
30	0101000020E61000000E661360582C55C00B96EA025EF84040
31	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
32	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
33	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
34	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
35	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
36	0101000020E61000000E661360582C55C00B96EA025EF84040
37	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
38	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
39	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
40	0101000020E6100000A4A7C821E2E755C07C48F8DEDFF04440
41	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
42	0101000020E61000001FF64201DB7B52C0B610E4A0845D4440
43	0101000020E61000000E661360582C55C00B96EA025EF84040
44	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
45	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
46	0101000020E6100000A4A7C821E2E755C07C48F8DEDFF04440
47	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
48	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
49	0101000020E61000000E661360582C55C00B96EA025EF84040
50	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
51	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
52	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
53	0101000020E6100000A4A7C821E2E755C07C48F8DEDFF04440
54	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
55	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
56	0101000020E61000000E661360582C55C00B96EA025EF84040
57	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
58	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
59	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
60	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
61	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
62	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
63	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
64	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
65	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
66	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
67	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
68	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
69	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
70	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
71	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
72	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
73	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
74	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
75	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
76	0101000020E61000000E661360582C55C00B96EA025EF84040
77	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
78	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
79	0101000020E61000000E661360582C55C00B96EA025EF84040
80	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
81	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
82	0101000020E6100000A4A7C821E2E755C07C48F8DEDFF04440
83	0101000020E61000000E661360582C55C00B96EA025EF84040
84	0101000020E61000000E661360582C55C00B96EA025EF84040
85	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
86	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
87	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
88	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
89	0101000020E6100000A4A7C821E2E755C07C48F8DEDFF04440
90	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
91	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
92	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
93	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
94	0101000020E61000001FF64201DB7B52C0B610E4A0845D4440
95	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
96	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
97	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
98	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
99	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
100	0101000020E61000000E661360582C55C00B96EA025EF84040
101	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
102	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
103	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
104	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
105	0101000020E61000000E661360582C55C00B96EA025EF84040
106	0101000020E6100000A4A7C821E2E755C07C48F8DEDFF04440
107	0101000020E61000000E661360582C55C00B96EA025EF84040
108	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
109	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
110	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
111	0101000020E61000001FF64201DB7B52C0B610E4A0845D4440
112	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
113	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
114	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
115	0101000020E61000002426A8E15B965EC005DCF3FC69CF4740
116	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
117	0101000020E6100000A4A7C821E2E755C07C48F8DEDFF04440
118	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
119	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
120	0101000020E610000083A5BA80979C5EC0F27B9BFEECDD4240
121	0101000020E61000007C4276DEC6875EC0BFF2203D45D64740
\.


--
-- Name: heatmap_heatmap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: demo
--

SELECT pg_catalog.setval('heatmap_heatmap_id_seq', 121, true);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: demo
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: heatmap_heatmap heatmap_heatmap_pkey; Type: CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY heatmap_heatmap
    ADD CONSTRAINT heatmap_heatmap_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: demo
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: demo
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: demo
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: demo
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: demo
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: demo
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: demo
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: demo
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: demo
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: demo
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: demo
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: demo
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: demo
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: demo
--

CREATE INDEX django_site_domain_a2e37b91_like ON django_site USING btree (domain varchar_pattern_ops);


--
-- Name: heatmap_heatmap_location_id; Type: INDEX; Schema: public; Owner: demo
--

CREATE INDEX heatmap_heatmap_location_id ON heatmap_heatmap USING gist (location);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: demo
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

