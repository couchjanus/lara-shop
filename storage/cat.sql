--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 9.5.19

-- Started on 2019-12-11 13:00:19 EET

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- TOC entry 189 (class 1259 OID 126781)
-- Name: categories; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description text,
    _lft integer DEFAULT 0 NOT NULL,
    _rgt integer DEFAULT 0 NOT NULL,
    parent_id integer,
    featured boolean DEFAULT false NOT NULL,
    menu boolean DEFAULT true NOT NULL,
    image character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categories OWNER TO dev;

--
-- TOC entry 188 (class 1259 OID 126779)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO dev;

--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 188
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 2077 (class 2604 OID 126784)
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 2202 (class 0 OID 126781)
-- Dependencies: 189
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public.categories (id, name, slug, description, _lft, _rgt, parent_id, featured, menu, image, created_at, updated_at) FROM stdin;
1	Books	books	This is Book category	19	36	\N	f	f	categories/VbkUNHoN2mqJgZhGGFlwqVp48.jpg	2019-12-08 20:57:40	2019-12-11 10:59:26
3	Marvel Comic Book	marvel-comic-book	This is Marvel category	21	22	2	f	f	\N	2019-12-08 20:57:41	2019-12-08 20:57:41
4	DC Comic Book	dc-comic-book	This is Comic category	23	24	2	f	f	\N	2019-12-08 20:57:41	2019-12-08 20:57:41
2	Comic Book	comic-book	This is Comic Book category	20	27	1	f	f	\N	2019-12-08 20:57:40	2019-12-08 20:57:40
5	Action comics	action-comics	This is Action category	25	26	2	f	f	\N	2019-12-08 20:57:41	2019-12-08 20:57:41
7	Business	business	This is Business category	29	30	6	f	f	\N	2019-12-08 20:57:41	2019-12-08 20:57:41
8	Finance	finance	This is Finance category	31	32	6	f	f	\N	2019-12-08 20:57:41	2019-12-08 20:57:41
6	Textbooks	textbooks	This is Textbooks category	28	35	1	f	f	\N	2019-12-08 20:57:41	2019-12-08 20:57:41
9	Computer Science	computer-science	This is Computer category	33	34	6	f	f	\N	2019-12-08 20:57:41	2019-12-08 20:57:41
12	LED	led	This is LED category	3	4	11	f	f	\N	2019-12-08 20:57:41	2019-12-08 20:57:41
11	TV	tv	This is TV category	2	7	10	f	f	\N	2019-12-08 20:57:41	2019-12-08 20:57:41
13	Blu-ray	blu-ray	This is Blu-ray category	5	6	11	f	f	\N	2019-12-08 20:57:41	2019-12-08 20:57:41
15	Samsung	samsung	This is Samsung category	9	10	14	f	f	\N	2019-12-08 20:57:41	2019-12-08 20:57:41
16	iPhone	iphone	This is iPhone category	11	12	14	f	f	\N	2019-12-08 20:57:41	2019-12-08 20:57:41
10	Electronics	electronics	This is Electronics category	1	16	\N	f	f	\N	2019-12-08 20:57:41	2019-12-08 20:57:41
14	Mobile	mobile	This is Mobile category	8	15	10	f	f	\N	2019-12-08 20:57:41	2019-12-08 20:57:41
17	Xiomi	xiomi	This is Xiomi category	13	14	14	f	f	\N	2019-12-08 20:57:41	2019-12-08 20:57:41
18	Cars	cars	All cars	17	18	\N	t	f	\N	2019-12-08 21:19:56	2019-12-08 21:20:52
\.


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 188
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public.categories_id_seq', 18, true);


--
-- TOC entry 2084 (class 2606 OID 126793)
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2086 (class 2606 OID 126796)
-- Name: categories_slug_unique; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_unique UNIQUE (slug);


--
-- TOC entry 2082 (class 1259 OID 126794)
-- Name: categories__lft__rgt_parent_id_index; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX categories__lft__rgt_parent_id_index ON public.categories USING btree (_lft, _rgt, parent_id);


-- Completed on 2019-12-11 13:00:19 EET

--
-- PostgreSQL database dump complete
--

