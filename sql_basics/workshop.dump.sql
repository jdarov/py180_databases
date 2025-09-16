--
-- PostgreSQL database dump
--

\restrict C9fjNXJut8tP5iEGEgwhcKa4soSt2ni4VZFg9vNgY9rxlvREhovTuLfQlbfDYFD

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
-- Name: devices; Type: TABLE; Schema: public; Owner: jdarov
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.devices OWNER TO jdarov;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: jdarov
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.devices_id_seq OWNER TO jdarov;

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jdarov
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: parts; Type: TABLE; Schema: public; Owner: jdarov
--

CREATE TABLE public.parts (
    id integer NOT NULL,
    part_number integer NOT NULL,
    device_id integer
);


ALTER TABLE public.parts OWNER TO jdarov;

--
-- Name: parts_id_seq; Type: SEQUENCE; Schema: public; Owner: jdarov
--

CREATE SEQUENCE public.parts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.parts_id_seq OWNER TO jdarov;

--
-- Name: parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jdarov
--

ALTER SEQUENCE public.parts_id_seq OWNED BY public.parts.id;


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: parts id; Type: DEFAULT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.parts ALTER COLUMN id SET DEFAULT nextval('public.parts_id_seq'::regclass);


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: jdarov
--

INSERT INTO public.devices VALUES (2, 'Gyroscope', '2025-09-15 22:31:49.838396');
INSERT INTO public.devices VALUES (3, 'Magnetometer', '2025-09-15 23:00:30.922755');


--
-- Data for Name: parts; Type: TABLE DATA; Schema: public; Owner: jdarov
--

INSERT INTO public.parts VALUES (4, 21, 2);
INSERT INTO public.parts VALUES (5, 22, 2);
INSERT INTO public.parts VALUES (6, 23, 2);
INSERT INTO public.parts VALUES (9, 31, NULL);
INSERT INTO public.parts VALUES (10, 32, NULL);
INSERT INTO public.parts VALUES (11, 33, NULL);
INSERT INTO public.parts VALUES (12, 42, 3);


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jdarov
--

SELECT pg_catalog.setval('public.devices_id_seq', 3, true);


--
-- Name: parts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jdarov
--

SELECT pg_catalog.setval('public.parts_id_seq', 12, true);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: parts parts_part_number_key; Type: CONSTRAINT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_part_number_key UNIQUE (part_number);


--
-- Name: parts parts_pkey; Type: CONSTRAINT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (id);


--
-- Name: parts parts_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jdarov
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.devices(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict C9fjNXJut8tP5iEGEgwhcKa4soSt2ni4VZFg9vNgY9rxlvREhovTuLfQlbfDYFD

