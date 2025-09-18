--
-- PostgreSQL database dump
--

\restrict WcddRpkTIsfT7rkjIhbXrIUW8TGWbMKxpLKQTYjC8cRVnt7Chjb8CZTvgmQCc0Q

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: jdarov
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.authors OWNER TO jdarov;

--
-- Name: authors_books; Type: TABLE; Schema: public; Owner: jdarov
--

CREATE TABLE public.authors_books (
    id integer NOT NULL,
    book_id integer,
    author_id integer
);


ALTER TABLE public.authors_books OWNER TO jdarov;

--
-- Name: authors_books_id_seq; Type: SEQUENCE; Schema: public; Owner: jdarov
--

CREATE SEQUENCE public.authors_books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authors_books_id_seq OWNER TO jdarov;

--
-- Name: authors_books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jdarov
--

ALTER SEQUENCE public.authors_books_id_seq OWNED BY public.authors_books.id;


--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: jdarov
--

CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authors_id_seq OWNER TO jdarov;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jdarov
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: jdarov
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title text NOT NULL,
    year_published integer NOT NULL,
    page_count integer,
    CONSTRAINT books_year_published_check CHECK (((year_published >= 1000) AND (year_published <= 9999))),
    CONSTRAINT no_future_published_years CHECK (((year_published)::double precision <= date_part('YEAR'::text, CURRENT_DATE)))
);


ALTER TABLE public.books OWNER TO jdarov;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: jdarov
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_id_seq OWNER TO jdarov;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jdarov
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: authors_books id; Type: DEFAULT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.authors_books ALTER COLUMN id SET DEFAULT nextval('public.authors_books_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: jdarov
--

INSERT INTO public.authors VALUES (1, 'Arthur C. Clarke');
INSERT INTO public.authors VALUES (2, 'Becky Chambers');
INSERT INTO public.authors VALUES (3, 'Bruce Sterling');
INSERT INTO public.authors VALUES (4, 'Frank Herbert');
INSERT INTO public.authors VALUES (5, 'Kurt Vonnegut, Jr.');
INSERT INTO public.authors VALUES (6, 'Leigh Brackett');
INSERT INTO public.authors VALUES (7, 'Ursula K. Le Guin');
INSERT INTO public.authors VALUES (8, 'Victoria Aveyard');
INSERT INTO public.authors VALUES (9, 'William Gibson');


--
-- Data for Name: authors_books; Type: TABLE DATA; Schema: public; Owner: jdarov
--

INSERT INTO public.authors_books VALUES (1, 1, 2);
INSERT INTO public.authors_books VALUES (2, 2, 1);
INSERT INTO public.authors_books VALUES (3, 3, 5);
INSERT INTO public.authors_books VALUES (4, 4, 4);
INSERT INTO public.authors_books VALUES (5, 6, 2);
INSERT INTO public.authors_books VALUES (6, 7, 9);
INSERT INTO public.authors_books VALUES (7, 7, 3);
INSERT INTO public.authors_books VALUES (8, 8, 7);
INSERT INTO public.authors_books VALUES (9, 9, 2);
INSERT INTO public.authors_books VALUES (10, 10, 7);
INSERT INTO public.authors_books VALUES (11, 11, 7);
INSERT INTO public.authors_books VALUES (12, 12, 6);
INSERT INTO public.authors_books VALUES (13, 13, 5);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: jdarov
--

INSERT INTO public.books VALUES (1, 'A Closed and Common Orbit', 2016, NULL);
INSERT INTO public.books VALUES (2, 'A Fall of Moondust', 1961, 224);
INSERT INTO public.books VALUES (3, 'Cat''s Cradle', 1963, 304);
INSERT INTO public.books VALUES (4, 'Dune', 1965, 412);
INSERT INTO public.books VALUES (5, 'Project Hail Mary', 2021, 496);
INSERT INTO public.books VALUES (6, 'Record of a Spaceborn Few', 2018, NULL);
INSERT INTO public.books VALUES (7, 'The Difference Engine', 1990, 383);
INSERT INTO public.books VALUES (8, 'The Dispossessed', 1974, 341);
INSERT INTO public.books VALUES (9, 'The Galaxy, and the Ground Within', 2021, NULL);
INSERT INTO public.books VALUES (10, 'The Lathe of Heaven', 1971, 184);
INSERT INTO public.books VALUES (11, 'The Left Hand of Darkness', 1969, 286);
INSERT INTO public.books VALUES (12, 'The Long Tomorrow', 1955, 222);
INSERT INTO public.books VALUES (13, 'The Sirens of Titan', 1959, 319);


--
-- Name: authors_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jdarov
--

SELECT pg_catalog.setval('public.authors_books_id_seq', 13, true);


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jdarov
--

SELECT pg_catalog.setval('public.authors_id_seq', 9, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jdarov
--

SELECT pg_catalog.setval('public.books_id_seq', 14, true);


--
-- Name: authors_books authors_books_book_id_author_id_key; Type: CONSTRAINT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.authors_books
    ADD CONSTRAINT authors_books_book_id_author_id_key UNIQUE (book_id, author_id);


--
-- Name: authors_books authors_books_pkey; Type: CONSTRAINT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.authors_books
    ADD CONSTRAINT authors_books_pkey PRIMARY KEY (id);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: authors_books authors_books_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.authors_books
    ADD CONSTRAINT authors_books_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(id) ON DELETE CASCADE;


--
-- Name: authors_books authors_books_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.authors_books
    ADD CONSTRAINT authors_books_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict WcddRpkTIsfT7rkjIhbXrIUW8TGWbMKxpLKQTYjC8cRVnt7Chjb8CZTvgmQCc0Q

