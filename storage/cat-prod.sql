--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 9.5.19

-- Started on 2019-12-11 13:01:04 EET

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
-- TOC entry 200 (class 1259 OID 126873)
-- Name: category_product; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.category_product (
    category_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.category_product OWNER TO dev;

--
-- TOC entry 2195 (class 0 OID 126873)
-- Dependencies: 200
-- Data for Name: category_product; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public.category_product (category_id, product_id) FROM stdin;
3	1
2	1
\.


--
-- TOC entry 2077 (class 1259 OID 126886)
-- Name: category_product_category_id_index; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX category_product_category_id_index ON public.category_product USING btree (category_id);


--
-- TOC entry 2078 (class 1259 OID 126887)
-- Name: category_product_product_id_index; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX category_product_product_id_index ON public.category_product USING btree (product_id);


--
-- TOC entry 2079 (class 2606 OID 126876)
-- Name: category_product_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.category_product
    ADD CONSTRAINT category_product_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 2080 (class 2606 OID 126881)
-- Name: category_product_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.category_product
    ADD CONSTRAINT category_product_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id);


-- Completed on 2019-12-11 13:01:04 EET

--
-- PostgreSQL database dump complete
--

