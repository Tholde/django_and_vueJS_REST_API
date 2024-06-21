--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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
-- Name: agri_person; Type: TABLE; Schema: public; Owner: tholde
--

CREATE TABLE public.agri_person (
    id integer NOT NULL,
    fullname character varying(100) NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    contact character varying(15) NOT NULL,
    address character varying(100) NOT NULL,
    image character varying(100) NOT NULL,
    rdoc character varying(100) NOT NULL
);


ALTER TABLE public.agri_person OWNER TO tholde;

--
-- Name: agri_person_id_seq; Type: SEQUENCE; Schema: public; Owner: tholde
--

ALTER TABLE public.agri_person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.agri_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: tholde
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO tholde;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tholde
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: tholde
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO tholde;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tholde
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: tholde
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO tholde;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: tholde
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: tholde
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO tholde;

--
-- Name: crud_user; Type: TABLE; Schema: public; Owner: tholde
--

CREATE TABLE public.crud_user (
    id integer NOT NULL,
    fullname character varying(250) NOT NULL,
    username character varying(250) NOT NULL,
    email character varying(250) NOT NULL,
    password character varying(250) NOT NULL,
    contact character varying(15) NOT NULL,
    "lieuPoste" character varying(250) NOT NULL
);


ALTER TABLE public.crud_user OWNER TO tholde;

--
-- Name: crud_user_id_seq; Type: SEQUENCE; Schema: public; Owner: tholde
--

ALTER TABLE public.crud_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.crud_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: tholde
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


ALTER TABLE public.django_admin_log OWNER TO tholde;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: tholde
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: tholde
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO tholde;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: tholde
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: tholde
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO tholde;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: tholde
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: tholde
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO tholde;

--
-- Name: user_user; Type: TABLE; Schema: public; Owner: tholde
--

