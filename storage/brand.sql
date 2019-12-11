--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 9.5.19

-- Started on 2019-12-11 13:02:25 EET

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
-- TOC entry 191 (class 1259 OID 126799)
-- Name: brands; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.brands (
    id bigint NOT NULL,
    name character varying(45) NOT NULL,
    slug character varying(255) NOT NULL,
    logo character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.brands OWNER TO dev;

--
-- TOC entry 190 (class 1259 OID 126797)
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO dev;

--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 190
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- TOC entry 2077 (class 2604 OID 126802)
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- TOC entry 2195 (class 0 OID 126799)
-- Dependencies: 191
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public.brands (id, name, slug, logo, created_at, updated_at) FROM stdin;
1	Black cat	black-cat	brands/P1aPec1pn2o07TQ3MoVgB8jvP.jpg	2019-12-08 21:23:14	2019-12-11 11:01:49
\.


--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 190
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public.brands_id_seq', 1, true);


--
-- TOC entry 2079 (class 2606 OID 126807)
-- Name: brands_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


-- Completed on 2019-12-11 13:02:25 EET

--
-- PostgreSQL database dump complete
--

