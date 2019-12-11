--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 9.5.19

-- Started on 2019-12-11 12:58:19 EET

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
-- TOC entry 197 (class 1259 OID 126842)
-- Name: products; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    brand_id integer NOT NULL,
    sku character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description text,
    quantity integer NOT NULL,
    weight numeric(8,2),
    price numeric(8,2),
    sale_price numeric(8,2),
    status boolean DEFAULT true NOT NULL,
    featured boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.products OWNER TO dev;

--
-- TOC entry 196 (class 1259 OID 126840)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO dev;

--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 196
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 2077 (class 2604 OID 126845)
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 2199 (class 0 OID 126842)
-- Dependencies: 197
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public.products (id, brand_id, sku, name, slug, description, quantity, weight, price, sale_price, status, featured, created_at, updated_at) FROM stdin;
1	1	c12	Marvel comics	marvel-comics	test desc	111	1.00	11.00	\N	f	t	2019-12-08 21:24:15	2019-12-08 21:24:15
\.


--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 196
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public.products_id_seq', 1, true);


--
-- TOC entry 2082 (class 2606 OID 126852)
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 2080 (class 1259 OID 126858)
-- Name: products_brand_id_index; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX products_brand_id_index ON public.products USING btree (brand_id);


--
-- TOC entry 2083 (class 2606 OID 126853)
-- Name: products_brand_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_brand_id_foreign FOREIGN KEY (brand_id) REFERENCES public.brands(id) ON DELETE CASCADE;


-- Completed on 2019-12-11 12:58:19 EET

--
-- PostgreSQL database dump complete
--