CREATE TABLE public.user_user (
    id bigint NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    fullname character varying(250) NOT NULL,
    email character varying(250) NOT NULL,
    password character varying(250) NOT NULL,
    contact character varying(15) NOT NULL,
    address character varying(100) NOT NULL,
    role character varying(100) NOT NULL,
    image character varying(100) NOT NULL,
    cv character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.user_user OWNER TO tholde;

--
-- Name: user_user_groups; Type: TABLE; Schema: public; Owner: tholde
--

CREATE TABLE public.user_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.user_user_groups OWNER TO tholde;

--
-- Name: user_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: tholde
--

ALTER TABLE public.user_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: tholde
--

ALTER TABLE public.user_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_user_user_permissions; Type: TABLE; Schema: public; Owner: tholde
--

CREATE TABLE public.user_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.user_user_user_permissions OWNER TO tholde;

--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tholde
--

ALTER TABLE public.user_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: agri_person; Type: TABLE DATA; Schema: public; Owner: tholde
--

COPY public.agri_person (id, fullname, username, email, password, contact, address, image, rdoc) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: tholde
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: tholde
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: tholde
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
21	Can add Token	6	add_token
22	Can change Token	6	change_token
23	Can delete Token	6	delete_token
24	Can view Token	6	view_token
25	Can add Token	7	add_tokenproxy
26	Can change Token	7	change_tokenproxy
27	Can delete Token	7	delete_tokenproxy
28	Can view Token	7	view_tokenproxy
29	Can add user	8	add_user
30	Can change user	8	change_user
31	Can delete user	8	delete_user
32	Can view user	8	view_user
33	Can add user	9	add_user
34	Can change user	9	change_user
35	Can delete user	9	delete_user
36	Can view user	9	view_user
37	Can add person	10	add_person
38	Can change person	10	change_person
39	Can delete person	10	delete_person
40	Can view person	10	view_person
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: tholde
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
29983b269014ea9e2ead1ecc5172d1cd859921b2	2024-06-21 20:49:04.243491+03	1
\.


--
-- Data for Name: crud_user; Type: TABLE DATA; Schema: public; Owner: tholde
--

COPY public.crud_user (id, fullname, username, email, password, contact, "lieuPoste") FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: tholde
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-06-21 20:55:13.078095+03	2	rakoto.pathfinder@gmail.com	1	[{"added": {}}]	8	1
2	2024-06-21 20:56:49.521814+03	2	rakoto.pathfinder@gmail.com	2	[{"changed": {"fields": ["Fullname", "Contact", "Address", "Role", "Image", "Cv", "Last login"]}}]	8	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: tholde
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	authtoken	token
7	authtoken	tokenproxy
8	user	user
9	crud	user
10	agri	person
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: tholde
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-06-21 20:35:47.100719+03
2	contenttypes	0002_remove_content_type_name	2024-06-21 20:35:47.108735+03
3	auth	0001_initial	2024-06-21 20:35:47.625188+03
4	auth	0002_alter_permission_name_max_length	2024-06-21 20:35:47.633259+03
5	auth	0003_alter_user_email_max_length	2024-06-21 20:35:47.640306+03
6	auth	0004_alter_user_username_opts	2024-06-21 20:35:47.647344+03
7	auth	0005_alter_user_last_login_null	2024-06-21 20:35:47.654353+03
8	auth	0006_require_contenttypes_0002	2024-06-21 20:35:47.655871+03
9	auth	0007_alter_validators_add_error_messages	2024-06-21 20:35:47.662882+03
10	auth	0008_alter_user_username_max_length	2024-06-21 20:35:47.669928+03
11	auth	0009_alter_user_last_name_max_length	2024-06-21 20:35:47.674927+03
12	auth	0010_alter_group_name_max_length	2024-06-21 20:35:47.684994+03
13	auth	0011_update_proxy_permissions	2024-06-21 20:35:47.690668+03
14	auth	0012_alter_user_first_name_max_length	2024-06-21 20:35:47.696736+03
15	user	0001_initial	2024-06-21 20:35:48.172811+03
16	admin	0001_initial	2024-06-21 20:35:48.606769+03
17	admin	0002_logentry_remove_auto_add	2024-06-21 20:35:48.616814+03
18	admin	0003_logentry_add_action_flag_choices	2024-06-21 20:35:48.629674+03
19	agri	0001_initial	2024-06-21 20:35:48.804011+03
20	authtoken	0001_initial	2024-06-21 20:35:48.944985+03
21	authtoken	0002_auto_20160226_1747	2024-06-21 20:35:48.990661+03
22	authtoken	0003_tokenproxy	2024-06-21 20:35:48.993665+03
23	authtoken	0004_alter_tokenproxy_options	2024-06-21 20:35:48.999722+03
24	crud	0001_initial	2024-06-21 20:35:49.071781+03
25	sessions	0001_initial	2024-06-21 20:35:49.220089+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: tholde
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
yv709vqhx20hoe7179s7dwfw7781kwtv	.eJxVjEEOwiAQRe_C2hCYlgIu3fcMZGYAqRqalHZlvLtt0oVu_3vvv0XAbS1ha2kJUxRXocXldyPkZ6oHiA-s91nyXNdlInko8qRNjnNMr9vp_h0UbGWvMwDwYLWKxF0PyhMMOemUAXvyCpw1O_KklGUTIwG73bbcZWcAu158vtncN40:1sKiLS:sHWrZZToj4Ku2TZHRnm-WEl66ocxh7lVQPw1uWhddCU	2024-07-05 20:46:42.924745+03
\.


--
-- Data for Name: user_user; Type: TABLE DATA; Schema: public; Owner: tholde
--

COPY public.user_user (id, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, fullname, email, password, contact, address, role, image, cv, created_at, updated_at) FROM stdin;
1	2024-06-21 20:46:42.864719+03	t			t	t	2024-06-21 20:36:51.379979+03		rahalahifaliako.t@zurcher.edu.mg	pbkdf2_sha256$720000$1s9yceuDh8zlcngBpsCqsZ$bb5IyPqNMARptgI6uv5cVny2KoFii0n8+UIrAyEiPb0=						2024-06-21 20:36:52.101611+03	2024-06-21 20:36:52.101611+03
2	2024-06-21 20:56:45+03	f			f	t	2024-06-21 20:55:12+03	Rakotozafy	rakoto.pathfinder@gmail.com	pbkdf2_sha256$720000$ufA009JGw0FVB2wxFqFSg6$EWzlMD0wdlPS3UCawid3kAzJvs0xxlw3SWdc1ndAZ4M=	+261345454280	Sambaina Gare	technicien	images/20240324_122949_Natural_Click_lmc_8.4_r16_-_by_camera_king_gcam.jpg	documents/devoir.pdf	2024-06-21 20:55:13.074278+03	2024-06-21 20:56:49.519816+03
\.


--
-- Data for Name: user_user_groups; Type: TABLE DATA; Schema: public; Owner: tholde
--

COPY public.user_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: user_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: tholde
--

COPY public.user_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: agri_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tholde
--

SELECT pg_catalog.setval('public.agri_person_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tholde
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tholde
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tholde
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: crud_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tholde
--

SELECT pg_catalog.setval('public.crud_user_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tholde
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 2, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tholde
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tholde
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: user_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tholde
--

SELECT pg_catalog.setval('public.user_user_groups_id_seq', 1, false);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tholde
--

SELECT pg_catalog.setval('public.user_user_id_seq', 2, true);


--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tholde
--

SELECT pg_catalog.setval('public.user_user_user_permissions_id_seq', 1, false);


--
-- Name: agri_person agri_person_pkey; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.agri_person
    ADD CONSTRAINT agri_person_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: crud_user crud_user_pkey; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.crud_user
    ADD CONSTRAINT crud_user_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: user_user user_user_email_key; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_email_key UNIQUE (email);


--
-- Name: user_user_groups user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_pkey PRIMARY KEY (id);


--
-- Name: user_user_groups user_user_groups_user_id_group_id_bb60391f_uniq; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_group_id_bb60391f_uniq UNIQUE (user_id, group_id);


--
-- Name: user_user user_user_pkey; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_pkey PRIMARY KEY (id);


--
-- Name: user_user_user_permissions user_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq; Type: CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: tholde
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: tholde
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: tholde
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: tholde
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: tholde
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: tholde
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: tholde
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: tholde
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: tholde
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: user_user_email_1c6f3d1a_like; Type: INDEX; Schema: public; Owner: tholde
--

CREATE INDEX user_user_email_1c6f3d1a_like ON public.user_user USING btree (email varchar_pattern_ops);


--
-- Name: user_user_groups_group_id_c57f13c0; Type: INDEX; Schema: public; Owner: tholde
--

CREATE INDEX user_user_groups_group_id_c57f13c0 ON public.user_user_groups USING btree (group_id);


--
-- Name: user_user_groups_user_id_13f9a20d; Type: INDEX; Schema: public; Owner: tholde
--

CREATE INDEX user_user_groups_user_id_13f9a20d ON public.user_user_groups USING btree (user_id);


--
-- Name: user_user_user_permissions_permission_id_ce49d4de; Type: INDEX; Schema: public; Owner: tholde
--

CREATE INDEX user_user_user_permissions_permission_id_ce49d4de ON public.user_user_user_permissions USING btree (permission_id);


--
-- Name: user_user_user_permissions_user_id_31782f58; Type: INDEX; Schema: public; Owner: tholde
--

CREATE INDEX user_user_user_permissions_user_id_31782f58 ON public.user_user_user_permissions USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_group_id_c57f13c0_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_group_id_c57f13c0_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_user_id_13f9a20d_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_13f9a20d_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permi_permission_id_ce49d4de_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permi_permission_id_ce49d4de_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_31782f58_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tholde
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_31782f58_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

