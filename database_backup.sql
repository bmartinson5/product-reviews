--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

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

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: benjaminmartinson
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO benjaminmartinson;

--
-- Name: products; Type: TABLE; Schema: public; Owner: benjaminmartinson
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying,
    cost double precision,
    country_of_origin character varying
);


ALTER TABLE public.products OWNER TO benjaminmartinson;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: benjaminmartinson
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO benjaminmartinson;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: benjaminmartinson
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: benjaminmartinson
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    author character varying,
    content_body character varying,
    rating integer,
    product_id integer
);


ALTER TABLE public.reviews OWNER TO benjaminmartinson;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: benjaminmartinson
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO benjaminmartinson;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: benjaminmartinson
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: benjaminmartinson
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO benjaminmartinson;

--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: benjaminmartinson
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: benjaminmartinson
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: benjaminmartinson
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-08-09 23:40:02.427128	2019-08-09 23:40:02.427128
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: benjaminmartinson
--

COPY public.products (id, name, cost, country_of_origin) FROM stdin;
4	Scone	3.5	Uruguay
5	poptart	3.54999999999999982	US
6	Ramrod	5.59999999999999964	asdf
7	Please Bagel	4.5	USA
8	newew	3	asdfsdfsdf
9	greg	4	USA
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: benjaminmartinson
--

COPY public.reviews (id, author, content_body, rating, product_id) FROM stdin;
2	jBen	sdfsdf	3333	6
3	qweqwe	sdfsadf	3	6
4	werwer	sdfgsdfgsdfgsdfgdsfgsdf	3	5
5	werqwe	gsdf	55	7
6	asdfsadf	asdfasf	23	5
7	dfg	sdfg	4	5
8	dfgdfg	sdfg	4	4
9	dfg	asdfasdf	3344	4
10	asdfasd	asdf	3	4
11	3sdf	sdfsdaf	33	4
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: benjaminmartinson
--

COPY public.schema_migrations (version) FROM stdin;
20190809233126
20190809233135
20190809233658
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benjaminmartinson
--

SELECT pg_catalog.setval('public.products_id_seq', 9, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benjaminmartinson
--

SELECT pg_catalog.setval('public.reviews_id_seq', 11, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: benjaminmartinson
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: benjaminmartinson
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: benjaminmartinson
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: benjaminmartinson
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: reviews fk_rails_bedd9094d4; Type: FK CONSTRAINT; Schema: public; Owner: benjaminmartinson
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_bedd9094d4 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

