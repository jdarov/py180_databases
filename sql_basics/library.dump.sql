--
-- PostgreSQL database dump
--

\restrict dRclc6yYL7UwkpFLIe8FCifpmOGMrzmulCemYhBo8qVtewIhEaADiYEAARYFdet

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

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
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: jdarov
--

CREATE SEQUENCE public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_id_seq OWNER TO jdarov;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: books; Type: TABLE; Schema: public; Owner: jdarov
--

CREATE TABLE public.books (
    id integer DEFAULT nextval('public.books_id_seq'::regclass) NOT NULL,
    title text NOT NULL,
    author character varying(32) NOT NULL
);


ALTER TABLE public.books OWNER TO jdarov;

--
-- Name: books_categories; Type: TABLE; Schema: public; Owner: jdarov
--

CREATE TABLE public.books_categories (
    book_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.books_categories OWNER TO jdarov;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: jdarov
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO jdarov;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: jdarov
--

CREATE TABLE public.categories (
    id integer DEFAULT nextval('public.categories_id_seq'::regclass) NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.categories OWNER TO jdarov;

--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: jdarov
--

INSERT INTO public.books VALUES (1, 'A Tale of Two Cities', 'Charles Dickens');
INSERT INTO public.books VALUES (2, 'Harry Potter', 'J. K. Rowling');
INSERT INTO public.books VALUES (3, 'Einstein: His Life and Universe', 'Walter Isaacson');
INSERT INTO public.books VALUES (4, 'Sally Ride: America''s First Woman in Space', 'Lynn Sherr');
INSERT INTO public.books VALUES (5, 'Jane Eyre', 'Charlotte Bronte');
INSERT INTO public.books VALUES (6, 'Vij''s: Elegant and Inspired Indian Cuisine', 'Meeru Dhalwala and Vikram Vij');


--
-- Data for Name: books_categories; Type: TABLE DATA; Schema: public; Owner: jdarov
--

INSERT INTO public.books_categories VALUES (1, 2);
INSERT INTO public.books_categories VALUES (1, 4);
INSERT INTO public.books_categories VALUES (2, 2);
INSERT INTO public.books_categories VALUES (2, 3);
INSERT INTO public.books_categories VALUES (3, 1);
INSERT INTO public.books_categories VALUES (3, 5);
INSERT INTO public.books_categories VALUES (3, 6);
INSERT INTO public.books_categories VALUES (4, 5);
INSERT INTO public.books_categories VALUES (4, 1);
INSERT INTO public.books_categories VALUES (4, 7);
INSERT INTO public.books_categories VALUES (5, 2);
INSERT INTO public.books_categories VALUES (5, 4);
INSERT INTO public.books_categories VALUES (6, 8);
INSERT INTO public.books_categories VALUES (6, 1);
INSERT INTO public.books_categories VALUES (6, 9);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: jdarov
--

INSERT INTO public.categories VALUES (1, 'Nonfiction');
INSERT INTO public.categories VALUES (2, 'Fiction');
INSERT INTO public.categories VALUES (3, 'Fantasy');
INSERT INTO public.categories VALUES (4, 'Classics');
INSERT INTO public.categories VALUES (5, 'Biography');
INSERT INTO public.categories VALUES (6, 'Physics');
INSERT INTO public.categories VALUES (7, 'Space Exploration');
INSERT INTO public.categories VALUES (8, 'Cookbook');
INSERT INTO public.categories VALUES (9, 'South Asia');


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jdarov
--

SELECT pg_catalog.setval('public.books_id_seq', 6, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jdarov
--

SELECT pg_catalog.setval('public.categories_id_seq', 9, true);


--
-- Name: books_categories books_categories_book_id_category_id_key; Type: CONSTRAINT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.books_categories
    ADD CONSTRAINT books_categories_book_id_category_id_key UNIQUE (book_id, category_id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: books_categories books_categories_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.books_categories
    ADD CONSTRAINT books_categories_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON DELETE CASCADE;


--
-- Name: books_categories books_categories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.books_categories
    ADD CONSTRAINT books_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict dRclc6yYL7UwkpFLIe8FCifpmOGMrzmulCemYhBo8qVtewIhEaADiYEAARYFdet

