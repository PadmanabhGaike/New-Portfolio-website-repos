--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    name character varying(100),
    email character varying(100),
    message text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contacts_id_seq OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts (id, name, email, message, created_at) FROM stdin;
12	Padmanabh	test@example.us	Hello Vicky 	2024-10-14 21:38:12.823698
13	PVG	test@example.us	yo you yo	2024-10-14 21:46:40.336066
14	chavi	KingPurge909@gmail.com	tu chutiya hai	2024-10-14 21:57:03.703191
15	Padmanabh	fafafafa@gmail.com	yoio	2024-10-15 21:49:05.066003
16	Padmanabh	padmanabhgaike2008@gmail.com	new	2024-10-16 15:15:24.16648
17	Padmanabh	test@example.us	fafa	2024-10-16 22:30:14.25554
18	Padmanabh	test@example.us	fafa	2024-10-16 22:30:15.388535
19	Padmanabh	test@example.us	fafa	2024-10-16 22:30:44.74683
20	Padmanabh	test@example.us	fafa	2024-10-16 22:30:49.932708
21	hi	padmanabhgaike2008@gmail.com	faaewrtrhha	2024-10-16 22:39:37.493033
22	hi	padmanabhgaike2008@gmail.com	faaewrtrhha	2024-10-16 22:39:55.310128
23	hi	padmanabhgaike2008@gmail.com	faaewrtrhha	2024-10-16 22:40:17.559685
24	hi	padmanabhgaike2008@gmail.com	faaewrtrhha	2024-10-16 22:40:24.059627
25	hi	padmanabhgaike2008@gmail.com	faaewrtrhha	2024-10-16 22:40:59.456134
26	hi	padmanabhgaike2008@gmail.com	faaewrtrhha	2024-10-16 22:40:59.682186
27	hi	padmanabhgaike2008@gmail.com	faaewrtrhha	2024-10-16 22:41:00.45091
28	hi	padmanabhgaike2008@gmail.com	faaewrtrhha	2024-10-16 22:43:00.982622
29	hi	padmanabhgaike2008@gmail.com	faaewrtrhha	2024-10-16 22:44:29.961257
30	hi	padmanabhgaike2008@gmail.com	faaewrtrhha	2024-10-16 22:44:50.313204
31	gaga	fafafafa@gmail.com	fafafaqfafafaf	2024-10-16 23:06:48.799857
32	Padmanabh	padmanabhgaike2008@gmail.com	fafafafafafafa	2024-10-16 23:12:26.348216
33	Padmanabh	padmanabhgaike2008@gmail.com	tu chuitya hai	2024-10-17 21:32:04.268554
34	Padmanabh	test@example.us	gugulya	2024-10-17 22:50:04.249507
35	Padmanabh	padmanabhgaike2008@gmail.com	faf	2024-10-18 16:50:14.927576
36	PVG	padmanabhgaike2008@gmail.com	fa	2024-10-18 17:12:55.318493
37	Padmanabh	padmanabhgaike2008@gmail.com	fafa	2024-10-18 18:02:53.366799
38	Padmanabh	padmanabhgaike2008@gmail.com	fafa	2024-10-18 18:03:09.891379
39	Padmanabh	padmanabhgaike2008@gmail.com	da	2024-10-18 19:16:18.057056
40	Padmanabh	padmanabhgaike2008@gmail.com	dad	2024-10-18 19:32:59.145098
41	Padmanabh	padmanabhgaike2008@gmail.com	fa	2024-10-18 19:52:05.542528
42	Padmanabh	padmanabhgaike2008@gmail.com	fa	2024-10-18 19:52:34.379794
43	Padmanabh	test@example.us	faf	2024-10-18 20:08:36.181122
44	Padmanabh	test@example.us	kk	2024-10-18 20:10:48.825159
45	Padmanabh	test@example.us	fcafa	2024-10-18 20:38:55.770824
46	Padmanabh	test@example.us	fcafa	2024-10-18 20:38:56.87543
47	Padmanabh	test@example.us	fcafa	2024-10-18 20:39:13.779176
48	PVG	test@example.us	fa	2024-10-18 20:47:11.891773
49	Padmanabh	test@example.us	faf	2024-10-18 21:13:23.052347
50	Padmanabh	test@example.us	faf	2024-10-18 21:13:23.833204
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_id_seq', 50, true);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

