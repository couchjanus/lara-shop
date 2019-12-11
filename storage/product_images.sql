--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 9.5.19

-- Started on 2019-12-11 12:55:58 EET

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
-- TOC entry 199 (class 1259 OID 126861)
-- Name: product_images; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.product_images (
    id bigint NOT NULL,
    product_id integer NOT NULL,
    "full" character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.product_images OWNER TO dev;

--
-- TOC entry 198 (class 1259 OID 126859)
-- Name: product_images_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.product_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_images_id_seq OWNER TO dev;

--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 198
-- Name: product_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.product_images_id_seq OWNED BY public.product_images.id;


--
-- TOC entry 2077 (class 2604 OID 126864)
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.product_images ALTER COLUMN id SET DEFAULT nextval('public.product_images_id_seq'::regclass);


--
-- TOC entry 2197 (class 0 OID 126861)
-- Dependencies: 199
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public.product_images (id, product_id, "full", created_at, updated_at) FROM stdin;
1	1	products/vNNd8ZnzsyRUXox4C27hLtLYc.jpg	2019-12-11 10:51:37	2019-12-11 10:51:37
2	1	products/7HgnRyec7kjkzWq4uUHUurY2m.jpg	2019-12-11 10:51:49	2019-12-11 10:51:49
\.


--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 198
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public.product_images_id_seq', 2, true);


--
-- TOC entry 2079 (class 2606 OID 126866)
-- Name: product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- TOC entry 2080 (class 1259 OID 126872)
-- Name: product_images_product_id_index; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX product_images_product_id_index ON public.product_images USING btree (product_id);


--
-- TOC entry 2081 (class 2606 OID 126867)
-- Name: product_images_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


-- Completed on 2019-12-11 12:55:59 EET

--
-- PostgreSQL database dump complete
--

